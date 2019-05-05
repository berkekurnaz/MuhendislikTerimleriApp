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
    [Route("api/ATerimler")]
    public class ATerimlerController : Controller
    {

        TerimlerOperations terimlerOperations = new TerimlerOperations("Terimler");

        /* Bolumune Göre Terimleri Listeleme */
        public IActionResult Get(string bolum)
        {
            var query = terimlerOperations.GetAllByCategoryName(bolum).OrderByDescending(x => x.Id);
            if (query == null)
            {
                return NotFound();
            }
            return new ObjectResult(query);
        }

        /* Id Degerine Göre Terim Getirme */
        [HttpGet("{id}", Name = "GetList")]
        public IActionResult Get(int id)
        {
            var query = terimlerOperations.GetById(id);
            if (query == null)
            {
                return NotFound();
            }
            return new ObjectResult(query);
        }

        /* Terim Post Islemi */
        [HttpPost]
        public void Post(Terimler terim)
        {
            terimlerOperations.AddModel(terim);
        }

    }
}