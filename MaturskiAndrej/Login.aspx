<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MaturskiAndrej.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 271px;
        }
    </style>
</head>
<body style="height: 309px">
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="usernametxt" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:TextBox ID="imetxt" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="prezimetxt" runat="server"></asp:TextBox>
        </p>
        <p>
        <asp:TextBox ID="emailtxt" runat="server" TextMode="Email"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="passtxt" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
