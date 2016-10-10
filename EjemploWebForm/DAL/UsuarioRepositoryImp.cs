using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EjemploWebForm.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EjemploWebForm.DAL
{
    public class UsuarioRepositoryImp : UsuarioRepository
    {
        private string conexionString = ConfigurationManager.ConnectionStrings["GESTLIBRERIAConnectionString"].ConnectionString;
        public Guid create(Usuario usuario)
        {
            throw new NotImplementedException();
        }

        public void delete(Guid codigo)
        {
            throw new NotImplementedException();
        }

        public IList<Usuario> getAll()
        {
            throw new NotImplementedException();
        }

        public Usuario getById(Guid codigo)
        {
            Usuario usuario = null;
            const string  SQL = "";
            using(SqlConnection conexion = new SqlConnection(conexionString))
            {

                SqlCommand command = conexion.CreateCommand();
                command.CommandText = SQL;
                command.CommandType = CommandType.StoredProcedure;
                command.Connection = conexion;
                conexion.Open();
                ;
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows) {

                        while (reader.Read())
                        {
                            usuario = parseUsuario(reader);
                        }
                    }
                }
            }
            return usuario;
        }

        private Usuario parseUsuario(SqlDataReader reader)
        {
            Usuario usuario = new Usuario();
            usuario.CodigoUsuario = new Guid(reader["codigoUsuario"].ToString());
            usuario.Nombre = reader["nombreUsuario"].ToString();
            return usuario;
        }

        public Usuario update(Usuario usuario)
        {
            throw new NotImplementedException();
        }
    }
}