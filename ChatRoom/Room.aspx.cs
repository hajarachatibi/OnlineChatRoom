using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChatRoom;
using Npgsql;

namespace ChatRoom
{
    public partial class Room : System.Web.UI.Page
    {
        private string connstring = String.Format("Server={0}; Port={1};" +
            "User Id={2}; Password={3}; Database={4};",
            "localhost", 5432, "Hajar",
            "hajar98_", "ChatRoomDB");
        private NpgsqlConnection conn;
        private string query;
        private NpgsqlCommand cmd;
        //loginpage login = new loginpage();
        Principal p = new Principal();
        
        String user = "";
        bool admin;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this ,GetType(), "scrollPanel", "scrollPanel();", true);
            admin = p.isadmin;
            if (admin == true)
            {
                mngbtn.Visible = true;
            }
            conn = new NpgsqlConnection(connstring);
            Affichage();

            

        }

        protected void Affichage()
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Select * from Discussion";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd.Dispose();
            conn.Close();
            rep.DataSource = dt;
            rep.DataBind();
        }

        protected void sendbtn_Click(object sender, EventArgs e)
        {
            String message = messagetxt.Text;
            user = p.getuser;
            try
            {
                conn.Open();
                query = "insert into Discussion(_username, _message) values('" + user + "', '" + message + "')";
                cmd = new NpgsqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                conn.Close();
            }
            messagetxt.Text = "";
        }

        protected void outbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Principal.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Affichage();
        }

        protected void mngbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage.aspx");
        }
    }
}