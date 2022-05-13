<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="MaturskiAndrej.Album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="StyleAlbum.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


        </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="myGridClass">

        </asp:GridView>
        
        <asp:DropDownList ID="Godine" runat="server" OnSelectedIndexChanged="Godine_SelectedIndexChanged" CssClass="mydropdownlist">
        </asp:DropDownList>
        <asp:DropDownList ID="Izdavaci" runat="server" OnSelectedIndexChanged="Izdavaci_SelectedIndexChanged" CssClass="mydropdownlist">
        </asp:DropDownList>
        <asp:TextBox ID="nazivAlbuma" runat="server" CssClass="textbox" placeholder="NAZIV ALBUMA:"></asp:TextBox>
        <asp:Button ID="Dodaj_Album" runat="server" OnClick="Dodaj_Album_Click" Text="DODAJ ALBUM" CssClass="button" />
        <p>
            <asp:TextBox ID="godtxt" runat="server" CssClass="textbox" placeholder="GODINA:"></asp:TextBox>
            <asp:TextBox ID="izdavactxt" runat="server" CssClass="textbox" placeholder="IZDAVAC:"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" Text="DODAJ GODINU" OnClick="Button1_Click"  CssClass="button"/>
        <asp:Button ID="Button2" runat="server" Text="DODAJ IZDAVACA" OnClick="Button2_Click"  CssClass="button"/>
        <br />
        <a href="Glavna.aspx">Vrati na pocetnu</a>
        
    </form>
</body>
</html>
