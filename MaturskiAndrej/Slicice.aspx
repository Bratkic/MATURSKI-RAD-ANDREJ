<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Slicice.aspx.cs" Inherits="MaturskiAndrej.Slicice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox ID="imetxt" runat="server"></asp:TextBox>
        <asp:TextBox ID="prezimetxt" runat="server"></asp:TextBox>
        <asp:TextBox ID="brojtxt" runat="server"></asp:TextBox>
        <asp:DropDownList ID="GodineDrop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="GodineDrop_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="IzdavaciDrop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="IzdavaciDrop_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="NazivDrop" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <a href="Glavna.aspx">Vrati me</a>
    </form>
</body>
</html>
