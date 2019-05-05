using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace terimler_app_web.Models.Concrete
{
    public class Mesajlar : BaseEntity
    {
        public string AdSoyad { get; set; }
        public string Mail { get; set; }
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string Tarih { get; set; }

        public Mesajlar()
        {

        }

        public Mesajlar(string AdSoyad, string Mail, string Baslik, string Icerik, string Tarih)
        {
            this.AdSoyad = AdSoyad;
            this.Mail = Mail;
            this.Baslik = Baslik;
            this.Icerik = Icerik;
            this.Tarih = Tarih;
        }

    }
}
