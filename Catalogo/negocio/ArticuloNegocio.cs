using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using dominio;
using static System.Collections.Specialized.BitVector32;

namespace negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar(string idArticulo = "", int idUser = 0)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (idArticulo != "")
                {
                    datos.Consulta("Select A.Id, Codigo, Nombre, A.Descripcion, ImagenUrl, Precio, A.IdMarca, A.IdCategoria, M.Id, M.Descripcion Marca, C.Id, C.Descripcion Categoria From ARTICULOS A, MARCAS M, CATEGORIAS C Where M.Id = A.IdMarca And C.Id = A.IdCategoria and A.Id = " + idArticulo);
                }
                else if (idUser != 0)
                {
                    datos.Procedimiento("listarFavoritos");
                    datos.Parametro("IdUser", idUser);
                }
                else
                {
                    datos.Procedimiento("listarArticulo");
                }
                    
 
                datos.Lectura();

                while (datos.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.Id = (int)datos.Lector["Id"];
                    articulo.CodigoArticulo = (string)datos.Lector["Codigo"];
                    articulo.Nombre = (string)datos.Lector["Nombre"];
                    articulo.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        articulo.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    else
                        articulo.ImagenUrl = ("https://images.samsung.com/is/image/samsung/assets/ar/p6_gro2/p6_initial_mktpd/smartphones/galaxy-s10/specs/galaxy-s10-plus_specs_design_colors_prism_black.jpg?$163_346_PNG$");
                    articulo.Precio = datos.Lector.GetDecimal(5);
                    articulo.Marca = new Marca();
                    articulo.Marca.Id = (int)datos.Lector["IdMarca"];
                    articulo.Marca.Descripcion = (string)datos.Lector["Marca"];
                    articulo.Categoria = new Categoria();
                    articulo.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    articulo.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    lista.Add(articulo);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }


        }

        public void Agregar(Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.Procedimiento("agregarArticulo");
                datos.Parametro("@Codigo", nuevo.CodigoArticulo);
                datos.Parametro("@Nombre", nuevo.Nombre);
                datos.Parametro("@Descripcion", nuevo.Descripcion);
                datos.Parametro("@IdMarca", nuevo.Marca.Id);
                datos.Parametro("@IdCategoria", nuevo.Categoria.Id);
                datos.Parametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.Parametro("@Precio", nuevo.Precio);
                datos.Ejecutar();


            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }

        }

        public void Modificar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.Procedimiento("modificarArticulo");
                datos.Parametro("@Codigo", articulo.CodigoArticulo);
                datos.Parametro("@Nombre", articulo.Nombre);
                datos.Parametro("@Descripcion", articulo.Descripcion);
                datos.Parametro("@IdMarca", articulo.Marca.Id);
                datos.Parametro("@IdCategoria", articulo.Categoria.Id);
                datos.Parametro("@ImagenUrl", articulo.ImagenUrl);
                datos.Parametro("@Precio", articulo.Precio);
                datos.Parametro("@Id", articulo.Id);
                datos.Ejecutar();
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                datos.CerrarConexion();
            }
        } 

        public void Borrar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.Consulta("Delete From ARTICULOS Where Id = @Id");
                datos.Parametro("@Id", id);

                datos.Ejecutar();
            }
            catch(Exception ex) 
            {
                throw ex; 
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        { 
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            Articulo articulof = new Articulo();
            
            try
            {
                string consulta = "Select A.Id, Codigo, Nombre, A.Descripcion, ImagenUrl, Precio,  M.Descripcion Marca, C.Descripcion Categoria, IdCategoria, IdMarca From ARTICULOS A, MARCAS M, CATEGORIAS C Where  A.IdMarca = M.Id And A.IdCategoria = C.Id And ";

                if (campo == "Precio") 
                {
                    articulof.Precio = decimal.Parse(filtro);
                    switch (criterio)
                    {
                        case "Mayor a":
                            consulta += "Precio > " + articulof.Precio.ToString(CultureInfo.InvariantCulture); // Usar CultureInfo.InvariantCulture;
                            break;
                        case "Menor a":
                            consulta += "Precio < " + articulof.Precio.ToString(CultureInfo.InvariantCulture); // Usar CultureInfo.InvariantCulture;
                            break;
                        case "Igual a":
                            consulta += "Precio = " + articulof.Precio.ToString(CultureInfo.InvariantCulture); // Usar CultureInfo.InvariantCulture;
                            break;
                        default:
                            break;
                    }

                }
                else  //(campo =="Nombre")
                {
                    if (campo == "Descripción")
                        campo = "A.Descripcion";
                    switch (criterio)
                    {
                        case "Empieza con":
                            consulta += campo + " Like '" + filtro + "%' ";
                            break;
                        case "Termina con":
                            consulta += campo + " Like '%" + filtro + "'";
                            break;
                        case "Contiene":
                            consulta += campo + " like '%" + filtro + "%' ";
                            break;
                        default:
                            break;
                    }
                }
               

                datos.Consulta(consulta);
                datos.Lectura();

                while (datos.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.Id = (int)datos.Lector["Id"];
                    articulo.CodigoArticulo = (string)datos.Lector["Codigo"];
                    articulo.Nombre = (string)datos.Lector["Nombre"];
                    articulo.Descripcion = (string)datos.Lector["Descripcion"];
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        articulo.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    articulo.Precio = datos.Lector.GetDecimal(5);
                    articulo.Marca = new Marca();
                    articulo.Marca.Id = (int)datos.Lector["IdMarca"];
                    articulo.Marca.Descripcion = (string)datos.Lector["Marca"];
                    articulo.Categoria = new Categoria();
                    articulo.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    articulo.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    lista.Add(articulo);
                }

                return lista;



                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}
