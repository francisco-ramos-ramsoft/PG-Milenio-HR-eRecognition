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

/// <summary>
/// Summary description for MyFilterClass
/// </summary>

namespace MyStuff
{
    public class MyFilterClass : GridDropDownColumn
    {
        
        //RadGrid calls this method when it initializes the controls inside the filtering item cells
        protected override void SetupFilterControls(TableCell cell)
        {
            base.SetupFilterControls(cell);
            cell.Controls.RemoveAt(0);
            DropDownList list = new DropDownList();
            list.ID = "list" + this.DataField;
            list.AutoPostBack = true;
            list.SelectedIndexChanged += new EventHandler(list_SelectedIndexChanged);
            cell.Controls.AddAt(0, list);
            cell.Controls.RemoveAt(1);
            list.DataTextField = this.DataField;
            list.DataValueField = this.DataField;
            list.DataSourceID = "dsLUsers";
        }
        void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridFilteringItem filterItem = (sender as DropDownList).NamingContainer as GridFilteringItem;
            if (this.DataType == System.Type.GetType("System.Int32") || this.DataType == System.Type.GetType("System.Int16") || this.DataType == System.Type.GetType("System.Int64"))
            {
                filterItem.FireCommandEvent("Filter", new Pair("EqualTo", this.UniqueName));
            }
            else
                // treat everything else like a string   
                filterItem.FireCommandEvent("Filter", new Pair("Contains", this.UniqueName));
        }
        //RadGrid calls this method when the value should be set to the filtering input control(s)  
        protected override void SetCurrentFilterValueToControl(TableCell cell)
        {
            base.SetCurrentFilterValueToControl(cell);
            DropDownList list = (DropDownList)cell.Controls[0];
            if (this.CurrentFilterValue != string.Empty)
            {
                list.SelectedValue = this.CurrentFilterValue;
            }
        }
        //RadGrid calls this method to extract the filtering value from the filtering input control(s)  
        protected override string GetCurrentFilterValueFromControl(TableCell cell)
        {
            DropDownList list = (DropDownList)cell.Controls[0];
            return list.SelectedValue;
        }
        protected override string GetFilterDataField()
        {
            return this.DataField;
        }
    }
}