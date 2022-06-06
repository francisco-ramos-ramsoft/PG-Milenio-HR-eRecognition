using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RadGrid5.ItemDataBound += new GridItemEventHandler(RadGrid1_ItemDataBound);
        if (Session["UserID"] == null)
            Response.Redirect("default.aspx");
        string useradmin = Session["UserAdmin"].ToString();
        if (useradmin != "true")
            Response.Redirect("MyPage.aspx");
    }
    protected void RadGrid2_ItemInserted(object sender, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        dsExistencias.DataBind();
        RadGrid6.DataBind();
    }
    public void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
    {

        if (e.File.FileName.Contains(".xlsx"))
        {
            string filePath = Server.MapPath("~/TempFiles/" + e.File.FileName.Replace(" ", "_"));
            e.File.SaveAs(filePath);
            //check file was submitted
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            //2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);

            //4. DataSet - Create column names from first row
            DataSet result = excelReader.AsDataSet(new ExcelDataSetConfiguration()
            {
                ConfigureDataTable = (_) => new ExcelDataTableConfiguration()
                {
                    UseHeaderRow = true
                }
            });
            //5. Data Reader methods
            if (result.Tables[0].Columns.Contains("Shortname"))
            {
                SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Server"].ConnectionString);
                objConn.Open();
                string s = "";
                bool flag = false;
                foreach (DataRow r in result.Tables[0].Rows)
                {
                    if (r["Shortname"].ToString() != "")
                    {
                        SqlCommand objCmd = new SqlCommand();

                        objCmd.CommandText = "INSERT INTO [UserRecQty] ([UserID], [Month], [RecID], [Qty]) ";
                        objCmd.CommandText += "VALUES ((Select [ID] from [Users] where Mail='" + r["Shortname"].ToString().Replace("@pg.com", "") + "'),";
                        objCmd.CommandText += r["Fecha"].ToString() + ",(Select ID from [Recognitions] where Name='";
                        objCmd.CommandText += r["Reconocimiento"].ToString();
                        objCmd.CommandText += "')," + r["Cantidad"].ToString() + ")";
                        objCmd.Connection = objConn;
                        try
                        {

                            objCmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                            flag = true;
                            s += r["Shortname"].ToString() + ",";

                        }
                        finally
                        {
                            objCmd.Dispose();
                        }
                    }
                }//6. Free resources (IExcelDataReader is IDisposable)
                objConn.Close();
                objConn.Dispose();
                excelReader.Close();
                if (!flag)
                {
                    UploadDetails.Text = "Carga Realizada con Exito.";
                }
                else
                {
                    UploadDetails.Text = "Carga Realizada. Hubo uno o varios registros que fallaron." + s;
                }
            }
            else
            {
                UploadDetails.Text = "Formato Incorrecto.";
            }
        }
        else
        {
            UploadDetails.Text = "El archivo no es un excel";
        }

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {

        //Response.Redirect("Request/FileDowload.ashx");
        // Response.End();
    }
    const int MaxTotalBytes = 1048576; // 1 MB
    Int64 totalBytes;
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
                SqlDataSource1.InsertParameters[0].DefaultValue =  file.GetName();
                SqlDataSource1.InsertParameters[1].DefaultValue = Session["UserID"].ToString();
              
        }
    }
    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        RadAsyncUpload upload = e.Item.FindControl("RadUpload1") as RadAsyncUpload;
        if (upload.UploadedFiles.Count > 0)
        {
            UploadedFile file = upload.UploadedFiles[0];
            SqlDataSource1.UpdateParameters.Add("ImageName", file.GetName());
        }
        else
        {
            SqlDataSource1.UpdateParameters.Add("ImageName", "");
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

    protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        string s = e.Command.Parameters.ToString();
    }   
}