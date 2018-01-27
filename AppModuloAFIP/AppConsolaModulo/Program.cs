using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using ServicioAFIP;

namespace AppConsolaModulo
{
    class Program
    {
        static void Main(string[] args)
        {


            Uri servUri = new Uri("http://localhost:8000/");

            ServiceHost hospedaje = new ServiceHost(
               typeof(Servicio),
               servUri
               );



            try
            {

                hospedaje.Open();
                
                Console.WriteLine("Dirección: " + hospedaje.BaseAddresses[0]);
                Console.WriteLine("Enlace: " + hospedaje.Description.Endpoints[0].Binding.Name);

      


                Console.WriteLine("El servicio está en funcionamiento <Enter> = SALIR");

                Console.ReadLine();

                hospedaje.Close();


            }
            catch (CommunicationException comm)
            {
                Console.WriteLine("Ha ocurrido un problema " + comm.Message);
                Console.ReadLine();
            }





        }
    }
}
