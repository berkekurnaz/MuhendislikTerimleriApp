using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Concrete
{
    public class DuyurularOperations : BaseRepository<Duyurular>
    {

        string repoName;

        public DuyurularOperations(string repoName) : base(repoName)
        {
            this.repoName = repoName;
        }

    }
}
