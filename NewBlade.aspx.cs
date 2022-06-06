using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class NewBlade : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NewRecID"] == null)
            Response.Redirect("Blade.aspx");
        else
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
            SqlCommand objCmd = new SqlCommand();
            objCmd.CommandText = "Select * from vRecognitionDetails Where ID=" + Session["NewRecID"].ToString();
            objCmd.Connection = objConn;
            try
            {
                objConn.Open();
                SqlDataReader dr = objCmd.ExecuteReader();
                try
                {
                    if (dr.Read())
                    {
                        imagePreview.ImageUrl = "images/Recs/" + dr.GetInt32(4).ToString() + ".png";
                        //lblRecDescrip.Text = dr.GetString(5);
                        lblUserName.Text = dr.GetString(2);
                        //lblRock.Text = dr.GetString(8);
                        lblReason.Text = dr.GetString(9);
                        lblGive.Text = dr.GetString(11);
                        lblDate.Text = dr.GetString(13);
                        hfUserMail.Value = dr.GetString(3);
                        hfGiveMail.Value = dr.GetString(12);
                        txbMail.Text = dr.GetString(3);

                        Label1.Text = dr.GetString(2);
                        Label2.Text = dr.GetString(11);
                        Label3.Text = dr.GetString(14);
                        Label4.Text = dr.GetString(13);
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


        if (Session["iRec"].ToString() == "10" || Session["iRec"].ToString() == "11")
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            TextLabel1.Visible = true;
            TextLabel2.Visible = true;

            lblUserName.Visible = false;
            lblReason.Visible = false;
            lblDate.Visible = false;
            lblGive.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            TextLabel1.Visible = false;
            TextLabel2.Visible = false;

            lblUserName.Visible = true;
            lblReason.Visible = true;
            lblDate.Visible = true;
            lblGive.Visible = true;
        }

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.Connection = objConn;

        //if (hfUserMail.Value != txbMail.Text)
        //{
        //    objCmd.CommandText = "EXEC UpdUserMail @ID=" + Session["NewRecID"].ToString() + ", @NM='"+ txbMail.Text +"'";
        //    try
        //    {
        //        objConn.Open();
        //        objCmd.ExecuteNonQuery();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //    finally
        //    {
        //        objConn.Close();
        //    }
        //}
        string mailToSend = hfUserMail.Value.ToString() != txbMail.Text ? txbMail.Text : hfUserMail.Value;

        mailToSend = mailToSend.Trim();
        objCmd.CommandText = "EXEC [SendRecognition] @ID=" + Session["NewRecID"].ToString() + " @emailReceipt='" + mailToSend+"'";
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
        Response.Redirect("SendRecMail.aspx");
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "PrintOperation", "window.print();", true);
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC AddLogPrint @RID=" + Session["NewRecID"].ToString();
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