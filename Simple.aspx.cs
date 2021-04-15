using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Simple : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        LoadCustomers();
    }
    private void LoadCustomers()
    {
        string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string query = "SELECT * FROM Customers WHERE Country = @Country OR @Country = ''";
        SqlCommand cmd = new SqlCommand(query);
        cmd.Parameters.AddWithValue("@Country", ddlCountries.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds, "Customers");
                    gvCustomers.DataSource = ds;
                    gvCustomers.DataBind();
                }
            }
        }
    }

}