<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page.aspx.cs" Inherits="page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
       
    </title>
     <link href="css/Style.css" rel="stylesheet" type="text/css" />
</head>
   
<body style="background-color:#eee;color:#333333">
    <hr /> <p style="text-align:left;"><b>Timesheet application for Computer Science Department</b></p> <hr />
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:DropDownList ID="DropDownList1" runat="server"   AutoPostBack="True"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"   AppendDataBoundItems="true"    >
            <asp:ListItem Text="please select student name" Value="-1"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [id], [name] FROM [time_sheets]"></asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Width="163px"  ReadOnly="true"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server"   OnClick="LinkButton1_Click">BACK</asp:LinkButton>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="dawg,clock_in"  OnRowEditing="GridView1_RowEditing"   OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="dawg" SortExpression="dawg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dawg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("dawg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="clock_in" SortExpression="clock_in">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("clock_in","{0:MM/dd/yyyy hh:mm:ss tt}") %>'></asp:TextBox>

                         </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("clock_in") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="clock_out" SortExpression="clock_out">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("clock_out") %>'></asp:TextBox>

                          </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval( "clock_out") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="operations" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  OnClientClick="return Validate(this)"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        
        <p>
            &nbsp;</p>
        <asp:GridView  ID="GridView2" runat="server" AutoGenerateColumns="False"  DataKeyNames="dawg,clock_in" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
            <Columns>
                <asp:TemplateField HeaderText="dawg" SortExpression="dawg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dawg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("dawg") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="clock_in" SortExpression="clock_in">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("clock_in") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("clock_in") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="clock_out">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server"     Text='<%# Eval("clock_out")  %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server"   Text='<%# Eval("clock_out","{0:G}")  %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="hrs_paid" SortExpression="hrs_paid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("hrs_paid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("hrs_paid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="unpaid_hrs" SortExpression="unpaid_hrs">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("unpaid_hrs") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("unpaid_hrs") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="total" SortExpression="total">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                
            </Columns>
        </asp:GridView>
    </form> 
</body>
</html>
