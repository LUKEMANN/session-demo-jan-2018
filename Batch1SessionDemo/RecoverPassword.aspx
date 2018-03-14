<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-4">Email Id</label><div class="col-md-8">

                <asp:TextBox ID="EmailId" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="EmailId" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="EmailId" CssClass="req" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Label ID="Msg" runat="server"></asp:Label>

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Recover Password" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" DeleteCommand="DELETE FROM [User] WHERE [EmailId] = @EmailId" InsertCommand="INSERT INTO [User] ([EmailId], [Password]) VALUES (@EmailId, @Password)" SelectCommand="SELECT [EmailId], [Password] FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password WHERE [EmailId] = @EmailId">
                    <DeleteParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="EmailId" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:HiddenField ID="HiddenFieldPassword" runat="server" />

            </div>
        </div>
    </div>
</asp:Content>

