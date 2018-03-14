<%@ Page Title="" Language="C#" MasterPageFile="~/UserView.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-4">Email Id</label><div class="col-md-8">

                <asp:TextBox ID="EmailId" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="EmailId" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="EmailId" CssClass="req" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Old Password</label><div class="col-md-8">

                <asp:TextBox ID="OldPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="OldPassword" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">New Password</label><div class="col-md-8">

                <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="NewPassword" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-4">Confirm Password</label><div class="col-md-8">

                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ConfirmPassword" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords should be same" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword" CssClass="req" Display="Dynamic"></asp:CompareValidator>

            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Label ID="Msg" runat="server"></asp:Label>

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" DeleteCommand="DELETE FROM [User] WHERE [EmailId] = @EmailId" InsertCommand="INSERT INTO [User] ([EmailId], [Password]) VALUES (@EmailId, @Password)" SelectCommand="SELECT [EmailId], [Password] FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password WHERE [EmailId] = @EmailId">
                    <DeleteParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="NewPassword" Name="Password" PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="EmailId" SessionField="emailid" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

