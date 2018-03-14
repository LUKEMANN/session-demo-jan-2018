using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecoverPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Msg.Text = "";
        Msg.CssClass = "";

        DataView dv = SqlDataSourceUser.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (EmailId.Text == dv.Table.Rows[i]["EmailId"].ToString())
                {
                    Exists = true;
                    break;
                }
            }
        }

        if (Exists)
        {
            Random rn = new Random();

            for (int i = 1; i <= 6; i++)
            {
                HiddenFieldPassword.Value += rn.Next(0, 10);
            }

            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("");
            mailMessage.To.Add(new MailAddress(EmailId.Text));
            mailMessage.Subject = "Password Recovery";
            mailMessage.Body = "Your new password is " + HiddenFieldPassword.Value;
            mailMessage.Priority = MailPriority.High;

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("", "");

            try
            {
                smtpClient.Send(mailMessage);
                SqlDataSourceUser.Update();
                Msg.Text = "Password sent to your email address";
                Msg.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                Msg.Text = ex.Message;
                Msg.CssClass = "text-danger";
            }
        }
        else
        {

            Msg.Text = "Email not registered";
            Msg.CssClass = "text-danger";

        }
    }
}