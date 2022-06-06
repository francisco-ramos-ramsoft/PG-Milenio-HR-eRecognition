using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;


public partial class Blade : System.Web.UI.Page
{
    string sMsg;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        
    }

    protected void ShowImage(object sender, RadRotatorEventArgs e)
    {
        int iRec = 0;
        System.Web.UI.WebControls.Image frameImage = (System.Web.UI.WebControls.Image)e.Item.FindControl("Image");        
        Session["iRec"] = iRec;
        SetButton();
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        //Genera la nueva Blade en la Base de datos
        //Retorna el Folio de la Blade

        int iEmpID = Convert.ToInt32(cbbEmploye.SelectedValue);
        int iRsnID = 0;
        int iUsrID = Convert.ToInt32(Session["UserID"].ToString());
       
        

        Session["NewRecID"] = NewBlade(iEmpID, 45, iUsrID, Convert.ToInt32(cbbBlades.SelectedValue), "Blade Fisica").ToString();         
        if(Session["NewRecID"].ToString()!="0")
            //if (Session["iRec"].ToString() == "10" || Session["iRec"].ToString() == "11")
            //    Response.Redirect("NewBlade.aspx");
            //else
                Response.Redirect("NewBlade3.aspx");
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sMsg + "')", true);
    }

    private void SetButton()
    {
            if (cbbBlades.SelectedValue!="0")
                btnGenerate.Enabled = true;
            else
                btnGenerate.Enabled = (cbbEmploye.Text != "") && (cbbBlades.Text!="");
    }

    protected void cbbEmploye_TextChanged(object sender, EventArgs e)
    {
        Session["iRec"] = cbbBlades.SelectedValue;
        SetButton();
    }
    protected void cbbReason_TextChanged(object sender, EventArgs e)
    {

        SetButton();
    }

    string SearchDescription(int iRecognition)
    {
        string sQuery = "Select Description From Recognitions Where ID=" + iRecognition.ToString();
        string sDescrip = "";
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = sQuery;
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    sDescrip = dr.GetString(0);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
        return sDescrip;
    }

    int NewBlade(int iEmpl, int iReason, int iUser, int iReco, string sReason)
    {
        string sQuery = "EXEC NewRec @Empl=" + iEmpl.ToString() + ", @Reason=" + iReason.ToString() + ", @User=" + iUser.ToString() + ", @Rec=" + iReco.ToString() + ", @Text='" + sReason +"'";
        int iRecID = 0;
        sMsg = string.Empty;
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = sQuery;
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    iRecID = dr.GetInt32(0);
                    sMsg = dr.GetString(1);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
        return iRecID;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
    }
}