using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using terimler_app_web.Filter;

namespace terimler_app_web.Controllers.Site
{
    [AuthFilter]
    public class KurYayController : Controller
    {
        public IActionResult Nedir()
        {
            return View();
        }

        public IActionResult Amac()
        {
            return View();
        }

        public IActionResult Topluluk()
        {
            return View();
        }

        public IActionResult Kurulum()
        {
            return View();
        }

        public IActionResult Kodlar()
        {
            return View();
        }
    }
}