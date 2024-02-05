using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace examenFebrero
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new System.Web.UI.ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.3.1.min.js", // Asegúrate de ajustar la ruta al archivo jQuery en tu proyecto
                DebugPath = "~/Scripts/jquery-3.3.1.js", // Ruta para la versión de depuración
                CdnPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js", // Ruta CDN para jQuery
                CdnDebugPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js" // Ruta de depuración en CDN
            });

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}