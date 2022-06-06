using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
            SqlCommand objCmd = new SqlCommand();
            objCmd.CommandText = "Select NumEmp, Name, isnull(Area,'') Area, isnull(Leader,'') Leader, isnull(UserMail,'') UserMail from Users Where ID=" + Session["UserID"].ToString();
            objCmd.Connection = objConn;
            try
            {
                objConn.Open();
                SqlDataReader dr = objCmd.ExecuteReader();
                try
                {
                    if (dr.Read())
                    {
                        lblNumEmp.Text = dr.GetInt32(0).ToString();
                        lblName.Text = dr.GetString(1);
                        lblArea.Text = dr.GetString(2);
                        lblLeader.Text = dr.GetString(3);                        
                        hfUserMail.Value = dr.GetString(4);
                        txbMail.Text = dr.GetString(4);
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

    protected void btnUpdMail_Click(object sender, EventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.Connection = objConn;

        if (hfUserMail.Value != txbMail.Text)
        {
            objCmd.CommandText = "EXEC UpdUserMail @ID=" + Session["NewRecID"].ToString() + ", @NM='" + txbMail.Text + "'";
            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                objConn.Close();
            }
        }
    }
}