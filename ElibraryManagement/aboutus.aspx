<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="ElibraryManagement.aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text-block {
        position: absolute;
        top: 100px;
        left: 40%;
        color:white;
        background-color: none;        
        font-family: 'Brush Script MT', cursive;
        font-size: 50px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="imgs/elibrary.jpg" width="100%" height="800" />
    <div class="text-block">
        <center>
        <p>About us</p>
        <p>Udhaya chandran</p><br />
        <p>udhay@gmail.com</p><br />
        <p>0421-323423</p>
        </center>
    </div>

    <%--<div class="container-fluid">
        <div class="row">
            <div class="col">
                 <img src="imgs/elibrary.jpg" width="100%" height="800" />
            </div>
        </div>
    </div>--%> 
</asp:Content>
