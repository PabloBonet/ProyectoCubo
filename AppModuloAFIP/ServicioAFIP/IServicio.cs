using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace ServicioAFIP
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IServicio
    {

        [OperationContract]
        //bool cargarComprobante(int ptoVta, int docTipoEmp, int nroDocEmp, int tipComp,int docTipoCli, int nroDocCli, string fechaComp, float impTot, float impNeto, float impOpEx, float impTrib, float impIva, string idMoneda, float cotMoneda);
        bool cargarComprobante(DatosEnvioComprobante compEnvio);

        [OperationContract]
        string autorizarComprobante(int id);

        #region GETs
        [OperationContract]
        int getPtoVtaComprobante();

        [OperationContract]
        int getTipoComprobante();

        [OperationContract]
        int getDocTipoEmpresaComprobante();

        [OperationContract]
        string getNroDocEmpresaComprobante();

        [OperationContract]
        int getDocTipoClienteComprobante();

        [OperationContract]
        string getNroDocClienteComprobante();

        [OperationContract]
        long getNroComprobante();

        [OperationContract]
        string getFechaComprobante();

        [OperationContract]
        float getImporteTotalComprobante();

        [OperationContract]
        float getImporteNetoComprobante();

        [OperationContract]
        float getImporteOpExComprobante();

        [OperationContract]
        float getImporteTributoComprobante();

        [OperationContract]
        float getImporteIvaComprobante();

        [OperationContract]
        string getIDMonedaComprobante();

        [OperationContract]
        float getCotizacionMonedaComprobante();

        [OperationContract]
        float getBaseImpAlicIvaComprobante(int idAlicuotaIva);

        [OperationContract]
        float getImporteAlicIvaComprobante(int idAlicuotaIva);

        [OperationContract]
        string getResultadoComprobante();

        [OperationContract]
        string getReprocesoComprobante();

        [OperationContract]
        string getFechaProcesoComprobante();

        [OperationContract]
        int getConceptoComprobante();

        [OperationContract]
        string getCAEComprobante();

        [OperationContract]
        string getFechaVtoCAEComprobante();

        [OperationContract]
        string getEmpresa();

        [OperationContract]
        List<string> getObservaciones();

        [OperationContract]
        string getObservacionI(int i);
        #endregion

        #region SETs

        [OperationContract]
        bool setIDComprobante(int idComp);

        [OperationContract]
        bool setPtoVtaComprobante(int PtoVta);

        [OperationContract]
        bool setTipoComprobante(int TipoComp);

        //[OperationContract]
        //int setDocTipoEmpresaComprobante(int DocTipoEmp);

      //  [OperationContract]
       // int setNroDocEmpresaComprobante(int NroDocEmp);

        [OperationContract]
        bool setDocTipoClienteComprobante(int docTipoCli);

        [OperationContract]
        bool setNroDocClienteComprobante(string nroDocCli);

        [OperationContract]
        bool setFechaComprobante(string fechaComp);

        [OperationContract]
        bool setImporteTotalComprobante(float impTotal);

        [OperationContract]
        bool setImporteNetoComprobante(float impNeto);

        [OperationContract]
        bool setImporteOpExComprobante(float impOpEx);

        [OperationContract]
        bool setImporteTributoComprobante(float impTributo);

        [OperationContract]
        bool setImporteIvaComprobante(float impIva);

        [OperationContract]
        bool setIDMonedaComprobante(string idMoneda);

        [OperationContract]
        bool setCotizacionMonedaComprobante(int cotizacionMon);

           
        [OperationContract]
        bool setConceptoComprobante(int concepto);


        [OperationContract]
        bool agregarAlicIva(int idAlic, float baseImp, float importe);

        [OperationContract]
        bool agregarTributo(int idTrib, float alicuota, float baseImponible, string descripcion, float importe);
        #endregion

        //[OperationContract]
        //string setEmpresa(string emp);

        [OperationContract]
        bool iniciarServicio(int ptoVta);

        [OperationContract]
        bool comprobanteCargado();

        [OperationContract]
        bool servicioIniciado();
        // TODO: agregue aquí sus operaciones de servicio
    }


    // Utilice un contrato de datos, para agregar tipos compuestos a las operaciones de servicio.
       [DataContract]
    public class DatosEnvioComprobante
    {
            private int _ptoVta = 0;
            private int _tipoComprobante = 0;
            private int _docTipoEmpresa = 0;
            private string _nroDocEmpresa = "";
            private int _docTipoCliente = 0;
            private string _nroDocCliente = "";
            private string _fechaComprobante = "";
            private float _importeTotal = 0;
            private float _importeNeto = 0;
            private float _importeOpEx = 0;
            private float _importeTrib = 0;
            private float _importeIva = 0;
            private string _idMoneda = "";
            private float _cotizacionMoneda = 0;


        [DataMember]
        /// <summary>
        /// Retorna y asigna el Punto de Venta
        /// </summary>

        public int PtoVta
        {
            get { return _ptoVta; }

            set { _ptoVta = value; }
        }

        [DataMember]
        /// <summary>
        /// Retorna y asigna el Tipo de Comprobante
        /// </summary>
        public int TipoComprobante
        {
            get { return _tipoComprobante; }
            set { _tipoComprobante = value; }
        }

        [DataMember]
        /// <summary>
        /// Retorna y asigna el Tipo de Documento de la Empresa
        /// </summary>
        public int DocTipoEmpresa
        {
            get { return _docTipoEmpresa; }
            set { _docTipoEmpresa = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Número de Documento de la Empresa
        /// </summary>
        public string NroDocEmpresa
        {
            get { return _nroDocEmpresa; }
            set { _nroDocEmpresa = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Tipo de Documento del Cliente
        /// </summary>
        public int DocTipoCliente
        {
            get { return _docTipoCliente; }
            set { _docTipoCliente = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Número de Documento del cliente
        /// </summary>
        
        public string NroDocCliente
        {
            get { return _nroDocCliente; }
            set { _nroDocCliente = value; }
        }


        [DataMember]
        /// <summary>
        /// Retorna y asigna la Fecha del Comprobante
        /// </summary>
        public string FechaComprobante
        {
            get { return _fechaComprobante; }
            set { _fechaComprobante = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Importe Total
        /// </summary>
        public float ImporteTotal
        {
            get { return _importeTotal; }
            set { _importeTotal = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Importe Neto
        /// </summary>
        public float ImporteNeto
        {
            get { return _importeNeto; }
            set { _importeNeto = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Importe Op. Ex.
        /// </summary>
        public float ImporteOpEx
        {
            get { return _importeOpEx; }
            set { _importeOpEx = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Importe del Tributo
        /// </summary>
        public float ImporteTributo
        {
            get { return _importeTrib; }
            set { _importeTrib = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el Importe Iva
        /// </summary>
        public float ImporteIva
        {
            get { return _importeIva; }
            set { _importeIva = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna el ID de la moneda utilizada
        /// </summary>
        public string IDMoneda
        {
            get { return _idMoneda; }
            set { _idMoneda = value; }
        }
        [DataMember]
        /// <summary>
        /// Retorna y asigna la cotización de la moneda
        /// </summary>
        public float CotizacionMoneda
        {
            get { return _cotizacionMoneda; }
            set { _cotizacionMoneda = value; }
        }
        
     
    }
}
