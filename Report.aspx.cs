using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        dtBegin.SelectedDate = Convert.ToDateTime("2016-08-01");
        dtEnd.SelectedDate = DateTime.Now;
    }
    protected void RadComboBox1_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        

        if (RadComboBox1.Text == "Managers")
            pnlManager.Visible = true;
        else
            pnlManager.Visible = false;

        if (RadComboBox1.Text == "Inventarios")
            pnlDates.Visible = false;
        else
            pnlDates.Visible = true;

        RadButton1_Click(sender, e);
    }
    protected void RadButton1_Click(object sender, EventArgs e)
    {
        var uriReportSource = new Telerik.Reporting.UriReportSource();
        uriReportSource.Uri = RadComboBox1.SelectedValue;
        if (RadComboBox1.Text == "Managers")
        {
            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("UG", RadComboBox2.SelectedValue));
            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("B", dtBegin.SelectedDate.Value.ToString("yyyy-MM-dd")));
            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("E", dtEnd.SelectedDate.Value.ToString("yyyy-MM-dd")));
        }
        if (RadComboBox1.Text == "Tipos de Reconocimientos")
        {
            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("B", dtBegin.SelectedDate.Value.ToString("yyyy-MM-dd")));
            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("E", dtEnd.SelectedDate.Value.ToString("yyyy-MM-dd")));
        }
        ReportViewer1.ReportSource = uriReportSource;
        ReportViewer1.RefreshReport();
    }
}