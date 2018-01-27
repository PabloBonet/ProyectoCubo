using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaClases
{
    public class UtilClass
    {


        /// <summary>
        /// Escribe el mensaje pasado como parámetro en el archivo de log
        /// </summary>
        /// <param name="mensaje"> Mensaje a escribir en el log</param>
        /// <param name="archivoLog">ubicación del archivo de log</param>
        /// <param name="flujoEscritura">Flujo de escritura para el arhivo</param>
        public static void escribirArchivoLog(string mensaje, FileStream archivoLog, StreamWriter flujoEscritura,string strLog, bool conFecha = false)
        {
            bool r = false;
            if (archivoLog != null && flujoEscritura != null)
            {

                if (archivoLog.CanWrite)
                {

                }
                else
                {
                    archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    flujoEscritura = new StreamWriter(archivoLog);
                }

            }
            else
            {
                //Cargar Archivo de LOG

                if (!File.Exists(strLog)) //Si no existe el archivo, lo creo
                {

                    archivoLog = new FileStream(strLog, FileMode.OpenOrCreate);
                    archivoLog.Close();

                    archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    flujoEscritura = new StreamWriter(archivoLog);

                }
                else
                {

                    archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    flujoEscritura = new StreamWriter(archivoLog);

                }

            }

            

            if (archivoLog != null && flujoEscritura != null)
            {

                try
                {


                    //Escribo en el archivo
                    flujoEscritura.WriteLine(mensaje);
                    flujoEscritura.Flush();


                    archivoLog.Close();
                }
                catch (Exception e)
                {
                    Exception exep = new Exception("Error al intentar escribir en el archivo de log\n" + e.Message);
                    archivoLog.Close();
                    throw exep;

                }

            }

        }

        /// <summary>
        /// Cambia el formato del CUIT a un formato sin guiones
        /// </summary>
        /// <param name="cuit">CUIT con guiones</param>
        /// <returns>Retorna CUIT sin guiones</returns>
        public static string cambiarFormatoCuitSinGuinoes(string cuit)
        {
            string cuitSinGuiones = "";



            foreach (char c in cuit)
            {
                if (c != '-')
                {
                    cuitSinGuiones += c;
                }
            }


            return cuitSinGuiones;
        }

    }
}
