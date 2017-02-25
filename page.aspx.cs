using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class page : System.Web.UI.Page


{
    string con = @"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            TextBox1.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
            filldropDown();
            check();

        }

    }

    void filldropDown()
    {
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        SqlCommand cmd = new SqlCommand("select name,id from time_sheets", cn);
        SqlDataAdapter dap = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        dap.Fill(ds);
        DropDownList1.DataTextField = "name";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        // DropDownList1.SelectedItem = 0;

        cn.Close();
        GridView2.Visible = false;
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        TextBox1.Text = DropDownList1.SelectedValue.ToString();
        grid();
        GridView2.Visible = false;

    }

    public void grid()
    {
        GridView1.Visible = true;
        SqlConnection cn = new SqlConnection(con);
        SqlCommand cmd = new SqlCommand("select c.dawg, b.name, c.clock_in, c.clock_out from info c, time_sheets b where  dawg=@d and b.id = c.dawg  ", cn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cmd.Parameters.AddWithValue("@d", TextBox1.Text);
        DataSet ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        }

        cn.Close();
        GridView1.DataBind();
    }

    public void check()
    {
        if (!String.IsNullOrEmpty(TextBox1.Text))
        {
            TextBox1.Text = DropDownList1.SelectedValue.ToString();
            Session["text"] = TextBox1.Text;

        }

        GridView2.Visible = false;
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("admin_functions.aspx");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        grid();


    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        grid();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        SqlConnection cn = new SqlConnection(@"Data Source = SWETHA; Initial Catalog = master; Integrated Security = True");
        TextBox dawg = (TextBox)row.FindControl("TextBox1");
        TextBox clock_in = (TextBox)row.FindControl("TextBox3");
        TextBox clock_out = (TextBox)row.FindControl("TextBox4");
        cn.Open();
        string query = "update info set clock_out='" + clock_out.Text + "' where dawg='" + dawg.Text + "' and  clock_in='" + clock_in.Text + "'";
        //  string query = "update info set clock_out='"+clock_out.Text+"' , hrs_paid='"+hrs_paid.Text+"',unpaid_hrs='"+unpaid_hrs.Text+"' ,total_paid_hrs='"+total_paid_hrs.Text+"',lunch='"+lunch.Text+"' where clock_in='"+clock_in.Text+"' and dawg='"+dawg.Text+"'";
        SqlCommand cmd = new SqlCommand(query, cn);
        cmd.ExecuteNonQuery();
        cn.Close();


        GridView1.EditIndex = -1;

        GridView1.DataBind();
        grid();
        GridView1.Visible = false;

        GridView2.Visible = true;
        grid2();
        hours();
        unpaid();
        total();
        lunch();

        GridView2.Visible = true;
        grid2();
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;

        GridView2.Visible = true;
        grid2();
        hours();
        GridView2.DataBind();
        unpaid();
        GridView2.DataBind();
        total();
        GridView2.DataBind();
        lunch();
        GridView2.DataBind();
     GridView2.Visible = true;
        grid2();
        GridView2.DataBind();

    }
    public void hours()
    {
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        string s = "update info set hrs_paid=(DATEDIFF(MINUTE,clock_in,clock_out)) /60.0 where dawg='" + TextBox1.Text + "'"; //by 60.0 is there
        SqlCommand sql = new SqlCommand(s, cn);
        sql.ExecuteNonQuery();
        cn.Close();
    }

    public void unpaid()
    {
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        string query = "  select COUNT(*) from info  where dawg='" + TextBox1.Text + "' and CONVERT(date,created_date) = CONVERT(date, GETDATE())";
        SqlCommand cmd = new SqlCommand(query, cn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        cn.Close();
        if (temp > 2)
        {
            cn.Open();
            string s = "  UPDATE INFO SET unpaid_hrs=(SELECT(	ROUND((SELECT(DATEDIFF(MINUTE,( SELECT MIN(clock_in) FROM INFO WHERE ( dawg='" + TextBox1.Text + "') and CONVERT(date,created_date)=CONVERT(date,GETDATE())),  (SELECT MAX(clock_out) FROM INFO WHERE (dawg='" + TextBox1.Text + "') and CONVERT(date,created_date)=CONVERT(date,GETDATE()))))/60.0),3))) FROM INFO WHERE DAWG='" + TextBox1.Text + "' AND CONVERT(DATE,created_date)=CONVERT(date,getdate())";
            SqlCommand sql = new SqlCommand(s, cn);
            sql.ExecuteNonQuery();
            cn.Close();
        }
    }

    public void total()
    {
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        string s = " update info set total=(select round((select sum(hrs_paid) from info where dawg='" + TextBox1.Text + "' and (convert(date,created_date)=convert(date,getdate()))),2)) where dawg='" + TextBox1.Text + "' and (convert(date,created_date)=CONVERT(date,getdate()))";
        SqlCommand sql = new SqlCommand(s, cn);
        sql.ExecuteNonQuery();
        cn.Close();
    }

    public void lunch()
    {
        SqlConnection cn = new SqlConnection(con);
      //  SqlConnection cn = new SqlConnection(con);
        cn.Open();
        string query = "  select COUNT(*) from info  where dawg='" + TextBox1.Text + "' and CONVERT(date,created_date) = CONVERT(date, GETDATE())";
        SqlCommand cmd = new SqlCommand(query, cn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        cn.Close();
        if (temp > 1)
        {
            cn.Open();
            string s = "update info set lunch = (select (unpaid_hrs-total)) where dawg = '" + TextBox1.Text + "' and (CONVERT(date, created_date) = CONVERT(date, GETDATE()))";
            SqlCommand sql = new SqlCommand(s, cn);
            sql.ExecuteNonQuery();
            cn.Close();
        }
        }
    public void grid2()
    {
        GridView1.Visible = false;
        GridView2.Visible = true;
        SqlConnection cn = new SqlConnection(con);
        SqlCommand cmd = new SqlCommand("select c.dawg, b.name, c.clock_in, c.clock_out,c.hrs_paid,c.unpaid_hrs,c.total,c.lunch from info c, time_sheets b where b.id = c.dawg and dawg=@d  ", cn);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        cmd.Parameters.AddWithValue("@d", TextBox1.Text);
        DataSet ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridView2.DataSource = ds;
            GridView2.DataBind();
            int columncount = GridView1.Rows[0].Cells.Count;
            GridView2.Rows[0].Cells.Clear();
            GridView2.Rows[0].Cells.Add(new TableCell());
            GridView2.Rows[0].Cells[0].ColumnSpan = columncount;
            GridView2.Rows[0].Cells[0].Text = "No Records Found";
        }

        cn.Close();
        GridView2.DataBind();

    }

    public void grid2_upadte()
    {
        SqlConnection cn = new SqlConnection(con);
        cn.Open();
        SqlCommand cmd = new SqlCommand("update info set clock_out = @cout where dawg = @id and created_date = @cd and clock_out is null", cn);
        cmd.Parameters.AddWithValue("@cout", DateTime.Now.ToString());
        // cmd.Parameters.AddWithValue("@hrs", (DATEDIFF(minute, clock_in, clock_out)) where dawg = '"++"'));
        cmd.Parameters.AddWithValue("@id", TextBox1.Text);
        cmd.Parameters.AddWithValue("@cd", DateTime.Today);
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}