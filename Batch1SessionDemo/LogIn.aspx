<%@ Page Title="" Language="C#" MasterPageFile="~/PublicView.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

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
            <label class="control-label col-md-4">Password</label><div class="col-md-8">

                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="Password" CssClass="req" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Label ID="Msg" runat="server"></asp:Label>

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-4 col-md-8">

                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="Button1_Click" />

                <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" DeleteCommand="DELETE FROM [User] WHERE [EmailId] = @EmailId" InsertCommand="INSERT INTO [User] ([EmailId], [Password], [FullName], [PhoneNo], [Photo], [Gender]) VALUES (@EmailId, @Password, @FullName, @PhoneNo, @Photo, @Gender)" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [Password] = @Password, [FullName] = @FullName, [PhoneNo] = @PhoneNo, [Photo] = @Photo, [Gender] = @Gender WHERE [EmailId] = @EmailId">
                    <DeleteParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="EmailId" Name="EmailId" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Password" Name="Password" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="FullName" Name="FullName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="PhoneNo" Name="PhoneNo" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="HiddenFieldPhoto" Name="Photo" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="Gender" Name="Gender" PropertyName="SelectedValue" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="PhoneNo" Type="String" />
                        <asp:Parameter Name="Photo" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="EmailId" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

