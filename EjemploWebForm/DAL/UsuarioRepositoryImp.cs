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
            IList<Usuario> usuarios = null;
            const string SQL = "obtenerUsuarios";

            using(SqlConnection conexion = new SqlConnection(conexionString))
            {
                SqlCommand cmd = new SqlCommand(SQL, conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                conexion.Open();
                using(SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        usuarios = new List<Usuario>();
                        Usuario usuario = null;
                        while (reader.Read())
                        {
                            usuario = parseUsuario(reader);
                            usuarios.Add(usuario);
                        }
                    }
                }
            }
            return usuarios;
        }

        public Usuario getById(Guid codigo)
        {
            Usuario usuario = null;
            const string  SQL = "getUsuarioByID";
           
            using(SqlConnection conexion = new SqlConnection(conexionString))
            {

                SqlCommand command = new SqlCommand(SQL,conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@pUsuarioId", codigo);
                conexion.Open();
                
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows) {//si devuelve datos

                        while (reader.Read())//cada vuelta es una tupla
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
            usuario.Apellidos = reader["apellidosUsuario"].ToString();
            usuario.Email = reader["emailUsuario"].ToString();
            usuario.NickName = reader["aliasUsuario"].ToString();
            usuario.Password = reader["passwordUsuario"].ToString();
            usuario.FechaNacimiento = Convert.ToDateTime(reader["fNacimientoUsuario"].ToString());
            return usuario;
        }

        public Usuario update(Usuario usuario)
        {
            //throw new NotImplementedException();
        }
    }
}