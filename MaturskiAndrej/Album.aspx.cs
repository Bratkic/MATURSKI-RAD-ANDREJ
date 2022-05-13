using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MaturskiAndrej
{
    public partial class Album : System.Web.UI.Page
    {
        int godinee;
        int izdavacii;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Grid_Populate();
                Godine_Populate();
                Izdavac_Populate();


            }
        }

        protected void Grid_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select Album.naziv as Naziv, Godina_Izdanja.naziv as Godina_izdanja, Izdavac.naziv as Izdavac from Album");
            naredba.Append(" join Izdavac on Album.izdavac_id = Izdavac.id join Godina_Izdanja on Album.godina_izdanja_id=Godina_Izdanja.id");

            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            //textBox2.Text = naredba.ToString();
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable grid = new DataTable();
                adapter.Fill(grid);
                GridView1.DataSource = grid;
                GridView1.DataBind();

            }
            catch (Exception Greska)
            {
                Response.Write(Greska.Message);
                
            }
            
            
            
        }


        protected void Godine_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select id,naziv from Godina_Izdanja");

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                Godine.DataSource = god;
                Godine.DataValueField = "id";
                Godine.DataTextField = "naziv";
                Godine.DataBind();

            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }

        protected void Izdavac_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select id,naziv from Izdavac");

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                Izdavaci.DataSource = god;
                Izdavaci.DataValueField = "id";
                
                Izdavaci.DataTextField = "naziv";
                Izdavaci.DataBind();
                

            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }

        protected void Dodaj_Album_Click(object sender, EventArgs e)
        {
            MatRadClass m = new MatRadClass();
            int rezultat;
           
            try
            {
                

                rezultat = m.Album_Insert(nazivAlbuma.Text, Convert.ToInt32(Godine.SelectedValue), Convert.ToInt32(Izdavaci.SelectedValue));
                if (rezultat==0)
                {
                    Grid_Populate();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Doslo je do greske')", true);
                }
                   
                
                
            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }

            


        }

        protected void Godine_SelectedIndexChanged(object sender, EventArgs e)
        {
            godinee = Convert.ToInt32(Godine.SelectedValue);
            
        }

        protected void Izdavaci_SelectedIndexChanged(object sender, EventArgs e)
        {

            izdavacii = Convert.ToInt32(Izdavaci.SelectedValue);
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MatRadClass m = new MatRadClass();
            int rezultat;
            rezultat = m.Godina_Izdanja_Insert(godtxt.Text);

            
            Godine_Populate();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MatRadClass m = new MatRadClass();
            int rezultat;
            rezultat = m.Izdavac_Insert(izdavactxt.Text);

            Izdavac_Populate();
        }
    }
}