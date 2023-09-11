using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using dominio;
using System.Collections;
using System.Diagnostics.Eventing.Reader;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("90600ab60ed40f", "f31dae2b90f0de");
            server.EnableSsl = true;
            server.Port = 2525;
            server.Host = "sandbox.smtp.mailtrap.io";
        }

        public void armarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@MiCatalogoWeb.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            //email.Body = "<h1>Reporte de materias a las que se ha inscripto</h1> <br>Hola, te inscribiste.... bla bla";
            email.Body = cuerpo;

        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EmailExistente(string email) 
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.Consulta("SELECT email FROM USERS");
                datos.Lectura();

                

                while (datos.Lector.Read())
                {
                    string emailDb = (string)datos.Lector["email"];
                    if (email == emailDb)
                    {
                        return true;
                    }
                    
                }
                
                return false;
            }
            catch (Exception ex) 
            {
                throw ex;
            }
        }
    }
}
