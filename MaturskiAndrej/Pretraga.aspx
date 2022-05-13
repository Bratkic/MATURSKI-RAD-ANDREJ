<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pretraga.aspx.cs" Inherits="MaturskiAndrej.Pretraga" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="stylish.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="DropKorisnici" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropKorisnici_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <asp:GridView ID="GridKorisnici" runat="server">

        </asp:GridView>
        <asp:DropDownList ID="DropAlbumi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropAlbumi_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <asp:GridView ID="GridAlbumi" runat="server">
        </asp:GridView>
        <asp:DropDownList ID="DropSlicice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropSlicice_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <asp:GridView ID="GridSlicice" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
