<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="ElibraryManagement.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/user.png" width="100"/>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label 
                                        ID="lblStatus" runat="server" Text="Your status"></asp:Label>
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
                                        <asp:TextBox CssClass="form-control" ID="txt_fullname" runat="server" placeholder="Full Name"></asp:TextBox>
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
                                        <asp:TextBox CssClass="form-control" ID="txt_Contno" runat="server"
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
                                        <asp:TextBox CssClass="form-control" ID="txt_pincode" runat="server" 
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
                            <div class="col-md-4">
                                <label>User ID</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server"
                                            placeholder="User ID" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_OldPassword" runat="server" 
                                            placeholder="Password" ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_NewPassword" runat="server" 
                                            placeholder="Password" TextMode="Password"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-primary btn-block" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                </div>      
                            </div>
                        </div>                                   
                    </div>
                </div>

              <div class="mb-5">
                <a href="homepage.aspx"><< Back to Home</a>
              </div>
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/bookss.jpg" width="100"  />
                                    <h4>Your Issued Books</h4>
                                    <asp:Label class="badge rounded-pill text-bg-info"
                                        ID="Label2" runat="server" Text="your books info"></asp:Label>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="displayGrid" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
