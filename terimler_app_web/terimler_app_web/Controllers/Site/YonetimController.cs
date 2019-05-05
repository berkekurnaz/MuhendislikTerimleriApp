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
    public class YonetimController : Controller
    {

        MesajlarOperations mesajlarOperations = new MesajlarOperations("Mesajlar");
        OnerilerOperations onerilerOperations = new OnerilerOperations("Oneriler");
        TerimlerOperations terimlerOperations = new TerimlerOperations("Terimler");
        YoneticilerOperations yoneticilerOperations = new YoneticilerOperations("Yoneticiler");

        [AuthFilter]
        public IActionResult Index()
        {
            ViewBag.MesajSayisi = mesajlarOperations.GetAll().Count;
            ViewBag.OneriSayisi = onerilerOperations.GetAll().Count;
            ViewBag.TerimSayisi = terimlerOperations.GetAll().Count;
            ViewBag.YoneticiSayisi = yoneticilerOperations.GetAll().Count;
            return View();
        }

        [AuthFilter]
        public IActionResult Hata()
        {
            return View();
        }

        [AuthFilter]
        public IActionResult SiteAyarlari()
        {
            return View();
        }

        public IActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Giris(Yoneticiler model)
        {
            var newEntity = yoneticilerOperations.Login(model);
            if (newEntity != null)
            {
                HttpContext.Session.SetString("SessionUsername", newEntity.KullaniciAdi);
                return RedirectToAction("Index", "Yonetim");
            }
            return View(model);
        }

        public IActionResult Cikis()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Anasayfa");
        }

    }
}