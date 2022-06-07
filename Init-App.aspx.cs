using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Refresher4.Component;
using System.Configuration;
using MSXML2;
using System.Xml;
using System.Data.SqlClient;

public partial class Init_App : System.Web.UI.Page
{
    public string sLogin, Password;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserName"] = Request.QueryString["UserName"];
        Session["UserKeyAccess"] = Request.QueryString["UserKeyAccess"];
        Session["CurrentToken"] = Request.QueryString["CurrentToken"];

       
        //lanzar el proceso de Refresh
        if (!Page.IsPostBack)
        {
            ValidarAcceso(Session["UserName"], Session["UserKeyAccess"], Session["CurrentToken"]);
        }

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
                Response.Redirect(ConfigurationManager.AppSettings["UrlAppEndPage"]);
            }
            else
            {
                Session["UserName"] = userName;
                Session["UserKeyAccess"] = userKeyAccess;
                Session["CurrentToken"] = Convert.ToBoolean(objResponse.TockedChanged) ? objResponse.CurrentToken : currentToken;


                //ir a la app
               // Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"]);

                sLogin = userName.ToString();
                Session["Intranet"] = userName.ToString();
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
            //    lblMsg.Text = "Error: <br>" + objRefresher.MsgStatus;

            //    hlRedirect.Visible = true;
            //    hlRedirect.Text = "Redirect to Page.";
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
                    Response.Redirect("Change2.aspx");
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
                    if (LogCheck.UserMail != "fastenal.df.1")
                    {
                        Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"],false);
                        //Response.Redirect("Main.aspx");
                    }
                    else
                    {
                        Response.Redirect(ConfigurationManager.AppSettings["UrlAppFastenalPage"],false);
                        //Response.Redirect("Change2.aspx");
                    }
                }
                else
                {
                    //Cuando el usuario no esta registrado en el sistema.
                    //hlRedirect.NavigateUrl = ConfigurationManager.AppSettings["UrlAppEndPage"];
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

    private bool checkIfExistIntranet(ref string strReturnCode, ref string strReturnMessage, string strServerName, string strWsName, string strUsr, string strPwd)
    {
        //Request URL To Intranet Login
        ServerXMLHTTP30Class xmlRequest = new ServerXMLHTTP30Class();
        xmlRequest.setOption(SERVERXMLHTTP_OPTION.SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS, 13056);
        //--
        //Get Xml Code Response URL 
        XmlDocument xmlResponse = new XmlDocument();
        //--
        //Query Server Name
        string strHost = strServerName + strWsName;
        //--
        //Create Objects to Call Function Open
        object obj1 = new object();
        object obj2 = new object();
        //--
        //Create and Parameters of Object in the Call WireKey
        xmlRequest.open("POST", strHost, false, obj1, obj2);
        xmlRequest.setRequestHeader("Man", "POST " + strHost + " HTTP/1.1");
        xmlRequest.setRequestHeader("Content-Type", "text/xml; charset=utf-8");
        //--
        //Execute WireKey and Sed Parameters Login and Pass
        xmlRequest.send("xusr=" + strUsr + "&xpwd=" + strPwd + "");
        xmlResponse.LoadXml(xmlRequest.responseText);
        strReturnCode = ((XmlNodeList)xmlResponse.DocumentElement.SelectNodes("results/message-code"))[0].InnerText;
        strReturnMessage = ((XmlNodeList)xmlResponse.DocumentElement.SelectNodes("results/message-text"))[0].InnerText;
        //--
        //Return Results Whether Exist User
        if (strReturnCode != "0")
        {
            return false;
        }
        else
        {
            return true;
        }
        //--
    }

}