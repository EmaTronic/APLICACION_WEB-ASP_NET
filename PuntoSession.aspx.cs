using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace examenFebrero
{
    public partial class PuntoSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["nombreSession"] != null)
            {
                Label4.Text = Session["nombreSession"].ToString();
            }
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {


            if (Page.IsValid && TextBox2.Text != string.Empty)

            {
                this.Session["nombreSession"] = TextBox2.Text;

                HttpCookie cookie1 = new HttpCookie("Contrasegna", TextBox4.Text);
                //CONSTRUCTOR: de la clase httpCookie se crea un objeto llamado cookie 2, su respectivo valor, traido del TextBox

                DateTime expiracion = DateTime.Now.AddSeconds(300);
                cookie1.Expires = expiracion;
                Response.Cookies.Add(cookie1);
                //envía la cookie
                Response.Redirect(Request.RawUrl);

            }





        }
    }
}