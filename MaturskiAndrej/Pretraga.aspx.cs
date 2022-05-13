using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MaturskiAndrej
{
    public partial class Pretraga : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Korisnici_Populate();
                Albumi_Populate();
                Slicice_Populate();
            }
        }
        protected void Korisnici_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select distinct id, username from Korisnik");

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                DropKorisnici.DataSource = god;
                DropKorisnici.DataValueField = "id";
                DropKorisnici.DataTextField = "username";
                DropKorisnici.DataBind();

                Grid_Korisnici_Populate();

            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }
        protected void Grid_Korisnici_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select Slicica.ime+' '+Slicica.prezime as naziv, Slicica.broj, Album.naziv+ ' '+ Godina_Izdanja.naziv + ' ' + Izdavac.Naziv as Album, Slicica.slika from Slicica_Korisnik");
            naredba.Append(" join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id ");
            naredba.Append(" where Korisnik.id=" + DropKorisnici.SelectedValue);

            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable grid = new DataTable();
                adapter.Fill(grid);
                GridKorisnici.DataSource = grid;
                GridKorisnici.DataBind();

            }
            catch (Exception Greska)
            {
                Response.Write(Greska.Message);

            }



        }

        protected void DropKorisnici_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid_Korisnici_Populate();
        }

        protected void Albumi_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select distinct Album.id as id, Album.naziv + ' ' + Godina_Izdanja.naziv + ' ' + Izdavac.naziv as naziv_albuma from Album ");
            naredba.Append(" join Godina_Izdanja on Album.godina_izdanja_Id = Godina_Izdanja.id join Izdavac on Album.izdavac_id = Izdavac.id");

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                DropAlbumi.DataSource = god;
                DropAlbumi.DataValueField = "id";
                DropAlbumi.DataTextField = "naziv_albuma";
                DropAlbumi.DataBind();
                Grid_Albumi_Populate();
               

            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }
        protected void Grid_Albumi_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select Korisnik.username as Korisnik, Slicica.Ime+ ' ' + Slicica.Prezime as igrac , Slicica.broj as broj, Slicica.slika from Slicica_Korisnik ");
            naredba.Append(" join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id ");
            naredba.Append(" where Album.id=" + DropAlbumi.SelectedValue);

            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable grid = new DataTable();
                adapter.Fill(grid);
                GridAlbumi.DataSource = grid;
                GridAlbumi.DataBind();

            }
            catch (Exception Greska)
            {
                Response.Write(Greska.Message);

            }
        }

        protected void DropAlbumi_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid_Albumi_Populate();
        }
        protected void Slicice_Populate()
        {

            StringBuilder naredba = new StringBuilder("Select distinct Slicica.id as id, Slicica.ime+' ' + Slicica.prezime as igrac from Slicica");
            

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                DropSlicice.DataSource = god;
                DropSlicice.DataValueField = "id";
                DropSlicice.DataTextField = "igrac";
                DropSlicice.DataBind();
                Grid_Slicice_Populate();


            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }

        protected void Grid_Slicice_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select Korisnik.username as Korisnik, Album.naziv + ' ' + Godina_Izdanja.naziv + ' ' + Izdavac.naziv as Album from Slicica_Korisnik ");
            naredba.Append(" join Slicica on Slicica_Korisnik.slicica_id=Slicica.id join Korisnik on Slicica_Korisnik.korisnik_id = Korisnik.id join Album on Slicica.album_id = Album.id join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.Godina_Izdanja_Id = Godina_izdanja.id ");
            naredba.Append(" where Slicica.id=" + DropSlicice.SelectedValue);

            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable grid = new DataTable();
                adapter.Fill(grid);
                GridSlicice.DataSource = grid;
                GridSlicice.DataBind();

            }
            catch (Exception Greska)
            {
                Response.Write(Greska.Message);

            }
        }

        protected void DropSlicice_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid_Slicice_Populate();
        }
    }
}