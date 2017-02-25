using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_functions : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Visible = false;

            // TextBox1.Text = Session["admin"].ToString();
            TextBox1.Visible = false;

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("userList.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("page.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = Session["admin"].ToString();
        Server.Transfer("changepassword.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Server.Transfer("home.aspx");
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Server.Transfer("timesheet.aspx");
        //sponse.Redirect("timesheet.aspx", false);
    }

}
