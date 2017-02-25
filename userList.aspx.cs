using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class userList : System.Web.UI.Page
{

    String con = @"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox10.Visible = false;
        bindData();
    }
    private void bindData()
    {
        DataTable dt = new DataTable();
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        SqlDataAdapter adp = new SqlDataAdapter("select id,name,contact,email,password from time_sheets", con);
        DataSet set = new DataSet();
        adp.Fill(dt);
        adp.Dispose();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        cn.Close();

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("admin_functions.aspx");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        using (SqlConnection cn = new SqlConnection(con))
        {
            //string id;
            // TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");

            string id = GridView1.DataKeys[e.RowIndex].Values["id"].ToString();
            string sql = "delete from time_sheets where id= @id";
            using (SqlCommand cmd = new SqlCommand(sql, cn))
            {
                cn.Open();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                bindData();
            }
            cn.Close();
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection cn = new SqlConnection(con);
        TextBox id = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox9");
        TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        TextBox contact = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        TextBox password = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");


        cn.Open();
        string query = "update time_sheets set  name ='" + name.Text + "',password='" + password.Text + "',contact='" + contact.Text + "',email='" + email.Text + "' where id='" + id.Text + "'";
        SqlCommand cmd = new SqlCommand(query, cn);

        cmd.ExecuteNonQuery();

        cn.Close();
        GridView1.EditIndex = -1;
        bindData();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        // GridView1_EditIndex = -1;
        bindData();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        // GridView1_EditIndex = -1;
        bindData();
    }
    protected void TextBox10_TextChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

}