using System;
using System.Collections.Generic;
using System.Text;
/*Importación para trabajar con SQL*/
using System.Data;
using System.Data.SqlClient;




namespace CapaDatos
{
    class DCategoria
    {
        //Variables correspondientes a atributos de tabla
        private int _idCategoria;
        private string _Nombre;
        private string _Descripcion;

        //Variable para buscar por nombre
        private string _TxtBuscar;

        //Metodos Getters y Setters
        public int IdCategoria { get => _idCategoria; set => _idCategoria = value; }

        public string Nombre { get => _Nombre; set => _Nombre = value; }

        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }

        public string TxtBuscar { get => _TxtBuscar; set => _TxtBuscar = value; }

        //Constructor Vacio
        public DCategoria()
        {

        }

        //Constructor con parametros
        public DCategoria(int idcategoria, string nombre, string descripcion, string txt_buscar)
        {
            this.IdCategoria = idcategoria;
            this.Nombre = nombre;
            this.Descripcion = descripcion;
            this.TxtBuscar = txt_buscar;
        }

        //Metodo Insertar
        public string Insertar(DCategoria Categoria)
        {
            string Respuesta = "";
            SqlConnection SqlCon = new SqlConnection();


            try
            {   
                //Codigo
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                //Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spinsertar_categoria";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                //Parametro idCategoria
                SqlParameter ParIdCategoria = new SqlParameter();
                ParIdCategoria.ParameterName = "@idCategoria";
                ParIdCategoria.SqlDbType = SqlDbType.Int;
                ParIdCategoria.Direction = ParameterDirection.Output;
                SqlCmd.Parameters.Add(ParIdCategoria);

                //Parametro Nombre_Categoria
                SqlParameter ParNombreCategoria = new SqlParameter();
                ParNombreCategoria.ParameterName = "@Nombre";
                ParNombreCategoria.SqlDbType = SqlDbType.VarChar;
                ParNombreCategoria.Size = 50;
                ParNombreCategoria.Value = Categoria.Nombre;
                SqlCmd.Parameters.Add(ParNombreCategoria);

                //Parametro DescripcionCategoria
                SqlParameter ParDescripcionCategoria = new SqlParameter();
                ParDescripcionCategoria.ParameterName = "@Categoria";
                ParDescripcionCategoria.SqlDbType = SqlDbType.VarChar;
                ParDescripcionCategoria.Size = 256;
                ParDescripcionCategoria.Value = Categoria.Descripcion;
                SqlCmd.Parameters.Add(ParDescripcionCategoria);

                //Ejecucion Comando
                Respuesta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se ingreso el registro";

            }
            catch(Exception ex)
            {
                Respuesta = ex.Message;
            }
            finally
            {
                if(SqlCon.State == ConnectionState.Open){SqlCon.Close();}
            }
            return Respuesta;

        }

        //Metodo Editar
        public string Editar(DCategoria Categoria)
        {
            string Respuesta = "";
            SqlConnection SqlCon = new SqlConnection();


            try
            {
                //Codigo
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                //Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "speditar_categoria";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                //Parametro idCategoria
                SqlParameter ParIdCategoria = new SqlParameter();
                ParIdCategoria.ParameterName = "@idCategoria";
                ParIdCategoria.SqlDbType = SqlDbType.Int;
                ParIdCategoria.Value = Categoria.IdCategoria;
                SqlCmd.Parameters.Add(ParIdCategoria);

                //Parametro Nombre_Categoria
                SqlParameter ParNombreCategoria = new SqlParameter();
                ParNombreCategoria.ParameterName = "@Nombre";
                ParNombreCategoria.SqlDbType = SqlDbType.VarChar;
                ParNombreCategoria.Size = 50;
                ParNombreCategoria.Value = Categoria.Nombre;
                SqlCmd.Parameters.Add(ParNombreCategoria);

                //Parametro DescripcionCategoria
                SqlParameter ParDescripcionCategoria = new SqlParameter();
                ParDescripcionCategoria.ParameterName = "@Categoria";
                ParDescripcionCategoria.SqlDbType = SqlDbType.VarChar;
                ParDescripcionCategoria.Size = 256;
                ParDescripcionCategoria.Value = Categoria.Descripcion;
                SqlCmd.Parameters.Add(ParDescripcionCategoria);

                //Ejecucion Comando
                Respuesta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se Actualizo el registro";

            }
            catch (Exception ex)
            {
                Respuesta = ex.Message;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open) { SqlCon.Close(); }
            }
            return Respuesta;
        }

        //Metodo Eliminar
        public string Eliminar(DCategoria Categoria)
        {
            string Respuesta = "";
            SqlConnection SqlCon = new SqlConnection();


            try
            {
                //Codigo
                SqlCon.ConnectionString = Conexion.Cn;
                SqlCon.Open();

                //Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "speliminar_categoria";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                //Parametro idCategoria
                SqlParameter ParIdCategoria = new SqlParameter();
                ParIdCategoria.ParameterName = "@idCategoria";
                ParIdCategoria.SqlDbType = SqlDbType.Int;
                ParIdCategoria.Value = Categoria.IdCategoria;
                SqlCmd.Parameters.Add(ParIdCategoria);

                //Ejecucion Comando
                Respuesta = SqlCmd.ExecuteNonQuery() == 1 ? "Ok" : "No se Elimino el registro";

            }
            catch (Exception ex)
            {
                Respuesta = ex.Message;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open) { SqlCon.Close(); }
            }
            return Respuesta;
        }

        //Metodo Mostrar
        public DataTable Mostrar()
        {
            DataTable DtResultado = new DataTable("Categoria");
            SqlConnection SqlCon = new SqlConnection();

            try
            {
                SqlCon.ConnectionString = Conexion.Cn;

                //Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spmostrar_categoria";
                SqlCmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter SqlDat = new SqlDataAdapter(SqlCmd);
                SqlDat.Fill(DtResultado);
            }
            catch(Exception ex)
            {
                DtResultado = null;
            }

            return DtResultado;
        }

        //Metodo Buscar Nombre
        public DataTable BuscarNombre(DCategoria Categoria)
        {
            DataTable DtResultado = new DataTable("Categoria");
            SqlConnection SqlCon = new SqlConnection();

            try
            {
                SqlCon.ConnectionString = Conexion.Cn;

                //Comando
                SqlCommand SqlCmd = new SqlCommand();
                SqlCmd.Connection = SqlCon;
                SqlCmd.CommandText = "spbuscar_categoria";
                SqlCmd.CommandType = CommandType.StoredProcedure;
                SqlParameter ParTxtBuscar = new SqlParameter();
                ParTxtBuscar.ParameterName = "@txt_buscar";
                ParTxtBuscar.SqlDbType = SqlDbType.VarChar;
                ParTxtBuscar.Size = 50;
                ParTxtBuscar.Value = Categoria.TxtBuscar;
                SqlCmd.Parameters.Add(ParTxtBuscar);


                SqlDataAdapter SqlDat = new SqlDataAdapter(SqlCmd);
                SqlDat.Fill(DtResultado);
            }
            catch (Exception ex)
            {
                DtResultado = null;
            }

            return DtResultado;
        }


    }
}
