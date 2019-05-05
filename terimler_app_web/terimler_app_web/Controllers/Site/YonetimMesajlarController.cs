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
    public class YonetimMesajlarController : Controller
    {

        MesajlarOperations mesajlarOperations = new MesajlarOperations("Mesajlar");

        public IActionResult Index()
        {
            return View(mesajlarOperations.GetAll().OrderByDescending(x => x.Id));
        }

        public IActionResult Incele(int id)
        {
            var item = mesajlarOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        public IActionResult Sil(int id)
        {
            var item = mesajlarOperations.GetById(id);
            if (item == null)
            {
                return RedirectToAction("Yonetim", "Hata");
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Sil(int id, IFormCollection collection)
        {
            mesajlarOperations.DeleteModel(id);
            return RedirectToAction("Index");
        }

    }
}