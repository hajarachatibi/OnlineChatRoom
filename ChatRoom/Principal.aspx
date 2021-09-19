<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="ChatRoom.Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Connexion</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #006699;
            font-size: xx-large;
            margin-bottom: 0px;
        }
        .auto-style2 {
            height: 250px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style3 {
            background-color: #C1E0FF;
        }
        .auto-style4 {
            background-color: #009999;
        }
        .auto-style5 {
            color: #009999;
        }
    </style>
</head>
<body style="height: 185px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>
            <span class="auto-style5">
            <br />
            <br />
            <br />
            Connectez-vous ou Créez un nouveau compte<br />
            <br />
            </span>
            </strong></div>
        <div class="auto-style2"><i><strong>
            <br />
            Nom d&#39;utilisateur:</strong></i>&nbsp;&nbsp;
            <asp:TextBox ID="usernametxt" runat="server" Height="18px" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />

            <strong><i>Mot de passe:&nbsp;</i></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="36px" Text="Se connecter" Width="140px" OnClick="Button1_Click" CssClass="auto-style4" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Height="33px" Text="Créer un compte" OnClick="Button2_Click" CssClass="auto-style4" />
            <br />
            <br />
            <asp:Label ID="errorlbl" runat="server" ForeColor="#CC0000" Text="Nom d'utilisateur ou mot de passe incorrect" Visible="False"></asp:Label>
            <br />

        </div>
    </form>
</body>
</html>
