using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class login : System.Web.UI.Page {

    SqlConnection con = new SqlConnection(@"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        con.Open();
        string q = "select count(*) from time_sheets where id='" + TextBox1.Text + "'";
        SqlCommand c1 = new SqlCommand(q, con);
        int temp = Convert.ToInt32(c1.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            Response.Write("ID exists.. Please enter a proper ID");
        }
        else
        {
            con.Open();
            string query = "insert into time_sheets(id,name,contact,email,password) values(@id,@name,@contact,@email,@password)";
            // string check_userName = "select count(*) from time_sheets where username='" + TextBox1.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", TextBox1.Text);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@contact", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox4.Text);
            //cmd.Parameters.AddWithValue("@username", TextBox5.Text);
            cmd.Parameters.AddWithValue("@password", TextBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            // Response.Write("Registration was successful");
            Server.Transfer("home.aspx");
          //  Response.Redirect("./");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("home.aspx");
    }
}
