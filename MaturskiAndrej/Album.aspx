<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="MaturskiAndrej.Album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


        </div>
        <asp:DropDownList ID="DropDown_Godina" runat="server">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDown_Izdavac" runat="server">
        </asp:DropDownList>
        <asp:TextBox ID="Naziv_Txt" runat="server"></asp:TextBox>
        <asp:TextBox ID="Godina_Txt" runat="server"></asp:TextBox>
        <asp:TextBox ID="Izdavac_Txt" runat="server"></asp:TextBox>
    </form>
</body>
</html>
