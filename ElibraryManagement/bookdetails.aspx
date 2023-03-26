<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookdetails.aspx.cs" Inherits="ElibraryManagement.bookdetails" %>
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
                                    <img src="imgs/bookdetails.png" width="100"/>
                                    <h4>Book Details</h4>                                 
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
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                    <div class="form-group mb-1">
                                        <div class="input-group mx-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_bookID" runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" 
                                            Text="Go" OnClick="btnGo"></asp:LinkButton>
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_bookName" runat="server" 
                                            placeholder="Full Name"></asp:TextBox>
                                    </div>  
                            </div>                        
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                    <div class="form-group mb-1">
                                        <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                                            <asp:ListItem Text="English" Value="English"/>
                                            <asp:ListItem Text="Hindi" Value="Hindi"/>
                                            <asp:ListItem Text="Marathi" Value="Marathi"/>
                                            <asp:ListItem Text="French" Value="French"/>
                                            <asp:ListItem Text="German" Value="German"/>
                                            <asp:ListItem Text="Urdu" Value="Urdu"/>
                                        </asp:DropDownList>                                   
                                    </div>

                                <label>Publisher Name</label>
                                    <div class="form-group mb-1">
                                        <asp:DropDownList class="form-control" ID="ddlPublisherName" runat="server">
                                            <asp:ListItem Text="Publisher 1" Value="Publisher 1"/>
                                            <asp:ListItem Text="Publisher 2" Value="Publisher 2"/>                                            
                                        </asp:DropDownList>                                   
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                    <div class="form-group mb-1">
                                        <asp:DropDownList class="form-control" ID="ddlAuthorName" runat="server">
                                            <asp:ListItem Text="Author 1" Value="Author 1"/>
                                            <asp:ListItem Text="Author 2" Value="Author 2"/>                                            
                                        </asp:DropDownList>                                   
                                    </div> 

                                <label>Publish Date</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_publishDate" runat="server" 
                                            TextMode="Date" ></asp:TextBox>
                                    </div> 
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                    <div class="form-group mb-3">
                                        <asp:ListBox class="form-control" ID="lbox_genre" runat="server">
                                            <asp:ListItem Text="Adventure" Value="Adventure"/>
                                            <asp:ListItem Text="Comit Book" Value="Comit Book"/>
                                            <asp:ListItem Text="Self Help" Value="Self Help"/>
                                            <asp:ListItem Text="Motivation" Value="Motivation"/>
                                            <asp:ListItem Text="Healthy Living" Value="Healthy Living"/>
                                            <asp:ListItem Text="Wellness" Value="Wellness"/>
                                            <asp:ListItem Text="Crime" Value="Crime"/>
                                            <asp:ListItem Text="Drama" Value="Drama"/>
                                            <asp:ListItem Text="Fantasy" Value="Fantasy"/>
                                            <asp:ListItem Text="Horror" Value="Horror"/>
                                            <asp:ListItem Text="Poetry" Value="Poetry"/>
                                            <asp:ListItem Text="Personal Development" Value="Personal Development"/>
                                        </asp:ListBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_Edition" runat="server"
                                            placeholder="Edition"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Book Cost(per unit)</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_bookCost" runat="server" 
                                            placeholder="Book Cost"></asp:TextBox>
                                    </div>  
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_pages" runat="server" 
                                            placeholder="Pages" TextMode="Number"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                    <div class="form-group mb-1">
                                        <asp:TextBox CssClass="form-control" ID="txt_actualStock" runat="server"
                                            placeholder="Actual Stock"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_currentStock" runat="server" 
                                            placeholder="Current Stock" ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_issuedBooks" runat="server" 
                                            placeholder="Issued Books" ReadOnly="true"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <label>Book Description</label>
                                    <div class="form-group mb-3">
                                        <asp:TextBox CssClass="form-control" ID="txt_bookDesc" runat="server" 
                                            placeholder="Product Description" TextMode="MultiLine"></asp:TextBox>
                                    </div>  
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-success" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                </div>      
                            </div>
                            <div class="col-4">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-primary" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                </div>      
                            </div>
                            <div class="col-4">                       
                                <div class="form-group d-grid gap-2 mb-1">
                                    <asp:Button class="btn btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                <asp:GridView ID="displayGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                        <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                                        <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                        <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                        <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                                        <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                                        <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                        <asp:BoundField DataField="actual_shock" HeaderText="actual_shock" SortExpression="actual_shock" />
                                        <asp:BoundField DataField="current_shock" HeaderText="current_shock" SortExpression="current_shock" />
                                        <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
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
