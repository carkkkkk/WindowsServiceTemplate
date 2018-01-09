using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace WindowsService1
{
    public partial class Service1 : ServiceBase
    {
        private const string LOG_SOURCE = "AppTest1";

        private System.Timers.Timer _serviceTimer = null;

        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            StartService();
        }

        protected override void OnStop()
        {
            StopService();
        }

        public void StartService()
        {
            _serviceTimer = new System.Timers.Timer(5000);
            _serviceTimer.Elapsed += _serviceTimer_Elapsed;
            _serviceTimer.Start();
        }

        public void StopService()
        {
            _serviceTimer.Stop();
            _serviceTimer = null;
        }

        private void _serviceTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            //if (!EventLog.SourceExists(LOG_SOURCE))
            //    EventLog.CreateEventSource(LOG_SOURCE, "Application");
            
            EventLog.WriteEntry(LOG_SOURCE,"Test", EventLogEntryType.Information);
        }
    }
}
