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
    [Route("api/AOneriler")]
    public class AOnerilerController : Controller
    {

        OnerilerOperations onerilerOperations = new OnerilerOperations("Oneriler");

        /* Oneri Post Islemi */
        [HttpPost]
        public void Post(Oneriler oneri)
        {
            onerilerOperations.AddModel(oneri);
        }

    }
}