using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Survey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList1.SelectedItem.Text == "No")
        {
            RadTextBox1.Enabled = true;
            RadTextBox1.Focus();
        }
        else
            RadTextBox1.Enabled = false;
    }
    protected void RadioButtonList2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList2.SelectedItem.Text == "No")
        {
            RadTextBox2.Enabled = true;
            RadTextBox2.Focus();
        }
        else
            RadTextBox2.Enabled = false;
    }
    protected void RadioButtonList3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList3.SelectedItem.Text == "No")
        {
            RadTextBox3.Enabled = true;
            RadTextBox3.Focus();
        }
            RadTextBox3.Enabled = false;
    }
    protected void RadioButtonList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList6.SelectedItem.Text == "Malo")
        {
            RadTextBox4.Enabled = true;
            RadTextBox4.Focus();
        }
        else
            RadTextBox4.Enabled = false;
    }
    protected void RadioButtonList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        EnableButton();
        if (RadioButtonList7.SelectedItem.Text == "Malo")
        {
            RadTextBox5.Enabled = true;
            RadTextBox5.Focus();
        }
        else
            RadTextBox5.Enabled = false;
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string q1 = RadioButtonList1.SelectedItem.Text;
        string q1r = RadTextBox1.Text;
        string q2 = RadioButtonList2.SelectedValue.ToString();
        string q2r = RadTextBox2.Text;
        string q3 = RadioButtonList3.SelectedValue.ToString();
        string q3r = RadTextBox3.Text;
        string q41 = RadioButtonList6.SelectedValue.ToString();
        string q41r = RadTextBox4.Text;
        string q42 = RadioButtonList7.SelectedValue.ToString();
        string q42r = RadTextBox5.Text;
        string q5r = RadTextBox6.Text;        

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC SaveSurvey2 @Usr=" + Session["UserID"].ToString() + ", @Q1='" + q1 + "', @Q1R='" + q1r + "', @Q2='" + q2 + "', @Q2R='" + q2r + "', @Q3='" + q3 + "', @Q3R='" + q3r + "', @Q41='" + q41 + "', @Q41R='" + q41r + "', @Q42='" + q42 + "', @Q42R='" + q42r + "', @Q5R='" + q5r + "'";
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
    
    void EnableButton()
    {
        if (RadioButtonList1.SelectedItem!=null && 
            RadioButtonList2.SelectedItem!=null && 
            RadioButtonList3.SelectedItem!=null && 
            RadioButtonList6.SelectedItem!=null && 
            RadioButtonList7.SelectedItem!=null 
            )
            ImageButton1.Enabled=true;
    }
        
}