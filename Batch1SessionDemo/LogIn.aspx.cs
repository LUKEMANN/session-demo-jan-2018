using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn : System.Web.UI.Page
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
                if (EmailId.Text == dv.Table.Rows[i]["EmailId"].ToString() &&
                    Password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                    break;
                }
            }
        }

        if (Exists)
        {
            Session["emailid"] = EmailId.Text;
            Response.Redirect("UpdateProfile.aspx");
        }
        else
        {

            Msg.Text = "Invalid Email or Password";
            Msg.CssClass = "text-danger";

        }
    }
}