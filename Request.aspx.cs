using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public partial class Request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("Default.aspx");

        string gid = Request.QueryString["GID"];
        SearchProduct(Request.QueryString["GID"]);
        
        int iVal = Convert.ToInt32(lblValue.Text);
        int iPnt = Convert.ToInt32(Session["UserRecs"].ToString());
        if (iPnt >= iVal)
        {
            btnRequest.Enabled = true;
            lblPoints.Text = "Tienes " + Session["UserRecs"].ToString() + " puntos disponibles, presiona canjear para obtenerlo!!";
        }
        else
        {
            btnRequest.Enabled = false;
            lblPoints.Text = "No puedes obtener este artículo por el momento. Actualmente tienes " + Session["UserRecs"].ToString() + " puntos disponibles";            
        }
    }

    void SearchProduct(string id)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * from Gifts Where ID=" + id;
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    imagePreview.ImageUrl = "images/Gifts/" + dr.GetInt32(0).ToString() + ".png";
                    lblGift.Text = dr.GetString(1);
                    lblDescrip.Text = dr.GetString(2);
                    lblValue.Text = dr.GetInt32(3).ToString();
                    
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

    protected void btnRequest_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();

        objCmd.CommandText = "EXEC [SendRequestGift] @Usr=" + Session["UserID"].ToString() + ", @GID=" + Request.QueryString["GID"];
        objCmd.Connection = objConn;
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

        objCmd.CommandText = "EXEC [NewChange] @Usr = " + Session["UserID"].ToString() + ", @Gft=" + Request.QueryString["GID"];
        objCmd.Connection = objConn;
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
        objCmd.Dispose();
        objConn.Dispose();
        Response.Redirect("NewChangeHR.aspx");
    }
}