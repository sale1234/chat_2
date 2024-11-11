using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteka
{
    [Serializable]
    public class Korisnik
    {
        public string KorisnickoIme { get; set; }
        public string KorisnickaSifra { get; set; }
        public string Ulogovan { get; set; } = "ne";

        public override string ToString()
        {
            return KorisnickoIme;
        }

        public override bool Equals(object obj)
        {
            try
            {
                return ((Korisnik)obj).KorisnickoIme == KorisnickoIme;
            }
            catch (InvalidCastException ex)
            {
                Debug.WriteLine(">>>>" + ex.Message);
                return false;
            }    
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
