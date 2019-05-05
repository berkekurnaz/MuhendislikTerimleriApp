using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using terimler_app_web.Models.Abstract;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.DataAccessLayer.Abstract
{
    public interface IBaseRepository<T> where T : BaseEntity, IEntity, new()
    {
        List<T> GetAll();
        T GetById(int id);
        void AddModel(T model);
        void UpdateModel(T model);
        void DeleteModel(int id);
    }
}
