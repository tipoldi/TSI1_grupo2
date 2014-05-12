using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AdminWeb.Models;

namespace AdminWeb.Controllers
{
    public class UnidadesController : Controller
    {
        private UnidadesDBContext db = new UnidadesDBContext();

        // GET: /Unidades/
        public ActionResult Index()
        {
            return View(db.Unidades.ToList());
        }

        // GET: /Unidades/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Unidades unidades = db.Unidades.Find(id);
            if (unidades == null)
            {
                return HttpNotFound();
            }
            return View(unidades);
        }

        // GET: /Unidades/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Unidades/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,nombre,resistencia,ataque,foto,movilidad")] Unidades unidades, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Unidades.Add(unidades);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(unidades);
        }

        // GET: /Unidades/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Unidades unidades = db.Unidades.Find(id);
            if (unidades == null)
            {
                return HttpNotFound();
            }
            return View(unidades);
        }

        // POST: /Unidades/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,nombre,resistencia,ataque,foto,movilidad")] Unidades unidades)
        {
            if (ModelState.IsValid)
            {
                db.Entry(unidades).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(unidades);
        }

        // GET: /Unidades/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Unidades unidades = db.Unidades.Find(id);
            if (unidades == null)
            {
                return HttpNotFound();
            }
            return View(unidades);
        }

        // POST: /Unidades/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Unidades unidades = db.Unidades.Find(id);
            db.Unidades.Remove(unidades);
            db.SaveChanges();
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
