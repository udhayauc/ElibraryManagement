<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ElibraryManagement.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/home.jpeg" class="img-fluid" width="100%"/>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col" >
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>
             <div class="row">
                <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/e-library.png"  width="150"/>
                        <h4>Digital Book Inventory</h4>
                    </center>
                        <p class="text-justify">Libraries have thousands of books; large academic libraries may have millions of books; 
                            It may not be financially feasible, employees required may not have 
                            extra time to devote to such an inventory, and there are no financial rewards for the Library for completing an inventory.</p>               
                </div>
                 <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/searchbooks.png" width="150" />
                        <h4>Search Books</h4>
                    </center>
                        <p class="text-justify">The easiest way to find this is to use the library's catalog. Depending on the integrated library system (or ILS) the library subscribes to, the process might be slightly different. 
                            Generally, you can use a catalog system on a computer to search by title, author, subject, and more.</p>               
                </div>
                 <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/book1.png" width="150"/>
                        <h4>Our Books</h4>
                    </center>
                        <p class="text-justify">BioOne Is a Non-Profit Publisher Dedicated to Making Science Accessible and Sustainable. List of Help Topics, Instructions, and Downloadable Guides Designed for Librarians. Brought To You By BioOne. 
                            For Institutions & Corps. Environmental Sciences.</p>               
                </div>
            </div>
        </div>
    </section>

    <section>
        <img src="imgs/home2.jpeg" class="img-fluid" width="100%"/>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12" >
                    <center>
                        <h2>Our Process</h2>
                        <p><b>We have a Simple 3 step process</b></p>
                    </center>
                </div>
            </div>
             <div class="row">
                <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/signup.png" width="150" />
                        <h4>Sign Up</h4>
                        
                    </center>
                        <p class="text-justify">Browse learning resources available to loan in print and digital formats. Discover events, books, music, documentaries, and more. Access resources today! Register for elearning! 
                            Courses: Access resources easily., Check out elearning!, Browse resources online.</p>               
                </div>
                 <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/searchbooks.png" width="150" />
                        <h4>Search Books</h4>
                    </center>
                        <p class="text-justify">The easiest way to find this is to use the library's catalog. Depending on the integrated library system (or ILS) the library subscribes to, the process might be slightly different. 
                            Generally, you can use a catalog system on a computer to search by title, author, subject, and more.</p>               
                </div>
                 <div class="col-md-4" >                    
                    <center>
                        <img src="imgs/memlist.png" width="150"/>
                        <h4>Visit Us</h4>
                    </center>
                        <p class="text-justify">Digital libraries give access to multiple contents with a potentially infinite number of resources and selections at hand. 
                            The main limit for traditional libraries is represented by physical space.</p>               
                </div>
            </div>
        </div>
    </section>
</asp:Content>
