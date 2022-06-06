using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void SetButton()
    {
        bool change=false;
        int cost=0;
        if (lblCost.Text!="")
            cost=Convert.ToInt32(lblCost.Text);
        int points = 0;
        if (lblPoints.Text!="")
            points = Convert.ToInt32(lblPoints.Text);
        int qty = 0;
        if (lblQty.Text != "")
            qty = Convert.ToInt32(lblQty.Text);
        if (cost <= points && qty > 0)
            change = true;
        btnGenerate.Enabled = (cbbEmpl.Text != "") && (cbbGifts.Text != "") && (change);
    }

    protected void cbbEmpl_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From vUsers Where ID=" + cbbEmpl.SelectedValue.ToString();;
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    lblMail.Text = dr.GetString(3);
                    lblNumEmp.Text = dr.GetInt32(1).ToString(); 
                    lblPoints.Text = dr.GetInt32(5).ToString();
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
        SetButton();
    }
    protected void cbbGifts_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "Select * From vGifts Where ID=" + cbbGifts.SelectedValue.ToString(); 
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            SqlDataReader dr = objCmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    lblDescripp.Text = dr.GetString(2);
                    lblCost.Text = dr.GetInt32(3).ToString();
                    lblQty.Text = dr.GetInt32(6).ToString();
                    GiftPrev.ImageUrl = "images/gifts/" + cbbGifts.SelectedValue.ToString() + ".png";
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
        SetButton();
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        int iRecID = 0;
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC [NewChange] @Usr = " + cbbEmpl.SelectedValue.ToString() + ", @Gft=" + cbbGifts.SelectedValue.ToString(); 
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

        if (iRecID != 0)
        {
            Session["NewChangeID"] = iRecID.ToString();
            Response.Redirect("ChangeComplete.aspx");
        }
    }
}