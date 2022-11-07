using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADO_CRUD
{
    public partial class Default : System.Web.UI.Page
    {
        public static string db = ConfigurationManager.ConnectionStrings["dbSample"].ConnectionString;
        SqlConnection con = new SqlConnection(db);

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblDevice", con);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }

        void Reset()
        {
            tbDeviceManufacturer.Text = tbDeviceName.Text = tbDevicePrice.Text = "";
            tbDeviceID.Focus();
        }
        protected void btnSearchByID_Click(object sender, EventArgs e)
        {
            Reset();

            string id = tbDeviceID.Text;
            string command = "SELECT * FROM tblDevice WHERE DeviceID = " + id;
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                tbDeviceManufacturer.Text = rdr[1].ToString();
                tbDeviceName.Text = rdr[2].ToString();
                tbDevicePrice.Text = rdr[3].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid DeviceID! Please enter correct DeviceID.');", true);
            }
            rdr.Close();
            con.Close();

        }

        protected void btnGenerateUniqueDeviceID_Click(object sender, EventArgs e)
        {
            Reset();

            string command = "SELECT max(DeviceID) + 1 FROM tblDevice ";
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            string id = cmd.ExecuteScalar().ToString();
            con.Close();
            tbDeviceID.Text = id;
        }

        protected void btnInsertData_Click(object sender, EventArgs e)
        {
            string id = tbDeviceID.Text;
            string manufacturer = tbDeviceManufacturer.Text;
            string devName = tbDeviceName.Text;
            string price = tbDevicePrice.Text;

            string command = string.Format("INSERT INTO tblDevice VALUES({0}, '{1}', '{2}', {3})", id, manufacturer, devName, price);
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Reset();

            // refresh page
            this.Page_Load(null, null);
        }

        protected void btnUpdateData_Click(object sender, EventArgs e)
        {
            string id = tbDeviceID.Text;
            string manufacturer = tbDeviceManufacturer.Text;
            string devName = tbDeviceName.Text;
            string price = tbDevicePrice.Text;

            string command = string.Format("UPDATE tblDevice SET DeviceManufacturer = '{0}', DeviceName = '{1}', DevicePrice = {2} WHERE DeviceID = {3}", manufacturer, devName, price, id);
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data updated successfully!');", true);
            
            // refresh page
            this.Page_Load(null, null);
        }

        protected void btnDeleteData_Click(object sender, EventArgs e)
        {
            string id = tbDeviceID.Text;
            string command = "DELETE FROM tblDevice WHERE DeviceID = " + id;
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data deleted successfully!');", true);

            // refresh page
            this.Page_Load(null, null);
            Reset();
        }
    }
}