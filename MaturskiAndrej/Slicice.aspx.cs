using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

namespace MaturskiAndrej
{
    public partial class Slicice : System.Web.UI.Page
    {
        string adresa;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                Godine_Populate();
                
                
            }
        }

        protected void Godine_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select distinct Album.godina_izdanja_id as id,Godina_Izdanja.naziv from Album join Godina_Izdanja on Album.Godina_Izdanja_id = Godina_Izdanja.id");

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                GodineDrop.DataSource = god;
                GodineDrop.DataValueField = "id";
                GodineDrop.DataTextField = "naziv";
                GodineDrop.DataBind();

                Izdavac_Populate();

            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }

        protected void Izdavac_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select distinct Album.izdavac_id as id, Izdavac.naziv from Album join Izdavac on Album.izdavac_id = Izdavac.id where Album.godina_izdanja_id = " + Convert.ToInt32(GodineDrop.SelectedValue));
            

            //textBox2.Text = naredba.ToString();
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                IzdavaciDrop.DataSource = god;
                IzdavaciDrop.DataValueField = "id";

                IzdavaciDrop.DataTextField = "naziv";
                IzdavaciDrop.DataBind();

                Naziv_Populate();


            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }
        protected void Naziv_Populate()
        {
            StringBuilder naredba = new StringBuilder("Select id,naziv from Album ");
            naredba.Append(" where Album.izdavac_id = " + Convert.ToInt32(IzdavaciDrop.SelectedValue));
            naredba.Append(" and Album.godina_izdanja_id = " + Convert.ToInt32(GodineDrop.SelectedValue));
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), conn);
                DataTable god = new DataTable();
                adapter.Fill(god);
                NazivDrop.DataSource = god;
                NazivDrop.DataValueField = "id";

                NazivDrop.DataTextField = "naziv";
                NazivDrop.DataBind();
                
            }
            catch (Exception Greska)
            {

                Response.Write(Greska.Message);
            }
        }

        protected void IzdavaciDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            Naziv_Populate();
        }

        protected void GodineDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            Izdavac_Populate();
        }
        public int vrati_id(string email)
        {
            string naredba = "select id from Korisnik where Korisnik.email = '" + email +"'";

            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            SqlCommand komanda = new SqlCommand(naredba, conn);
            int vrati;
            conn.Open();
            vrati = (int)komanda.ExecuteScalar();
            conn.Close();
            return vrati;

        }
        public int vrati_slic_id()
        {
            string naredba = "select MAX (id) from Slicica";
            SqlConnection conn = new SqlConnection();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            SqlCommand komanda = new SqlCommand(naredba, conn);
            int vracam;
            conn.Open();
            vracam = (int)komanda.ExecuteScalar();
            conn.Close();
            return vracam;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MatRadClass m = new MatRadClass();
            if (FileUpload1.HasFile)
            {
                int filesize = FileUpload1.PostedFile.ContentLength;
                if (filesize > 2242880)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Preveliki fajl!')", true);
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("/Uploads/" + FileUpload1.FileName));
                    adresa = "/Uploads/" + FileUpload1.FileName;
                }

            }
            else
            {
                adresa = null;
            }

            int rezultat;
            int rez_2;
            int vracam;
            int vracam_ga;
            vracam = vrati_id(Session["Korisnik"].ToString());
            
            rezultat = m.Slicica_Insert(imetxt.Text, prezimetxt.Text, Convert.ToInt32(brojtxt.Text),Convert.ToInt32(NazivDrop.SelectedValue), adresa);
            vracam_ga = vrati_slic_id();

            if (rezultat==0)
            {
                try
                {
                    rez_2 = m.Slicica_Korisnik_Insert(vracam, vracam_ga);
                    Response.Write(rez_2.ToString());
                }
                catch (Exception Greska)
                {

                    Response.Write(Greska.Message);
                }
               
            }
            vracam_ga = vrati_slic_id();
            











        }
    }
}