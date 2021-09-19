using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatRoom
{
    public partial class Manage : System.Web.UI.Page
    {
        public static string userselected;
        private string connstring = String.Format("Server={0}; Port={1};" +
            "User Id={2}; Password={3}; Database={4};",
            "localhost", 5432, "Hajar",
            "hajar98_", "ChatRoomDB");
        private NpgsqlConnection conn;
        private string query, query1, query2;
        private NpgsqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new NpgsqlConnection(connstring);
            
        }
        protected void userRep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                { 
                    userselected = e.CommandArgument.ToString();
                    try
                    {
                        conn.Open();
                        query = "delete from Users where username='" + userselected + "'";

                        cmd = new NpgsqlCommand(query, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('L utilisateur est bien supprimé')", true);
                        }
                        catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                        conn.Close();
                    }
                } 
                    break;

                case "admin":
                    {
                        userselected = e.CommandArgument.ToString();
                        try
                        {
                            conn.Open();
                            query1 = "UPDATE Users SET u_admin = 'true' WHERE username ='" + userselected + "'";

                            cmd = new NpgsqlCommand(query1, conn);
                            cmd.ExecuteNonQuery();
                            conn.Close();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('L utilisateur est bien un admin du Room maintenant')", true);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Error: " + ex.Message);
                            conn.Close();
                        }
                    }



                    break;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from Users";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd.Dispose();
            conn.Close();
            deleteRep.DataSource = dt;
            deleteRep.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                query2 = "delete from Discussion";
                cmd = new NpgsqlCommand(query2, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('La discussion est bien supprimée')", true);

            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                conn.Close();
            }
        }
    }
}