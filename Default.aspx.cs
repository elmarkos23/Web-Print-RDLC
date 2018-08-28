using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Print_RDLC
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report1.rdlc");
                Customers dsCustomers = GetData();
                ReportDataSource datasource = new ReportDataSource("Customers", dsCustomers.Tables[0]);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(datasource);
            }
        }
        private Customers GetData()
        {
            using (Customers dsCustomers = new Customers())
            {
                DataTable dt = dsCustomers.Tables["Data1"];
                dt.Rows.Add("ALFKI", "Maria", "Boise", "Germany");
                dt.Rows.Add("ANATR", "Ana Trujillo", "México D.F.", "Mexico");
                dt.Rows.Add("ANTON", "Antonio Moreno", "Montréal", "Mexico");
                dt.Rows.Add("AROUT", "Thomas Hardy", "Mannheim", "Sweden");
                dt.Rows.Add("BERGS", "Christina Berglund", "Luleå", "Sweden");
                return dsCustomers;
            }
        }
    }
}