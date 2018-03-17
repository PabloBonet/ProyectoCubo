using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace LibreriaClases
{
    public class GestionServicioClass
    {

        #region Parametros
        //Configuración

        // Valores por defecto, CONSTANTES

        const string DEFAULT_URLWSAAWSDL_PRUEBA = "https://wsaahomo.afip.gov.ar/ws/services/LoginCms?WSDL";
        const string DEFAULT_URLWSAAWSDL_PRODUCCION = "https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL";
        const string DEFAULT_SERVICIO = "wsfe";
        //  const string DEFAULT_CERTSIGNER_PRUEBA = "c:\\FE\\CERTIFICADOS\\aliascose.pfx"; //Certificado con clave privada
        const string DEFAULT_CERTSIGNER_PRUEBA = ""; //Certificado con clave privada
        //const string DEFAULT_CERTSIGNER_PRODUCCION = "c:\\FE\\CERTIFICADOS\\aliascose.pfx"; //Certificado con clave privada
        const string DEFAULT_CERTSIGNER_PRODUCCION = ""; //Certificado con clave privada
        const string DEFAULT_PROXY = null;
        const string DEFAULT_PROXY_USER = null;
        const string DEFAULT_PROXY_PASSWORD = null;
        const string DEFAULT_TA_PRU = "c:\\FE\\TA\\TicketAccesoPru.xml";
        const string DEFAULT_TA_PRO = "c:\\FE\\TA\\TicketAccesoPro.xml";
        const bool DEFAULT_VERBOSE = true;
        const string DEFAULT_CONFIGURACION = ".\\config.xml";
        const int DEFAULT_CANTIDAD_INTENTOS = 10;
        //const int DEFAULT_INTERVALO_LECTURA = 10000; //Tiempo de lectura de comprobantes pendientes de la base de datos (mS)
        const int DEFAULT_INTENTOS_OBTENER_TA = 10; //Cantidad de reintento de obtener el TA (mS)
        const int DEFAULT_INTERVALO_REINICIO = 60000; //Tiempo de reinicio en el caso de algún problema o que el autorizador no responda (mS), despues de X intentos
        //const string DEFAULT_PDFS_PRU = "c:\\WSFE\\FE\\PDFS";
        //const string DEFAULT_PDFS_PRO = "c:\\WSFE\\FE\\PDFSPRO";
        const int DEFAULT_VISIBLE_INICIO = 1;
        const int DEFAULT_INICIO_AUTOMATICO = 0;
        //const string DEFAULT_NOMBRE_EMPRESA = "ALSAFEX.SA";
        //const string DEFAULT_CUIT_EMPRESA = "30712443347";
        const int DEFAULT_MODO_PRODUCCION = 0;
        const string DEFAULT_LOG = ".\\log.txt";
        //const string DEFAULT_MAIL_SIN_ENVIAR = ".\\mail_sin_enviar.txt";
        const string DEFAULT_CONFIG = ".\\moduloFE.exe.config";
         
      

       



        //Propiedades

        public  string strUrlWsaaWsdl;                       //URL del servicio web de afip de autenticación
        public  string strIdServicioNegocio;                 //ID servicio

       

        public  string strRutaCertSignerPru;                 //Ubicación del certificado firmado de Prueba
        public  string strRutaCertSignerPro;                 //Ubicación del certificado firmado de Producción
        public SecureString strPasswordSecureString;       //Contraseña de seguridad
        public string strProxy;                          //Proxy de afip
        public string strProxyUser;                       //Usuario de Proxy
        public string strProxyPassword;                    //Contraseña de Proxy
        public string strTicketAccesoPru;                  //Ubicaicón del Ticket de acceso de Prueba
        public string strTicketAccesoPro;              //Ubicaicón del Ticket de acceso de Producción
        public bool blnVerboseMode;                         //Muestra información en modo cosola
        public string strConfiguracion;                     //Ubicación del archivo de configuración
        public int cantidadIntentosTA;                        //Cantidad de intentos de obtener TA
        public int cantidadIntentosAFIP;             //Cantidad de intentos de obtener respuesta afip

        // public int intervaloObtenerTA;                      //Intervalo de tiempo de reintento de obtener el TA (mS)
        // public int intervaloReinicio;                       //Intervalo de tiempo de reinicio en el caso de algún problema o que el autorizador no responda (mS), despues de X intentos
        public int visibleInicio;                           //Indica si tiene un inicio visible
        public string strEmpresa;                           //Nombre de la empresa que emite los comprobantes
        public string strCuit;                              //CUIT de la empresa que emite los comprobantes
        public int modoProduccion;                          //Indica si se trabaja en modo producción
        public string strLog;                               //Ubicación del archivo de LOG
        //public DispatcherTimer dispatcherTimer;             //Variable utilizada para controlar el temporizador de lectura
        //public DispatcherTimer dispatcherTimerObtenerTA;    //Variable utilizada para controlar el temporizador de obtención del TA
        //public DispatcherTimer dispatcherTimerReinicio;     //Variable utilizada para controlar el temporizador de reinicio 
       
        

        private string log;                               //LOG del sistema
       
        public bool errores;                                //Indica si hay errores
        public LoginTicket ticketAcceso;                    //Variable de Ticket de acceso
       // public DatosClass _accesoDatos;                     //Variable de acceso a datos
        //public FEClass _facturaElectronica;                 //Variable de factura electrónica
       
        private FileStream _archivoLog;                      //Variable para manejar el archivo de log
        private StreamWriter _flujoEscritura;                //Variable para manejar el flujo de escritura
        private bool _errorConfig = false;                   //Indica si hay error de configuración
        private bool _estadoIniciado = false;                  //Indica si se realizó la configuración y el servicio está listo para ser usado
        
        private FEClass _gestionFE = null;
        private List<string> _observaciones = new List<string>();    //lista de observaciones, utilizada principalmente para mostrar errores
        private int _ptoVta;
        /// <summary>
        /// Retorna el estadoListo del servicio, Si es True indica que el servicio está listo para ser usado y configurado correctamente
        /// </summary>
        public bool EstadoIniciado
        {
            get { return _estadoIniciado; }
        }

       

        public FileStream ArchivoLog
        {
            get { return _archivoLog; }
        }

        public StreamWriter FlujoEsctritura
        {
            get { return _flujoEscritura; }
        }

        public LoginTicket TicketAcceso
        {
            get { return ticketAcceso; }
        }

        public FEClass GestionFE
        {
            get { return _gestionFE; }
        }

        public List<string> Observaciones
        {
            get { return _observaciones; }
            set { _observaciones = value; }
        }

        public int PtoVta
        {
            get { return _ptoVta; }
        }
        #endregion

        public GestionServicioClass()
        {
          


            strIdServicioNegocio = DEFAULT_SERVICIO;

            //strPasswordSecureString = new SecureString();
            strProxy = DEFAULT_PROXY;
            strProxyUser = DEFAULT_PROXY_USER;
            strProxyPassword = DEFAULT_PROXY_PASSWORD;
            blnVerboseMode = DEFAULT_VERBOSE;
            strTicketAccesoPru = DEFAULT_TA_PRU;
            strTicketAccesoPro = DEFAULT_TA_PRO;
            strConfiguracion = DEFAULT_CONFIGURACION;
            cantidadIntentosTA = DEFAULT_INTENTOS_OBTENER_TA;
            cantidadIntentosAFIP = DEFAULT_CANTIDAD_INTENTOS;

           // intervaloObtenerTA = DEFAULT_INTERVALO_OBTENER_TA;
           // intervaloReinicio = DEFAULT_INTERVALO_REINICIO;
            visibleInicio = DEFAULT_VISIBLE_INICIO;

            modoProduccion = DEFAULT_MODO_PRODUCCION;
            strLog = DEFAULT_LOG;

         

            log = "";

            errores = false;

            ticketAcceso = null;

            _archivoLog = null;
            _flujoEscritura = null;
            bool produccion = false;
            _observaciones = new List<string>();
            _ptoVta = 0;
            if(modoProduccion == 1)
            {
                produccion = true;
            }
            else
            {
                produccion = false;
            }
          
        }



        #region Metodos

        /// <summary>
        /// Inicializa las variables de configuración
        /// </summary>
        /// <returns>Retorna True si se inicializó correctamente, False en otro caso</returns>
        public bool inicializar(int ptoVta)
        {
            bool r = false;



            try
            {
                strRutaCertSignerPro = DEFAULT_CERTSIGNER_PRODUCCION;
                strRutaCertSignerPru = DEFAULT_CERTSIGNER_PRUEBA;
                strPasswordSecureString = new SecureString();
                strProxy = DEFAULT_PROXY;
                strProxyUser = DEFAULT_PROXY_USER;
                strProxyPassword = DEFAULT_PROXY_PASSWORD;
                _ptoVta = ptoVta;
                cargarConfiguracion();
                if (modoProduccion == 1)
                {
                    strUrlWsaaWsdl = DEFAULT_URLWSAAWSDL_PRODUCCION;
                    _gestionFE = new FEClass(strCuit, ArchivoLog, FlujoEsctritura,strLog, true);
                    int intento = 1;
                    do
                    {
                        ticketAcceso =  _gestionFE.obtenerTicketAcceso(strTicketAccesoPro, strIdServicioNegocio, strUrlWsaaWsdl, strRutaCertSignerPro, strPasswordSecureString, strProxy, strProxyUser, strProxyPassword, _archivoLog, _flujoEscritura, false);
                        if (ticketAcceso != null)
                        {
                            string fecha_expiracion = ticketAcceso.ExpirationTime.ToString();

                            escribirLog("Ticket de Acceso obtenido, válido hasta: " + fecha_expiracion + "\n", true);


                        }
                        else
                        {
                            
                            escribirLog("No se pudo obtener el Ticket de acceso (Intento: "+intento+"\n", true);
                            intento++;
                        }

                    } while (intento < cantidadIntentosTA && ticketAcceso == null);

                    

                   if(ticketAcceso == null)
                    {
                        escribirLog("No se pudo obtener el Ticket de acceso (Intentos excedidos)\n", true);
                        return false;
                    }



                }
                else
                {
                    strUrlWsaaWsdl = DEFAULT_URLWSAAWSDL_PRUEBA;

                    _gestionFE = new FEClass(strCuit, ArchivoLog, FlujoEsctritura, strLog, false);




                    int intento = 1;
                    do
                    {
                        ticketAcceso = _gestionFE.obtenerTicketAcceso(strTicketAccesoPru, strIdServicioNegocio, strUrlWsaaWsdl, strRutaCertSignerPru, strPasswordSecureString, strProxy, strProxyUser, strProxyPassword, _archivoLog, _flujoEscritura, false);

                        if (ticketAcceso != null)
                        {
                            string fecha_expiracion = ticketAcceso.ExpirationTime.ToString();

                            escribirLog("Ticket de Acceso obtenido, válido hasta: " + fecha_expiracion + "\n", true);


                        }
                        else
                        {

                            escribirLog("No se pudo obtener el Ticket de acceso (Intento: " + intento + "\n", true);
                            intento++;
                        }

                    } while (intento < cantidadIntentosTA && ticketAcceso == null);



                    if (ticketAcceso == null)
                    {
                        escribirLog("No se pudo obtener el Ticket de acceso (Intentos excedidos)\n", true);
                        return false;
                    }
                }


              





            }
            catch(Exception excep)
            {
                string error = "Se produjo un error al cargar la configuración: " + excep.Message + "\n";
                log = log + error;

                escribirLog(log, true);
                _errorConfig = true;
            }

         
            if (_errorConfig)
            {
                r = false;
            }
            else
            {
                _estadoIniciado = true;
                r = true;
            }
            

            return r;
            

        }


        /// <summary>
        /// Carga el archivo de configuración con los valores definidos
        /// </summary>
        private void cargarConfiguracion()
        {


            try
            {

                //Cargar Archivo de LOG

                if (!File.Exists(strLog)) //Si no existe el archivo, lo creo
                {

                    _archivoLog = new FileStream(strLog, FileMode.OpenOrCreate);
                   _archivoLog.Close();

                    _archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    _flujoEscritura = new StreamWriter(_archivoLog);

                }
                else
                {
                    if(_archivoLog == null && _flujoEscritura == null)
                    {
                        _archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                        _flujoEscritura = new StreamWriter(_archivoLog);
                    }
                   

                }


                XmlDocument xmlConfig = new XmlDocument();


                xmlConfig.Load(DEFAULT_CONFIGURACION);


                //strUrlWsaaWsdl = xmlConfig.SelectSingleNode("//url_afip").InnerText;
                //strIdServicioNegocio = xmlConfig.SelectSingleNode("//servicio_afip").InnerText;

                strRutaCertSignerPro = xmlConfig.SelectSingleNode("//certificadoPro").InnerText;

                strRutaCertSignerPru = xmlConfig.SelectSingleNode("//certificadoPru").InnerText;


               
                visibleInicio = int.Parse(xmlConfig.SelectSingleNode("//visible_inicio").InnerText);
                strEmpresa = xmlConfig.SelectSingleNode("//nombre_empresa").InnerText;
                strCuit = xmlConfig.SelectSingleNode("//cuit_empresa").InnerText;
                modoProduccion = int.Parse(xmlConfig.SelectSingleNode("//modo_produccion").InnerText);
                strLog = xmlConfig.SelectSingleNode("//log").InnerText;
               
                
               


            }
            catch (Exception e)
            {
                string error = "Se produjo un error al cargar la configuración: " + e.Message + "\n";
                log = log + error;

                escribirLog(log, true);
                errores = true;
            }



        }

        public bool probarServicio()
        {
            bool r = false;

            if(modoProduccion == 1)
            {
               /* if(GestionFE.probarServicioPro(TicketAcceso, _ptoVta, 1))
                {
                    r = true;
                }
                else
                {
                    r = false;
                }*/
            }
            else
            {
                if(GestionFE.probarServicioPru(TicketAcceso, _ptoVta, 1)) //utiliza el pto de venta y un id comprobante = 1 (Factura A)
                {
                    r = true;
                }
                else
                {
                    r = false;
                }

            }


            return r;
        }

        /// <summary>
        /// Escribe la información de log en pantalla y en el archivo
        /// </summary>
        /// <param name="mensaje">Mensaje a escribir</param>
        /// <param name="conFecha">Información de fecha y hora del mensaje, por defecto es falso</param>
       /* public bool escribirLog(string mensaje, bool conFecha = false)
        {
            bool r = false;
            if (_archivoLog != null && _flujoEscritura != null)
            {

                if(_archivoLog.CanWrite)
                {
                    
                }
                else
                {
                    _archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    _flujoEscritura = new StreamWriter(_archivoLog);
                }
                              
            }
            else
            {
                //Cargar Archivo de LOG

                if (!File.Exists(strLog)) //Si no existe el archivo, lo creo
                {

                    _archivoLog = new FileStream(strLog, FileMode.OpenOrCreate);
                    _archivoLog.Close();

                    _archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    _flujoEscritura = new StreamWriter(_archivoLog);

                }
                else
                {

                    _archivoLog = new FileStream(strLog, FileMode.Append, FileAccess.Write);

                    _flujoEscritura = new StreamWriter(_archivoLog);

                }

            }


            try
            {
                string inf = "";
                if (conFecha)
                {
                    string fecha = DateTime.Now.ToString();

                    inf = inf + "[" + fecha + "] ";
                }

                inf = inf + mensaje+"\n";



                //Escribo en el archivo
                _observaciones.Add(inf);

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura);

                

                r = true;
            }
            catch (Exception e)
            {

                r = false;
            }
            return r;
        }*/


        public bool escribirLog(string mensaje, bool conFecha = false)
        {
            bool r = false;
            try
            {
                string inf = "";
                if (conFecha)
                {
                    string fecha = DateTime.Now.ToString();

                    inf = inf + "[" + fecha + "] ";
                }

                inf = inf + mensaje + "\n";



                //Escribo en el archivo
                _observaciones.Add(inf);

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura,strLog, conFecha);



                r = true;
            }
            catch (Exception e)
            {

                r = false;
            }
            return r;
        }

       
        #endregion















    }
}
