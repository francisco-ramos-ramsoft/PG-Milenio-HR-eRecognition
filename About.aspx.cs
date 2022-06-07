using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageButton6.Attributes.Add("OnClick", "javascript:url('img2/info05_1.png');");
        ImageButton7.Attributes.Add("OnClick", "javascript:url('img2/info05_2.png');");
        ImageButton8.Attributes.Add("OnClick", "javascript:url('img2/info05_3.png');");

        ImageButton10.Attributes.Add("OnClick", "javascript:url('help/job aid otorgamiento de blades sistema online  oct 2016.pdf');");
        ImageButton11.Attributes.Add("OnClick", "javascript:url('help/job aid canje de blades sistema online  oct 2016.pdf');");
        ImageButton12.Attributes.Add("OnClick", "javascript:url('help/job aid solicitar blades sistema online  oct 2016.pdf');");

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Default();
        imagePreview.ImageUrl = "img2/Info01.png";
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Default();
        imagePreview.ImageUrl = "img2/Info02.png";
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Default();
        imagePreview.ImageUrl = "img2/Info03.png";
        
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Default();
        pnlPreview.ScrollBars = ScrollBars.Vertical;
        imagePreview.Height = 520;
        imagePreview.ImageUrl = "img2/Info04.png";
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        pnlPreview.Visible = false;
        panel1.Visible = true;
        panel2.Visible = false;
    }

    void Default()
    {
        pnlPreview.ScrollBars = ScrollBars.None;
        imagePreview.Height = 400;
        pnlPreview.Visible = true;
        panel1.Visible = false;
        panel2.Visible = false;
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        pnlPreview.Visible = false;
        panel1.Visible = false;
        panel2.Visible = true;
    }
}