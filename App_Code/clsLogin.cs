using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Login
/// </summary>
public class clsLogin
{
    private int iID_;
    private int iNE_;
    private string sName_;
    private string sMail_;
    private string sRol_;
    private string bActive_;
    private string bAdmin_;
    private int iRecs_;
    private string sError_;
    
    /// <summary>
    /// 
    /// </summary>
    public int UserID
    {
        get { return iID_; }
        set { iID_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public int UserNum
    {
        get { return iNE_; }
        set { iNE_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string UserName
    {
        get { return sName_; }
        set { sName_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string UserMail
    {
        get { return sMail_; }
        set { sMail_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string UserRol
    {
        get { return sRol_; }
        set { sRol_ = value; }
    }
    /// <summary>
    /// 
    /// </summary>
    public string UserActive
    {
        get { return bActive_; }
        set { bActive_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string UserAdmin
    {
        get { return bAdmin_; }
        set { bAdmin_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public int UserRecs
    {
        get { return iRecs_; }
        set { iRecs_ = value; }
    }

    /// <summary>
    /// 
    /// </summary>
    public string Error
    {
        get { return sError_;  }
        set { sError_ = value;  }
    }


    /// <summary>
    /// Constructor de la clase que se encarga de obtener los datos de un determinado usuario
    /// </summary>
    /// <param name="user">Parametro string que indica el usuario con el que la clase validara los accesos</param>
    public clsLogin(string user)
    {
       sError_= "Ok";

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC GetUser @Mail = '" + user + "'";
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    iID_ = dr.GetInt32(0);
                    iNE_ = dr.GetInt32(1);
                    sName_ = dr.GetString(2);
                    sMail_ = dr.GetString(3);
                    sRol_ = dr.GetString(4);
                    bActive_ = dr.GetString(6);
                    bAdmin_ = dr.GetString(7);
                    iRecs_ = dr.GetInt32(8);
                }
                else
                    sError_ = "Usuario no registrado en el sistema, contacte al administrador.";
            }
            catch (Exception e)
            {
                sError_ = e.Message;
            }
            finally
            {
                dr.Close();
            }
        }
        catch (Exception e)
        {
            sError_ = e.Message;
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
    }


}