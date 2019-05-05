using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace terimler_app_web.Models.Concrete
{
    public class Yoneticiler : BaseEntity
    {
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
    }
}
