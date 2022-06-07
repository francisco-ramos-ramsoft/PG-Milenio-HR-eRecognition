using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null) 
            Response.Redirect("Default.aspx");

        //SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        //SqlCommand objCmd = new SqlCommand();
        //objCmd.CommandText = "Select * from Users Where ID=" + Session["UserID"].ToString();
        //objCmd.Connection = objConn;
        //try
        //{
        //    objConn.Open();
        //    SqlDataReader dr = objCmd.ExecuteReader();
        //    try
        //    {
        //        if (dr.Read())
        //        {
        //            hfUserMail.Value = dr.GetString(14);
        //            txbMail.Text = dr.GetString(14);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //    finally
        //    {
        //        dr.Close();
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Console.WriteLine(ex.Message);
        //}
        //finally
        //{
        //    objConn.Close();
        //}
        //objCmd.Dispose();
        //objConn.Dispose();

        lblPoints.Text = "Al día de hoy cuentas con " + Session["UserRecs"].ToString() + " puntos disponibles";


    }

    //protected void btnSend_Click(object sender, EventArgs e)
    //{
    //    SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
    //    SqlCommand objCmd = new SqlCommand();
    //    objCmd.Connection = objConn;

    //    if (hfUserMail.Value != txbMail.Text)
    //    {
    //        objCmd.CommandText = "EXEC UpdUserMail2 @Usr=" + Session["UserID"].ToString() + ", @NM='" + txbMail.Text + "'";
    //        try
    //        {
    //            objConn.Open();
    //            objCmd.ExecuteNonQuery();
    //        }
    //        catch (Exception ex)
    //        {
    //            Console.WriteLine(ex.Message);
    //        }
    //        finally
    //        {
    //            objConn.Close();
    //        }
    //    }

    //    objCmd.Dispose();
    //    objConn.Dispose();
    //}
}