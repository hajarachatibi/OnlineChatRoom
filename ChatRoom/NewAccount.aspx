<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAccount.aspx.cs" Inherits="ChatRoom.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Création d'un nouveau compte</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
            font-size: xx-large;
            color: #009999;
        }
        .auto-style2 {
            text-align: center;
            height: 252px;
            margin-left: 40px;
            background-color: #CCCCCC;
        }
        .auto-style4 {
            background-color: #B7DBFF;
        }
        .auto-style5 {
            background-color: #009999;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            Créez votre compte:<br />
            <br />
        </div>
        <div class="auto-style2">
            <br />
            <strong><i>Nom d&#39;utilisateur:</i></strong>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="usernametxt" runat="server" CssClass="auto-style4"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <strong><i>Mot de passe:&nbsp;</i></strong>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
            <br />
            <br />
            <strong><i>Admin:&nbsp;</i></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbyes" runat="server" Text="Oui" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="cbno" runat="server" Text="Non" />
            &nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="validerbtn" runat="server" Text="Valider" OnClick="Button1_Click" CssClass="auto-style5" />
            <br />
            <br />
            &nbsp;
            <asp:Label ID="aderrorlbl" runat="server" ForeColor="#CC0000" Text="Veuillez séléctionner une option" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="uerrorlbl" runat="server" ForeColor="#CC0000" Text="Ce nom d'utilisateur existe déjà" Visible="False"></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
