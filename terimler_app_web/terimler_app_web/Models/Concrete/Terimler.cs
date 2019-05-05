using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace terimler_app_web.Models.Concrete
{
    public class Terimler : BaseEntity
    {
        public string TerimAd { get; set; }
        public string TerimAciklama { get; set; }
        public string TerimBolum { get; set; }
    }
}
