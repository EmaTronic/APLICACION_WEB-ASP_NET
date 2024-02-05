using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace examenFebrero
{
    public partial class Punto3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int cantidadFilas = GridView1.Rows.Count;

            LabelCantidadFilas.Text = "Cantidad de filas: " + cantidadFilas.ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {

                SqlDataSource2.InsertParameters["valor"].DefaultValue = TextBox1.Text;
                SqlDataSource2.InsertParameters["idPregunta"].DefaultValue = DropDownList1.SelectedValue;
                
                int result = SqlDataSource2.Insert();

                if (result != 0)
                {
                    LabelMensaje.Text = "Se ha agregado " + result.ToString() + " una línea a la grilla";
                    GridView1.DataBind();
                }
                else
                {
                    LabelMensaje.Text = "No se agregó su pedido";
                }
            }
            else
            {
                LabelMensaje.Text = "Debe seleccionar un valor de la grilla o cargarlo en la caja";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (GridView1.SelectedRow != null)
                {
                    string selectedValue = DropDownList1.SelectedValue;

                    // Verifica que el valor no esté vacío
                    if (!string.IsNullOrEmpty(selectedValue))
                    {
                        int idDeporteValue;
                        if (int.TryParse(selectedValue, out idDeporteValue))
                        {
                            SqlDataSource2.UpdateParameters["valor"].DefaultValue = TextBox1.Text;
                            SqlDataSource2.UpdateParameters["idPregunta"].DefaultValue = idDeporteValue.ToString();
                            SqlDataSource2.UpdateParameters["id"].DefaultValue = GridView1.SelectedDataKey.Value.ToString(); // Add this line

                            int result = SqlDataSource2.Update();

                            if (result != 0)
                            {
                                LabelMensaje.Text = "Se ha modificado " + result.ToString() + " línea de la grilla";
                                GridView1.DataBind();
                            }
                            else
                            {
                                LabelMensaje.Text = "No se pudo modificar los valores";
                            }
                        }
                        else
                        {
                            LabelMensaje.Text = "El valor seleccionado no es un número válido.";
                        }
                    }
                    else
                    {
                        LabelMensaje.Text = "El valor seleccionado es nulo o vacío.";
                    }
                }
                else
                {
                    LabelMensaje.Text = "Debe seleccionar una fila de la grilla";
                }
            }
            catch (Exception ex)
            {
                LabelMensaje.Text = "Error: " + ex.Message;
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (GridView1.SelectedRow != null)
             
            {
                int nombreDeportistaColumnIndex = 2;
                TextBox1.Text = GridView1.SelectedRow.Cells[nombreDeportistaColumnIndex].Text;


                int idDeporte = 3;
                // Si también deseas asignar el valor de 'nombreDeportista' a un DropDownList, descomenta la siguiente línea
                DropDownList1.SelectedValue = GridView1.SelectedRow.Cells[idDeporte].Text;

            }
        }


 

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (GridView1.SelectedRow != null)
                {
                    int idColumnIndex = 1;
                    string idValue = GridView1.SelectedRow.Cells[idColumnIndex].Text;

                    SqlDataSource2.DeleteParameters["id"].DefaultValue = idValue;
                    int result = SqlDataSource2.Delete();

                    if (result > 0)
                    {
                        LabelMensaje.Text = "Se ha eliminado la fila seleccionada.";
                        GridView1.DataBind();
                    }
                    else
                    {
                        LabelMensaje.Text = "No se pudo eliminar la fila seleccionada.";
                    }
                }
                else
                {
                    LabelMensaje.Text = "No hay fila seleccionada para eliminar.";
                }
            }
            catch (Exception ex)
            {
                LabelMensaje.Text = "Error: " + ex.Message;
            }
        }
    }
}