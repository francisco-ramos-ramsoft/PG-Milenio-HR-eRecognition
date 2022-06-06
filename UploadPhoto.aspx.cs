using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class UploadPhoto : System.Web.UI.Page
{
    const int MaxTotalBytes = 1048576; // 1 MB
    Int64 totalBytes;

    protected void Page_Load(object sender, EventArgs e)
    {
        RadGrid1.ItemDataBound += new GridItemEventHandler(RadGrid1_ItemDataBound);
    }

    void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            RadAsyncUpload upload = e.Item.FindControl("RadUpload1") as RadAsyncUpload;
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "Upload", string.Format("window['UploadId'] = '{0}';", upload.ClientID), true);
        }
    }

    protected void RadGrid1_InsertCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        RadAsyncUpload upload = e.Item.FindControl("RadUpload1") as RadAsyncUpload;
        if (upload.UploadedFiles.Count > 0)
        {
            UploadedFile file = upload.UploadedFiles[0];
            SqlDataSource1.InsertParameters.Add("ImageName", file.GetName());
            SqlDataSource1.InsertParameters.Add("UserID", Session["UserID"].ToString());
        }
    }
    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        RadUpload upload = e.Item.FindControl("RadUpload1") as RadUpload;
        if (upload.UploadedFiles.Count > 0)
        {
            UploadedFile file = upload.UploadedFiles[0];
            SqlDataSource1.UpdateParameters.Add("ImageName", file.GetName());
        }
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