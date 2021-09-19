using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom
{
    public partial class Create : System.Web.UI.Page
    {
        private string connstring = String.Format("Server={0}; Port={1};" +
            "User Id={2}; Password={3}; Database={4};",
            "localhost", 5432, "Hajar",
            "hajar98_", "ChatRoomDB");
        private NpgsqlConnection conn;
        private string query;
        private NpgsqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(connstring);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string utxt = usernametxt.Text;
            string ptxt = passwordtxt.Text;
            bool isadmin = false;
            if (cbyes.Checked)
            {
                isadmin = true;
            }
            else 
                if(cbno.Checked)
            {
                isadmin = false;
            }
            else
            {
                aderrorlbl.Visible = true;
            }


            try
            {
                conn.Open();
                query = "insert into Users(username, motdepasse, u_admin) values('"+ utxt+ "', '"+ptxt+"'," + isadmin + ")";


                cmd = new NpgsqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Room.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                conn.Close();
            }
        }
    }
}