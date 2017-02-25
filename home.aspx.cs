using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page

{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("Admin.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("registration.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Server.Transfer("userLogin.aspx");
    }
}