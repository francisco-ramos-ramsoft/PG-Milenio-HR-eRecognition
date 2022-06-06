using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeComplete2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NewChangeID"] == null)
            Response.Redirect("Change.aspx");
        else
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
            SqlCommand objCmd = new SqlCommand();
            objCmd.CommandText = "Select * from vExchangeDetail Where ID=" + Session["NewChangeID"].ToString();
            objCmd.Connection = objConn;
            try
            {
                objConn.Open();
                SqlDataReader dr = objCmd.ExecuteReader();
                try
                {
                    if (dr.Read())
                    {
                        lblChangeID.Text = dr.GetInt32(0).ToString();
                        lblDate.Text = dr.GetDateTime(1).ToString();
                        lblUserID.Text = dr.GetInt32(2).ToString();
                        lblUserName.Text = dr.GetString(3);
                        lblGift.Text = dr.GetString(4);
                        lblValue.Text = dr.GetInt32(5).ToString();
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

    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "PrintOperation", "window.print();", true);
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
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
}