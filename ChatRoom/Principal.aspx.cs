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
    public partial class Principal : System.Web.UI.Page
    {
        public static string txt = "";
        public static bool admin;
        private string connstring = String.Format("Server={0}; Port={1};" +
            "User Id={2}; Password={3}; Database={4};",
            "localhost", 5432, "Hajar",
            "hajar98_","ChatRoomDB");
        private NpgsqlConnection conn;
        private string query;
        private NpgsqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(connstring);
            txt = usernametxt.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewAccount.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string utxt = usernametxt.Text;
            string ptxt = passwordtxt.Text;
            try
            {
                conn.Open();
                query = "select * from Users where username='"+ utxt+"'";
                cmd = new NpgsqlCommand(query, conn);
                NpgsqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    if (rdr.GetString(2) == ptxt)
                    {
                        txt = usernametxt.Text;
                        admin = rdr.GetBoolean(3);
                        Response.Redirect("Room.aspx");
                    }
                    else
                    {
                        errorlbl.Visible = true;
                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                conn.Close();
            }
        }
        public string getuser
        {
            get { return txt; }
        }
        public bool isadmin
        {
            get { return admin; }
        }
    }
}