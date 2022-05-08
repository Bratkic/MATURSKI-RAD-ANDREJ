﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaturskiAndrej
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MatRadClass m = new MatRadClass();
            int rezultat;
            rezultat = m.Registracija(usernametxt.Text,imetxt.Text,prezimetxt.Text,emailtxt.Text, passtxt.Text);

            if (rezultat==0)
            {
                Session["korisnik"] = emailtxt.Text;
                Response.Redirect("kontrolpanel.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}