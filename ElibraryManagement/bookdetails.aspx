<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookdetails.aspx.cs" Inherits="ElibraryManagement.bookdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find
                ("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result)   
                    .height = (150)
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                    <h4>Book Details</h4>                                 
                                    <img id="imgview" src="book_inventory/bookdetails.png" width="100"/>
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
                                            <asp:ListItem Text=" " Value=" "/>
                                        </asp:DropDownList>                                   
                                    </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                    <div class="form-group mb-1">
                                        <asp:DropDownList class="form-control" ID="ddlAuthorName" runat="server">
                                            <asp:ListItem Text=" " Value=" "/>
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
                                        <asp:ListBox class="form-control" ID="lbox_genre" runat="server" SelectionMode="Multiple" Rows="5">
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
