using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace examenFebrero
{
    public class Archivo
    {
        public string Nombre { get; set; }
        public string Ruta { get; set; }
        public Archivo(string name, string path)
        {
            Nombre = name;
            Ruta = path;
        }
    }
}