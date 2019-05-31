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
    [Route("api/ASonTerimler")]
    public class ASonTerimlerController : Controller
    {
        TerimlerOperations terimlerOperations = new TerimlerOperations("Terimler");

        public async Task<ActionResult> Get()
        {
            var query = terimlerOperations.GetAll().OrderByDescending(t => t.Id).Take(10);
            return Ok(query);
        }

    }
}