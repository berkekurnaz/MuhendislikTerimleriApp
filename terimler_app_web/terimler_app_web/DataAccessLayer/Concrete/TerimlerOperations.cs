using LiteDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Concrete
{
    public class TerimlerOperations : BaseRepository<Terimler>
    {

        string repoName;

        public TerimlerOperations(string repoName) : base(repoName)
        {
            this.repoName = repoName;
        }

        /* Butun Tabloyu Kategori Ismi İle Filtreleme Listeleme */
        public List<Terimler> GetAllByCategoryName(string bolum)
        {
            var list = new List<Terimler>();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Terimler>(repoName);
                foreach (Terimler item in items.FindAll().Where(x => x.TerimBolum == bolum))
                {
                    list.Add(item);
                }
            }
            return list;
        }

    }
}
