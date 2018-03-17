using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using LibreriaClases;
using System.ServiceModel.Activation;
using System.Web;
using ClienteLoginCms_CS.ar.gov.afip.wswhomo;

namespace ServicioAFIP
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Servicio : IServicio
    {
        
        private  static ComprobanteClass comprobante = new ComprobanteClass(); //Comprobante que se está manejando el servicio
        private  static bool error = false; //Indica si hay algún error
        private static GestionServicioClass gestion = new GestionServicioClass();   //objeto utilizado para gestionar el servicio
      
       


        /// <summary>
        /// Constructor del servicio
        /// </summary>
        public Servicio()
        {

           /* if(gestion.EstadoIniciado)
            {
                gestion.ArchivoLog.Close();
                //El servicio está configurador correctamente y listo para ser usado
            }
            else
            {

                //El servicio no está configurado correctamente
                string error = "El servicio no está iniciado correctamente\n";
                

                gestion.escribirLog(error, true);

                
                
            }
            */


            
          
        }

        /// <summary>
        /// Inicia el servicio estableciendo valores a las variables y cargando la configuración
        /// </summary>
        /// <returns>True si se inicia el servicio correctamente, False en otro caso (en este caso revisar la lista de observaciones)</returns>
        public bool iniciarServicio(int ptoVta)
        {
            comprobante = new ComprobanteClass();
            gestion = new GestionServicioClass();
            

            if (gestion.inicializar(ptoVta) && !gestion.errores)
            {

                //Prueba de servicio AFIP
                 if(gestion.probarServicio()) //Realiza una consulta al servicio para ver si está funcionnando correctamente
                {
                    error = false;
                }
                 else
                {
                    error = true;
                }
              
               

            }
            else
            {

                error = true;
            }

            return !error;
        }
/*
        /// <summary>
        /// Autoriza el comprobante cuyo id se le pasa como parámetro, el comprobante previamente debe estar cargado en el servicio.
        /// Una vez autorizado los valores retornados del servicio de afip quedan dentro del comprobante en este servicio
        /// </summary>
        /// <param name="idComprobante">Id del comprobante que se va a autorizar</param>
        /// <returns>True si se autoriza correctamente, False en otro caso (en este caso revisar la lista de observaciones)</returns>
        public bool autorizarComprobante(int idComprobante)
        {
            bool r = false;
            gestion.Observaciones = new List<string>(); //vacio la lista de observaciones

            if (gestion.EstadoIniciado)
            {
                if (gestion.TicketAcceso != null)
                { 
                    if(gestion.modoProduccion == 1)
                    {


                    }
                    else
                    {
                        try
                        {

                            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEResponse respuesta = null;
                            respuesta = gestion.GestionFE.autorizarComprobantePru(gestion.TicketAcceso, comprobante, idComprobante);

                            if (respuesta != null)
                            {
                                if(respuesta.FeCabResp != null && respuesta.FeDetResp != null)
                                {
                                    int respuestaPtoVta = respuesta.FeCabResp.PtoVta;
                                    int respuestaTipoCompro = respuesta.FeCabResp.CbteTipo;
                                    string respuestaFechaProceso = respuesta.FeCabResp.FchProceso;

                                    if (respuesta.FeCabResp.Resultado == "A")
                                    {

                                        //COMPROBANTE APROBADO
                                        FECAEDetResponse detalleRespuesta = respuesta.FeDetResp.First(); //Tomo siempre el primero, porque se manda de a un comprobante


                                        string respuestaCAE = detalleRespuesta.CAE;
                                        string respuestaFchaVtoCae = detalleRespuesta.CAEFchVto;
                                        long respuestaCbteDesde = detalleRespuesta.CbteDesde;
                                        string respuestaCbteFecha = detalleRespuesta.CbteFch;
                                        long respuestaCbteHasta = detalleRespuesta.CbteHasta;
                                        int respuestaConcepto = detalleRespuesta.Concepto;
                                        long respuestaDocNro = detalleRespuesta.DocNro;
                                        int respuestaDocTipo = detalleRespuesta.DocTipo;
                                        string respuestaResultado = detalleRespuesta.Resultado;
                                        ClienteLoginCms_CS.ar.gov.afip.wswhomo.Obs[] respuestaObservaciones = detalleRespuesta.Observaciones;

                                        string NumeroDocumentoCliente = respuestaDocNro.ToString();




                                        if (comprobante.TipoComprobante == respuestaTipoCompro && comprobante.DocTipoCliente == respuestaDocTipo && comprobante.NroDocCliente == NumeroDocumentoCliente)
                                        {
                                            // Se corresponde los tipos y numero de cliente con el comprobante

                                            comprobante.TipoComprobante = respuestaTipoCompro;
                                            comprobante.FechaProceso = respuestaFechaProceso;
                                            comprobante.CAE = respuestaCAE;
                                            comprobante.FechaVtoCAE = respuestaFchaVtoCae;

                                            if (respuestaCbteDesde == respuestaCbteHasta)
                                            {
                                                comprobante.NroComprobante = respuestaCbteDesde;
                                            }
                                            else
                                            {
                                                if (respuestaResultado == "A")
                                                {
                                                    Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". Fué autorizado pero no coinciden los números de comprobantes Desde y Hasta de la respuesta");
                                                    throw e;
                                                }
                                                else
                                                {
                                                    Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". El comprobante NO fué autorizado tampoco coinciden los números de comprobantes Desde y Hasta de la respuesta");
                                                    throw e;
                                                }
                                            }

                                            comprobante.FechaComprobante = respuestaCbteFecha;
                                            comprobante.Concepto = respuestaConcepto;
                                            comprobante.Resultado = respuestaResultado;



                                        }
                                        else
                                        {
                                            //No se corresponde los tipos y numero del cliente

                                            if (respuestaResultado == "A")
                                            {
                                                Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". Fué autorizado pero no se corresponden:\nTipo de doc, tipo de comprobante o núm. cliente");
                                                throw e;
                                            }
                                            else
                                            {
                                                Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". El comprobante NO fué autorizado tampoco se corresponden:\nTipo de doc, tipo de comprobante o núm. cliente");
                                                throw e;
                                            }


                                        }


                                        r = true;

                                    }
                                    else
                                    {
                                        //COMPROBANTE RECHAZADO, al mandarse uno solo se sabe que está rechazado, si se mandan mas de uno hay que revisar los resultados por aca uno. pudiendo ser RECHAZADO PARCIAL

                                    }



                                }
                                else
                                {
                                    if(respuesta.Errors != null)
                                    {
                                        foreach(Err error in respuesta.Errors)
                                        {
                                            gestion.escribirLog("[Cod: " + error.Code + "] " + error.Msg, true);
                                            r = false;
                                        }
                                    }
                                    else
                                    {
                                        gestion.escribirLog("Hubo un error al autorizar el comprobante. Se obtuvo una respuesta Nula", true);
                                        r = false;
                                    }
                                }
                               

                            
                               



                            }
                            else
                            {
                                gestion.escribirLog("Hubo un error al autorizar el comprobante. Se obtuvo una respuesta Nula", true);
                                r = false;
                            }
                            
                        }
                        catch (Exception e)
                        {
                            
                            //Escribo en el archivo
                            gestion.escribirLog("Hubo un error al autorizar el comprobante. "+e.Message, true);
                            
                            return false;

                        }
                    }
                    
                }
            }
            else
            {
                gestion.escribirLog("Hubo un error al autorizar el comprobante. El servicio no está iniciado", true);
                r = false;
            }

            return r;
        }
    */
        
        /// <summary>
        /// Autoriza el comprobante cuyo id se le pasa como parámetro, el comprobante previamente debe estar cargado en el servicio.
        /// Una vez autorizado los valores retornados del servicio de afip se retornan como una cadena de caracteres y quedan dentro del comprobante en este servicio
        /// </summary>
        /// <param name="idComprobante">Id del comprobante que se va a autorizar</param>
        /// <returns></returns>
        public string autorizarComprobante(int idComprobante)
        {
            string retorno = "";
            gestion.Observaciones = new List<string>(); //vacio la lista de observaciones

            if (gestion.EstadoIniciado)
            {
                if (gestion.TicketAcceso != null)
                {
                    if (gestion.modoProduccion == 1)
                    {


                    }
                    else
                    {
                        try
                        {

                            ClienteLoginCms_CS.ar.gov.afip.wswhomo.FECAEResponse respuesta = null;
                            respuesta = gestion.GestionFE.autorizarComprobantePru(gestion.TicketAcceso, comprobante, idComprobante);

                            if (respuesta != null)
                            {
                                if (respuesta.FeCabResp != null && respuesta.FeDetResp != null)
                                {
                                    int respuestaPtoVta = respuesta.FeCabResp.PtoVta;
                                    int respuestaTipoCompro = respuesta.FeCabResp.CbteTipo;
                                    string respuestaFechaProceso = respuesta.FeCabResp.FchProceso;

                                    if (respuesta.FeCabResp.Resultado == "A")
                                    {

                                        /*COMPROBANTE APROBADO*/
                                        FECAEDetResponse detalleRespuesta = respuesta.FeDetResp.First(); //Tomo siempre el primero, porque se manda de a un comprobante


                                        string respuestaCAE = detalleRespuesta.CAE;
                                        string respuestaFchaVtoCae = detalleRespuesta.CAEFchVto;
                                        long respuestaCbteDesde = detalleRespuesta.CbteDesde;
                                        string respuestaCbteFecha = detalleRespuesta.CbteFch;
                                        long respuestaCbteHasta = detalleRespuesta.CbteHasta;
                                        int respuestaConcepto = detalleRespuesta.Concepto;
                                        long respuestaDocNro = detalleRespuesta.DocNro;
                                        int respuestaDocTipo = detalleRespuesta.DocTipo;
                                        string respuestaResultado = detalleRespuesta.Resultado;
                                        ClienteLoginCms_CS.ar.gov.afip.wswhomo.Obs[] respuestaObservaciones = detalleRespuesta.Observaciones;

                                        string NumeroDocumentoCliente = respuestaDocNro.ToString();




                                        if (comprobante.TipoComprobante == respuestaTipoCompro && comprobante.DocTipoCliente == respuestaDocTipo && comprobante.NroDocCliente == NumeroDocumentoCliente)
                                        {
                                            // Se corresponde los tipos y numero de cliente con el comprobante

                                            comprobante.TipoComprobante = respuestaTipoCompro;
                                            comprobante.FechaProceso = respuestaFechaProceso;
                                            comprobante.CAE = respuestaCAE;
                                            comprobante.FechaVtoCAE = respuestaFchaVtoCae;

                                            if (respuestaCbteDesde == respuestaCbteHasta)
                                            {
                                                comprobante.NroComprobante = respuestaCbteDesde;
                                            }
                                            else
                                            {
                                                if (respuestaResultado == "A")
                                                {
                                                    Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". Fué autorizado pero no coinciden los números de comprobantes Desde y Hasta de la respuesta\n");
                                                    throw e;
                                                }
                                                else
                                                {
                                                    Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". El comprobante NO fué autorizado tampoco coinciden los números de comprobantes Desde y Hasta de la respuesta\n");
                                                    throw e;
                                                }
                                            }

                                            comprobante.FechaComprobante = respuestaCbteFecha;
                                            comprobante.Concepto = respuestaConcepto;
                                            comprobante.Resultado = respuestaResultado;

                                            string sPtovta = comprobante.PtoVta.ToString("D4");
                                            string sNumero = comprobante.NroComprobante.ToString("D8");
                                            string sCAE = comprobante.CAE;
                                            string sFechaVto = comprobante.FechaVtoCAE;

                                            gestion.escribirLog("Comprobante AUTORIZADO (ID "+comprobante.IDComprobante+"): " + sPtovta + " - " + sNumero + ". CAE: " + sCAE + "\n",true);


                                            //Formato Aprobado: RAAAANNNNNNNNCCCCCCCCCCCCCCFFFFFFFF
                                            retorno = "A" + sPtovta + sNumero + sCAE + sFechaVto;

                                        }
                                        else
                                        {
                                            //No se corresponde los tipos y numero del cliente

                                            if (respuestaResultado == "A")
                                            {
                                                Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". Fué autorizado pero no se corresponden:\nTipo de doc, tipo de comprobante o núm. cliente\n");
                                                throw e;
                                            }
                                            else
                                            {
                                                Exception e = new Exception("Hubo un error al autorizar el comprobante: " + respuestaPtoVta + " - " + respuestaCbteDesde + ". El comprobante NO fué autorizado tampoco se corresponden:\nTipo de doc, tipo de comprobante o núm. cliente\n");
                                                throw e;
                                            }


                                        }

                                        

                                    }
                                    else
                                    {
                                        /*COMPROBANTE RECHAZADO, al mandarse uno solo se sabe que está rechazado, si se mandan mas de uno hay que revisar los resultados por aca uno. pudiendo ser RECHAZADO PARCIAL*/

                                        comprobante.Resultado = "R";
                                        comprobante.NroComprobante = 0;
                                        comprobante.CAE = "";
                                        comprobante.FechaVtoCAE = "";
                                        string observaciones = "";
                                        if (respuesta.FeDetResp.First().Observaciones != null)
                                        {
                                            foreach (Obs observacion in respuesta.FeDetResp.First().Observaciones)
                                            {
                                                string mensaje = "[Cod: " + observacion.Code + "] " + observacion.Msg;
                                                gestion.escribirLog(mensaje, true);

                                                string sCodigo = observacion.Code.ToString();
                                                string sMensaje = observacion.Msg;

                                                


                                            
                                                observaciones = observaciones + "[" + sCodigo + "] " + sMensaje + "\n";
                                            }

                                            gestion.escribirLog("Comprobante RECHAZADO (ID " + comprobante.IDComprobante + ") \n"+observaciones+"\n", true);
                                            //Formato Rechazado: R[CCCCC]MENSAJE\n
                                            retorno = "R"+observaciones;
                                            
                                        }
                                        else
                                        {
                                            gestion.escribirLog("Hubo un error al autorizar el comprobante. No se pudieron obtener las observaciones", true);
                                            retorno = "RHubo un error al autorizar el comprobante. No se pudieron obtener obtener las observaciones\n";
                                        }

                                       
                                    }



                                }
                                else
                                {
                                    if (respuesta.Errors != null)
                                    {
                                        string errores = "";
                                        foreach (Err error in respuesta.Errors)
                                        {
                                            string mensaje = "[Cod: " + error.Code + "] " + error.Msg;
                                            gestion.escribirLog(mensaje, true);

                                            string sCodigo = error.Code.ToString();
                                            string sMensaje = error.Msg;
                                            //Formato Rechazado: R[CCCCC]MENSAJE\n
                                            errores = errores  + "[" + sCodigo +"] "+sMensaje+"\n";
                                        }


                                        gestion.escribirLog("Comprobante RECHAZADO (ID " + comprobante.IDComprobante + ") \n" + errores + "\n");

                                        retorno = errores;

                                    }
                                    else
                                    {
                                        gestion.escribirLog("Hubo un error al autorizar el comprobante. No se pudieron obtener los errores", true);
                                        retorno = "RHubo un error al autorizar el comprobante. No se pudieron obtener los errores\n";
                                    }
                                }







                            }
                            else
                            {
                                gestion.escribirLog("Hubo un error al autorizar el comprobante. Se obtuvo una respuesta Nula", true);
                                retorno = "RHubo un error al autorizar el comprobante. Se obtuvo una respuesta Nula\n";
                            }

                        }
                        catch (Exception e)
                        {

                            //Escribo en el archivo
                            gestion.escribirLog("Hubo un error al autorizar el comprobante. " + e.Message, true);

                            retorno = "RHubo un error al autorizar el comprobante. " + e.Message+"\n";

                        }
                    }

                }
            }
            else
            {
                gestion.escribirLog("Hubo un error al autorizar el comprobante. El servicio no está iniciado", true);
                retorno = "RHubo un error al autorizar el comprobante. El servicio no está iniciado\n";
            }

            return retorno;
        }

        /// <summary>
        /// Carga los datos del comprobante
        /// </summary>
        /// <param name="ptoVta"></param>
        /// <param name="tipComp"></param>
        /// <param name="docTipoCli"></param>
        /// <param name="nroDocCli"></param>
        /// <param name="fechaComp"></param>
        /// <param name="impTot"></param>
        /// <param name="impNeto"></param>
        /// <param name="impOpEx"></param>
        /// <param name="impTrib"></param>
        /// <param name="impIva"></param>
        /// <param name="idMoneda"></param>
        /// <param name="cotMoneda"></param>
        /// <returns></returns>
        /*public bool cargarComprobante(int ptoVta,int docTipoEmp,int nroDocEmp, int tipComp, int docTipoCli, int nroDocCli, string fechaComp, float impTot, float impNeto, float impOpEx, float impTrib, float impIva, string idMoneda, float cotMoneda)
        {
            bool r = false;
            try
            {
                 
                comprobante.PtoVta = ptoVta;
                comprobante.TipoComprobante = tipComp;
                comprobante.DocTipoEmpresa = docTipoEmp;
                comprobante.NroDocEmpresa = nroDocEmp;
                comprobante.DocTipoCliente = docTipoCli;
                comprobante.NroDocCliente = nroDocCli;
                comprobante.FechaComprobante = fechaComp;
                comprobante.ImporteTotal = impTot;
                comprobante.ImporteNeto = impNeto;
                comprobante.ImporteOpEx = impOpEx;
                comprobante.ImporteTributo = impTrib;
                comprobante.ImporteIva = impIva;
                comprobante.IDMoneda = idMoneda;
                comprobante.CotizacionMoneda = cotMoneda;

                comprobante.ListaIva = new List<AlicuotaIvaClass>();

                r = true;
            }
            catch(Exception e)
            {
                r = false;
                return r;
            }


            return r;
            

        }
        */


        ///<summary>
        ///Carga los datos del comprobante
        /// </summary>
        /// <returns>True si se cargó correctamente, False en otro caso (en este caso revisar la lista de observaciones)</returns>
        public bool cargarComprobante(DatosEnvioComprobante compEnvio)
        {
            gestion.Observaciones = new List<string>(); //vacio la lista de observaciones
            if (gestion.EstadoIniciado)
            {

            }
            else
            {
                return false;
            }
            bool r = false;
            try
            {

                comprobante.PtoVta = compEnvio.PtoVta;
                comprobante.TipoComprobante = compEnvio.TipoComprobante;
                comprobante.DocTipoEmpresa = compEnvio.DocTipoEmpresa;
                comprobante.NroDocEmpresa = compEnvio.NroDocEmpresa;
                comprobante.DocTipoCliente = compEnvio.DocTipoCliente;
                comprobante.NroDocCliente = compEnvio.NroDocCliente;
                comprobante.FechaComprobante = compEnvio.FechaComprobante;
                comprobante.ImporteTotal = compEnvio.ImporteTotal;
                comprobante.ImporteNeto = compEnvio.ImporteNeto;
                comprobante.ImporteOpEx = compEnvio.ImporteOpEx;
                comprobante.ImporteTributo = compEnvio.ImporteTributo;
                comprobante.ImporteIva = compEnvio.ImporteIva;
                comprobante.IDMoneda = compEnvio.IDMoneda;
                comprobante.CotizacionMoneda = compEnvio.CotizacionMoneda;

                comprobante.ListaIva = new List<AlicuotaIvaClass>();

                r = true;
            }
            catch (Exception e)
            {
                r = false;
                //Escribo en el archivo
                gestion.escribirLog(e.Message, true);
                return r;
            }


            return r;


        }


        #region GETs
        /// <summary>
        /// Retorna el ID del comprobante
        /// </summary>
        /// <returns>IDComproabante o -1 en caso de error</returns>
        public int getIDComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.IDComprobante;
            }
            else
            {
                return -1;
            }

        }
        /// <summary>
        /// Retorna la Alicuota Iva del comprobante que se corresponde con el ID pasado como parámetro
        /// </summary>
        /// <param name="idAlicuotaIva">ID Alicuota Iva</param>
        /// <returns>BaseImp para IDAlicuotaIva o -1 en caso de error</returns>
        public float getBaseImpAlicIvaComprobante(int idAlicuotaIva)
        {
            if (gestion.EstadoIniciado)
            {
                return (comprobante.ListaIva.Find(a => a.ID == idAlicuotaIva)).BaseImp;
            }
            else
            {
                return -1;
            }
            
        }

        /// <summary>
        /// Retorna el CAE del comprobante
        /// </summary>
        /// <returns>CAE comprobante o NULL en caso de error</returns>
        public string getCAEComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.CAE;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna el concepto del comprobante
        /// </summary>
        /// <returns>Concepto Comprobante o -1 en caso de error</returns>
        public int getConceptoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.Concepto;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna la Cotización de la Moneda del comprobante
        /// </summary>
        /// <returns>CotizacionMoneda  o -1 en caso de error</returns>
        public float getCotizacionMonedaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.CotizacionMoneda;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna el Tipo de Docuemento del Cliente en el comprobante
        /// </summary>
        /// <returns>DocTipoCliente o -1 en caso de error</returns>
        public int getDocTipoClienteComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.DocTipoCliente;
            }
            else
            {
                return -1;
            }
          
        }

        /// <summary>
        /// Retorna el Tipo de Documento de la Empresa emisora del comprobante
        /// </summary>
        /// <returns>DocTipoEmpresa o -1 en caso de error</returns>
        public int getDocTipoEmpresaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.DocTipoEmpresa;
            }
            else
            {
                return -1;
            }
            
        }

        /// <summary>
        /// Retorna la Empresa Emisora del comprobante
        /// </summary>
        /// <returns>strEmpresa o NULL en caso de error</returns>
        public string getEmpresa()
        {
            if (gestion.EstadoIniciado)
            {
                return gestion.strEmpresa;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna la Fecha de Emisión del comprobante
        /// </summary>
        /// <returns>FechaComprobante o NULL en caso de error</returns>
        public string getFechaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.FechaComprobante;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna la Fecha del Proceso del comprobante
        /// </summary>
        /// <returns>FechaProceso o NULL en caso de error</returns>
        public string getFechaProcesoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.FechaProceso;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna la Fecha de vencimiento del CAE del comprobante
        /// </summary>
        /// <returns>FechaVtoCAE o NULL en caso de error</returns>
        public string getFechaVtoCAEComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.FechaVtoCAE;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna el ID de la moneda del comprobante
        /// </summary>
        /// <returns>IDMoneda o NULL en caso de error</returns>
        public string getIDMonedaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.IDMoneda;
            }
            else
            {
                return null;
            }
           
        }

        /// <summary>
        /// Retorna el Importe de la Alicuota de Iva según el ID pasado como parámetro
        /// </summary>
        /// <param name="idAlicuotaIva">ID de Alicuota de IVA</param>
        /// <returns>Importe de alicuota iva o -1 en caso de error</returns>
        public float getImporteAlicIvaComprobante(int idAlicuotaIva)
        {
            if (gestion.EstadoIniciado)
            {
                return (comprobante.ListaIva.Find(a => a.ID == idAlicuotaIva)).Importe;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna el Importe de Iva del comprobante
        /// </summary>
        /// <returns>ImporteIva o NULL en caso de error</returns>
        public float getImporteIvaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.ImporteIva;
            }
            else
            {
                return -1;
            }
            
        }


        /// <summary>
        /// Retorna el Importe Neto del comprobante
        /// </summary>
        /// <returns>ImporteNeto o -1 en caso de error</returns>
        public float getImporteNetoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.ImporteNeto;
            }
            else
            {
                return -1;
            }
            
        }

        /// <summary>
        /// Retorna el Importe OpEx del comprobante
        /// </summary>
        /// <returns>ImporteOpEx o -1 en caso de error</returns>
        public float getImporteOpExComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.ImporteOpEx;
            }
            else
            {
                return -1;
            }
            
        }

        /// <summary>
        /// retorna el Importe Total del comprobante
        /// </summary>
        /// <returns>ImporteTotal o -1 en caso de error</returns>
        public float getImporteTotalComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.ImporteTotal;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna el Importe de Tributos del comprobante
        /// </summary>
        /// <returns>ImporteTributo o -1 en caso de error</returns>
        public float getImporteTributoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.ImporteTributo;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna el Número del comprobante
        /// </summary>
        /// <returns>NroComprobante o -1 en caso de error</returns>
        public long getNroComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.NroComprobante;
            }
            else
            {
                return -1;
            }
            
        }


        /// <summary>
        /// Retorna el Número de Documento del cliente
        /// </summary>
        /// <returns>NroDocCliente o  Null en caso de error</returns>
        public string getNroDocClienteComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.NroDocCliente;
            }
            else
            {
                return null;
            }
            
        }

        /// <summary>
        /// Retorna el Número de documento de la Empresa
        /// </summary>
        /// <returns>NroDocEmpresa o null en caso de error</returns>
        public string getNroDocEmpresaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.NroDocEmpresa;
            }
            else
            {
                return null;
            }
            
        }

        /// <summary>
        /// Retorna el Punto de Venta del comprobante
        /// </summary>
        /// <returns>PtoVta o -1 en caso de error</returns>
        public int getPtoVtaComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.PtoVta;
            }
            else
            {
                return -1;
            }

            
        }


        /// <summary>
        /// Retorna Reproceso del comprobante
        /// </summary>
        /// <returns>Reproceso o NULL en caso de error</returns>
        public string getReprocesoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.Reproceso;
            }
            else
            {
                return null;
            }
            
        }


        /// <summary>
        /// Retorna el Resultado del comprobante
        /// </summary>
        /// <returns>Resultado o NULL en caso de error</returns>
        public string getResultadoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.Resultado;
            }
            else
            {
                return null;
            }
            
        }

        /// <summary>
        /// Retorna el Tipo de Comprobante 
        /// </summary>
        /// <returns>TipoComproabante o NULL en caso de error</returns>
        public int getTipoComprobante()
        {
            if (gestion.EstadoIniciado)
            {
                return comprobante.TipoComprobante;
            }
            else
            {
                return -1;
            }
           
        }

        /// <summary>
        /// Retorna la lista de observaciones que contiene el servicio, esta lista es usada para obtener información sobre errores o advertencias
        /// </summary>
        /// <returns>Lista de Observaciones o NULL en caso de error</returns>
        public List<string> getObservaciones()
        {
            if (gestion.EstadoIniciado)
            {
                return gestion.Observaciones;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Retorna la cadena de obsercación en la posición de la lista ubicada en "indice"
        /// </summary>
        /// <param name="indice">Indice que indica posición de la lista que se va a retornar</param>
        /// <returns>Retorna obsercacion, null en otro caso</returns>
        public string getObservacionI(int indice)
        {
            string retorno = "";
            if(gestion.EstadoIniciado)
            {
                try
                {
                    retorno = gestion.Observaciones.ElementAt(indice);
                }
                catch(Exception e)
                {
                    return null;
                }
                
            }
            else
            {
                return null;
            }

            return retorno;
        }
        #endregion

        #region SETs

                /// <summary>
        /// Asigna el ID del comprobante. Reinicia todos los valores del comprobante, creando un comprobante vacio
        /// </summary>
        /// <param name="idComp">ID Comprobante</param>
        /// <returns>True si se asignó correctamente o False en caso de Error</returns>
        public bool setIDComprobante(int idComp)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante = new ComprobanteClass();
                comprobante.IDComprobante = idComp;
                return true;
            }
            else
            {
                return false;
            }

        }
        /// <summary>
        /// Asigna el PtoVta al Comprobante. Si el pto de vta se modifica respecto del que se estaba utilizando en el servicio, éste reiniciará toda la configuración; debiendose cargar los datos del comprobante nuevamente
        /// </summary>
        /// <param name="PtoVta">PtoVta</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setPtoVtaComprobante(int PtoVta)
        {
            if (gestion.EstadoIniciado)
            {
                if(gestion.PtoVta == PtoVta)
                {
                    comprobante.PtoVta = PtoVta;
                    return true;
                }
                else
                {
                    if(gestion.inicializar(PtoVta)) //Reinicio la configuración del servicio
                    {
                        comprobante.PtoVta = PtoVta;
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                
            }
            else
            {
                return false;
            }
            
        }


        /// <summary>
        /// Asgina el TipoComprobante 
        /// </summary>
        /// <param name="TipoComp">TipoComprobante</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setTipoComprobante(int TipoComp)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.TipoComprobante = TipoComp;
                return true;
            }
            else
            {
                return false;
            }
            
        }

        /// <summary>
        /// Asigna el Tipo de Documento del cliente del comprobante
        /// </summary>
        /// <param name="docTipoCli">TipoDocumento Cliente</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setDocTipoClienteComprobante(int docTipoCli)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.DocTipoCliente = docTipoCli;
                return true;
            }
            else
            {
                return false;
            }
            
        }

        /// <summary>
        /// Asigna el Número de Documento del Cliente del comprobante
        /// </summary>
        /// <param name="nroDocCli">NumeroDocumento Cliente</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setNroDocClienteComprobante(string nroDocCli)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.NroDocCliente = nroDocCli;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// Asigna la Fecha del comprobante
        /// </summary>
        /// <param name="fechaComp">FechaComprobante </param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setFechaComprobante(string fechaComp)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.FechaComprobante = fechaComp;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// Asigna el Importe Total del comprobante
        /// </summary>
        /// <param name="impTotal">ImporteTotal</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setImporteTotalComprobante(float impTotal)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.ImporteTotal = impTotal;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// Asigna el Importe Neto del comprobante
        /// </summary>
        /// <param name="impNeto">ImporteNeto</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setImporteNetoComprobante(float impNeto)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.ImporteNeto = impNeto;
                return true;
            }
            else
            {
                return false;
            }
            
        }

        /// <summary>
        /// Asigna el Importe OpEx del comprobante
        /// </summary>
        /// <param name="impOpEx">importeOpEx</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setImporteOpExComprobante(float impOpEx)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.ImporteOpEx = impOpEx;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// ASigna el importeTributo del comprobante
        /// </summary>
        /// <param name="impTributo">importeTributo</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setImporteTributoComprobante(float impTributo)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.ImporteTributo = impTributo;
                return true;
            }
            else
            {
                return false;
            }
            
        }

        /// <summary>
        /// Asigna el Importe Iva del comprobante
        /// </summary>
        /// <param name="impIva">ImporteIVA</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setImporteIvaComprobante(float impIva)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.ImporteIva = impIva;
                return true;
            }
            else
            {
                return false;
            }
            
        }

        /// <summary>
        /// Asigna el ID de la moneda del comprobante
        /// </summary>
        /// <param name="idMoneda">ID Moneda del comprobante</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setIDMonedaComprobante(string idMoneda)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.IDMoneda = idMoneda;
                return true;
            }
            else
            {
                return false;
            }
          
        }


        /// <summary>
        /// Asigna la Cotización de la moneda del comprobante
        /// </summary>
        /// <param name="cotizacionMon">CotizacionMoneda</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setCotizacionMonedaComprobante(int cotizacionMon)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.CotizacionMoneda = cotizacionMon;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// Asigna el Concepto del Comprobante
        /// </summary>
        /// <param name="concepto">Concepto Comprobante</param>
        /// <returns>True si se asignó correctamente o false en caso de error</returns>
        public bool setConceptoComprobante(int concepto)
        {
            if (gestion.EstadoIniciado)
            {
                comprobante.Concepto = concepto;
                return true;
            }
            else
            {
                return false;
            }
           
        }

        /// <summary>
        /// Agrega una alicuta de iva a la lista de impuestos de iva
        /// </summary>
        /// <param name="idAlic">ID de la alicuta del iva segun afip</param>
        /// <param name="baseImp">base imponible del impuesto</param>
        /// <param name="importe">Importe del impuesto</param>
        /// <returns></returns>
        public bool agregarAlicIva(int idAlic, float baseImp, float importe)
        {
            bool r = false;

            if(gestion.EstadoIniciado)
            {
                AlicuotaIvaClass alicuota = new AlicuotaIvaClass();
                alicuota.ID = idAlic;
                alicuota.BaseImp = baseImp;
                alicuota.Importe = importe;

                comprobante.addAlicuotaIva(alicuota);

                r = true;
            }
            else
            {
                return false;
            }


            return r;
        }

        /// <summary>
        /// Agrega un tributo a la lista de tributos del comprobante
        /// </summary>
        /// <param name="idTrib">ID del tributo segun el afip</param>
        /// <param name="alicuota">Alicuota del tributo</param>
        /// <param name="baseImponible">Base imponible del tributo</param>
        /// <param name="descripcion">Descripción del tributo</param>
        /// <param name="importe">Importe del tributo</param>
        /// <returns></returns>
        public bool agregarTributo(int idTrib, float alicuota, float baseImponible, string descripcion, float importe)
        {
            bool r = false;

            if(gestion.EstadoIniciado)
            {
                TributoComprobanteClass tributo = new TributoComprobanteClass();

                tributo.ID = idTrib;
                tributo.Alicuota = alicuota;
                tributo.BaseImponible = baseImponible;
                tributo.Descripcion = descripcion;
                tributo.Importe = importe;

                comprobante.addTributo(tributo);
                r = true;
            }
            else
            {
                return false;
            }


            return r;
        }

        /// <summary>
        /// Comprueba que el servicio tenga un comprobante cargado controlando el ID y el Nro de documento del cliente
        /// </summary>
        /// <returns>True si se cargó correctamente, false en otro caso</returns>
        public bool comprobanteCargado()
        {
            bool r = false;

            if (gestion.EstadoIniciado)
            {
                if (comprobante.IDComprobante > 0 && comprobante.NroDocCliente != "")
                {
                    r = true;
                }
            }
            else
            {
                return false;
            }

            return r;
        }

        /// <summary>
        /// Retorna True o False si el servicio está iniciado o no
        /// </summary>
        /// <returns>True, servicio Iniciado, False en otro caso</returns>
        public bool servicioIniciado()
        {
            bool r = false;


            r = gestion.EstadoIniciado;

            return r;
        }
        #endregion
    }
}
