using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class changePassword : System.Web.UI.Page
{
    String con = "Data Source=SWETHA;Initial Catalog=master;Integrated Security=True";



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["admin"] != null)
            {
                bind();
            }

        }
    }
    public void bind()
    {
        TextBox4.Text = Session["admin"].ToString();
        string s = "select  password from admins where username='" + TextBox4.Text + "'";
        using (SqlConnection cn = new SqlConnection(con))
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand(s, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        {
            TextBox4.Text = Session["admin"].ToString();


            string s = "update admins set password='" + TextBox2.Text + "' where username='" + TextBox4.Text + "'";
            using (SqlConnection cn = new SqlConnection(con))
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                Server.Transfer("admin_functions.aspx");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("admin_functions.aspx");
    }
}