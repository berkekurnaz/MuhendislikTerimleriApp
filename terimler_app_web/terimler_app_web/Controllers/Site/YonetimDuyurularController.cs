using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using terimler_app_web.DataAccessLayer.Concrete;
using terimler_app_web.Filter;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.Controllers.Site
{
    [AuthFilter]
    public class YonetimDuyurularController : Controller
    {

        DuyurularOperations duyurularOperations = new DuyurularOperations("Duyurular");

        public IActionResult Index()
        {
            return View(duyurularOperations.GetAll().OrderByDescending(x => x.Id));
        }

        public IActionResult Incele(int id)
        {
            var item = duyurularOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        public IActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Ekle(Duyurular model)
        {
            if (ModelState.IsValid)
            {
                duyurularOperations.AddModel(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public IActionResult Guncelle(int id)
        {
            var item = duyurularOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Duyurular newModel)
        {
            var model = duyurularOperations.GetById(id);

            model.Icerik = newModel.Icerik;
            model.Baslik = newModel.Baslik;
            model.EklenmeTarihi = newModel.EklenmeTarihi;

            duyurularOperations.UpdateModel(model);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = duyurularOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            duyurularOperations.DeleteModel(id);
            return RedirectToAction("Index");
        }

    }
}