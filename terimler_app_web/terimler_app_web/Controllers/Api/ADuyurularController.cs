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
    [Route("api/ADuyurular")]
    public class ADuyurularController : Controller
    {

        DuyurularOperations duyurularOperations = new DuyurularOperations("Duyurular");

        public async Task<ActionResult> Get()
        {
            var query = duyurularOperations.GetAll().OrderByDescending(x => x.Id);
            return Ok(query);
        }

    }
}