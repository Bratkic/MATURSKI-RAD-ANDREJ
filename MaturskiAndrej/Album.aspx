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
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        
        <asp:DropDownList ID="Godine" runat="server" OnSelectedIndexChanged="Godine_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="Izdavaci" runat="server" OnSelectedIndexChanged="Izdavaci_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:TextBox ID="nazivAlbuma" runat="server"></asp:TextBox>
        <asp:Button ID="Dodaj_Album" runat="server" OnClick="Dodaj_Album_Click" Text="Button" />
        <p>
            <asp:TextBox ID="godtxt" runat="server"></asp:TextBox>
            <asp:TextBox ID="izdavactxt" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
        <a href="Glavna.aspx">Vrati na pocetnu</a>
        
    </form>
</body>
</html>
