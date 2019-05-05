using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace terimler_app_web.Controllers.Site
{
    public class AnasayfaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}