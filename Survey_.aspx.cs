using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Survey_ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList1.SelectedItem.Text == "No")
            RadTextBox5.Enabled = true;
        else
            RadTextBox5.Enabled = false;
    }
    protected void RadioButtonList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList8.SelectedItem.Text == "Malo")
            RadTextBox1.Enabled = true;
        else
            RadTextBox1.Enabled = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string q1 = RadioButtonList1.SelectedItem.Text;
        string q1r = RadTextBox5.Text;
        string q21 = RadioButtonList2.SelectedValue.ToString();
        string q21r = RadTextBox2.Text;
        string q22 = RadioButtonList3.SelectedValue.ToString();
        string q22r = RadTextBox4.Text;
        string q23 = RadioButtonList4.SelectedValue.ToString();
        string q23r = RadTextBox6.Text;
        string q24 = RadioButtonList5.SelectedValue.ToString();
        string q24r = RadTextBox7.Text;
        string q31 = RadioButtonList6.SelectedValue.ToString();
        string q31r = RadTextBox8.Text;
        string q32 = RadioButtonList7.SelectedValue.ToString();
        string q32r = RadTextBox9.Text;
        string q4 = RadioButtonList8.SelectedValue.ToString();
        string q4r = RadTextBox1.Text;
        string q5 = RadioButtonList9.SelectedValue.ToString();

        string q5n = string.Empty;
        if (cbbEmploye.SelectedItem!=null)
            q5n = cbbEmploye.Text;
        string q5g = RadTextBox3.Text;
        string q5r = string.Empty;
        if (cbbRecs.SelectedItem != null)
            q5r = cbbRecs.Text;

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC SaveSurvey @Usr=" + Session["UserID"].ToString() + ", @Q1='" + q1 + "', @Q1R='" + q1r + "', @Q21='" + q21 + "', @Q22='" + q22 + "', @Q23='" + q23 + "', @Q24='" + q24 + "', @Q31='" + q31 + "', @Q32='" + q32 + "', @Q4='" + q4 + "', @Q4R='" + q4r + "', @Q5='" + q5 + "', @Q5n='" + q5n + "', @Q5g='" + q5g + "', @Q5r='" + q5r + "', @Q21r='" + q21r + "', @Q22r='" + q22r + "', @Q23r='" + q23r + "', @Q24r='" + q24r + "', @Q31r='" + q31r + "', @Q32r='" + q32r + "'";
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            objCmd.ExecuteNonQuery(); 
            Response.Redirect("Thanks.aspx");
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
    protected void RadioButtonList9_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList9.SelectedItem.Text == "No")
        {
            cbbEmploye.Enabled = false;
            RadTextBox3.Enabled = false;
            cbbRecs.Enabled = false;
        }
        else
        {
            cbbEmploye.Enabled = true;
            RadTextBox3.Enabled = true;
            cbbRecs.Enabled = true;
        }
    }

    void EnableButton()
    {
        if (RadioButtonList1.SelectedItem!=null && 
            RadioButtonList2.SelectedItem!=null && 
            RadioButtonList3.SelectedItem!=null && 
            RadioButtonList4.SelectedItem!=null && 
            RadioButtonList5.SelectedItem!=null && 
            RadioButtonList6.SelectedItem!=null && 
            RadioButtonList7.SelectedItem!=null && 
            RadioButtonList8.SelectedItem!=null && 
            RadioButtonList9.SelectedItem!=null
            )
            ImageButton1.Enabled=true;
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList2.SelectedItem.Text == "Malo")
        {
            RadTextBox2.Enabled = true;
            RadTextBox2.Focus();
        }
        else
            RadTextBox2.Enabled = false;
    }
    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList3.SelectedItem.Text == "Malo")
        {
            RadTextBox4.Enabled = true;
            RadTextBox4.Focus();
        }
        else
            RadTextBox4.Enabled = false;
    }
    protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList4.SelectedItem.Text == "Malo")
        {
            RadTextBox6.Enabled = true;
            RadTextBox6.Focus();
        }
        else
            RadTextBox6.Enabled = false;
    }
    protected void RadioButtonList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList5.SelectedItem.Text == "Malo")
        {
            RadTextBox7.Enabled = true;
            RadTextBox7.Focus();
        }
        else
            RadTextBox7.Enabled = false;
    }
    protected void RadioButtonList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList6.SelectedItem.Text == "Malo")
        {
            RadTextBox8.Enabled = true;
            RadTextBox8.Focus();
        }
        else
            RadTextBox8.Enabled = false;
    }
    protected void RadioButtonList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList7.SelectedItem.Text == "Malo")
        {
            RadTextBox9.Enabled = true;
            RadTextBox9.Focus();
        }
        else
            RadTextBox9.Enabled = false;
    }
}