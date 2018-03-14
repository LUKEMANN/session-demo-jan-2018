using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
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
            Msg.Text = "Email already registered";
            Msg.CssClass = "text-danger";
        }
        else
        {
            string FileName = Photo.FileName.ToLower();

            string Extension = FileName.Substring(FileName.LastIndexOf('.'));

            if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png")
            {
                HiddenFieldPhoto.Value = "/photos/" + FileName;
                Photo.SaveAs(Server.MapPath(HiddenFieldPhoto.Value));

                SqlDataSourceUser.Insert();
                Msg.Text = "Sign Up successful";
                Msg.CssClass = "text-success";
            }
            else
            {
                Msg.Text = "Please select an image file";
                Msg.CssClass = "text-danger";
            }
        }
    }
}