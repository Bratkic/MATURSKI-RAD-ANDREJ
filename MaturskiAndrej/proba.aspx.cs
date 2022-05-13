using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace MaturskiAndrej
{
    public partial class proba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            DataSet ds = new DataSet();
            string webConfig = ConfigurationManager.ConnectionStrings["home"].ConnectionString;
            conn.ConnectionString = webConfig;
            SqlCommand comm = new SqlCommand();
            comm.Connection = conn;
            comm.CommandType = CommandType.StoredProcedure;
            comm.CommandText = "Sve_Slike";
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;
            da.Fill(ds);

          
               Response.Write("<img src="+ ds.Tables[0].Rows[1]["slika"] + " />");
                
            
        }
    }
}