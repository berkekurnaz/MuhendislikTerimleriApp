using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using terimler_app_web.DataAccessLayer.Concrete;

namespace terimler_app_web.Controllers.Api
{
    [Produces("application/json")]
    [Route("api/ATerimAra")]
    public class ATerimAraController : Controller
    {

        TerimlerOperations terimlerOperations = new TerimlerOperations("Terimler");

        public async Task<ActionResult> Get(string bolum, string kelime)
        {
            var query = terimlerOperations.GetSearchByName(kelime, bolum).OrderBy(x => x.TerimAd);
            return Ok(query);
        }

    }
}