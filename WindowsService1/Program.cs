using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace WindowsService1
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main(string[] args)
        {
#if DEBUG
            StartAsConsole();
#else
            StartAsService();
#endif
        }

        private static void StartAsConsole()
        {
            Service1 service1 = new Service1();
            service1.StartService();
            Console.ReadKey();
            service1.StopService();
        }

        private static void StartAsService()
        {
            ServiceBase[] ServicesToRun = new ServiceBase[]
                        {
                new Service1()
                        };
            ServiceBase.Run(ServicesToRun);
        }
    }
}
