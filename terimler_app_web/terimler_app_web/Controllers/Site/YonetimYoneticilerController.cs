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
    public class YonetimYoneticilerController : Controller
    {

        YoneticilerOperations yoneticilerOperations = new YoneticilerOperations("Yoneticiler");

        public IActionResult Index()
        {
            return View(yoneticilerOperations.GetAll().OrderByDescending(x => x.Id));
        }

        public IActionResult Incele(int id)
        {
            var item = yoneticilerOperations.GetById(id);
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
        public IActionResult Ekle(Yoneticiler model)
        {
            if (ModelState.IsValid)
            {
                yoneticilerOperations.AddModel(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public IActionResult Guncelle(int id)
        {
            var item = yoneticilerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Yoneticiler newModel)
        {
            var model = yoneticilerOperations.GetById(id);

            model.KullaniciAdi = newModel.KullaniciAdi;
            model.Sifre = newModel.Sifre;

            yoneticilerOperations.UpdateModel(model);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = yoneticilerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            yoneticilerOperations.DeleteModel(id);
            return RedirectToAction("Index");
        }
    }
}