using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Concrete
{
    public class MesajlarOperations : BaseRepository<Mesajlar>
    {
        string repoName;

        public MesajlarOperations(string repoName) : base(repoName)
        {
            this.repoName = repoName;
        }

    }
}
