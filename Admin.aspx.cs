using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True");
    
  
    //SqlConnection con = new SqlConnection(@"Data Source=LIB-LAXMAN\SQLEXPRESS;Initial Catalog=timesheet_project;User ID=sa;Password=qwertypoiu123!");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        string query = "select count(*) from admins where username='" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            con.Open();
            string pass = "select password from admins where username='" + TextBox1.Text + "'";
            SqlCommand passcmd = new SqlCommand(pass, con);
            string password = passcmd.ExecuteScalar().ToString();
            if (password == TextBox2.Text)
            {
                Session["admin"] = TextBox1.Text;

                //  Response.Redirect("C:/Users/Systems/Documents/Visual Studio 2012/WebSites/sheet/admin_functions.aspx");

                Server.Transfer("admin_functions.aspx");

                /*string q = "insert into info(u_id) values('" + TextBox1.Text + "')";
                 SqlCommand cm = new SqlCommand(q, con);
                 cm.ExecuteNonQuery();*/



            }
            else
            {
                Response.Write("password is incorrect");
            }
        }
        else
        {
            Response.Write("dawg is not correct");
        }
        con.Close();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       // Response.Redirect("./");
        Server.Transfer("home.aspx");


    }
}