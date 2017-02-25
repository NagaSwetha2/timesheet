
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Drawing;

public partial class timesheet : System.Web.UI.Page
{
    String con = @"Data Source=SWETHA;Initial Catalog=master;Integrated Security=True";
   // Catalog=timesheet_project;Persist Security Info=True;User ID=sa;Password=qwertypoiu123!";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            // TextBox9.Text = Session["admin"].ToString();
            binddata();
            GridView1.DataBind();

        }
    }

    protected void binddata()
    {
        SqlConnection cn = new SqlConnection(con);
        SqlCommand cmd = new SqlCommand("select c.dawg, b.name, c.clock_in, c.clock_out,c.hrs_paid,c.unpaid_hrs,c.total,c.lunch from info c, time_sheets b where b.id = c.dawg", cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
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
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        binddata();
    }




    protected void export_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            this.binddata();

            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected override void Render(HtmlTextWriter writer)
    {
        // Ensure that the control is nested in a server form.
        if (Page != null)
        {
            Page.VerifyRenderingInServerForm(this);
        }
        base.Render(writer);
    }

    protected void TextBox15_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox9_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }





    /* void visible()
     {
         SqlConnection cn = new SqlConnection(con);
         cn.Open();

         using (SqlCommand cmd = new SqlCommand(rec, cn))
         {

             using (SqlDataReader dr = cmd.ExecuteReader())
             {
                 if (dr.HasRows)
                 {

                     binddata();
                 }
                 else
                 {

                     Console.WriteLine("no data");
                 }

             }
         }

             cn.Close();
         }
     */


    /* protected void Button1_Click(object sender, EventArgs e)
     {
        // visible();
         SqlConnection cn = new SqlConnection(con);
         string d = "delete from info where exists( SELECT c.dawg, b.name, c.clock_in, c.clock_out, c.hrs_paid, c.unpaid_hrs, c.total, c.lunch FROM info AS c INNER JOIN time_sheets AS b ON c.dawg = b.id WHERE CONVERT (date, c.created_date) = CONVERT (date, GETDATE()) and c.pay< '" + TextBox18.Text + "')";
         cn.Open();
         SqlCommand cmd = new SqlCommand(d, cn);
         cmd.ExecuteNonQuery();
         cn.Close();
         GridView1.DataBind();
         pay_end();
     }*/

    public void pay_end()
    {
        SqlConnection cn = new SqlConnection(con);
        string s = "update info set pay=(select dateadd(dd,14, (select min(created_date) from info)))";

        cn.Open();
        SqlCommand cmd = new SqlCommand(s, cn);
        cmd.ExecuteNonQuery();
        cn.Close();
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        Server.Transfer("admin_functions.aspx");


    }



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox18.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // visible();
        SqlConnection cn = new SqlConnection(con);
        string d = "delete from info where exists( SELECT c.dawg, b.name, c.clock_in, c.clock_out, c.hrs_paid, c.unpaid_hrs, c.total, c.lunch FROM info AS c INNER JOIN time_sheets AS b ON c.dawg = b.id WHERE CONVERT (date, c.created_date) = CONVERT (date, GETDATE()) and c.pay< '" + TextBox18.Text + "')";
        cn.Open();
        SqlCommand cmd = new SqlCommand(d, cn);
        cmd.ExecuteNonQuery();


        cn.Close();
        GridView1.DataBind();
        binddata();
    }
}
/* public void compare() {
     SqlConnection cn = new SqlConnection(con);
     string v = "  select DATEADD(dd,1,(select min(pay) from info))";

     SqlCommand cmd = new SqlCommand(v, cn);



 }

 public void compare2() {
     SqlConnection cn = new SqlConnection(con);
     string r = "select min(pay) from info";
     SqlCommand cmd = new SqlCommand(r, cn);

 }*/


