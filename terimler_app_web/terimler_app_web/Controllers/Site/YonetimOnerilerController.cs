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
    public class YonetimOnerilerController : Controller
    {

        OnerilerOperations onerilerOperations = new OnerilerOperations("Oneriler");

        public IActionResult Index()
        {
            return View(onerilerOperations.GetAll().OrderByDescending(x => x.Id));
        }

        public IActionResult Incele(int id)
        {
            var item = onerilerOperations.GetById(id);
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
        public IActionResult Ekle(Oneriler model)
        {
            if (ModelState.IsValid)
            {
                onerilerOperations.AddModel(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }

        public IActionResult Sil(int id)
        {
            var item = onerilerOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            onerilerOperations.DeleteModel(id);
            return RedirectToAction("Index");
        }

    }
}