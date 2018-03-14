using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["emailid"] != null)
        {
            EmailId.Text = Session["emailid"].ToString();
        }
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
                    OldPassword.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                    break;
                }
            }
        }

        if (Exists)
        {
            SqlDataSourceUser.Update();
            Msg.Text = "Password Updated";
            Msg.CssClass = "text-success";
        }
        else
        {

            Msg.Text = "Incorrect Old Password";
            Msg.CssClass = "text-danger";

        }
    }
}