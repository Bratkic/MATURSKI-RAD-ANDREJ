<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Stvarno.aspx.cs" Inherits="MaturskiAndrej.Login_Stvarno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <title></title>
    <style type="text/css">
        #form1 {
            height: 175px;
        }
    </style>
</head>
<body>
    <div id="bg">
    <div class="module">
    <form id="form1" runat="server" class="form">
        <div>
        <asp:TextBox ID="emailtxt" runat="server" class="textbox" placeholder="EMAIL:" TextMode="Email"></asp:TextBox>
        </div>
        
        
        <div><asp:TextBox ID="passtxt" runat="server" class="textbox" placeholder="PASSWORD:" TextMode="Password"></asp:TextBox></div>
        <div><asp:Button ID="Button1" runat="server" Text="LOGIN" class="button" OnClick="Button1_Click" /></div>
        
        <a href="Login.aspx">Registrujte se?</a>
    </form>
        
        </div>
        
        </div>
</body>
</html>
