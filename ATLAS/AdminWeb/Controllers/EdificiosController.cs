using AdminWeb.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace AdminWeb.Controllers
{
    public class EdificiosController : Controller
    {
       private EdificiosDBContext db = new EdificiosDBContext();

        // GET: /Default1/
        public ActionResult Index()
        {
            return View(db.Edificios.ToList());
        }

        // GET: /Default1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Edificio edificio = db.Edificios.Find(id);
            if (edificio == null)
            {
                return HttpNotFound();
            }
            return View(edificio);
        }

        // GET: /Default1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Default1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,nombre,resistencia,ataque,foto")] Edificio edificio)
        {
            if (ModelState.IsValid)
            {
                db.Edificios.Add(edificio);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //tipoldi
            //TODO llamar a las funciones del command

            return View(edificio);
        }
         
        // GET: /Default1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Edificio edificio = db.Edificios.Find(id);
            if (edificio == null)
            {
                return HttpNotFound();
            }
            return View(edificio);
        }

        // POST: /Default1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,nombre,resistencia,ataque,foto")] Edificio edificio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(edificio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //tipoldi
            //TODO llamar a las funciones del command
            return View(edificio);
        }

        // GET: /Default1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Edificio edificio = db.Edificios.Find(id);
            if (edificio == null)
            {
                return HttpNotFound();
            }
            return View(edificio);
        }

        // POST: /Default1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Edificio edificio = db.Edificios.Find(id);
            db.Edificios.Remove(edificio);
            db.SaveChanges();

            //tipoldi
            //TODO llamar a las funciones del command
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
