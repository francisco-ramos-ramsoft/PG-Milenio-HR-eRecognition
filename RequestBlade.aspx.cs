using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestBlade : System.Web.UI.Page
{
    protected void Page_Prerender(object sender, EventArgs e)
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            RadioButtonList1.SelectedIndex = 0;
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        string iEmpID = string.Empty;
        string iNR = string.Empty;
        if (RadioButtonList1.SelectedValue=="Masivo")
        {
            iEmpID = "0";
            iNR = RadNumericTextBox1.Value.ToString();
        }
        else
        {
            iEmpID = cbbEmploye.SelectedValue;
            iNR = "1";
        }
        
        string iRsnID = cbbReason.SelectedValue;
        string iUsrID = Session["UserID"].ToString();
        string iRecID = cbbRecs.SelectedValue;
        string sCom = txbReason.Text;

        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = "EXEC RequestNewBlade @Usr=" + iUsrID + ", @Emp=" + iEmpID + ", @NR=" + iNR + ", @Rsn=" + iRsnID + ", @Rec=" + iRecID + ", @Com='" + sCom + "'";
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            objCmd.ExecuteNonQuery();
            Response.Redirect("RequestNewBlade.aspx");
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
    protected void cbbRecs_TextChanged(object sender, EventArgs e)
    {
        EnableButton();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Individual")
        {
            cbbEmploye.Visible = true;
            RadNumericTextBox1.Visible=false;
        }
        else
        {
            cbbEmploye.Visible = false;
            RadNumericTextBox1.Visible = true;
        }
        EnableButton();
    }

    private void EnableButton()
    {
        string empl = string.Empty;
        if (RadioButtonList1.SelectedValue == "Masivo")
            empl = "Masivo";
        else
            empl = cbbEmploye.Text;

        btnGenerate.Enabled = (empl != "") && (cbbRock.Text != "") && (cbbReason.Text != "") && (cbbRecs.Text != "");
    }
}