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
    public class YonetimTerimlerController : Controller
    {

        TerimlerOperations terimlerOperations = new TerimlerOperations("Terimler");

        public IActionResult Index()
        {
            return View(terimlerOperations.GetAll().OrderByDescending(x => x.Id));
        }

        public IActionResult Bolumler(string bolum)
        {
            return View(terimlerOperations.GetAllByCategoryName(bolum).OrderByDescending(x => x.Id));
        }

        public IActionResult Incele(int id)
        {
            var item = terimlerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim","Hata");
            }
            return View(item);
        }

        public IActionResult Ekle()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Ekle(Terimler model)
        {
            if (ModelState.IsValid)
            {
                terimlerOperations.AddModel(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public IActionResult Guncelle(int id)
        {
            var item = terimlerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Guncelle(int id, Terimler newModel)
        {
            var model = terimlerOperations.GetById(id);

            model.TerimAd = newModel.TerimAd;
            model.TerimAciklama = newModel.TerimAciklama;
            model.TerimBolum = newModel.TerimBolum;

            terimlerOperations.UpdateModel(model);

            return RedirectToAction("Index");
        }

        public IActionResult Sil(int id)
        {
            var item = terimlerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            terimlerOperations.DeleteModel(id);
            return RedirectToAction("Index");
        }

    }
}