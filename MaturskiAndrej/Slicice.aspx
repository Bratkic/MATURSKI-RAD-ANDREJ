<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Slicice.aspx.cs" Inherits="MaturskiAndrej.Slicice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="StyleSlicice.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div width="100px"><asp:TextBox ID="imetxt" runat="server" CssClass="textbox" placeholder="IME:"></asp:TextBox><asp:TextBox ID="prezimetxt" runat="server" CssClass="textbox" placeholder="PREZIME:"></asp:TextBox><asp:TextBox ID="brojtxt" runat="server" CssClass="textbox" placeholder="BROJ:"></asp:TextBox><asp:DropDownList ID="GodineDrop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="GodineDrop_SelectedIndexChanged" CssClass="mydropdownlist">
        </asp:DropDownList><asp:DropDownList ID="IzdavaciDrop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="IzdavaciDrop_SelectedIndexChanged" CssClass="mydropdownlist">
        </asp:DropDownList><asp:DropDownList ID="NazivDrop" runat="server" AutoPostBack="True" CssClass="mydropdownlist">
        </asp:DropDownList><asp:FileUpload ID="FileUpload1" runat="server" /></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="DODAJ SLICICU" CssClass="button" /></div>
        <a href="Glavna.aspx">Vrati me</a>
    </form>
</body>
</html>
