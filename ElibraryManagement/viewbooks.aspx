<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="ElibraryManagement.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString3 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="displayGrid" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="lbl_bookName" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("book_name") %>'></asp:Label>                                       
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Author - <asp:Label ID="lbl_Author" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>                                       
                                                                    &nbsp;| Genre -
                                                                    <asp:Label ID="lbl_genre" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Langugae -
                                                                    <asp:Label ID="lbl_Lang" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Publisher - <asp:Label ID="lbl_Publisher" runat="server" Font-Bold="True" Text='<%# Bind("publisher_name") %>'></asp:Label>                                       
                                                                    &nbsp;| Publish Date -
                                                                    <asp:Label ID="lbl_DOP" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="lbl_pages" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                     &nbsp;| Edition -
                                                                    <asp:Label ID="lbl_Edition" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Cost - <asp:Label ID="lbl_cost" runat="server" Font-Bold="True" Text='<%# Bind("book_cost") %>'></asp:Label>                                       
                                                                    &nbsp;| Actual Stock -
                                                                    <asp:Label ID="lbl_Actualstock" runat="server" Font-Bold="True" Text='<%# Eval("actual_shock") %>'></asp:Label>
                                                                </div>
                                                                <div class="row">
                                                                <div class="col-lg-12">
                                                                    Book Description - <asp:Label ID="lbl_bookDesc" runat="server" Font-Bold="True" Text='<%# Bind("book_description") %>'></asp:Label>                                       
                                                                    
                                                                </div>
                                                            </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
