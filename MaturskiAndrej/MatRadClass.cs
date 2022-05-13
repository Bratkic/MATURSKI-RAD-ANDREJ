using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MaturskiAndrej
{
    public class MatRadClass
    {
        SqlConnection conn = new SqlConnection();
        string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet data = new DataSet();


        public int Registracija(string username, string ime, string prezime, string email, string pass)
        {
            conn.ConnectionString = webConfig;

            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Register";
            comm.Parameters.Add(new SqlParameter("@username", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, username));
            comm.Parameters.Add(new SqlParameter("@ime", SqlDbType.NVarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter("@prezime", SqlDbType.NVarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@pass", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, pass));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }

            return rezultat;
        }
        public int Provera_Korisnika(string email, string pass)
        {

            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Korisnik_Provera";
            // kolekcija Parameters
            comm.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, email));
            comm.Parameters.Add(new SqlParameter("@pass", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, pass));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int Ret;
            Ret = (int)comm.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }

            else
            {
                rezultat = 1;
            }
            return rezultat;
        }
        public int Godina_Izdanja_Insert(string naziv)
        {


            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Godina_Izdanja_Insert";

            comm.Parameters.Add(new SqlParameter("@godina", SqlDbType.VarChar, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, naziv));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;

            if (ret==0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }

            return rezultat;
        }
        public int Album_Insert(string naziv, int godina_id, int izdavac_id)
        {
            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Album_Insert";

            comm.Parameters.Add(new SqlParameter("@naziv", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, naziv));
            comm.Parameters.Add(new SqlParameter("@izdavac_id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, izdavac_id));
            comm.Parameters.Add(new SqlParameter("@godina_Izdanja", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, godina_id));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            conn.Open();
            comm.ExecuteNonQuery();
            
            conn.Close();


            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;

            if (ret==0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }

            return rezultat;
            
        }
        public int Izdavac_Insert(string naziv)
        {
            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Izdavac_Insert";

            comm.Parameters.Add(new SqlParameter("@naziv", SqlDbType.VarChar, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, naziv));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();

            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;

            if (ret == 0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }

            return rezultat;

        }
        public int Slicica_Insert(string ime, string prezime, int broj, int album_id, string path)
        {

            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Slicica_Insert";
            comm.Parameters.Clear();
            comm.Parameters.Add(new SqlParameter
                ("@ime", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            comm.Parameters.Add(new SqlParameter
                ("@prezime", SqlDbType.VarChar, 30, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            comm.Parameters.Add(new SqlParameter
                ("@broj", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, broj));
            comm.Parameters.Add(new SqlParameter
                ("@slika", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, path));
            comm.Parameters.Add(new SqlParameter
                ("@album_id", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, album_id));
            comm.Parameters.Add(new SqlParameter
                ("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;

            if (ret==0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;
      }
        public int Slicica_Korisnik_Insert(int korisnik_id, int slicica_id)
        {
            conn.ConnectionString = webConfig;
            int rezultat;

            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Slicica_Korisnik_Insert";
            comm.Parameters.Clear();
            comm.Parameters.Add(new SqlParameter("@korisnik_id", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, korisnik_id));
            comm.Parameters.Add(new SqlParameter("@slicica_id", SqlDbType.Int, 5, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slicica_id));
            comm.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            int ret;
            ret = (int)comm.Parameters["@RETURN_VALUE"].Value;

            if (ret==0)
            {
                rezultat = 0;
            }
            else
            {
                rezultat = 1;
            }
            return rezultat;

        }

       
    }
        
}