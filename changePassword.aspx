<<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePassword.aspx.cs" Inherits="changePassword" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reset password</title>
        <link href="css/Style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            width: 321px;
        }
        .auto-style2 {
            width: 350px;
        }
    </style>

</head>
<body style="background-color:#eee;color:#333333">
    <hr /> <p style="text-align:left;">Timesheet application for Computer Science Department</p> <hr />
    <form id="form1" runat="server">
    <div >
    </div>
    <table style="   width : 50%; height: 50px;">
        <tr>
              <td class="auto-style1">please enter the below credentials</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="true"></asp:TextBox>

            </td>
        </tr>
            <tr>

                <td class="auto-style1">Enter your old password</td>
                <td class="auto-style2"> 
                <asp:TextBox ID="TextBox1" runat="server"   TextMode="Password"  ></asp:TextBox>

                </td>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   ControlToValidate="TextBox1" ErrorMessage="Enter valid password"></asp:RequiredFieldValidator>
            </tr>
           
            <tr>

                <td class="auto-style1">Enter your new password</td>
                <td class="auto-style2">
                 <asp:TextBox ID="TextBox2" runat="server"    CausesValidation="false"  TextMode="Password"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter your new password"  ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td> 
            </tr>
         <tr>

                <td class="auto-style1">re-enter your password

                </td>
                <td class="auto-style2">
                 <asp:TextBox ID="TextBox3" runat="server"    CausesValidation="true"  TextMode="Password"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   ControlToValidate="TextBox3" ErrorMessage="Both passwords must match"></asp:RequiredFieldValidator>
                </td> 
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both passwords must be same" ControlToCompare="TextBox2" ControlToValidate="TextBox3"></asp:CompareValidator>

            </tr>
         <tr>

               
                <td class="auto-style2">
                  <asp:Button ID="Button1" runat="server" Text="change password"     OnClick="Button1_Click" />
                  <asp:Button ID="Button2" runat="server" Text="back"   CausesValidation="false"   OnClick="Button2_Click" />
                </td> 
            </tr>
                </table>
    </form>
</body>
</html>
