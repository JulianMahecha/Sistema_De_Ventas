using System;
using System.Collections.Generic;
using System.Text;
using CapaDatos;
using System.Data;



namespace CapaNegocio
{
    class NCategoria
    {
        //Metodo insertar que llama al metodo insertar de la clase DCategoria de la capa datos

        public static string Insertar(string nombre, string descripcion)
        {
            DCategoria Obj = new DCategoria();
            Obj.Nombre = nombre;
            Obj.Descripcion = descripcion;

            return Obj.Insertar(Obj);
        }

        //Metodo Editar que llama al metodo Editar de la clase DCategoria de la capa datos
        public static string Editar(int id, string nombre, string descripcion)
        {
            DCategoria Obj = new DCategoria();
            Obj.IdCategoria = id;
            Obj.Nombre = nombre;
            Obj.Descripcion = descripcion;

            return Obj.Editar(Obj);
        }

        //Metodo Eliminar que llama al metodo Eliminar de la clase DCategoria de la capa datos
        public static string Eliminar(int id)
        {
            DCategoria Obj = new DCategoria();
            Obj.IdCategoria = id;
    
            return Obj.Eliminar(Obj);
        }

        //Metodo Mostrar que llama al metodo Mostrar de la clase DCategoria de la capa datos
        public static DataTable Mostrar()
        {
            return new DCategoria().Mostrar();
        }

        //Metodo BuscarNombre que llama al metodo BuscarNombre de la clase DCategoria de la capa datos
        public static DataTable BuscarNombre(string txtbuscar)
        {
            DCategoria Obj = new DCategoria();
            Obj.TxtBuscar = txtbuscar;
            return Obj.BuscarNombre(Obj);
        }



    }
}
