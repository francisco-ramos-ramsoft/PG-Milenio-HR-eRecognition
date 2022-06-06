using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Refresher4.Component;


public partial class MasterPage : System.Web.UI.MasterPage
{
    public string sLogin, Password;

    protected void Page_Load(object sender, EventArgs e)
    {
        //lanzar el proceso de Refresh
        if (!Page.IsPostBack)
        {
            ValidarAcceso(Session["UserName"], Session["UserKeyAccess"], Session["CurrentToken"]);


            if (Session["UserID"] != null)
            {
                lblUser.Text = Session["UserName"].ToString();
                lblDepto.Text = Session["UserRol"].ToString();
            }
        }
        //else
        //    Response.Redirect("Default.aspx");

        Random r = new Random();
        int i = r.Next(1, 4);

        imgesq.ImageUrl = "img2/people0" + i.ToString() + ".png";

        string useradmin = Session["UserAdmin"].ToString();
        if (useradmin == "true" && Session["UserName"].ToString() != "fastenal.df.1")
        {
            ImageButton1.Visible = true;
            ImageButton2.Visible = true;
            ImageButton3.Visible = true;
            ImageButton4.Visible = true;
            ImageButton5.Visible = true;
            ImageButton6.Visible = true;
        }
        else
        {
            if (Session["UserName"].ToString() == "FASTENAL")
            {
                ImageButton1.Visible = false;
                ImageButton2.Visible = false;
                ImageButton3.Visible = false;
                ImageButton4.Visible = false;
                ImageButton5.Visible = true;
                ImageButton6.Visible = true;
                ImageButton8.Visible = false;
                ImageButton9.Visible = false;
                ImageButton10.Visible = false;
            }
            else
            {
                ImageButton1.Visible = true;
                ImageButton2.Visible = true;
                ImageButton3.Visible = true;
                ImageButton4.Visible = false;
                ImageButton5.Visible = false;
                ImageButton6.Visible = false;
            }
        }
        UpdatePoints();
    }

    void UpdatePoints()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From vUsers Where ID=" + Session["UserID"].ToString();
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    Session["UserRecs"] = dr.GetInt32(5).ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Session["UserNum"] = null;
        Session["UserMail"] = null;
        Session["UserName"] = null;
        Session["UserRol"] = null;
        Session["UserAdmin"] = null;
        Session["UserActive"] = null;
        Session["UserRecs"] = null;
        Response.Redirect("Default.aspx");
    }

    private void ValidarAcceso(object userName, object userKeyAccess, object currentToken)
    {
        //Get instance
        Refresh4 objRefresher = new Refresh4();

        //Set Request
        EntRequest objRequest = new EntRequest();
        objRequest.UserName = userName == null ? string.Empty : userName.ToString();
        objRequest.UserKeyAccess = userKeyAccess == null ? string.Empty : userKeyAccess.ToString();
        objRequest.CurrentToken = currentToken == null ? string.Empty : currentToken.ToString();

        //Call component and get response
        EntResponse objResponse = objRefresher.ValidateAccess(objRequest);

        //Do the actions
        if (objRefresher.Status)
        {
            if (Convert.ToBoolean(objResponse.NeedNewLogin))
            {
                Session["UserName"] = null;
                Session["UserKeyAccess"] = null;
                Session["CurrentToken"] = null;

                //ir a intranet
                Response.Redirect(ConfigurationManager.AppSettings["UrlAppEndPage"], false);
            }
            else
            {
                Session["UserName"] = userName;
                Session["UserKeyAccess"] = userKeyAccess;
                Session["CurrentToken"] = Convert.ToBoolean(objResponse.TockedChanged) ? objResponse.CurrentToken : currentToken;


                //ir a la app
                //Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"]);

                sLogin = Session["Intranet"].ToString();
                Password = "";
                //Actualizar el usuario Fastenal en el campo name de la tabla UserWH  
                //y  en el campo mail de la tabla User de la base de datos RH_RC 
                if (sLogin != "fastenal.df.1")
                    ValidaAcceso(sLogin.Replace("@pg.com", string.Empty), Password);
                else
                    ValidaFastenal(sLogin, Password);
            }
        }
        else
        {
            //lblMsg.Text = "Error: <br>" + objRefresher.MsgStatus;
            //hlRedirect.Visible = true;
            //hlRedirect.Text = "Redirect to Page.";
            Response.Redirect(ConfigurationManager.AppSettings["UrlAppEndPage"]);
        }
    }

    private void ValidaFastenal(string Login, string Pass)
    {
        bool success = false;
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From UserWH Where Name='" + Login + "'";// and Pass='" + Pass + "'";//Cambiar validación
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    Session["UserID"] = "3";
                    Session["UserNum"] = "2";
                    Session["UserMail"] = Login;
                    Session["UserName"] = Login;
                    Session["UserRol"] = "Almacén";
                    Session["UserAdmin"] = "true";
                    Session["UserActive"] = "true";
                    Session["UserRecs"] = "0";
                    //Response.Redirect(ConfigurationManager.AppSettings["UrlAppFastenalPage"]);
                    //Response.Redirect("Change2.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
    }

    public void ValidaAcceso(string Login, string Password)
    {
        try
        {
            //Checar si existe el Usuario en Intranet
            /*  Creacion de la variables de control */
            //string strReturnCode = string.Empty;
            //string strReturnMessage = string.Empty;
            //string strServerName = "https://wirekey.pg.com/xgdsauth/";
            //string strWsName = "xlogon.plx";
            //bool existUserIntranet = false;
            //existUserIntranet = checkIfExistIntranet(ref strReturnCode, ref strReturnMessage, strServerName, strWsName, Login, Password);
            //if (existUserIntranet == false)
            //{
            //    //Usuario de Intranet No Valido
            //    //txbLogin.Text = String.Empty;
            //    //txbPass.Text = String.Empty;
            //    //txbLogin.Focus();
            //    //lblNoUserIntranet.Text = "Usuario y/o contraseña invalidos";
            //}
            //else
            //{
            //Usuario Valido si Exixte en Intranet
            //Login = "hernandez.s.49";
            clsLogin LogCheck = new clsLogin(Login);
            if (LogCheck.Error == "Ok")
            {
                Session["UserID"] = LogCheck.UserID;
                Session["UserNum"] = LogCheck.UserNum;
                Session["UserMail"] = LogCheck.UserMail;
                //Session["UserName"] = LogCheck.UserName;
                Session["UserRol"] = LogCheck.UserRol;
                Session["UserAdmin"] = LogCheck.UserAdmin;
                Session["UserActive"] = LogCheck.UserActive;
                Session["UserRecs"] = LogCheck.UserRecs;
                //if (LogCheck.UserMail != "fastenal.lf")
                //{
                //    Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"]);
                //    //Response.Redirect("Main.aspx");
                //}
                //else
                //{
                //    Response.Redirect(ConfigurationManager.AppSettings["UrlAppFastenalPage"]);
                //    //Response.Redirect("Change2.aspx");
                //}
            }
            else
            {
                //Cuando el usuario no esta registrado en el sistema.
                //hlRedirect.NavigateUrl = ConfigurationManager.AppSettings["UrlAppEndPage"];
                Response.Redirect(ConfigurationManager.AppSettings["UrlAppEndPage"]);

                //txbLogin.Text = String.Empty;
                //txbPass.Text = String.Empty;
                //txbLogin.Focus();
                //lblNoUserIntranet.Text = LogCheck.Error;
            }
            //}
        }
        catch (Exception ex)
        {
            string error = ex.Message.ToString();
        }
    }
}
