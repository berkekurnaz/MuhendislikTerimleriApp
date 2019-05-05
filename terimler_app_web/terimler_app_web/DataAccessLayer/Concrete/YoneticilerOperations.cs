using LiteDB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Concrete
{
    public class YoneticilerOperations : BaseRepository<Yoneticiler>
    {
        string repoName;

        public YoneticilerOperations(string repoName) : base(repoName)
        {
            this.repoName = repoName;
        }

        /* Sisteme Giris Yapmak Icin */
        public Yoneticiler Login(Yoneticiler model)
        {
            var result = new Yoneticiler();
            using (var db = new LiteDatabase(@"myDatabase.db"))
            {
                var items = db.GetCollection<Yoneticiler>(repoName);
                result = items.Find(x => x.KullaniciAdi == model.KullaniciAdi && x.Sifre == model.Sifre).FirstOrDefault();
            }
            return result;
        }

    }
}
