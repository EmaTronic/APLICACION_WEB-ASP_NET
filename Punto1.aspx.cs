using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace examenFebrero
{
    public partial class Punto1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string descripcion = TextBox1.Text;
            SqlDataSource1.InsertParameters["descripcion"].DefaultValue = descripcion;
            if (!string.IsNullOrEmpty(TextBox1.Text)){

                int result = SqlDataSource1.Insert();
            
                if (result != 0)
                {
                    LabelMensaje.Text = "Se ha agregado " + result.ToString() + " pregunta";
                    TextBox1.Text = "";
                }
                else
                {
                    LabelMensaje.Text = "No se agregó el deporte";
                }
            } else {
                LabelMensaje.Text = "Debe ingresar una pregunta";
                 } 
        }
    }
}