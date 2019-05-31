using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace terimler_app_web.Models.Concrete
{
    public class Duyurular : BaseEntity
    {
        public string Baslik { get; set; }
        public string Icerik { get; set; }
        public string EklenmeTarihi { get; set; }
    }
}
