using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibreriaClases
{
    public class AlicuotaIvaClass
    {
        #region Atributos
        private int _id;
        private float _baseImp;
        private float _importe;

        /// <summary>
        /// Asigna y retorna el ID
        /// </summary>
        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// Asigna y retorna la Base imp.
        /// </summary>
        public float BaseImp
        {
            get { return _baseImp; }
            set { _baseImp = value; }
        }

        /// <summary>
        /// Asigna y retorna el Importe
        /// </summary>
        public float Importe
        {
            get { return _importe; }
            set { _importe = value; }
        }

        #endregion


        #region Constructor
        /// <summary>
        /// Constructor por defecto de la clase AlicuotaIvaClass
        /// </summary>
        public AlicuotaIvaClass()
        {

            _id = 0;
            _baseImp = 0.0f;
            _importe = 0.0f;

        }
        #endregion



        #region Metodos

        #endregion
    }
}
