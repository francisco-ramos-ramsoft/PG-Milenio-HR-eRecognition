using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using xi = Telerik.Web.UI.ExportInfrastructure;
using Telerik.Web.UI.GridExcelBuilder;
using System.Drawing;
using System.IO;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;


public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dtBegin.SelectedDate = DateTime.Now.AddMonths(-1);
            dtEnd.SelectedDate = DateTime.Now;
            grdManagers.Visible = true;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;
            pnlBlades.Visible = false;
            pnlTotals.Visible = false;
        }
    }

    protected void RadComboBox1_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (RadComboBox1.Text == "Managers"){
            pnlManager.Visible = true;
            RadButton1.Visible=true;
            RadButton2.Visible=true;}
        else
            pnlManager.Visible = false;
        

        if (RadComboBox1.Text == "Inventarios"){
            pnlDates.Visible = false;
            pnlTotals.Visible=false;
            RadButton1.Visible = true;
            RadButton2.Visible = true;
        }
        else
            pnlDates.Visible = true;

        if (RadComboBox1.Text == "Asignacion de Alces")
        {
            pnlBlades.Visible = true;
            pnlDates.Visible = false;
            pnlTotals.Visible = false;
            RadButton1.Visible = true;
            RadButton2.Visible = true;
        }
        else
            pnlBlades.Visible = false;

        if (RadComboBox1.Text == "Reportes de Totales")
        {
            pnlTotals.Visible = true;
            pnlBlades.Visible = false;
            pnlDates.Visible = false;
            RadButton1.Visible = false;
            RadButton2.Visible = false;
        }
        else
            pnlTotals.Visible = false;

       RadButton1_Click(sender, e);
    }

    protected void RadButton1_Click(object sender, EventArgs e)
    {
        if (RadComboBox1.Text == "Managers")
        {
            grdManagers.Visible = true;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;

            dsGrdManagers.SelectParameters["UG"].DefaultValue = RadComboBox2.SelectedValue;
            dsGrdManagers.SelectParameters["B"].DefaultValue = dtBegin.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdManagers.SelectParameters["E"].DefaultValue = dtEnd.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdManagers.DataBind();
            grdManagers.Rebind();
        }
        if (RadComboBox1.Text == "Tipos de Reconocimientos")
        {
            grdManagers.Visible = false;
            grdRecognitios.Visible = true;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;

            dsGrdRecognitions.SelectParameters["B"].DefaultValue = dtBegin.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdRecognitions.SelectParameters["E"].DefaultValue = dtEnd.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdRecognitions.DataBind();
            grdRecognitios.Rebind();
        }
        if (RadComboBox1.Text == "Inventarios")
        {
            grdManagers.Visible = false;
            grdRecognitios.Visible = false;
            grdInventory.Visible = true;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;

            grdInventory.Rebind();
        }
        if (RadComboBox1.Text == "Canje de artículos")
        {
            grdManagers.Visible = false;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = true;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;

            dsGrdExchange.SelectParameters["B"].DefaultValue = dtBegin.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdExchange.SelectParameters["E"].DefaultValue = dtEnd.SelectedDate.Value.ToString("yyyy-MM-dd");
            dsGrdExchange.DataBind();
            grdInventory.Rebind();
        }
        if (RadComboBox1.Text == "Registro de Impresiones")
        {

            grdManagers.Visible = false;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = true;
            GrdBlades.Visible = false;

            grdLogPrint.Rebind();
        }
        if (RadComboBox1.Text == "Asignacion de Alces")
        {
            grdManagers.Visible = false;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = true;

            if (Name.Text != "")
            {
                dsBlades.SelectParameters["Name"].DefaultValue = Name.Text;
            }
            else
            {
                dsBlades.SelectParameters["Name"].DefaultValue = "%%";
            }
            int month=0;
            int.TryParse(Month.Text , out month);
            dsBlades.SelectParameters["Month"].DefaultValue = month.ToString();
            dsBlades.DataBind();
            GrdBlades.Rebind();
        }
        if (RadComboBox1.Text == "Reportes de Totales")
        {
            grdManagers.Visible = false;
            grdRecognitios.Visible = false;
            grdInventory.Visible = false;
            grdExchange.Visible = false;
            grdLogPrint.Visible = false;
            GrdBlades.Visible = false;            

        }
    }

    protected void RadButton2_Click(object sender, EventArgs e)
    {

        string alternateText = "Xlsx";
        

        if (RadComboBox1.Text == "Managers")
        {
            grdManagers.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            grdManagers.ExportSettings.IgnorePaging = true;            
            grdManagers.ExportSettings.ExportOnlyData = true;
            grdManagers.ExportSettings.OpenInNewWindow = true;
            //grdManagers.ExportSettings.FileName = "RecMilenio_Managers_" + RadComboBox2.SelectedValue;
            grdManagers.ExportSettings.FileName = "RecAlceBlanco_Managers_" + RadComboBox2.SelectedValue;
            grdManagers.MasterTableView.ExportToExcel();

            
            /*RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            RadGrid1.MasterTableView.ExportToExcel();*/
        }
        if (RadComboBox1.Text == "Tipos de Reconocimientos")
        {
            grdRecognitios.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            grdRecognitios.ExportSettings.IgnorePaging = true;
            grdRecognitios.ExportSettings.OpenInNewWindow = true;
            grdRecognitios.ExportSettings.ExportOnlyData = true;
            //grdRecognitios.ExportSettings.FileName = "RecMilenio_Reconocimientos";
            grdRecognitios.ExportSettings.FileName = "RecAlceBlanco_Reconocimientos";
            grdRecognitios.MasterTableView.ExportToExcel();
        }
        if (RadComboBox1.Text == "Inventarios")
        {
            grdInventory.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            grdInventory.ExportSettings.IgnorePaging = true;
            grdInventory.ExportSettings.OpenInNewWindow = true;
            grdInventory.ExportSettings.ExportOnlyData = true;
            //grdInventory.ExportSettings.FileName = "RecMilenio_Inventarios";
            grdInventory.ExportSettings.FileName = "RecAlceBlanco_Inventarios";
            grdInventory.MasterTableView.ExportToExcel();
        }
        if (RadComboBox1.Text == "Canje de artículos")
        {
            grdExchange.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            grdExchange.ExportSettings.IgnorePaging = true;
            grdExchange.ExportSettings.OpenInNewWindow = true;
            grdExchange.ExportSettings.ExportOnlyData = true;
            //grdExchange.ExportSettings.FileName = "RecMilenio_Canje";
            grdExchange.ExportSettings.FileName = "RecAlceBlanco_Canje";
            grdExchange.MasterTableView.ExportToExcel();
        }
        if (RadComboBox1.Text == "Registro de Impresiones")
        {
            grdLogPrint.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            grdLogPrint.ExportSettings.IgnorePaging = true;
            grdLogPrint.ExportSettings.OpenInNewWindow = true;
            grdLogPrint.ExportSettings.ExportOnlyData = true;
            //grdLogPrint.ExportSettings.FileName = "RecMilenio_Impresiones";
            grdLogPrint.ExportSettings.FileName = "RecAlceBlanco_Impresiones";
            grdLogPrint.MasterTableView.ExportToExcel();
        }
        if (RadComboBox1.Text == "Asignacion de Alces")
        {
            GrdBlades.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
            GrdBlades.ExportSettings.IgnorePaging = true;
            GrdBlades.ExportSettings.OpenInNewWindow = true;
            GrdBlades.ExportSettings.ExportOnlyData = true;
            GrdBlades.ExportSettings.FileName = "Rec_AlcesAsignadas_" + Name.Text + "_" + Month.Text; ;
            GrdBlades.MasterTableView.ExportToExcel();
        }
    }
    protected void RadTotalsYear_Click(object sender, EventArgs e)
    {
        Execute_Query("exec SPexecReportYearRec");
    }
    protected void RadTotalsLastYear_Click(object sender, EventArgs e)
    {
        Execute_Query("exec SPexecReportLastYearRec");
    }
    protected void RadTotalsLastMonth_Click(object sender, EventArgs e)
    {
        Execute_Query("exec SPexecReportMonthlyRecLastMonth");
    }
    protected void RadTotalsMonth_Click(object sender, EventArgs e)
    {
        Execute_Query("exec SPexecReportMonthlyRec");
    }

    private void Execute_Query(string sQuery)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        objCmd.CommandText = sQuery;
        objCmd.Connection = objConn;
        try
        {
            objConn.Open();
            objCmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
        finally
        {
            objConn.Close();
        }
        objCmd.Dispose();
        objConn.Dispose();
    }
}