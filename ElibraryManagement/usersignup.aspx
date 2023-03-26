<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="ElibraryManagement.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/user1.png" width="100" />
                                    <h4>User Registration</h4>
                                </center>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_fullName" runat="server" placeholder="Full Name"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_dob" runat="server" 
                                            placeholder="Date-of-birth" TextMode="Date"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_contactno" runat="server"
                                            placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email address</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_emailID" runat="server" 
                                            placeholder="Email address" TextMode="Email"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_state" runat="server"
                                            placeholder="State"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_city" runat="server" 
                                            placeholder="City"></asp:TextBox>
                                    </div>  
                            </div>
                             <div class="col-md-4">
                                <label>Pin code</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_pinCode" runat="server" 
                                            placeholder="Pin code" TextMode="Number"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full address</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_fulladdress" runat="server" 
                                            placeholder="Full address" TextMode="MultiLine"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col mb-4">
                                <center>
                                <span class="badge rounded-pill text-bg-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>User ID</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server"
                                            placeholder="User ID"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_password" runat="server" 
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                
                                <div class="form-group d-grid mb-1">
                                    <asp:Button class="btn btn-info btn-block" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
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
