<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="ChatRoom.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Chat Room</title>
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .message {
            background-color: #e0ebeb;
        }
        .auto-style2 {
            width: 706px;
        }
        .auto-style3 {
            width: 706px;
            height: 34px;
        }
        .auto-style4 {
            background-color: #009999;
        }
        .newStyle1 {
            background-color: #666666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
        <table class="auto-style1">
            
            <tr>
                <td class="auto-style3">
                    
                    <asp:Button ID="outbtn" runat="server" Text="Logout" OnClick="outbtn_Click" CssClass="auto-style4" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="mngbtn" runat="server" Text="Room Managing" Visible="False" OnClick="mngbtn_Click" CssClass="auto-style4" />
                    <br />
                </td>
            </tr>
            
            <tr>
                <td class="auto-style2">
                    <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                    </asp:Timer>
                    <br /><br />
                    
                    
                        <asp:Panel ID="pnl" runat="server" style="overflow-y:scroll;" Height="359px" Width="803px" BackColor="#CCCCCC" >
                            <script type="text/javascript">
                                function scrollPanel() {
                                    var myDiv = document.getElementById("pnl");
                                    myDiv.scrollTop = myDiv.scrollHeight;
                                }
                            </script>
                        <asp:Repeater ID="rep" runat="server">
        <ItemTemplate>
            <div class="message">
              <asp:Label runat="server" ForeColor="#5c8a8a"><%# Eval("_username") %> :</asp:Label>&nbsp;&nbsp;&nbsp;
              <asp:Label runat="server"><%# Eval("_message") %></asp:Label>
              </div><br />
        </ItemTemplate>
    </asp:Repeater>
                    </asp:Panel>
                     

                </td>
            </tr>
            
        </table >
             </ContentTemplate>
             </asp:UpdatePanel>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <br />
                    <asp:Button ID="sendbtn" runat="server" Text="Envoyer" OnClick="sendbtn_Click" CssClass="auto-style4" />
                    <br />
                    <br />
                    <asp:TextBox ID="messagetxt" runat="server" Width="506px" TextMode="MultiLine"></asp:TextBox>
                  <!--  Pour Ajouter les emojis on utilise ce code -->
                      <script type="text/javascript" src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.init({
            selector: 'textarea',
            plugins: "emoticons",
            toolbar: "emoticons",
            width: 500
        });
    </script> 
                    &nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
        </table>
             
    </form>
</body>
</html>
