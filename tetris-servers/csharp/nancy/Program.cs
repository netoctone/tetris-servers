﻿namespace NancySelfHosting
{
    using System;
    using Nancy.Hosting.Self;

    using System.Diagnostics;

    class Program
    {
        static void Main()
        {
            var nancyHost = new NancyHost(new Uri("http://localhost:8888/"));
            nancyHost.Start();

            Console.WriteLine("Nancy now listening - navigating to http://localhost:8888/. Press enter to stop");
            Process.Start("http://localhost:8888/");
            Console.ReadKey();

            nancyHost.Stop();

            Console.WriteLine("Stopped. Good bye!");
        }
    }
}
