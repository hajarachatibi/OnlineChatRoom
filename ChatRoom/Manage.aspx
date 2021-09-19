<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ChatRoom.Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Settings</title>
    <style type="text/css">
        .newStyle1 {
            background-color: #99CCFF;
        }
        .newStyle2 {
            background-color: #99CCFF;
        }
        .auto-style1 {
            background-color: #009999;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div >
            </div>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" OnClick="Button1_Click" Text="Utilisteurs paramètres" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" CssClass="auto-style1" OnClick="Button3_Click" Text="Supprimer la conversation" />
            <br /><br />
            <br />
            <br />
            <br />
            <asp:Repeater ID="deleteRep" runat="server" OnItemCommand="userRep_ItemCommand">
              <ItemTemplate>
                  <table border=1 style="width:400px">
  <tr>
    <th width="200"><span >Nom</span> <span > d'utilisateur</span></th>
    <td>
        <strong>
        <asp:Label ID="lbcodecmd" runat="server" Width="100" Text='<%# Eval("username") %>'></asp:Label>
        </strong>
      </td>
      <td>
         <asp:LinkButton ID="LinkButton1" Width="100" runat="server" CommandName="delete" CommandArgument='<%# Eval("username") %>'>Supprimer</asp:LinkButton>

      </td>
      <td>
         <asp:LinkButton ID="LinkButton2" runat="server" Width="200" CommandName="admin" CommandArgument='<%# Eval("username") %>'>Ajouter comme admin</asp:LinkButton>

      </td>
  </tr>
</table>
              </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
