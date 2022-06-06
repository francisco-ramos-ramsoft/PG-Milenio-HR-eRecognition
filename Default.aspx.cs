using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using MSXML2;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using Refresher4.Component;


public partial class Default : System.Web.UI.Page 
{
    public string sLogin, Password;

    protected void Page_Load(object sender, EventArgs e)
    {
        //txbLogin.Focus();

        if (!Page.IsPostBack)
        {
            ValidarAcceso(Session["UserName"], Session["UserKeyAccess"], Session["CurrentToken"]);
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        sLogin = txbLogin.Text.ToLower().Trim();
        Password = txbPass.Text.Trim();
        if (sLogin != "fastenal")
            ValidaAcceso(sLogin.Replace("@pg.com", string.Empty), Password);
        else
            ValidaFastenal(sLogin, Password);
    }

    private void ValidaFastenal(string Login, string Pass)
    {
        bool success = false;
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From UserWH Where Name='" + Login + "' and Pass='" + Pass + "'";
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
                    Session["UserMail"] = "fastenal";
                    Session["UserName"] = "FASTENAL";
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


    public bool AMLogin(string strUser, string strPass)
    {
        bool isValid = false;
        using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, "pg.com"))
        {
            // validate the credentials
            isValid = pc.ValidateCredentials(strUser, strPass);
        }
        return isValid;
    }
    public void ValidaAcceso(string Login, string Password)
    {
        try
        {
            //Checar si existe el Usuario en Intranet
            /*  Creacion de la variables de control */
            string strReturnCode = string.Empty;
            string strReturnMessage = string.Empty;
            string strServerName = "https://wirekey.pg.com/xgdsauth/";
            string strWsName = "xlogon.plx";
            bool existUserIntranet = true;
            //existUserIntranet = checkIfExistIntranet(ref strReturnCode, ref strReturnMessage, strServerName, strWsName, Login, Password);
            if (existUserIntranet == false)
            {
                //Usuario de Intranet No Valido
                txbLogin.Text = String.Empty;
                txbPass.Text = String.Empty;
                txbLogin.Focus();
                lblNoUserIntranet.Text = "Usuario y/o contraseña invalidos";
            }
            else
            {
                //Usuario Valido si Exixte en Intranet
                //Login = "hernandez.s.49";
                clsLogin LogCheck = new clsLogin(Login);
                if (LogCheck.Error == "Ok")
                {
                    Session["UserID"] = LogCheck.UserID;
                    Session["UserNum"] = LogCheck.UserNum;
                    Session["UserMail"] = LogCheck.UserMail;
                    Session["UserName"] = LogCheck.UserName;
                    Session["UserRol"] = LogCheck.UserRol;
                    Session["UserAdmin"] = LogCheck.UserAdmin;
                    Session["UserActive"] = LogCheck.UserActive;
                    Session["UserRecs"] = LogCheck.UserRecs;
                    if (LogCheck.UserMail != "fastenal.lf")
                    {
                        Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"]);
                        //Response.Redirect("Main.aspx");
                    }
                    else
                    {
                        Response.Redirect("Change2.aspx");
                    }
                }
                else
                {
                    txbLogin.Text = String.Empty;
                    txbPass.Text = String.Empty;
                    txbLogin.Focus();
                    lblNoUserIntranet.Text = LogCheck.Error;
                }
            }
        }
        catch (Exception ex)
        {
            string error = ex.Message.ToString();
        }
    }

    /// <summary>
    /// Llamada el WS que nos permite autenticar un usuario en la red de PG
    /// </summary>
    /// <param name="strReturnCode"> Codigo de Retorno de la aplicación (codigo != 0 = Error ) </param>
    /// <param name="strReturnMessage"> Mensaje de retorno </param>
    /// <param name="strServerName"> Nombre del servidos donde se aloja el WS </param>
    /// <param name="strWsName"> Nombre del WS a invocar</param>
    /// <param name="strUsr"> Nombre del usuario </param>
    /// <param name="strPwd"> Contraseña de INTRANET de usuario </param>
    /// <returns> Regresa Falso Verdadero segun la respuesta del server </returns>
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
                //Response.Redirect(ConfigurationManager.AppSettings["UrlAppHomePage"]);

                Password = txbPass.Text.Trim();
                if (sLogin != "fastenal")
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
}
