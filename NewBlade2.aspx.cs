using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

public partial class NewBlade2 : System.Web.UI.Page
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
                        imagePreview.ImageUrl = "images/Recs2/" + dr.GetInt32(6).ToString() + ".png";
                        lblFolio.Text = Session["NewRecID"].ToString();
                        lblRecDescrip.Text = dr.GetString(7);
                        if (dr.GetInt32(8) != 0)
                            lblRecValue.Text = dr.GetInt32(8).ToString() + " Puntos";
                        else
                            lblRecValue.Text = "";
                        lblUserName.Text = dr.GetString(2);
                        //lblRock.Text = dr.GetString(8);
                        lblEstrat.Text = dr.GetString(12);
                        lblcomment.Text=dr.GetString(18);
                        lblGive.Text = dr.GetString(14);
                        lblDate.Text = dr.GetString(17);
                        hfUserMail.Value = dr.GetString(3);
                        hfGiveMail.Value = dr.GetString(15);
                        //txbMail.Text = dr.GetString(3);

                        //Label1.Text = dr.GetString(2);
                        //Label2.Text = dr.GetString(11);
                        //Label3.Text = dr.GetString(14);
                        //Label4.Text = dr.GetString(13);
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
            lblEstrat.Visible = false;
            //Label1.Visible = true;
            //Label2.Visible = true;
            //Label3.Visible = true;
            //Label4.Visible = true;
            //TextLabel1.Visible = true;
            //TextLabel2.Visible = true;

            //lblUserName.Visible = false;
            //lblReason.Visible = false;
            //lblDate.Visible = false;
            //lblGive.Visible = false;
        }
        else
        {
            //Label1.Visible = false;
            //Label2.Visible = false;
            //Label3.Visible = false;
            //Label4.Visible = false;
            //TextLabel1.Visible = false;
            //TextLabel2.Visible = false;

            lblUserName.Visible = true;
            lblEstrat.Visible = true;
            lblDate.Visible = true;
            lblGive.Visible = true;
        }
        if (!IsPostBack)
            SendMail();

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        //UpdateMail(); Este metodo actualiza el correo del usuario con el correo ingresado, para poder enviarlo posteriormente.
        SendMail();
        Response.Redirect("SendRecMail.aspx");
    }

    private void SendMail()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.Connection = objConn;

        string mailToSend = hfUserMail.Value.ToString() != txbMail.Text ? txbMail.Text : hfUserMail.Value;

         mailToSend = mailToSend.Trim();
        {

            objCmd.CommandText = "EXEC [SendRecognition] @ID=" + Session["NewRecID"].ToString() + ", @emailReceipt='"+mailToSend+"'";
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
    }

    private void UpdateMail()
    {
        if (hfUserMail.Value != txbMail.Text)
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objConn;
        
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

            objCmd.Dispose();
            objConn.Dispose();
        }

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