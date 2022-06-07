using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("default.aspx");
        string useradmin = Session["UserAdmin"].ToString();
        if (useradmin != "true" )
            Response.Redirect("MyPage.aspx");
        //if (Session["UserName"].ToString() == "FASTENAL")
        //{
        //    RadTabStrip2.Tabs[0].Visible = false;
        //    RadTabStrip2.Tabs[1].Visible = false;
        //    RadTabStrip2.Tabs[2].Visible = false;
        //    RadTabStrip2.Tabs[3].Visible = false;
        //    RadTabStrip2.Tabs[4].Visible = true;
        //    RadTabStrip2.Tabs[5].Visible = false;

        //    PageView1.Enabled = false;
        //    PageView2.Enabled = false;
        //    PageView3.Enabled = false;
        //    RadPageView1.Enabled = false;
        //    RadPageView2.Enabled = true;
        //    RadPageView3.Enabled = false;

        //    PageView1.Visible = false;
        //    PageView2.Visible = false;
        //    PageView3.Visible = false;
        //    RadPageView1.Visible = false;
        //    RadPageView2.Visible = true;
        //    RadPageView3.Visible = false;

        //    RadPageView2.Selected = true;
            
        //    grdRecognitions.Enabled = false;
        //    grdReasons.Enabled = false;
        //    grdRocks.Enabled = false;
        //    RadGrid4.Enabled = false;
        //    RadGrid3.Enabled = false;
        //    RadGrid1.Enabled = false;

        //}
    }
    protected void RadGrid2_ItemInserted(object sender, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        dsExistencias.DataBind();
        RadGrid6.DataBind();
    }
   
}