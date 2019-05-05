using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using terimler_app_web.DataAccessLayer.Concrete;
using terimler_app_web.Models.Concrete;

namespace terimler_app_web.Controllers.Api
{
    [Produces("application/json")]
    [Route("api/AMesajlar")]
    public class AMesajlarController : Controller
    {

        MesajlarOperations mesajlarOperations = new MesajlarOperations("Mesajlar");

        /* Mesaj Post Islemi */
        [HttpPost]
        public void Post(Mesajlar mesaj)
        {
            mesajlarOperations.AddModel(mesaj);
        }

    }
}