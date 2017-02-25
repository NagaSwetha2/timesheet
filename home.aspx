<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>This is our timesheet</title> 
                <link href="css/Style.css" rel="stylesheet" type="text/css" />
  
</head>
<body style="background-color:#eee;color:#333333">
  <hr />  <p style="text-align:center;">Timesheet application for Computer Science Department</p><hr />
    <form id="form1" runat="server">
        <p style="text-align:center"> 

      <img src="Images/siu.jpg"  alt="OUR LOGO" style="height: 160px; width: 275px; margin-right: 106px; margin-left:150px;border:inset" /><br />
     </p>
      <table style="width: 100%;">
        <tr style="padding:18px ;text-align:center" >
                <td >
            <p style="text-align:center;"> <asp:LinkButton ID="LinkButton1" runat="server"   OnClick="LinkButton1_Click">Admin Login </asp:LinkButton>
                </p>
                </td>
            </tr>
          <tr>
            
                <td>
                 
                   <p style="text-align:center;">    <asp:LinkButton ID="LinkButton2" runat="server"    OnClick="LinkButton2_Click">Register New Student</asp:LinkButton>
                   
</p></td>
            
             
                
                    </tr>
          <tr><td>
                  <p style="text-align:center;">      <asp:LinkButton ID="LinkButton3" runat="server"  OnClick="LinkButton3_Click">Student Login </asp:LinkButton>

               </p> </td>
                        

            </tr>
            

            
            </table>
        
    </form>
</body>
</html>

