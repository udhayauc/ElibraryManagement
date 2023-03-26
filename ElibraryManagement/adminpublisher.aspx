<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublisher.aspx.cs" Inherits="ElibraryManagement.adminpublisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <center>
                                    <h4>Publisher Details</h4>
                                    <img src="imgs/publisher.png" width="100" />
                                </center>  
                                </center>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr /> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Publisher ID</label>
                                    <div class="form-group mb-1">
                                        <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_publisherID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />  
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-8">
                                <label>Publisher Name</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_publisherName" runat="server" 
                                            placeholder="Publisher Name"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-4 d-grid gap-2">                     
                                 <asp:Button class="btn btn-success" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />  
                            </div> 
                            <div class="col-4 d-grid gap-2">                     
                                 <asp:Button class="btn btn-primary" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />  
                            </div>  
                            <div class="col-4 d-grid gap-2">                     
                                 <asp:Button class="btn btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />  
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
                                    <h4>Publisher List</h4>                                 
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="displayGrid" class="table table-striped table-bordered"  runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                 <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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
