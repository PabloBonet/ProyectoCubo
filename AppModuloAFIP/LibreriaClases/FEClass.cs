using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using ClienteLoginCms_CS.ar.gov.afip.wswhomo;

namespace LibreriaClases
{
    public class FEClass
    {

        #region Propiedades

        private bool _produccion;                                                       //Indica si se trabaja en modo producción
        private ClienteLoginCms_CS.ar.gov.afip.wswhomo.Service _servicioPrueba;         //Variable de acceso al servicio de prueba
        private ClienteLoginCms_CS.ar.gov.afip.servicios1.Service _servicioProduccion;  //Variable de acceso al servicio de producción      
        private FileStream _archivoLog;                      //Variable para manejar el archivo de log
        private StreamWriter _flujoEscritura;                //Variable para manejar el flujo de escritura
        private string _cuitEmisor;
        private string _strLog;
        #endregion

        #region Constructor

        public FEClass(string cuitEmisor, FileStream archLog, StreamWriter flujoEsc,string strLog, bool produccion = false)
        {
            _cuitEmisor = cuitEmisor;
            _servicioPrueba = null;
            _servicioProduccion = null;
            _archivoLog = archLog;
            _flujoEscritura = flujoEsc;
            _strLog = strLog;

            _produccion = produccion;

            if (_produccion)
            {
                // SI es producción
                _servicioProduccion = new ClienteLoginCms_CS.ar.gov.afip.servicios1.Service();
                _servicioPrueba = null;
            }
            else
            {
                //NO es Producción
                _servicioPrueba = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.Service();
                _servicioProduccion = null;

            }


        }
        #endregion

        #region Metodos

        /// <summary>
        /// Obtiene el Ticket de Acceso
        ///     Si esta vigente lo otiene de la ubicación establecida
        ///     Si no esta vigente lo obtiene del Web Service de AFIP
        /// </summary>
        /// <param name="ubicacion_TA">Ubicación del archivo local</param>
        /// <param name="strIdServicioNegocio">servicio al que se desea acceder</param>
        /// <param name="strUrlWsaaWsdl">URL del WSAA</param>
        /// <param name="strRutaCertSigner">Ruta del certificado X509 (con clave privada) usado para firmar</param>
        /// <param name="strPasswordSecureString">Password del certificado X509 (con clave privada) usado para firmar</param>
        /// <param name="strProxy">IP:port del proxy</param>
        /// <param name="strProxyUser">Usuario del proxy</param>
        /// <param name="strProxyPassword">Password del proxy</param>
        /// <param name="blnVerboseMode">Nivel detallado de descripcion? true/false</param>
        /// <returns>Retorna el Ticket de Acceso en caso de error retorna Null</returns>
        public LoginTicket obtenerTicketAcceso(string ubicacion_TA, string strIdServicioNegocio, string strUrlWsaaWsdl, string strRutaCertSigner, SecureString strPasswordSecureString, string strProxy, string strProxyUser, string strProxyPassword, FileStream archivoLog, StreamWriter flujoEscritura, bool blnVerboseMode = false)
        {



            LoginTicket objTicketRespuesta = null;
            string strTicketRespuesta = null;
            bool pedirTA = true;
            //¿Hay que sincronizar las fechas?
            DateTime fechHoraActual = DateTime.Now;


            if (File.Exists(ubicacion_TA))
            {
                //Si existe, cargo el TA de la ubicación local
                try
                {
                    XmlDocument xmlTA = new XmlDocument();

                    xmlTA.Load(ubicacion_TA);

                    strTicketRespuesta = xmlTA.OuterXml;

                    objTicketRespuesta = new LoginTicket();

                    objTicketRespuesta.UniqueId = UInt32.Parse(xmlTA.SelectSingleNode("//uniqueId").InnerText);
                    objTicketRespuesta.GenerationTime = DateTime.Parse(xmlTA.SelectSingleNode("//generationTime").InnerText);
                    objTicketRespuesta.ExpirationTime = DateTime.Parse(xmlTA.SelectSingleNode("//expirationTime").InnerText);
                    objTicketRespuesta.Sign = xmlTA.SelectSingleNode("//sign").InnerText;
                    objTicketRespuesta.Token = xmlTA.SelectSingleNode("//token").InnerText;

                }
                catch (Exception excepcionAlCargarTicket)
                {
                    if (archivoLog != null && flujoEscritura != null)
                    {

                        try
                        {
                            string inf = "";

                            string fecha = DateTime.Now.ToString();

                            inf = inf + "[" + fecha + "] ";


                            inf = inf + excepcionAlCargarTicket.Message+"\n";

                            //Escribo en el archivo

                            UtilClass.escribirArchivoLog(inf, archivoLog, flujoEscritura,_strLog);

                        }
                        catch (Exception e)
                        {
                            return null;
                        }


                    }

                    return null;
                }

                //Compruebo si el ticket de acceso está vigente
                if (objTicketRespuesta.GenerationTime <= fechHoraActual && fechHoraActual < objTicketRespuesta.ExpirationTime)
                {
                    //El ticket está vigente, lo retorno
                    pedirTA = false;
                    return objTicketRespuesta;
                }
                else
                {
                    //Se debe obtener un nuevo Ticket de acceso
                    pedirTA = true;
                }

            }
            else
            {
                //No se encontró el ticket de acceso en la ubicación especificada, se debe obtener uno nuevo
                pedirTA = true;
            }



            try
            {
                //Obtener el Ticket de Acceso del Web Service
                if (pedirTA)
                {


                    objTicketRespuesta = new LoginTicket();

                    strTicketRespuesta = objTicketRespuesta.ObtenerLoginTicketResponse(strIdServicioNegocio, strUrlWsaaWsdl, strRutaCertSigner, strPasswordSecureString, strProxy, strProxyUser, strProxyPassword, blnVerboseMode);


                    //guardar Ticket

                    XmlDocument xmlTA = new XmlDocument();
                    xmlTA.LoadXml(strTicketRespuesta);

                    xmlTA.Save(ubicacion_TA);

                    return objTicketRespuesta;

                }


            }
            catch (XmlException e)
            {
                try
                {
                    string inf = "";

                    string fecha = DateTime.Now.ToString();

                    inf = inf + "[" + fecha + "] ";


                    inf = inf + "***EXCEPCION XML: " + e.Message;

                    //Escribo en el archivo

                    UtilClass.escribirArchivoLog(inf, archivoLog, flujoEscritura, _strLog);

                }
                catch (Exception ex)
                {
                    return null;
                }

                return null;
            }
            catch (Exception excepcionObtUltComprobante)
            {
                try
                {
                    string inf = "";

                    string fecha = DateTime.Now.ToString();

                    inf = inf + "[" + fecha + "] ";


                    inf = inf + "***EXCEPCION AL CARGAR TICKET: " + excepcionObtUltComprobante.Message;

                    //Escribo en el archivo

                    UtilClass.escribirArchivoLog(inf, archivoLog, flujoEscritura, _strLog);

                }
                catch (Exception ex)
                {
                    return null;
                }


                return null;
            }


            return objTicketRespuesta;
        }


        /// <summary>
        /// Autoriza el comprobante de PRUEBA pasado como parametro con el Ticket de Acceso, el IdComprobante es para asegurar de que sea el comprobante que se pasa
        /// </summary>
        /// <param name="ticketAcceso">Ticket de Acceso utilizado para acceder a los servicios del AFIP</param>
        /// <param name="comprobante">Comprobante a Autorizar</param>
        /// <param name="idComprobante">ID del comprobante a autorizar</param>
        /// <returns>FECAEResponse si se autorizó correctamente, NULL en otro caso</returns>
        public  ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEResponse autorizarComprobantePru(LoginTicket ticketAcceso, ComprobanteClass comprobante ,int idComprobante)
        {
            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEResponse respuesta = null;

            if (ticketAcceso != null && idComprobante > 0 && comprobante.IDComprobante  != 0)
            {
           
                if(comprobante.IDComprobante == idComprobante)
                {
                    if (comprobante.CAE != "")
                    {
                        string inf = "";

                        string fecha = DateTime.Now.ToString();

                        inf = inf + "[" + fecha + "] ";


                        inf = inf + "Error al autorizar el comprobante por ID. El comprobante ya está autorizado con CAE: "+comprobante.CAE+"\n";

                        //Escribo en el archivo

                        UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                        return null;
                    }
                    else
                    {
                        try
                        {
                            //Asigno los valores de autorización: CUIT, SIGN y Token
                            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FEAuthRequest autorizacionPru = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.FEAuthRequest();

                            string cuit = UtilClass.cambiarFormatoCuitSinGuinoes(_cuitEmisor);
                            long cuitLong = 0;
                            if (long.TryParse(cuit, out cuitLong))
                            {
                                autorizacionPru.Cuit = cuitLong;
                                autorizacionPru.Sign = ticketAcceso.Sign;
                                autorizacionPru.Token = ticketAcceso.Token;
                            }
                            else
                            {
                                Exception errorExc = new Exception("No se pudo convertir el cuit a Long");
                                throw errorExc;
                            }



                            /*** Armar RequerimientoAutorización*/

                            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAERequest reqAut = armarRequerimientoAutorizacionPru(autorizacionPru, comprobante);




                            if (!_produccion)
                            {



                                if (comprobante.CAE == "" && comprobante.FechaVtoCAE == "" && comprobante.NroComprobante == 0)
                                {
                                    //Autorizar
                                    respuesta = _servicioPrueba.FECAESolicitar(autorizacionPru, reqAut);
                                }
                                else
                                {
                                    // Ya está autorizado
                                    Exception errorExc = new Exception("El comprobante ya se encuentra Autorizado");
                                    throw errorExc;
                                }





                            }

                            /*
                             * Guardar en carpeta no lo utilizamos por ahora
                             * */

                            #region Guardar en carpeta
                            /*
                            if (respuesta != null)
                            {

                                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAECabResponse cabeceraRespuesta = respuesta.FeCabResp;
                                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetResponse detalleRespuesta = respuesta.FeDetResp.First();



                                string codSocio = "" + comprobante.cod_socio;
                                codSocio = codSocio.PadLeft(5, '0');

                                string puntoVenta = "" + cabeceraRespuesta.PtoVta;
                                puntoVenta = puntoVenta.PadLeft(4, '0');

                                string numComprobante = "" + detalleRespuesta.CbteDesde;
                                numComprobante = numComprobante.PadLeft(8, '0');

                                string identifReg = "" + comprobante.idregistro;
                                identifReg = identifReg.PadLeft(5, '0');



                                if (detalleRespuesta.Resultado != "A")
                                {
                                    puntoVenta = "0000";
                                    numComprobante = "00000000";
                                }




                                nombreCarpeta = "\\CLIENTE_" + codSocio + "_" + comp + "_" + puntoVenta + "_" + numComprobante + "_id_" + identifReg;


                                //Creo Carpeta si no existe

                                if (!Directory.Exists(_strpdfs + nombreCarpeta))
                                {
                                    Directory.CreateDirectory(_strpdfs + nombreCarpeta);
                                }

                                //Guardo el REQUEST.xml del comprobante

                                string strArchivoReq = _strpdfs + nombreCarpeta + "\\REQUEST.xml";



                                // FileStream archivoReq = new FileStream(strArchivoReq, FileMode.OpenOrCreate, FileAccess.Write);

                                // StreamWriter flujoEscritura = new StreamWriter(archivoReq);


                                XmlDocument xmlReq = new XmlDocument();

                                //string strReqCae = reqCae.ToString(); //¿FUNCIONA?
                                string strReqCae = UtilClass.convertirAXML(reqCae);
                                xmlReq.LoadXml(strReqCae);

                                xmlReq.Save(strArchivoReq);

                                //Guardo RESPONSE.xml del comprobante

                                string strArchivoRes = _strpdfs + nombreCarpeta + "\\RESPONSE.xml";

                                XmlDocument xmlRes = new XmlDocument();

                                //string strResCae = respuesta.ToString(); //¿FUNCIONA?
                                string strResCae = UtilClass.convertirAXML(respuesta);
                                xmlRes.LoadXml(strResCae);

                                xmlRes.Save(strArchivoRes);


                                //}
                                //}
                            }
                            */

                            #endregion
                        }
                        catch (Exception e)
                        {
                            string inf = "";

                            string fecha = DateTime.Now.ToString();

                            inf = inf + "[" + fecha + "] ";


                            inf = inf + "Error al autorizar el comprobante por ID. " + e.Message + "\n";

                            //Escribo en el archivo

                            UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                            return null;
                        }
                    }

                    

                    
                }
                else
                {
                   

                    string inf = "";

                    string fecha = DateTime.Now.ToString();

                    inf = inf + "[" + fecha + "] ";


                    inf = inf + "Error al autorizar el comprobante por ID. El ID del comprobante no se corresponde con el que se desea autorizar\n";

                    //Escribo en el archivo

                    UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                    return null;
                }
            }
            else
            {
                
                string inf = "";

                string fecha = DateTime.Now.ToString();

                inf = inf + "[" + fecha + "] ";



                inf = inf + "Error al autorizar el comprobante por ID. El ticket de acceso es NULL o idComprobante <= 0\n";

                //Escribo en el archivo

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                return null;
            }

            return respuesta;
        }


        /// <summary>
        /// Prueba el servicio de de Prueba de AFIP
        /// </summary>
        /// <param name="ticketAcceso">Ticket de Acceso de prueba</param>
        /// <param name="ptoVta">Pto de Vta que se utiliza</param>
        /// <param name="tipoComp">Tipo de comprobante a probar</param>
        /// <returns>True si se probó el servicio y funciona correctamente, False en otro caso</returns>
        public bool probarServicioPru(LoginTicket ticketAcceso, int ptoVta, int tipoComp)
        {
            bool r = false;

            if (ticketAcceso != null)
            {

                
                    try
                    {
                        //Asigno los valores de autorización: CUIT, SIGN y Token
                        ClienteLoginCms_CS.ar.gov.afip.wswhomo.FEAuthRequest autorizacionPru = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.FEAuthRequest();

                        string cuit = UtilClass.cambiarFormatoCuitSinGuinoes(_cuitEmisor);
                        long cuitLong = 0;
                        if (long.TryParse(cuit, out cuitLong))
                        {
                            autorizacionPru.Cuit = cuitLong;
                            autorizacionPru.Sign = ticketAcceso.Sign;
                            autorizacionPru.Token = ticketAcceso.Token;
                        }
                        else
                        {
                            Exception errorExc = new Exception("No se pudo convertir el cuit a Long");
                            throw errorExc;
                        }


                        
                        if (!_produccion)
                        {

                            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FERecuperaLastCbteResponse respuestaUltAut = null;
                            respuestaUltAut = _servicioPrueba.FECompUltimoAutorizado(autorizacionPru, ptoVta,tipoComp);

                            

                            if (respuestaUltAut != null)
                            {
                               
                                if(respuestaUltAut.CbteNro >= 0)
                                {
                                     r = true;
                                }
                                else
                                {
                                    Exception errorExc = new Exception("El número del último comprobante es negativo\n");
                                    throw errorExc;
                                }
                            }
                            else
                            {
                               
                                Exception errorExc = new Exception("No se pudo obtener el ultimo comprobante autorizado\n");
                                throw errorExc;
                            }





                        }

                      
                    }
                    catch (Exception e)
                    {
                        string inf = "";

                        string fecha = DateTime.Now.ToString();

                        inf = inf + "[" + fecha + "] ";


                        inf = inf + "Error al probar el servicio de AFIP. " + e.Message + "\n";

                        //Escribo en el archivo

                        UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                        return false;
                    }


               
            }
            else
            {

                string inf = "";

                string fecha = DateTime.Now.ToString();

                inf = inf + "[" + fecha + "] ";


                inf = inf + "Error al probar el servicio. El ticket de acceso es NULL\n";

                //Escribo en el archivo

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                return false;
            }

            return r;
        }

        /// <summary>
        /// Arma el requerimiento para obtener el CAE con el servicio de Prueba
        /// </summary>
        /// <param name="autorizacion">Autorización</param>
        /// <param name="comprobante">Comprobante a autorizar</param>
        /// <returns>Retorna el Requerimiento, Null en caso de Error</returns>
        private ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAERequest armarRequerimientoAutorizacionPru(ClienteLoginCms_CS.ar.gov.afip.wswhomo.FEAuthRequest autorizacion, ComprobanteClass comprobante)
        {
            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAERequest reqAut = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAERequest();
            try
            {
                int tipoComprobante = comprobante.TipoComprobante;
                int puntoVenta = comprobante.PtoVta;
                string cuit = comprobante.NroDocCliente;

               

                /*** Cabecera de la solicitud del comprobante ***/
                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAECabRequest cabreq = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAECabRequest();
                int cantidadReg = 1; //Siempre se autoriza de a 1 elemento
                cabreq.CantReg = cantidadReg;

                cabreq.CbteTipo = tipoComprobante;
                cabreq.PtoVta = puntoVenta;

                reqAut.FeCabReq = cabreq;


                //OBTENGO EL NUMERO DEL ULTIMO COMPROBANTE REGISTRADO
                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FERecuperaLastCbteResponse ultComprobante = null;
                ultComprobante = obtenerUltimoComprobanteRegistradoPru(autorizacion, puntoVenta, tipoComprobante);

                if (ultComprobante == null)
                {
                    Exception e = new Exception("No se pudo obtener el último comprobante");

                    throw e;
                }
                int numUltComp = ultComprobante.CbteNro;
                int cbteTipoUltComp = ultComprobante.CbteTipo;








                /*** Detalle de la solicitud del comprobante ***/
                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetRequest detReq = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetRequest();


                detReq.Concepto = 1; //1: Productos
                long v_docNro = 0;

                if(comprobante.DocTipoCliente == 80)
                {
                    string cuitSinGuiones = UtilClass.cambiarFormatoCuitSinGuinoes(comprobante.NroDocCliente);
                    long.TryParse(cuitSinGuiones, out v_docNro);
                }
                else
                {
                    Exception e = new Exception("El tipo de documento del cliente no es CUIT (80). ");

                    throw e;
                }
               
                detReq.DocNro = v_docNro; //Nro documento
                detReq.DocTipo = 80; //CUIT: documento tipo 80

                detReq.CbteDesde = numUltComp + 1; //Numero de ultimo comprobante + 1
                detReq.CbteHasta = numUltComp + 1; //Numero de ultimo comprobante + 1

                detReq.CbteFch = comprobante.FechaComprobante;


                detReq.ImpTotal = comprobante.ImporteTotal;
                detReq.ImpTotal = Math.Round(detReq.ImpTotal, 2);


                detReq.ImpNeto = comprobante.ImporteNeto;
                detReq.ImpNeto = Math.Round(detReq.ImpNeto, 2);

                double compImpIvaTot = comprobante.ImporteIva; // importe total del iva
                compImpIvaTot = Math.Round(compImpIvaTot, 2);


                detReq.ImpOpEx = 0;
                detReq.ImpTotConc = 0;
                if (compImpIvaTot == 0)
                {
                    double compImpTotConc = comprobante.ImporteNeto;
                    //detReq.ImpTotConc = comprobante.imp_neto;
                    detReq.ImpTotConc = Math.Round(compImpTotConc, 2);
                    detReq.ImpOpEx = 0;
                    detReq.ImpNeto = 0;
                }
                else
                {
                    detReq.ImpIVA = compImpIvaTot;
                }

                //detReq.ImpTrib = 0;


                detReq.FchServDesde = "";
                detReq.FchServHasta = "";
                detReq.FchVtoPago = "";

                detReq.MonId = comprobante.IDMoneda;
                /*if (detReq.MonId == "PES")
                {
                    detReq.MonCotiz = 1;
                }
                */

                detReq.MonCotiz = comprobante.CotizacionMoneda;

                detReq.ImpTrib = comprobante.ImporteTributo;

                if (detReq.ImpTrib > 0)
                {
                        List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo> listaTributo = new List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo>();
                    ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo tributo = null;
                    foreach (TributoComprobanteClass t in comprobante.ListaTributos)
                    {
                        tributo = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo();

                        tributo.Id = 0;
                        tributo.Alic = 0;
                        tributo.BaseImp = 0;
                        tributo.Desc = "";
                        tributo.Importe = 0;

                        tributo.Id = (short)t.ID;
                        tributo.Alic = t.Alicuota;
                        tributo.BaseImp = t.BaseImponible;
                        tributo.Desc = t.Descripcion;
                        tributo.Importe = t.Importe;

                        if (tributo.Id > 0 && tributo.BaseImp > 0 && tributo.Importe > 0)
                        {
                            listaTributo.Add(tributo);
                        }
                        else
                        {
                            Exception e = new Exception("Los valores de los tributos son incorrectos");
                            throw e;
                        }



                    }

                    ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo[] arrayTributos = listaTributo.ToArray();

                
                        detReq.Tributos = arrayTributos;
                        detReq.ImpTrib = detReq.ImpTrib;
               }



                /*
                List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo> listTributo = new List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo>();
                double importeTotalTributos = 0;
                if (comprobante.imp_recar > 0)
                {
                    ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo trib = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo();
                    trib.Alic = 0;
                    trib.BaseImp = Math.Round(comprobante.imp_neto, 2);
                    trib.Desc = "INGRESOS BRUTOS DE LA PROVINCIA DE SANTA FE";
                    trib.Id = 2; //IMPUESTO PROVINCIAL
                    trib.Importe = Math.Round(comprobante., 2);
                    importeTotalTributos += trib.Importe;
                    importeTotalTributos = Math.Round(importeTotalTributos, 2);
                    listTributo.Add(trib);
                }


                ClienteLoginCms_CS.ar.gov.afip.wswhomo.Tributo[] arrayTributos = listTributo.ToArray();

                if (importeTotalTributos > 0)
                {
                    detReq.Tributos = arrayTributos;
                    detReq.ImpTrib = importeTotalTributos;
                }

                */

                if (detReq.ImpIVA > 0)
                {

                    List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva> listIva = new List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva>();

                    ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva aiva = null;
                    foreach (AlicuotaIvaClass a in comprobante.ListaIva)
                    {
                        aiva = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva();
                        aiva.Id = 0;
                        aiva.BaseImp = 0;
                        aiva.Importe = 0;

                        aiva.Id = a.ID;
                        aiva.BaseImp = Math.Round(a.BaseImp, 2);    //CONTROLAR SI ESTO ESTÁ BIEN, COMPARANDOLO CON EL MODULO DEL AFIP HECHO
                        aiva.Importe = Math.Round(a.Importe, 2);


                        if (aiva.Id > 0 && aiva.BaseImp > 0 && aiva.Importe > 0)
                        {
                            listIva.Add(aiva);
                        }
                        else
                        {
                            Exception e = new Exception("La alicuota de iva tiene un valor Incorrecto");
                            throw e;
                        }



                    }

                    /*IVA 21*/

                    /* ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva aiva = new ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva();
                     if (comprobante.t_iva_g == 21)
                     {

                         aiva.Id = 5;
                         aiva.BaseImp = 0;
                         aiva.Importe = 0;

                         aiva.BaseImp = Math.Round(comprobante.imp_neto, 2);
                         aiva.Importe = compImpIvaTot;

                         if (aiva.BaseImp > 0)
                         {
                             listIva.Add(aiva);
                         }

                     }
                     */





                    /*IVA 10,5*/


                    /* if (comprobante.t_iva_g == 10.5)
                     {
                         aiva.Id = 4;
                         aiva.BaseImp = 0;
                         aiva.Importe = 0;

                         aiva.BaseImp = Math.Round(comprobante.imp_neto, 2);
                         aiva.Importe = compImpIvaTot;
                         if (aiva.BaseImp > 0)
                         {
                             listIva.Add(aiva);
                         }
                     }
                     */

                    /*IVA 0*/


                    /*if (comprobante.t_iva_g == 0)
                    {
                        aiva.Id = 3;
                        aiva.BaseImp = 0;
                        aiva.Importe = 0;

                        aiva.BaseImp = Math.Round(comprobante.imp_neto, 2);
                        aiva.Importe = compImpIvaTot;
                        if (aiva.BaseImp > 0)
                        {
                            listIva.Add(aiva);
                        }

                    }
                    */


                    ClienteLoginCms_CS.ar.gov.afip.wswhomo.AlicIva[] arrayIva = listIva.ToArray();
                    detReq.Iva = arrayIva;
                    //  Array.Copy(arrayIva, detReq.Iva, listIva.Count());



                  

                    
                }

                List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetRequest> listaDetalle = new List<ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetRequest>();

                listaDetalle.Add(detReq);
                ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEDetRequest[] arrayDetalle = listaDetalle.ToArray();
                reqAut.FeDetReq = arrayDetalle;
                // Array.Copy(arrayDetalle, reqCae.FeDetReq, listaDetalle.Count());


            }
            catch (Exception e)
            {
                string inf = "";

                string fecha = DateTime.Now.ToString();

                inf = inf + "[" + fecha + "] ";


                inf = inf + "Error al armar el requerimiento de autorización. " + e.Message + "\n";

                //Escribo en el archivo

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                return null;
            }




            return reqAut;
        }

        /// <summary>
        /// Obtiene el ultimo comprobante registrado en modo PRUEBA
        /// </summary>
        /// <param name="autorizacion">Autorización para acceder al servicio del AFIP</param>
        /// <param name="puntoVenta">Punto de venta de facturación</param>
        /// <param name="tipoComprobante">Tipo de comprobante</param>
        /// <returns>FEReCuperaLastCbteResponse, NULL en caso de error</returns>
        private FERecuperaLastCbteResponse obtenerUltimoComprobanteRegistradoPru(FEAuthRequest autorizacion, int puntoVenta, int tipoComprobante)
        {
            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FERecuperaLastCbteResponse ultimoComprobante = null;

            try
            {
                                
                if (!_produccion)
                {
                    ultimoComprobante = _servicioPrueba.FECompUltimoAutorizado(autorizacion, puntoVenta, tipoComprobante);
                }

                               
            }
            catch (Exception excepcionObtUltComprobante)
            {
                 string inf = "";

                string fecha = DateTime.Now.ToString();

                inf = inf + "[" + fecha + "] ";


                inf = inf + "***EXCEPCION AL OBTENER EL ÚLTIMO COMPROBANTE: " + excepcionObtUltComprobante.Message + "\n";

                //Escribo en el archivo

                UtilClass.escribirArchivoLog(inf, _archivoLog, _flujoEscritura, _strLog);
                return null;
            }
            



            return ultimoComprobante;
        }

        #endregion




    }
}
