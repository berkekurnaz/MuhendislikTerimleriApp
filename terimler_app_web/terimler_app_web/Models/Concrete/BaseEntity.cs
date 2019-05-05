using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Abstract;

namespace terimler_app_web.Models.Concrete
{
    public class BaseEntity : IEntity
    {
        public int Id { get; set; }
    }
}
