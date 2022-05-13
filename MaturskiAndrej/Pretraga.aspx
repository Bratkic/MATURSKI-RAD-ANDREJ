<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pretraga.aspx.cs" Inherits="MaturskiAndrej.Pretraga" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="StylePretraga.css" />
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <a>PRETRAZI PO KORISNICIMA:</a><asp:DropDownList ID="DropKorisnici" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropKorisnici_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridKorisnici" runat="server" CssClass="myGridClass" AutoGenerateColumns="false">
             <Columns>
                    <asp:BoundField DataField="naziv" HeaderText="naziv" />  
                    <asp:BoundField DataField="Album" HeaderText="Album" />  
                    
                <asp:ImageField DataImageUrlField="slika" HeaderText="Slika" ControlStyle-CssClass="slika">

                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <a>PRETRAZI PO ALBUMIMA:</a><asp:DropDownList ID="DropAlbumi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropAlbumi_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <asp:GridView ID="GridAlbumi" runat="server" CssClass="myGridClass" AutoGenerateColumns="False">
            <Columns>
                    <asp:BoundField DataField="Korisnik" HeaderText="Korisnik" />  
                    <asp:BoundField DataField="igrac" HeaderText="igrac" />  
                    <asp:BoundField DataField="broj" HeaderText="broj" /> 
                <asp:ImageField DataImageUrlField="slika" HeaderText="Image" ControlStyle-CssClass="slika">

                </asp:ImageField>
            </Columns>
            
        </asp:GridView>
        <a>Pretrazi po slicicama:</a><asp:DropDownList ID="DropSlicice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropSlicice_SelectedIndexChanged" class="mydropdownlist">
        </asp:DropDownList>
        <asp:GridView ID="GridSlicice" runat="server" CssClass="myGridClass" AutoGenerateColumns="false">
            <Columns>
                    <asp:BoundField DataField="Korisnik" HeaderText="Korisnik" />  
                    <asp:BoundField DataField="Album" HeaderText="Album" />  
                     
                
            </Columns>
        </asp:GridView>
        <a href="Glavna.aspx" id="link">Vrati se</a>
        
    </form>
</body>
</html>
