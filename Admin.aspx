<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="_Default" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>WELCOME ADMIN!</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    
</head>
<body style="background-color:#eee;color:#333333">
  <hr />  <p style="text-align:left;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
    <div >
    <div >
        <table style=" width : 70%; height: 50px;">
            <tr style="padding:25px">
                    <td >username:
                    </td>
                     <td >
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter valid user name" ControlToValidate="TextBox1"  Width="114px"></asp:RequiredFieldValidator>       
                  </td>
                    </tr>
            <tr  >
                <td >password:
                </td>
                <td >
               <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter valid password" ControlToValidate="TextBox2" Width="114px"></asp:RequiredFieldValidator>       
             </td>  
            </tr>
          
           
        </table>
       
      </div>  </div>
    
    <asp:Button ID="Button1" runat="server" Text="LOGIN"    OnClick="Button1_Click" CausesValidation="true"  Width="114px" Height="20px"/>
   
  
   <asp:Button ID="Button2" runat="server" Text="BACK"  OnClick="Button2_Click" CausesValidation="false" Width="114px" Height="20px"/>
    
   
        
    
      

    </form>
</body>
</html>
