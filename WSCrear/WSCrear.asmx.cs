using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace WSCrear
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "My App mobil";
        }

        [WebMethod]
        public DataSet WSListado()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=DESKTOP-SBIUVOP\\SQLEXPRESS01;Initial catalog=DBUDC; Integrated Security=true";
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Program", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod]
        public DataSet WSConsulta()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=DESKTOP-SBIUVOP\\SQLEXPRESS01;Initial catalog=DBUDC; Integrated Security=true";
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Program", conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

    }
}
