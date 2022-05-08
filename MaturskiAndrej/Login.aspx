<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MaturskiAndrej.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <title></title>
    <style type="text/css">
        #form1 {
            height: 271px;
        }
    </style>
</head>
<body style="height: 309px">

    <div id="bg">
    <div class="module">
    <form id="form1" runat="server" class="form">
        <div>
            <asp:TextBox ID="usernametxt" runat="server" class="textbox" placeholder="USERNAME:"></asp:TextBox>
        </div>
        <p>
            <asp:TextBox ID="imetxt" runat="server" class="textbox" placeholder="IME:"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="prezimetxt" runat="server" class="textbox" placeholder="PREZIME:"></asp:TextBox>
        </p>
        <p>
        <asp:TextBox ID="emailtxt" runat="server" TextMode="Email" class="textbox" placeholder="EMAIL:"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="passtxt" runat="server" TextMode="Password" class="textbox" placeholder="PASSWORD:"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="Button1" runat="server" Text="REGISTER" OnClick="Button1_Click" class="button" />
        </p>
        <a href="Login_Stvarno.aspx">Vec imate nalog?</a>
    </form>
        
        </div>
        </div>
</body>
</html>


