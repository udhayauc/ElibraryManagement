<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="ElibraryManagement.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/user.png" width="130" />
                                    <h3>User Login</h3>
                                </center>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Member ID</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>

                                <label>Password</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_Password" runat="server" 
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>
                                
                                <div class="form-group d-grid mb-1">
                                    <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>

                                  <div class="form-group d-grid mb-1">
                                    <asp:Button class="btn btn-info btn-block" ID="Button2" runat="server" Text="Sign Up" />
                                </div>
                            </div>
                        </div>                                   
                    </div>
                </div>

              <div class="mb-5">
                <a href="homepage.aspx"><< Back to Home</a>
              </div>
            </div>
        </div>
    </div>
</asp:Content>
