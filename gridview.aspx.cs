using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class gridview : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            name();
            display();
            bindgrid();
            visibility();
            GridView1.DataBind();
        }
    }

    public void name()
    {
        SqlCommand cmd = new SqlCommand("update info set name=(select name from time_sheets where id=@id) where dawg=@d and  CONVERT(date,created_date) = CONVERT(date, GETDATE())", con);
        cmd.Parameters.AddWithValue("@id", TextBox1.Text);
        cmd.Parameters.AddWithValue("@d", TextBox1.Text);
        con.Close();
        GridView1.DataBind();
    }

    public void display()
    {
        con.Open();
        string s = "select * from info where CONVERT(date,created_date) = CONVERT(date, GETDATE())";
        SqlCommand cmd = new SqlCommand(s, con);
        con.Close();
        visibility();
    }

    public void bindgrid()
    {
        if (Session["New"] != null)
        {
            TextBox1.Text = Session["New"].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Server.Transfer("home.aspx");
        // Response.Redirect("./");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        string s = "insert into info(dawg,clock_in,created_date) values(@u,@il,@l)";
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.Parameters.AddWithValue("@u", TextBox1.Text);
        //DateTime.Now.ToString("mm/dd/yyyy HH:mm:ss");
        cmd.Parameters.AddWithValue("@il", DateTime.Now.ToString());
        cmd.Parameters.AddWithValue("@l", DateTime.Today);
        cmd.ExecuteNonQuery();
        con.Close();
        pay();
        pay_end();
        name();
        bindgrid();
        visibility();
        GridView1.DataBind();

    }

    void pay()
    {
        con.Open();
        string s = "update info set pay=(select dateadd(dd,14, (select min(created_date) from info)))";
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    void pay_end()
    {
        con.Open();
        string o = "update info set end_pay=(select dateadd(day,1,min(pay)) from info)";

        SqlCommand cmd = new SqlCommand(o, con);
        cmd.ExecuteNonQuery();
        con.Close();
        con.Close();

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update info set clock_out = @cout where dawg = @id and created_date = @cd and clock_out is null", con);
        cmd.Parameters.AddWithValue("@cout", DateTime.Now.ToString());
        // cmd.Parameters.AddWithValue("@hrs", (DATEDIFF(minute, clock_in, clock_out)) where dawg = '"++"'));
        cmd.Parameters.AddWithValue("@id", TextBox1.Text);
        cmd.Parameters.AddWithValue("@cd", DateTime.Today);
        cmd.ExecuteNonQuery();
        con.Close();
        hours();
        GridView1.DataBind();
        unpaid();
        GridView1.DataBind();
        total();
        GridView1.DataBind();
        lunch();
        GridView1.DataBind();
        visibility();
        GridView1.DataBind();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        string s = "select dawg,clock_in,clock_out,hrs_paid from info where dawg='" + TextBox1.Text + "' and CONVERT(date, created_date) = CONVERT(date, GETDATE()) ";
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.ExecuteNonQuery();
        con.Close();
        visibility();
        DataBind();
        bindgrid();
    }

    public void hours()
    {
        con.Open();
        string s = "update info set hrs_paid=(DATEDIFF(MINUTE,clock_in,clock_out)) /60.0 where dawg='" + TextBox1.Text + "'"; //by 60.0 is there
        SqlCommand sql = new SqlCommand(s, con);
        sql.ExecuteNonQuery();
        con.Close();
    }

    public void unpaid()
    {
        con.Open();
        string query = "  select COUNT(*) from info  where dawg='" + TextBox1.Text + "' and CONVERT(date,created_date) = CONVERT(date, GETDATE())";
        SqlCommand cmd = new SqlCommand(query, con);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        con.Close();
        if (temp > 2)
        {
            con.Open();
        string s = " UPDATE INFO SET unpaid_hrs=(SELECT(ROUND((SELECT(DATEDIFF(MINUTE,( SELECT MIN(clock_in) FROM INFO WHERE dawg='" + TextBox1.Text + "' and CONVERT(date,created_date)=CONVERT(date,GETDATE())),  (SELECT MAX(clock_out) FROM INFO WHERE (dawg='" + TextBox1.Text + "') and CONVERT(date,created_date)=CONVERT(date,GETDATE()))))/60.0),3))) FROM INFO WHERE DAWG='" + TextBox1.Text + "' AND CONVERT(DATE,created_date)=CONVERT(date,getdate())";
        SqlCommand sql = new SqlCommand(s, con);
        sql.ExecuteNonQuery();
        con.Close();
    }
}
    public void total()
    {
        con.Open();
        string s = " update info set total=(select round((select sum(hrs_paid) from info where dawg='" + TextBox1.Text + "' and (convert(date,created_date)=convert(date,getdate()))),2)) where dawg='" + TextBox1.Text + "' and (convert(date,created_date)=CONVERT(date,getdate()))";
        SqlCommand sql = new SqlCommand(s, con);
        sql.ExecuteNonQuery();
        con.Close();
    }

    public void lunch()
    {
        con.Open();
        string query = "  select COUNT(*) from info  where dawg='" + TextBox1.Text + "' and CONVERT(date,created_date) = CONVERT(date, GETDATE())";
        SqlCommand cmd = new SqlCommand(query, con);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        con.Close();
        if (temp >1 )
        {
            con.Open();
            string s = "update info set lunch = (select (unpaid_hrs-total)) where dawg = '" + TextBox1.Text + "' and (CONVERT(date, created_date) = CONVERT(date, GETDATE()))";
            SqlCommand sql = new SqlCommand(s, con);
            sql.ExecuteNonQuery();
            con.Close();
        }
        
    }
    public void visibility()
    {
        bindgrid();
        con.Open();
        string s = "select * from info where clock_out is null and  (CONVERT(date, created_date)) = (CONVERT(date, GETDATE())) and dawg = '" + TextBox1.Text + "'";
        using (SqlCommand command = new SqlCommand(s, con))
        {
            using (SqlDataReader reader = command.ExecuteReader())
            {
                // if the result set is not NULL
                if (reader.HasRows)
                {
                    Button1.Visible = false;
                    Button2.Visible = true;

                }
                else
                {
                    Button1.Visible = true;
                    Button2.Visible = false;
                }
            }
        }
        con.Close();
    }

    public void datecol()
    {
        con.Open();
        string s1 = "update info set datecol= (select convert(date,getdate()) from info where dawg='" + TextBox1.Text + "') where dawg='" + TextBox1.Text + "'";
        SqlCommand sql1 = new SqlCommand(s1, con);
        sql1.ExecuteNonQuery();
        con.Close();
    }
}