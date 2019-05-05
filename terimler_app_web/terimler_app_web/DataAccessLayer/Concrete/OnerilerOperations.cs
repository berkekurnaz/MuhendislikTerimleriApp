using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Concrete
{
    public class OnerilerOperations : BaseRepository<Oneriler>
    {
        string repoName;

        public OnerilerOperations(string repoName) : base(repoName)
        {
            this.repoName = repoName;
        }

    }
}
