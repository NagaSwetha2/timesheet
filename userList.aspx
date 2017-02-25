<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userList.aspx.cs" Inherits="userList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        DELETE
    </title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:#eee;color:#333333">
   <hr /> <p style="text-align:left;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox10" runat="server" OnTextChanged="TextBox10_TextChanged"></asp:TextBox>
    <div class="delete">
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"  EnableViewState="false"    OnRowDeleting="GridView1_RowDeleting"   OnRowUpdating="GridView1_RowUpdating"   OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"    OnRowCancelingEdit="GridView1_RowCancelingEdit"    OnRowEditing="GridView1_RowEditing"  >
            <Columns>
                <asp:TemplateField HeaderText="id" SortExpression="id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("id") %>'></asp:TextBox>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="contact" SortExpression="contact">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("contact") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="password" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                    </ItemTemplate>
                   
                    
                </asp:TemplateField>
                <asp:CommandField HeaderText="operation" ShowDeleteButton="true" ShowEditButton="true" ShowHeader="true"   
                    
                    />
                
               
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" DeleteCommand="delete from time_sheets where name=@n" SelectCommand="select * from time_sheets" UpdateCommand="update time_sheets set name=@n,password=@p,contact=@c,email=@e where id=@id" OnSelecting="SqlDataSource2_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="n" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="n" />
                <asp:Parameter Name="p" />
                <asp:Parameter Name="c" />
                <asp:Parameter Name="e" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:LinkButton ID="LinkButton2" runat="server"    OnClick="LinkButton2_Click" CausesValidation="false">BACK</asp:LinkButton>
    </form>
</body>
</html>