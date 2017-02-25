<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_functions.aspx.cs" Inherits="admin_functions" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
        <title>WELCOME ADMIN!</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 44px;
        }
    </style>
</head>
   
<body style="background-color:#eee;color:#333333">
   <hr /> <p style="text-align:left;">Timesheet application for Engineering BuildingTimesheet application for Computer Science Department</p> <hr />
    <form id="form1" runat="server">
        <div >
    <div >  <asp:Label ID="Label1" runat="server" Text="welcome"></asp:Label>
        <table style="width: 100%;">
            
            <tr style="padding:18px">
<td >
    <asp:TextBox ID="TextBox1" runat="server"  ReadOnly="true"></asp:TextBox>

                </td>
                </tr>
            <tr>
               </tr>
            <tr >
                
                <td>
                 <p style="text-align:left;width:400%;">   <asp:LinkButton ID="LinkButton1" runat="server"    OnClick="LinkButton1_Click">List all students</asp:LinkButton>

               </p> </td>
              
               </tr>
            <tr>
                <td>
                 <p style="text-align:left;width:400%;"> 
                    <asp:LinkButton ID="LinkButton2" runat="server"   OnClick="LinkButton2_Click">View timesheet entries for one student </asp:LinkButton>

             </p>   </td>
                        

         </tr>
            <tr>
                <td>
                 <p style="text-align:left;width:400%;"> 
                    <asp:LinkButton ID="LinkButton5" runat="server"   OnClick="LinkButton5_Click">View all timesheet entries</asp:LinkButton>

              </p>  </td>
                  </tr>
              <tr style="padding:18px">
                <td class="auto-style1">
                </td>
                <td>

                </td>
                        

            </tr>
            
             <tr>
                <td class="auto-style3">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"  CausesValidation="false">Change your admin password</asp:LinkButton>

                   </td>
            </tr>
             <tr style="padding:18px">
                
                <td>
                    <asp:LinkButton ID="LinkButton4" runat="server"    OnClick="LinkButton4_Click"  CausesValidation="false">Logout</asp:LinkButton>

                </td>
                        

            </tr>
            
             </table>
        </div>
            </div>
    </form>
</body>
</html>
