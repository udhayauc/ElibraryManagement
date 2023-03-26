<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissue.aspx.cs" Inherits="ElibraryManagement.WebForm4" %>
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
                                    <img src="imgs/bookissuing.png" width="100"  />
                                    <h4>Book Issuing</h4>
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
                                <label>Member ID</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                    <div class="form-group mb-1">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-secondary" ID="Button2" runat="server" Text="Go" />  
                                        </div>
                                    </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server"
                                            placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                            placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"
                                            placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                            placeholder="End Date" TextMode="Date"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4 mx-auto">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-primary btn-block" ID="Button1" runat="server" Text="Issue" />
                                </div>      
                            </div>
                            <div class="col-4 mx-auto">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-success btn-block" ID="Button3" runat="server" Text="Return" />
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
                                    <h4>Issued Books List</h4>
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
                                <table>
                                    <tr>
                                        <td>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
