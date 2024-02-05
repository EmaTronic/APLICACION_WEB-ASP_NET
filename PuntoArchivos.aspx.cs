using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace examenFebrero
{
    public partial class PuntoArchivos : System.Web.UI.Page
    {
        string usuario = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["nombreSession"] != null)
                {
                    usuario = HttpContext.Current.Session["nombreSession"].ToString();
                    labelUsuario.Text = usuario;
                    cargarGrilla(usuario);
                }
                else
                {
                    labelUsuario.Text = "No ha iniciado sesión";
                }
            }
        }

        public void cargarGrilla(string NombreSession)
        {
            string path = Server.MapPath($"./{NombreSession}");

            if (Directory.Exists(path))
            {
                string[] files = Directory.GetFiles(path);
                List<Archivo> fileList = new List<Archivo>();

                foreach (string file in files)
                {
                    var archivo = new Archivo(Path.GetFileName(file), file);
                    fileList.Add(archivo);
                }

                GridView1.DataSource = fileList;
                GridView1.DataBind();
            }
            else
            {
                // Si la carpeta no existe, crea la carpeta y vuelve a intentar cargar la grilla
                Directory.CreateDirectory(path);
                cargarGrilla(NombreSession);
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            string usuario = string.Empty;
            if (HttpContext.Current.Session["nombreSession"] != null)
            {
                usuario = HttpContext.Current.Session["nombreSession"].ToString();
                string path = $"{Server.MapPath(".")}/{usuario}";
                string result = string.Empty;

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                if (FileUpload1.HasFiles)
                {
                    foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                    {
                        if (archivo.ContentLength > 10000000)
                        {
                            result += $"El archivo {archivo.FileName} supera los 100 bytes - ";
                        }
                        else
                        {
                            if (File.Exists($"{path}/{archivo.FileName}"))
                            {
                                result += $"El archivo {archivo.FileName} ya existe - ";
                            }
                            else
                            {
                                archivo.SaveAs($"{path}/{archivo.FileName}");
                                LabelCarga.Text = "El archivo se cargó correctamente";
                                TextBox1.Text = archivo.FileName;
                            }
                        }
                    }

                
                    cargarGrilla(usuario);
                }
                else
                {
                    LabelCarga.Text = "Seleccione al menos un archivo para cargar.";
                }
            }
            else
            {
                labelUsuario.Text = "Debe iniciar sesión para cargar un archivo";
            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }


    }
}