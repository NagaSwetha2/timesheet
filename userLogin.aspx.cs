using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class userLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("home.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        string query = "select count(*) from time_sheets where id='" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            con.Open();
            string pass = "select password from time_sheets where id='" + TextBox1.Text + "'";
            SqlCommand passcmd = new SqlCommand(pass, con);
            string password = passcmd.ExecuteScalar().ToString();
            if (password == TextBox2.Text)
            {
                Session["New"] = TextBox1.Text;
                Server.Transfer("gridview.aspx");


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
}