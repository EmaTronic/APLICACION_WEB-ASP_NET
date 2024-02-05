using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace examenFebrero
{
    public partial class Punto2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtener el valor seleccionado del DropDownList
            string valorSeleccionado = DropDownList1.SelectedValue;

            // Obtener la fila seleccionada del SqlDataSource
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            // Filtrar los resultados para obtener la fila que coincide con el valor seleccionado
            DataRowView drv = dv.OfType<DataRowView>().FirstOrDefault(row => row["id"].ToString() == valorSeleccionado);

            if (drv != null)
            {
                // Obtener el valor de 'descripcion' de la fila seleccionada
                string descripcion = drv["descripcion"].ToString();

                // Asignar el valor al TextBox
                TextBox1.Text = descripcion;
            }
            else
            {
                // Limpiar el TextBox si no hay coincidencia
                TextBox1.Text = string.Empty;
            }
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            if ( !string.IsNullOrEmpty(TextBox1.Text)) { 
                SqlDataSource1.DeleteParameters["id"].DefaultValue = DropDownList1.SelectedValue.ToString();
                int result = SqlDataSource1.Delete();
                        if (result != 0)
                        {
                            labelEstado.Text = "Se ha eliminado " + result.ToString() + " registros";
                            TextBox1.Text = "";
                        }
                        else
                        {
                            labelEstado.Text = " No se eliminaron los elementos.";
                        }
                        GridView1.DataBind();
            }
            else
            {
                labelEstado.Text = " No se seleccionó ninguna fila de la lista.";
            }
        }



        protected void modificar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {

                SqlDataSource1.UpdateParameters["id"].DefaultValue = DropDownList1.SelectedValue.ToString();
                SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox1.Text;
                int result = SqlDataSource1.Update();
                if (result != 0)
                {
                    labelEstado.Text = "Se ha modificado " + result.ToString() + " registros";

                    TextBox1.Text = "";
                }
                else
                {
                    labelEstado.Text = " No se modificado los elementos.";
                }
                GridView1.DataBind();
            }
            else
            {
                labelEstado.Text = "Debe seleccionar un valor de la lista";
            }

        }

    }
}