using MVC_SMS.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Unity;
using Unity.AspNet.Mvc;

namespace MVC_SMS.App_Start
{
    public class Bootstrapper
    {
        public static IUnityContainer Initialize()
        {
            var container = BuildUnityContainer();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
            return container;
        }

        private static IUnityContainer BuildUnityContainer()
        {
            var container = new UnityContainer();
            container.RegisterType<IResumeRepository, ResumeRepository>();
            RegisterTypes(container);
            return container;
        }

        private static void RegisterTypes(IUnityContainer container)
        {
           
        }
    }
}