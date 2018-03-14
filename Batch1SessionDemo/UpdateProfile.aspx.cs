using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["emailid"] != null)
        {
            if(!IsPostBack)
            { 
            DataView dv = SqlDataSourceUser.Select(DataSourceSelectArguments.Empty) as DataView;

            EmailId.Text = Session["emailid"].ToString();

            if (dv != null)
            {
                    for (int i = 0; i < dv.Table.Rows.Count; i++)
                    {
                        if (EmailId.Text == dv.Table.Rows[i]["EmailId"].ToString())
                        {
                            FullName.Text = dv.Table.Rows[i]["FullName"].ToString();
                            PhoneNo.Text = dv.Table.Rows[i]["PhoneNo"].ToString();
                            Image1.ImageUrl = dv.Table.Rows[i]["Photo"].ToString();
                            HiddenFieldPhoto.Value = dv.Table.Rows[i]["Photo"].ToString();
                            Gender.SelectedValue = dv.Table.Rows[i]["Gender"].ToString();
                            break;
                        }

                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Photo.HasFile)
        {
            string FileName = Photo.FileName.ToLower();

            string Extension = FileName.Substring(FileName.LastIndexOf('.'));

            if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png")
            {
                HiddenFieldPhoto.Value = "/photos/" + FileName;
                Photo.SaveAs(Server.MapPath(HiddenFieldPhoto.Value));

                SqlDataSourceUser.Update();
                Msg.Text = "Profile Updated";
                Msg.CssClass = "text-success";
            }
            else
            {
                Msg.Text = "Please select an image file";
                Msg.CssClass = "text-danger";
            }
        }
        else
        {
            SqlDataSourceUser.Update();
            Msg.Text = "Profile Updated";
            Msg.CssClass = "text-success";
        }
    }
}