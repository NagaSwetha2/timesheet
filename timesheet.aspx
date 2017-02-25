<%@ Page Language="C#" AutoEventWireup="true" CodeFile="timesheet.aspx.cs" Inherits="timesheet"  EnableEventValidation="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
.Gridview
{
font-family:Verdana;
font-size:10pt;
font-weight:normal;
color:black;
 
}
</style>
<script type="text/javascript">
 
</script>
</head>
<body style="background-color:#eee;color:#333333">
<hr />   <p style="text-align:left;">Timesheet application for Computer Science Department</p>  <hr />
    <form id="form1" runat="server">
        

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="dawg,clock_in" OnPageIndexChanging="GridView1_PageIndexChanging"   OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
    <Columns>
        <asp:TemplateField HeaderText="dawg">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("dawg") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("dawg") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="clock_in">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("clock_in") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("clock_in") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="clock_out">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("clock_out") %>'></asp:TextBox>

                
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("clock_out") %>'></asp:Label>
                  
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="hrs_paid">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("hrs_paid") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("hrs_paid") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="unpaid_hrs">
             <EditItemTemplate>
                 <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("unpaid_hrs") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Label ID="Label6" runat="server" Text='<%# Eval("unpaid_hrs") %>'></asp:Label>
             </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="total_paid_hrs">
             <EditItemTemplate>
                 <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Label ID="Label7" runat="server" Text='<%# Eval("total") %>'></asp:Label>
             </ItemTemplate>
        </asp:TemplateField>
         

        </Columns>
    </asp:GridView>
    <asp:Button ID="export" runat="server" Text="Export to excel sheet" OnClick="export_Click" />
 
 
   
      
 
   

       
       
       
        
       
        
        <br />
       
         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"  CausesValidation="false">BACK</asp:LinkButton><br />
       <br />
         <table>
            
<tr>
    <td>
To start a new pay period:
Export the current data to excel.<br />
Save this file for archival and for importing into the timesheet used by the admin office.<br />
Enter the last day of the new pay period by using the calendar button.<br />
Click "Start new pay period"
    </td>
</tr>

        </table>
       
        <p>
            <asp:Label ID="Label9" runat="server" Text="Please enter last day of your new time peroid"></asp:Label>
            
        <asp:TextBox ID="TextBox18" runat="server"  ReadOnly="true"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl ="~/Images/calendar.jpg" onclick="ImageButton1_Click" Width="31px" />
             <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"   Text="Start new Pay"   />
    
<asp:Calendar ID="Calendar1" runat="server"
            onselectionchanged=  "Calendar1_SelectionChanged" Visible="False">
        </asp:Calendar>
            <br />
           
           
        </p>
       
    </form>
</body>
</html>



