<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogin.aspx.cs" Inherits="userLogin" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>
        welcome user
    </title>
      <link href="css/Style.css" rel="stylesheet" type="text/css" />
    
</head>
<body style="background-color:#eee;color:#333333">
   <hr /> <p style="text-align:left;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
        <div >
            <table style=" width : 50%; height: 50px;">
            <tr>
                <td class="auto-style1">ID</td>
                <td class="auto-style1">
                <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   ControlToValidate="TextBox1" ErrorMessage="Enter valid DAWG"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            <tr>
                <td class="auto-style1">password</td>
                <td class="auto-style1">
                 <asp:TextBox ID="TextBox2" runat="server" CausesValidation="True" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter valid password" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td> 
            </tr>
                </table>
        </div>
       <div>
        <asp:Button ID="Button1" runat="server"    OnClick="Button1_Click" Text="Login" />
        <asp:Button ID="Button2" runat="server"   OnClick="Button2_Click" Style="width: 46px" Text="Back" CausesValidation="False" /></div>
    </form>
</body>
</html>


