using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaClases
{
    public class ComprobanteClass
    {

        #region Propiedades
        private int _idComprobante;
        private int _ptoVta;
        private int _tipoComprobante;
        private int _docTipoEmpresa;
        private string _nroDocEmpresa;
        private int _docTipoCliente;
        private string _nroDocCliente;
        private long _nroComprobante;
        private string _fechaComprobante;
        private float _importeTotal;
        private float _importeNeto;
        private float _importeOpEx;
        private float _importeTrib;
        private float _importeIva;
        private string _idMoneda;
        private float _cotizacionMoneda;
        private List<AlicuotaIvaClass> _listaIva;
        private List<TributoComprobanteClass> _listaTributos;
        private string _resultado;
        private string _reproceso;
        private string _fechaProceso;
        private int _concepto;
        private string _cae;
        private string _fechaVtoCae;

        /// <summary>
        /// Retorna y asigna el Id del comprobante
        /// </summary>
        public int IDComprobante
        {
            get { return _idComprobante; }
            set { _idComprobante = value; }
        }
        /// <summary>
        /// Retorna y asigna el Punto de Venta
        /// </summary>
        public int PtoVta
        {
            get { return _ptoVta; }

            set { _ptoVta = value; }
        }

        /// <summary>
        /// Retorna y asigna el Tipo de Comprobante
        /// </summary>
        public int TipoComprobante
        {
            get { return _tipoComprobante; }
            set { _tipoComprobante = value; }
        }

        /// <summary>
        /// Retorna y asigna el Tipo de Documento de la Empresa
        /// </summary>
        public int DocTipoEmpresa
        {
            get { return _docTipoEmpresa; }
            set { _docTipoEmpresa = value; }
        }

        /// <summary>
        /// Retorna y asigna el Número de Documento de la Empresa
        /// </summary>
        public string NroDocEmpresa
        {
            get { return _nroDocEmpresa; }
            set { _nroDocEmpresa = value; }
        }

        /// <summary>
        /// Retorna y asigna el Tipo de Documento del Cliente
        /// </summary>
        public int DocTipoCliente
        {
            get { return _docTipoCliente; }
            set { _docTipoCliente = value; }
        }

        /// <summary>
        /// Retorna y asigna el Número de Documento del cliente
        /// </summary>

        public string NroDocCliente
        {
            get { return _nroDocCliente; }
            set { _nroDocCliente = value; }
        }

        /// <summary>
        /// Retorna y asigna el Número del Comprobante
        /// </summary>
        public long NroComprobante
        {
            get { return _nroComprobante; }
            set { _nroComprobante = value; }
        }

        /// <summary>
        /// Retorna y asigna la Fecha del Comprobante
        /// </summary>
        public string FechaComprobante
        {
            get { return _fechaComprobante; }
            set { _fechaComprobante = value; }
        }

        /// <summary>
        /// Retorna y asigna el Importe Total
        /// </summary>
        public float ImporteTotal
        {
            get { return _importeTotal; }
            set { _importeTotal = value; }
        }

        /// <summary>
        /// Retorna y asigna el Importe Neto
        /// </summary>
        public float ImporteNeto
        {
            get { return _importeNeto; }
            set { _importeNeto = value; }
        }

        /// <summary>
        /// Retorna y asigna el Importe Op. Ex.
        /// </summary>
        public float ImporteOpEx
        {
            get { return _importeOpEx; }
            set { _importeOpEx = value; }
        }

        /// <summary>
        /// Retorna y asigna el Importe del Tributo
        /// </summary>
        public float ImporteTributo
        {
            get { return _importeTrib; }
            set { _importeTrib = value; }
        }

        /// <summary>
        /// Retorna y asigna el Importe Iva
        /// </summary>
        public float ImporteIva
        {
            get { return _importeIva; }
            set { _importeIva = value; }
        }

        /// <summary>
        /// Retorna y asigna el ID de la moneda utilizada
        /// </summary>
        public string IDMoneda
        {
            get { return _idMoneda; }
            set { _idMoneda = value; }
        }

        /// <summary>
        /// Retorna y asigna la cotización de la moneda
        /// </summary>
        public float CotizacionMoneda
        {
            get { return _cotizacionMoneda; }
            set { _cotizacionMoneda = value; }
        }


        /// <summary>
        /// Retorna y asigna la Lista de Alicuotas de Iva
        /// </summary>
        public List<AlicuotaIvaClass> ListaIva
        {
            get { return _listaIva; }
            set { _listaIva = value; }
        }

        /// <summary>
        /// Retorna y asigna la lista de Tributos
        /// </summary>
        public List<TributoComprobanteClass> ListaTributos
        {
            get { return _listaTributos; }
            set { _listaTributos = value; }
        }

        /// <summary>
        /// Retorna y asigna el Resultado de la operación
        /// </summary>
        public string Resultado
        {
            get { return _resultado; }
            set { _resultado = value; }
        }

        /// <summary>
        /// Retorna y asigna el Reproceso
        /// </summary>
        public string Reproceso
        {
            get { return _reproceso; }
            set { _reproceso = value; }
        }

        /// <summary>
        /// Retorna y asigna la Fecha del Proceso
        /// </summary>
        public string FechaProceso
        {
            get { return _fechaProceso; }
            set { _fechaProceso = value; }
        }

        /// <summary>
        /// Retorna y asigna el Concepto
        /// </summary>
        public int Concepto
        {
            get { return _concepto; }
            set { _concepto = value; }
        }

        /// <summary>
        /// Retorna y asigna el CAE
        /// </summary>
        public string CAE
        {
            get { return _cae; }
            set { _cae = value; }
        }

        /// <summary>
        /// Retorna y asigna la Fecha de Vto. del CAE
        /// </summary>
        public string FechaVtoCAE
        {
            get { return _fechaVtoCae; }
            set { _fechaVtoCae = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// Constructor por defecto de la clase ComprobanteClass
        /// </summary>
        public ComprobanteClass()
        {

            _ptoVta = 0;
            _tipoComprobante = 0;
            _docTipoEmpresa =0;
            _nroDocEmpresa = "";
            _docTipoCliente = 0;
            _nroDocCliente = "";
            _nroComprobante = 0;
            _fechaComprobante = "";
            _importeTotal= 0.0f;
            _importeNeto= 0.0f;
            _importeOpEx= 0.0f;
            _importeTrib= 0.0f;
            _importeIva = 0.0f;
            _idMoneda = "";
            _cotizacionMoneda = 0.0f;
            _listaIva = new List<AlicuotaIvaClass>();
            _listaTributos = new List<TributoComprobanteClass>();
            _resultado = "";
            _reproceso = "";
            _fechaProceso = "";
            _concepto = 0;
            _cae = "";
            _fechaVtoCae = "";
        }

        #endregion

        #region Metodos

        /// <summary>
        /// Agregar alicuota Iva a la lista del comprobante
        /// </summary>
        /// <param name="alicIva">Alicuota Iva a agregar al comprobante</param>
        public void addAlicuotaIva(AlicuotaIvaClass alicIva)
        {
            ListaIva.Add(alicIva);
        }


        /// <summary>
        /// Quita alicuota Iva de la lista del comprobante
        /// </summary>
        /// <param name="alicIva">Alicuota Iva a quitar del comprobante</param>
        /// <returns>Retorna True si se quitó correctamente, False en otro caso</returns>
        public bool quitarAlicuotaIva(AlicuotaIvaClass alicIva)
        {
            bool r = false;
            r = ListaIva.Remove(alicIva);

            return r;
        }

        /// <summary>
        /// Agrega el tributo a la lista de tributos del comprobante
        /// </summary>
        /// <param name="tributo">Tributo a agregar al comprobante</param>
        public void addTributo(TributoComprobanteClass tributo)
        {
            ListaTributos.Add(tributo);
        }

        /// <summary>
        /// Quita el tributo pasado como parámetro de la lista de tributos del comprobante
        /// </summary>
        /// <param name="tributo">Tributo a quitar de la lista de comprobantes</param>
        /// <returns>True si se quitó correctamente, False en otro caso</returns>
        public bool quitarTributo(TributoComprobanteClass tributo)
        {
            bool r = false;
            r = ListaTributos.Remove(tributo);

            return r;
        }

        #endregion

    }
}
