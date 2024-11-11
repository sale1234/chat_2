using Biblioteka;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServerskiDeo
{
    public class Broker
    {
        private SqlConnection connection;

        public Broker()
        {
            connection = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Chat;Integrated Security=True;");
        }

        public void OpenConnection()
        {
            connection.Open();
        }

        public void CloseConnection()
        {
            connection.Close();
        }

        internal List<Administartor> VratiAdmine()
        {
            SqlCommand command = new SqlCommand("", connection);
            command.CommandText = "select * from Administrator";
            List<Administartor> lista = new List<Administartor>();
            SqlDataReader reader = command.ExecuteReader();
            while(reader.Read())
            {
                Administartor administartor = new Administartor
                {
                    Email = reader.GetString(1),
                    Sifra = reader.GetString(2),
                    Ime = reader.GetString(3),
                    Prezime = reader.GetString(4)
                };
                lista.Add(administartor);
            }
            reader.Close();
            return lista;
        }

        internal List<Korisnik> VratiKorisnike()
        {
            SqlCommand command = new SqlCommand("", connection);
            command.CommandText = "select * from Korisnik";
            List<Korisnik> lista = new List<Korisnik>();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Korisnik korisnik = new Korisnik
                {
                   KorisnickoIme = reader.GetString(0),
                   KorisnickaSifra = reader.GetString(1)
                };
                lista.Add(korisnik);
            }
            reader.Close();
            return lista;
        }

        internal void DodajPoruku(Poruka poruka)
        {
            SqlCommand command = new SqlCommand("", connection);
            command.CommandText = "insert into Poruka values (@tekst, @posiljalac, @primalac)";
            command.Parameters.AddWithValue("@tekst", poruka.Tekst);
            command.Parameters.AddWithValue("@posiljalac", poruka.Posiljalac.KorisnickoIme);
            command.Parameters.AddWithValue("@primalac", poruka.Primalac.KorisnickoIme);
            command.ExecuteNonQuery();
        }

        internal bool DodajKorisnika(Korisnik korisnik)
        {
            try
            {
                SqlCommand command = new SqlCommand("", connection);
                command.CommandText = "insert into Korisnik values (@ime, @sifra)";
                command.Parameters.AddWithValue("@ime", korisnik.KorisnickoIme);
                command.Parameters.AddWithValue("@sifra", korisnik.KorisnickaSifra);
                command.ExecuteNonQuery();
                return true;
            }
            catch (SqlException ex)
            {
                Debug.WriteLine(">>>>> " + ex.Message);
                return false;
            }
            
        }
    }
}
