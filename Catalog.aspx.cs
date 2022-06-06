using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Default.aspx");

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From vMyPoints Where UserID=" + Session["UserID"].ToString();
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    lblRec.Text = dr.GetInt32(1).ToString();
                    lblCan.Text = dr.GetInt32(2).ToString();
                    lblDis.Text = dr.GetInt32(3).ToString();
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
    protected void RadButton1_Click(object sender, EventArgs e)
    {
        
    }

    protected void RadListView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["GiftID"] = RadListView1.SelectedValue.ToString();
        Response.Redirect("Request.aspx");
    }
}