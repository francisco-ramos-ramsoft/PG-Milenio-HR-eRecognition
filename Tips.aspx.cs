using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tips : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip01.png";
        Default();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip02.png";
        Default();
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip03.png";
        Default();
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip04.png";
        Default();
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip05.png";
        Default();
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip06.png";
        Default();
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip07.png";
        Default();
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.ImageUrl = "img2/Tip08.png";
        Default();
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        imagePreview.Height = 360;
        imagePreview.Width = 810;
        ImageButton10.Visible = true;
        imagePreview.ImageUrl = "img2/Tip09.png";        
    }

    void Default()
    {
        imagePreview.Height = 400;
        imagePreview.Width = 850;
        ImageButton10.Visible = false;

    }
}