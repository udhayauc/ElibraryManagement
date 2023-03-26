<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="memberdetails.aspx.cs" Inherits="ElibraryManagement.memberdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
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
                                    <img src="imgs/user.png"  width="100"/>
                                    <h4>Member Details</h4>                                 
                                </center>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                    <div class="form-group mb-1">
                                        <div class="input-group mx-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_memberID" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" 
                                            OnClick="LinkButton4_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_memberName" runat="server" 
                                            placeholder="Full Name"  ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                    <div class="form-group mb-1">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control me-1" ID="txt_accStatus" runat="server" placeholder="Status" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success me-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                                            <i class="fa-solid fa-circle-check"></i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning me-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
                                            <i class="fa-solid fa-circle-pause"></i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger me-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
                                            <i class="fa-sharp fa-solid fa-circle-xmark"></i> </asp:LinkButton>
                                        </div>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Date of birth</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_Dob" runat="server"
                                            placeholder="Contact Number" TextMode="Date" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact no</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_contNo" runat="server" 
                                            placeholder="Contact no" TextMode="Number"  ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                            <div class="col-md-4">
                                <label>Email address</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_emailID" runat="server" 
                                            placeholder="Email address" TextMode="Email" ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_State" runat="server"
                                            placeholder="State"  ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_City" runat="server" 
                                            placeholder="City"  ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                             <div class="col-md-4">
                                <label>Pin code</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_pinCode" runat="server" 
                                            placeholder="Pin code" TextMode="Number"  ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full address</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_fullAddress" runat="server" 
                                            placeholder="Full address" TextMode="MultiLine"  ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-danger" ID="Button1" runat="server" Text="Delete User Permanently" OnClick="Button1_Click" />
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
                                    <img src="imgs/memberlist.png" width="100"  />
                                    <h4>Member List</h4>                                   
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="displayGrid" class="table table-striped table-bordered"  runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account status" SortExpression="account_status" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                        <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode" />
                                        <asp:BoundField DataField="full_address" HeaderText="Full address" SortExpression="full_address" />
                                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
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
