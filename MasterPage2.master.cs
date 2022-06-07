using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            lblUser.Text = Session["UserName"].ToString();
            lblDepto.Text = Session["UserRol"].ToString();
        }
        else
            Response.Redirect("Default.aspx");
        Random r = new Random();
        int i = r.Next(1, 4);

        imgesq.ImageUrl = "img2/people0" + i.ToString() + ".png";

        string useradmin = Session["UserAdmin"].ToString();
        if (useradmin == "true" && Session["UserName"].ToString() != "FASTENAL")
        {
            ImageButton1.Visible = true;
            ImageButton2.Visible = true;
            ImageButton3.Visible = true;
            ImageButton4.Visible = true;
            ImageButton5.Visible = true;
            ImageButton6.Visible = true;
        }
        else
        {
            if (Session["UserName"].ToString() == "FASTENAL")
            {
                ImageButton1.Visible = false;
                ImageButton2.Visible = false;
                ImageButton3.Visible = false;
                ImageButton4.Visible = false;
                ImageButton5.Visible = true;
                ImageButton6.Visible = true;
                ImageButton8.Visible = false;
                ImageButton9.Visible = false;
                ImageButton10.Visible = false;
            }
            else
            {
                ImageButton1.Visible = true;
                ImageButton2.Visible = true;
                ImageButton3.Visible = true;
                ImageButton4.Visible = false;
                ImageButton5.Visible = false;
                ImageButton6.Visible = false;
            }
        }
        UpdatePoints();
    }

    void UpdatePoints()
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From vUsers Where ID=" + Session["UserID"].ToString();
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    Session["UserRecs"] = dr.GetInt32(5).ToString();
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

    protected void btnClose_Click(object sender, EventArgs e)
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
