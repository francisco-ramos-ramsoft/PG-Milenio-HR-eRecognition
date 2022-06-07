<%@ WebHandler Language="C#" Class="FileDowload" %>

using System;
using System.Web;

public class FileDowload : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        /*context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");*/
        string fileName = "Plantilla_Blades.xlsx";
        string filePath = context.Server.MapPath("~/Templates/");
        context.Response.Clear();
        context.Response.ContentType = "application/xlsx";
        context.Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
        context.Response.TransmitFile(filePath + fileName);
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}