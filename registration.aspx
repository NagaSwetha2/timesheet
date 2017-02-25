<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add user</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .auto-style5 {
            height: 44px;
            width: 381px;
            font-family: 'Segoe UI';
            font-size: medium;
            font-weight: bold;
            font-style: inherit;
            font-variant: normal;
            color: #333333;
            background-color: #eee;
            background-image: none;
            float: left;
            display: inline;
        }
        .auto-style6 {
            width: 381px;
        }
        #Reset1 {
            width: 88px;
        }
    </style>
    
</head>
<body style="background-color:#eee;color:#333333">
   <hr /> <p style="text-align:left;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
    <div >
        <table style="width:100%; height: 200px;">
          <tr>
                <td class="auto-style1">ID</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter your DAWG tag number"  ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                </td>

            </tr>
            <tr>
                <td class="auto-style1">Name</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter your full name"  ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact number</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter your phone number"  ControlToValidate="TextBox3"></asp:RequiredFieldValidator>


                </td>
             </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter your email id" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>


                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="You must enter valid email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


                </td>
                
            </tr>
           
            <tr>
                <td class="auto-style1">password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter password" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>


                </td>
                
            </tr>
             <tr>
                <td class="auto-style1">Confirm password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Re-Enter password" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>


                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both passwords must be same" ControlToCompare="TextBox6" ControlToValidate="TextBox7"></asp:CompareValidator>
                    <br />


                </td>
                
           </tr>
               </table>
     <table>
              <tr>  <td>
                  
                  <p  style="text-align:center; width: 91px; height: 21px;"><asp:Button ID="Button1" runat="server" Text="Register"   CausesValidation="true" OnClick="Button1_Click"/>

                      
                  &nbsp; &nbsp;
                  <input id="Reset1" type="reset" value="Reset form" /></p>  </td>
                       
                <td>
                    <asp:Button ID="Button2" runat="server"   OnClick="Button2_Click" Text="Back"  CausesValidation="false" Width="89px"/>

                
                 
                  &nbsp; &nbsp;</td>
                        

            </tr>
            
        </table>

    
    </div>

        
    </form>
   
</body>
</html>


