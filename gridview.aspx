<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridview.aspx.cs" Inherits="gridview" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="css/Style.css" rel="stylesheet" type="text/css" />

    </head>
<body  style="background-color:#eee;color:#333333">
   <hr /> <p style="text-align:left;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="clock_in" DataSourceID="SqlDataSource5" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="dawg" HeaderText="dawg" SortExpression="dawg" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="clock_in" HeaderText="clock_in" ReadOnly="True" SortExpression="clock_in" />
                <asp:BoundField DataField="clock_out" HeaderText="clock_out" SortExpression="clock_out" />
                <asp:BoundField DataField="hrs_paid" HeaderText="hrs_paid" SortExpression="hrs_paid" />
               
            </Columns>
        </asp:GridView>

        
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT c.dawg, b.name, c.clock_in, c.clock_out, c.hrs_paid, c.lunch FROM info AS c INNER JOIN time_sheets AS b ON c.dawg = b.id WHERE (CONVERT (date, c.created_date) = CONVERT (date, GETDATE()))" > </asp:SqlDataSource>

        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [dawg], [clock_in], [clock_out], [hrs_paid] FROM [info]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [dawg], [clock_in], [clock_out], [hrs_paid] FROM [info]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="CLOCK IN" />
        <asp:Button ID="Button2" runat="server"   OnClick="Button2_Click" Text="CLOCK OUT" />
        <asp:TextBox ID="TextBox1" runat="server"  ReadOnly="true" ></asp:TextBox>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server"     OnClick="LinkButton1_Click"  CausesValidation="false">LOGOUT</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>



        <p>
           

           
            
            &nbsp;</p>
        <p>
           

           
            
            &nbsp;</p>
        <p>
           

           
            
            &nbsp;</p>
        
    </form>
</body>
</html>

