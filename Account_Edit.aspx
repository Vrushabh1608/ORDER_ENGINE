﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Account_Edit.aspx.cs" Inherits="Account_Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- CODE CHECKED -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContainer" runat="Server">
    <asp:ScriptManager ID="script1" runat="server">
    </asp:ScriptManager>
    <!-- BEGIN CONTENT -->
    <div id="page-content" class="clearfix">
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">
                        <asp:Label ID="lblpagetitle1" runat="server"></asp:Label>-&nbsp;<b><asp:Label ID="lblstudentname"
                            runat="server" ForeColor="DarkRed"></asp:Label></b><small> &nbsp;
                                <asp:Label ID="lblpagetitle2" runat="server"></asp:Label></small></h3>
                    <ul class="page-breadcrumb breadcrumb">
                        <li class="btn-group btn-group-solid">
                            <button type="button" class="btn btn-app btn-primary btn-mini radius-4" runat="server"
                                id="btnpage1">
                                1</button>
                            <button type="button" class="btn btn-app btn-primary btn-mini radius-4" runat="server"
                                id="btnpage2">
                                2</button>
                            <button type="button" class="btn btn-app btn-primary btn-mini radius-4" runat="server"
                                id="btnpage3">
                                3</button>
                            <button type="button" class="btn btn-app btn-primary btn-mini radius-4" runat="server"
                                id="btnpage4">
                                4</button>
                        </li>
                        <li class="btn-group">
                            <button type="button" class="btn purple dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                                data-delay="1000" data-close-others="true">
                                <span>Actions</span><i class="fa fa-angle-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                                <li><a id="btnsearchoppor" runat="server">Search Opportunity</a></li>
                                <li><a id="btnaddOpp" runat="server">Add Opportunity</a></li>
                            </ul>
                        </li>
                        <li><i class="fa fa-home"></i><a href="Homepage.aspx">Home</a><i class="fa fa-angle-right"></i>
                        </li>
                        <li id="limidbreadcrumb" runat="server"><a href="Opportunity.aspx">
                            <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label></a></li>
                        <li id="lilastbreadcrumb" runat="server"><i class="fa fa-angle-right"></i><a href="#">
                            <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="alert alert-danger" id="divErrormessage" runat="server">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblerrormessage" runat="server"></asp:Label></strong>
            </div>
            <div class="alert alert-success" id="divSuccessmessage" runat="server">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblsuccessMessage" runat="server"></asp:Label></strong>
            </div>
            <asp:UpdatePanel ID="upnlformsubmit" runat="server">
                <ContentTemplate>
                    <div class="row-fluid" id="divformsubmit" runat="server">
                        <div class="span12">
                            <div id="tab_1_3" class="tab-pane active">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <div class="table-responsive">
                                            <div id="divprimarycontact" runat="server">
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="6">
                                                                Primary Contact - Information
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tr>
                                                        <td width="10%">
                                                            Entry Date
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtappentrydate" Enabled="false" Placeholder="Application Entry date"
                                                                runat="server" Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Submission Date
                                                            <asp:Label ID="label8" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtappsubmitdate" Enabled="false" runat="server" Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <CC1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtappsubmitdate"
                                                                DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                            </CC1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator79" ControlToValidate="txtappsubmitdate"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Application Submit Date" />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtappsubmitdate"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                            <asp:Label ID="lbldateerrorsubmit" runat="server" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="10%">
                                                            Title
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddltitle" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="1">Mr.</asp:ListItem>
                                                                <asp:ListItem Value="2">Ms.</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddltitle"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Title"
                                                                InitialValue="0" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            First Name
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtstudentfirstname" Placeholder="Student First Name" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtstudentfirstname"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Student First Name " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator38" runat="server"
                                                                ControlToValidate="txtstudentfirstname" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                        </td>
                                                        <td width="10%">
                                                            Middle Name
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtstudentmidname" Placeholder="Student Middle Name" runat="server"
                                                                Width="86%" ValidationGroup="val1">  </asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator39" runat="server"
                                                                ControlToValidate="txtstudentmidname" ErrorMessage="Please input alphabets" ValidationGroup="val1"
                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                        </td>
                                                        <td width="10%">
                                                            Last Name
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtstudentlastname" Placeholder="Student Last Name" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator40" runat="server"
                                                                ControlToValidate="txtstudentlastname" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Address 1
                                                            <asp:Label ID="label3" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtflatno" Placeholder="Address Line 1" runat="server" Width="86%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="txtflatno"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Address #1 " />
                                                        </td>
                                                        <td width="10%">
                                                            Address 2
                                                            <asp:Label ID="label4" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtbuildingno" Placeholder="Address Line 2" runat="server" Width="86%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="txtbuildingno"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Address #2 " />
                                                        </td>
                                                        <td width="10%">
                                                            Street Name
                                                            <asp:Label ID="label5" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtstreetname" Placeholder="Street Name" runat="server" Width="86%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator64" ControlToValidate="txtstreetname"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Street Name " />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Country
                                                            <asp:Label ID="label6" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlcountry" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged"
                                                                ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddlcountry"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Country"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            State
                                                            <asp:Label ID="label7" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlstate" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1" AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ddlstate"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select State"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            City
                                                            <asp:Label ID="label9" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlcity" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1" AutoPostBack="true" OnSelectedIndexChanged="ddlcity_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlcity"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select City"
                                                                InitialValue="Select" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Location
                                                            <asp:Label ID="label26" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddllocation" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="ddllocation"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Location"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            Postal Code
                                                            <asp:Label ID="label10" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpincode" Placeholder="Postal Code" runat="server" MaxLength="6"
                                                                ValidationGroup="val1" Width="86%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtpincode"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Pincode" />
                                                            <asp:RegularExpressionValidator ID="redquiredexpression5" ControlToValidate="txtpincode"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator41" runat="server"
                                                                ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="val1" Text="#"
                                                                SetFocusOnError="true" ControlToValidate="txtpincode" ValidationExpression="^[0-9]{6,6}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Email id
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtemailidstudent" Placeholder="Student Email Address" runat="server"
                                                                Width="86%"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="EmailIDValidation" runat="server" ControlToValidate="txtemailidstudent"
                                                                ErrorMessage="Email Address Not Valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ValidationGroup="Grplead" SetFocusOnError="True" Text="#"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Handphone 1
                                                            <asp:Label ID="label11" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txthandphone1" Placeholder="Handphone 1" runat="server" Width="86%"
                                                                ValidationGroup="val1" MaxLength="18"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfv3" ControlToValidate="txthandphone1" Text="#"
                                                                runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Handphone no." />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txthandphone1"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegExp1" runat="server" ControlToValidate="txthandphone1"
                                                                ErrorMessage="Handphone length must be between 10 to 18 characters" ValidationGroup="val1"
                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Handphone 2
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txthandphone2" Placeholder="Handphone 2" runat="server" Width="86%"
                                                                ValidationGroup="val1" MaxLength="18"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txthandphone2"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator42" runat="server"
                                                                ControlToValidate="txthandphone2" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Landline No.
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtlandline" Placeholder="Landline" runat="server" Width="86%" ValidationGroup="val1"
                                                                MaxLength="18"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            DOB
                                                            <asp:Label ID="label12" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtdateofbirth" Placeholder="Student Date of Birth" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <CC1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtdateofbirth"
                                                                DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                            </CC1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" ControlToValidate="txtdateofbirth"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Student Date of Birth" />
                                                            <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="txtdateofbirth"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                            <asp:Label ID="lbldateerrordob" runat="server" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="10%">
                                                            Country (Of Birth)
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlplaceofbirthcountry" AutoPostBack="true" Placeholder="Student Country of Birth"
                                                                runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1"
                                                                OnSelectedIndexChanged="ddlplaceofbirthcountry_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%--<asp:RequiredFieldValidator id="RequiredFieldValidator35" ControlToValidate="ddlplaceofbirthcountry" Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True"  ErrorMessage="Select Student place of birth State" InitialValue="Select" />
                                                            --%>
                                                        </td>
                                                        <td width="10%">
                                                            State (Of Birth)
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlplaceofbirthstate" AutoPostBack="true" Placeholder="Student State of Birth"
                                                                runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1"
                                                                OnSelectedIndexChanged="ddlplaceofbirthstate_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%--<asp:RequiredFieldValidator id="RequiredFieldValidator4" ControlToValidate="ddlplaceofbirthstate" Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True"  ErrorMessage="Select Student place of birth State" InitialValue="Select" />
                                                            --%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            City (Of Birth)
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlplaceofbirthcity" Placeholder="Student City of Birth" runat="server"
                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1" OnSelectedIndexChanged="ddlplaceofbirthcity_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%--<asp:RequiredFieldValidator id="RequiredFieldValidator41" ControlToValidate="ddlplaceofbirthcity" Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True"  ErrorMessage="Select Student City of birth " InitialValue="Select" />
                                                            --%>
                                                        </td>
                                                        <td width="10%">
                                                            Place (Of Birth)
                                                            <asp:Label ID="label13" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtplaceofbirth" Placeholder="Student Place of Birth" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtplaceofbirth"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Place of Birth " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server"
                                                                ControlToValidate="txtplaceofbirth" ErrorMessage="Please input alphabets" ValidationGroup="val1"
                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                        <td width="10%">
                                                            Gender
                                                            <asp:Label ID="label35" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlgenderadd" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="1">Male</asp:ListItem>
                                                                <asp:ListItem Value="2">Female</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="ddlgenderadd"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Gender"
                                                                InitialValue="0" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Nationality
                                                            <asp:Label ID="label15" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlnationality" AutoPostBack="true" Placeholder="Nationality"
                                                                runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ddlnationality"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Student Nationality"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            Mother Tongue
                                                            <asp:Label ID="label16" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlmothertongue" AutoPostBack="true" Placeholder="Mother Tongue"
                                                                runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ddlmothertongue"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Student Mother Tongue"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            Religion
                                                            <asp:Label ID="label17" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlreligion" Placeholder="Student Religion" runat="server"
                                                                data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="ddlreligion"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Student Religion"
                                                                InitialValue="Select" />
                                                        </td>
                                                    </tr>
                                                    <tr id="tr4" runat="server" visible="false">
                                                        <td width="10%" id="td10" runat="server" visible="false">
                                                            Specify Nationality
                                                            <asp:Label ID="label18" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%" id="td11" runat="server" visible="false">
                                                            <asp:TextBox ID="txtNationalitySpecify" Placeholder="Student Nationality" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" ControlToValidate="txtNationalitySpecify"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Enter Nationality " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server"
                                                                ControlToValidate="txtNationalitySpecify" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                        <td width="10%" id="td14" runat="server" visible="false">
                                                            Speci. Mother Tongue
                                                            <asp:Label ID="label19" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%" id="td15" runat="server" visible="false">
                                                            <asp:TextBox ID="txtmothertonguespecify" Placeholder="Student Mother Tongue" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" ControlToValidate="txtmothertonguespecify"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Specify Mother Tongue " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator46" runat="server"
                                                                ControlToValidate="txtmothertonguespecify" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                        <td width="10%" id="td8" runat="server" visible="false">
                                                            Specify Religion
                                                            <asp:Label ID="label20" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%" id="td9" runat="server" visible="false">
                                                            <asp:TextBox ID="txtReligionpecify1" Placeholder="Specify Religion" runat="server"
                                                                Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="txtReligionpecify1"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Specify Religion " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator47" runat="server"
                                                                ControlToValidate="txtReligionpecify1" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Caste
                                                            <asp:Label ID="label21" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlcaste" runat="server" Placeholder="Student Caste" data-placeholder="Select"
                                                                CssClass="chzn-select" ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="ddlcaste"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Student Caste"
                                                                InitialValue="Select" />
                                                        </td>
                                                        <td width="10%">
                                                            Sub-Caste
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtsubcaste" Placeholder="Student Sub Caste" runat="server" Width="86%"
                                                                ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator48" runat="server"
                                                                ControlToValidate="txtsubcaste" ErrorMessage="Please input alphabets" ValidationGroup="val1"
                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                        <td width="10%">
                                                            Category
                                                            <asp:Label ID="label22" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlgroup" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1" Enabled="false">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlgroup"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select Category"
                                                                InitialValue="Select" />
                                                        </td>
                                                    </tr>
                                                    <tr id="tr5" runat="server" visible="false">
                                                        <td width="10%" id="td16" runat="server" visible="false">
                                                            Specify Religion
                                                            <asp:Label ID="label23" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%" id="td17" runat="server" visible="false">
                                                            <asp:TextBox ID="txtreligionspecify" runat="server" Width="86%" ValidationGroup="val1"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" ControlToValidate="txtreligionspecify"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Specify Religion " />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator49" runat="server"
                                                                ControlToValidate="txtreligionspecify" ErrorMessage="Please input alphabets"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                        </td>
                                                        <td id="td18" runat="server" visible="false">
                                                        </td>
                                                        <td id="td19" runat="server" visible="false">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Physically
                                                            <br />
                                                            Challenged
                                                            <asp:Label ID="label24" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlphysicalchallenged" runat="server" data-placeholder="Select"
                                                                CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover" data-placement="top"
                                                                data-content="Select whether student is physicaly challenged">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                                <asp:ListItem Value="N">No</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddlphysicalchallenged"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select whether student is physicaly challenged"
                                                                InitialValue="0" />
                                                        </td>
                                                        <td width="10%">
                                                            Customer / Student From
                                                            <asp:Label ID="label25" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlstudentfrom" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                ValidationGroup="val1" data-trigger="hover" data-placement="top" data-content="Select student from"
                                                                data-original-title="Student From">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlstudentfrom"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="True" ErrorMessage="Select student from"
                                                                InitialValue="Select" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="5">
                                                                Primary Contact - Permanent Residential Details
                                                            </th>
                                                            <th width="10%">
                                                                <asp:CheckBox ID="chkaddcopy" runat="server" AutoPostBack="true" OnCheckedChanged="chkaddcopy_CheckedChanged" />
                                                                <span class="lbl">Same As Above</span>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tr>
                                                        <td width="10%">
                                                            Permanent Add. 1
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentAdd1" Placeholder="Permanent Address Line 1 " runat="server"
                                                                Width="86%"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Permanent Add. 2
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentAdd2" Placeholder="Permanent Address Line 2" runat="server"
                                                                Width="86%"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Street Name
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentstreet" Placeholder="Street Name" runat="server" Width="86%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Country
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlpermanentcountry" runat="server" data-placeholder="Select"
                                                                CssClass="chzn-select" AutoPostBack="true" ValidationGroup="Val1" data-trigger="hover"
                                                                data-placement="top" data-content="Enter Student Country" data-original-title="Student Country"
                                                                OnSelectedIndexChanged="ddlpermanentcountry_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td width="10%">
                                                            State
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlpermstate" AutoPostBack="true" runat="server" data-placeholder="Select"
                                                                CssClass="chzn-select" ValidationGroup="Val1" data-trigger="hover" data-placement="top"
                                                                data-content="Enter Student State" data-original-title="Student State" OnSelectedIndexChanged="ddlpermstate_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td width="10%">
                                                            City
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlpermanentcity" runat="server" data-placeholder="Select"
                                                                CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val1" OnSelectedIndexChanged="ddlpermanentcity_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Location
                                                        </td>
                                                        <td width="20%">
                                                            <asp:DropDownList ID="ddlpermanentlocation" runat="server" data-placeholder="Select"
                                                                CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val1">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td width="10%">
                                                            Postal Code
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentpostal" Placeholder="Postal Code" runat="server" MaxLength="6"
                                                                ValidationGroup="Val1" Width="86%" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtpermanentpostal"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator50" runat="server"
                                                                ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="val1" Text="#"
                                                                SetFocusOnError="true" ControlToValidate="txtpermanentpostal" ValidationExpression="^[0-9]{6,6}$" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Handphone 1
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentHphone1" Placeholder="HandPhone 1" runat="server" Width="86%"
                                                                ValidationGroup="val1" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtpermanentHphone1"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator51" runat="server"
                                                                ControlToValidate="txtpermanentHphone1" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Handphone 2
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtpermanentHPhone2" Placeholder="Handphone 2" runat="server" Width="86%"
                                                                ValidationGroup="val1" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="txtpermanentHPhone2"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator52" runat="server"
                                                                ControlToValidate="txtpermanentHPhone2" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Landline No.
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtLandline1" Placeholder="Landline" runat="server" Width="86%"
                                                                ValidationGroup="val1" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate ="txtLandline1" Text ="#" runat ="server" ValidationGroup ="val1" SetFocusOnError ="true" ErrorMessage ="Please Enter Only Numbers" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator53" runat="server" ControlToValidate="txtLandline1" ErrorMessage="Handphone length must be between 7 to 18 characters"  ValidationGroup ="val1" Text ="#" SetFocusOnError ="true"  ValidationExpression="^[0-9]{7,18}$" />
                                                            --%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="6">
                                                                Primary Contact - Employment Details
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tr>
                                                        <td width="10%">
                                                            Qualification
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtquali" runat="server" placeholder="Qualification" ValidationGroup="val1"
                                                                Width="86%"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Company Name
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtcompany" runat="server" Width="86%" placeholder="Company"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Office Address
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtofficeaddress" runat="server" Width="86%" placeholder="Office Address"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="10%">
                                                            Office Tel No.
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtofficetelno" runat="server" placeholder="Office Telephone No."
                                                                ValidationGroup="val1" Width="86%"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtofficetelno"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                                                ControlToValidate="txtofficetelno" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                        </td>
                                                        <td width="10%">
                                                            Designation
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtdesignation" runat="server" Width="86%" placeholder="Designation"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Annual Salary
                                                        </td>
                                                        <td width="20%">
                                                            <asp:TextBox ID="txtannaulsalary" runat="server" Width="86%" placeholder="Annual Salary"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtannaulsalary"
                                                                Text="#" runat="server" ValidationGroup="val1" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Amount length must be of Minimum 1 Character and Maximum 10 Character"
                                                                ValidationGroup="val1" Text="#" SetFocusOnError="true" ControlToValidate="txtannaulsalary"
                                                                ValidationExpression="^[0-9]{1,10}$" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="well" style="text-align: center; background-color: #F0F0F0" id="divstuperinfo"
                                                    runat="server">
                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep1next" runat="server"
                                                        validationgroup="val1" onserverclick="btnstep1next_ServerClick">
                                                        Next
                                                    </button>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                                        ValidationGroup="val1" ShowSummary="False" />
                                                </div>
                                            </div>
                                            <!--End of Primary Contact Details -->
                                            <div id="divseconadarycontact" runat="server">
                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                Secondary Contact - Information
                                                            </th>
                                                            <th width="10%">
                                                                <button type="button" class="btn btn-sm red" id="btnaddSeccontact" runat="server"
                                                                    onserverclick="btnaddSeccontact_ServerClick">
                                                                    >Add Secondary Contact</button>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                                <asp:DataList ID="dlseccontact" runat="server" Width="100%" OnItemCommand="dlseccontact_ItemCommand"
                                                    OnItemDataBound="dlseccontact_ItemDataBound" CssClass="table table-striped table-bordered table-hover">
                                                    <HeaderTemplate>
                                                        <b>Contact Type</b></th>
                                                        <th>
                                                            Contact Name
                                                        </th>
                                                        <th>
                                                            Handphone 1
                                                        </th>
                                                        <th>
                                                            Age
                                                        </th>
                                                        <th>
                                                            Standard
                                                        </th>
                                                        <th>
                                                            Year
                                                        </th>
                                                        <th>
                                                            Action
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcontacttype" Text='<%#DataBinder.Eval(Container.DataItem, "Con_type_Desc")%>'
                                                            runat="server"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Label1" Text='<%#DataBinder.Eval(Container.DataItem, "SecondaryName")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label2" Text='<%#DataBinder.Eval(Container.DataItem, "handphone1")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbldob" Text='<%#DataBinder.Eval(Container.DataItem, "DoB")%>' runat="server"
                                                                Visible="false"></asp:Label><asp:Label ID="lblage" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" Text='<%#DataBinder.Eval(Container.DataItem, "current_std_desc")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label40" Text='<%#DataBinder.Eval(Container.DataItem, "year_pass_desc")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="lnkedit" runat="server" class="btn btn-app btn-primary btn-mini radius-4"
                                                                CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Con_id")%>'><i class="fa fa-edit"></i> Edit</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <div id="divseccontactadd" runat="server">
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Add Secondary Contact
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Contact Type
                                                                <asp:Label ID="label82" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseccontacttype" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Secondary Contact Type">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" ControlToValidate="ddlseccontacttype"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Contact Type"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Title
                                                                <asp:Label ID="label83" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsectitle" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead2">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Mr.</asp:ListItem>
                                                                    <asp:ListItem Value="2">Ms.</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" ControlToValidate="ddlsectitle"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Title"
                                                                    InitialValue="0" />
                                                                <asp:Label ID="lblprimaryconid" runat="server" Visible="false"></asp:Label>
                                                            </td>
                                                            <td width="10%">
                                                                Gender
                                                                <asp:Label ID="label36" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecgender" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead2">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="ddlsecgender"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Gender"
                                                                    InitialValue="0" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                First Name
                                                                <asp:Label ID="label84" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecfname" runat="server" Width="86%" ValidationGroup="Grplead2"
                                                                    placeholder="First Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator63" runat="server"
                                                                    ControlToValidate="txtsecfname" ErrorMessage="Please input alphabets" ValidationGroup="Grplead2"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" ControlToValidate="txtsecfname"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Name" />
                                                            </td>
                                                            <td width="10%">
                                                                Middle Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecmname" runat="server" Width="86%" ValidationGroup="Grplead2"
                                                                    placeholder="Middle Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator64" runat="server"
                                                                    ControlToValidate="txtsecmname" ErrorMessage="Please input alphabets" ValidationGroup="Grplead2"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                            </td>
                                                            <td width="10%">
                                                                Last Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseclname" runat="server" Width="86%" ValidationGroup="Grplead2"
                                                                    placeholder="Last Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator65" runat="server"
                                                                    ControlToValidate="txtseclname" ErrorMessage="Please input alphabets" ValidationGroup="Grplead2"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Handphone 1
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsechandphone1" runat="server" Width="86%" placeholder="Handphone 1"
                                                                    ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator66" ControlToValidate="txtsechandphone1"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator67" runat="server"
                                                                    ControlToValidate="txtsechandphone1" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                    ValidationGroup="Grplead2" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                <%--<asp:RequiredFieldValidator id="RequiredFieldValidator45" ControlToValidate="txtsechandphone1" Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Handphone1" />
                                                                --%>
                                                            </td>
                                                            <td width="10%">
                                                                Handphone 2
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsechandphone2" runat="server" Width="86%" placeholder="Handphone 2"
                                                                    ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator68" ControlToValidate="txtsechandphone2"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator69" runat="server"
                                                                    ControlToValidate="txtsechandphone2" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                    ValidationGroup="Grplead2" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                            </td>
                                                            <td width="10%">
                                                                Landline No.
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseclandline" runat="server" Width="86%" placeholder="Landline No."
                                                                    ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator70" ControlToValidate="txtseclandline"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator71" runat="server"
                                                                    ControlToValidate="txtseclandline" ErrorMessage="Handphone length must be between 7 to 18 characters"
                                                                    ValidationGroup="Grplead2" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{7,18}$" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                DOB
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecdob" Placeholder="Date of Birth" runat="server" Width="86%"
                                                                    ValidationGroup="Grplead3"></asp:TextBox>
                                                                <CC1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MM-yyyy" TargetControlID="txtsecdob"
                                                                    DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                </CC1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="txtsecdob"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Enter Student Date of Birth" />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                                                                    ControlToValidate="txtsecdob" ValidationGroup="Grplead3" Text="#" SetFocusOnError="True"
                                                                    ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                                <asp:Label ID="Label39" runat="server" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Address 1
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecaddress1" runat="server" Width="86%" placeholder="Address Line 1"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Address 2
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecaddress2" runat="server" Width="86%" placeholder="Address Line 2"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Street Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecStreetname" runat="server" Width="86%" placeholder="Street Name"></asp:TextBox>
                                                            </td>
                                                            <tr>
                                                                <td width="10%">
                                                                    Country
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlseccountry" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                        AutoPostBack="true" ValidationGroup="Grplead2" OnSelectedIndexChanged="ddlseccountry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td width="10%">
                                                                    State
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlsecstate" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                        AutoPostBack="true" ValidationGroup="Grplead2" OnSelectedIndexChanged="ddlsecstate_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td width="10%">
                                                                    City
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlseccity" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                        AutoPostBack="true" ValidationGroup="Grplead2" OnSelectedIndexChanged="ddlseccity_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Location
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlSeclocation" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead2">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Postal Code
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecpincode" runat="server" placeholder="Postal Code" MaxLength="6"
                                                                    ValidationGroup="Grplead2" Width="86%" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator72" ControlToValidate="txtsecpincode"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator73" ControlToValidate="txtsecpincode"
                                                                    runat="server" ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="Grplead2"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{6,6}$" />
                                                            </td>
                                                            <td width="10%">
                                                                Email id
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecemailid" runat="server" Width="86%" placeholder="Email Id"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator74" runat="server"
                                                                    ControlToValidate="txtsecemailid" ErrorMessage="Email Address Not Valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                    ValidationGroup="Grplead2" SetFocusOnError="True" Text="#"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Add Secondary Contact Academic Information
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Institution Type
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlinstitutiontype2" runat="server" AutoPostBack="true" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Institution Type" OnSelectedIndexChanged="ddlinstitutiontype2_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Institution Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtnameofinstitution2" runat="server" placeholder="Institution name"
                                                                    MaxLength="100" Width="86%" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                    data-content="Enter Institution Name"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Board / University
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlboard2" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead2" data-trigger="hover" data-placement="top" data-content="Select Board / University">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Current Standard
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlcurrentstudying2" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead2">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Division / Section
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsection2" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead2" data-trigger="hover" data-placement="top" data-content="Select Division / Section / Grade">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Year of Passing
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlyearofpassing2" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Year of Passing">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Qualification
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecqualif" runat="server" placeholder="Qualification" ValidationGroup="Grplead2"
                                                                    Width="86%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Notes, If Any
                                                            </td>
                                                            <td width="20%" colspan="3">
                                                                <asp:TextBox ID="txtadditiondesc2" runat="server" placeholder="Additional Information"
                                                                    Width="95%" MaxLength="100" data-trigger="hover" data-placement="top" data-content="Enter Additional description (If Any)"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Add Secondary Contact - Employment Details
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Occupation
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecoccupation" runat="server" Width="86%" placeholder="Occupation"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Company Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseccompany" runat="server" Width="86%" placeholder="Company"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Company Address
                                                            </td>
                                                            <td width="20%" colspan="3">
                                                                <asp:TextBox ID="txtsecoffadd" runat="server" Width="95%" placeholder="Office Address"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Designation
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecdesig" runat="server" Width="86%" placeholder="Designation"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Office Tel No.
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecofftelno" runat="server" placeholder="Office Telephone No."
                                                                    ValidationGroup="Grplead2" Width="86%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Annual Salary
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecannalsal" runat="server" Width="86%" placeholder="Annual Salary"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Image
                                                            </td>
                                                            <td width="20%">
                                                                <asp:FileUpload ID="fileupload1" runat="server" />
                                                                <%--<CC1:AsyncFileUpload ID="fileupload1" runat ="server" />--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                        <button class="btn btn-app btn-success btn-mini radius-4" id="btnSubmitSeccon" runat="server"
                                                            validationgroup="Grplead2" onserverclick="btnSubmitSeccon_ServerClick">
                                                            Save</button>
                                                        <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclearSeccon" runat="server"
                                                            onserverclick="btnclearSeccon_ServerClick">
                                                            Close</button>
                                                        <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowMessageBox="True"
                                                            ValidationGroup="Grplead2" ShowSummary="False" />
                                                    </div>
                                                </div>
                                                <div id="divseccontactedit" runat="server">
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Edit Secondary Contact
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Contact Type
                                                                <asp:Label ID="label86" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseccontacttypeedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead3" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Secondary Contact Type">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator54" ControlToValidate="ddlseccontacttypeedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Select Contact Type"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Title
                                                                <asp:Label ID="label87" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsectitleedit" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead3">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Mr.</asp:ListItem>
                                                                    <asp:ListItem Value="2">Ms.</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator57" ControlToValidate="ddlsectitleedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Select Title"
                                                                    InitialValue="0" />
                                                                <asp:Label ID="Label88" runat="server" Visible="false"></asp:Label>
                                                            </td>
                                                            <td width="10%">
                                                                Gender
                                                                <asp:Label ID="label37" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecgenderedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead3">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="ddlsecgenderedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Select Gender"
                                                                    InitialValue="0" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                First Name
                                                                <asp:Label ID="label89" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecfnameedit" runat="server" Width="86%" ValidationGroup="Grplead3"
                                                                    placeholder="First Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator75" runat="server"
                                                                    ControlToValidate="txtsecfnameedit" ErrorMessage="Please input alphabets" ValidationGroup="Grplead3"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator65" ControlToValidate="txtsecfname"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Enter Name" />
                                                            </td>
                                                            <td width="10%">
                                                                Middle Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecmnameedit" runat="server" Width="86%" ValidationGroup="Grplead3"
                                                                    placeholder="Middle Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator76" runat="server"
                                                                    ControlToValidate="txtsecmnameedit" ErrorMessage="Please input alphabets" ValidationGroup="Grplead3"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                            </td>
                                                            <td width="10%">
                                                                Last Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseclnameedit" runat="server" Width="86%" ValidationGroup="Grplead3"
                                                                    placeholder="Last Name"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator77" runat="server"
                                                                    ControlToValidate="txtseclnameedit" ErrorMessage="Please input alphabets" ValidationGroup="Grplead3"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Handphone 1
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsechandphone1edit" runat="server" Width="86%" placeholder="Handphone 1"
                                                                    ValidationGroup="Grplead3" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator78" ControlToValidate="txtsechandphone1edit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator79" runat="server"
                                                                    ControlToValidate="txtsechandphone1edit" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                    ValidationGroup="Grplead3" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                <%--<asp:RequiredFieldValidator id="RequiredFieldValidator66" ControlToValidate="txtsechandphone1edit" Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Enter Handphone1" />
                                                                --%>
                                                            </td>
                                                            <td width="10%">
                                                                Handphone 2
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsechandphone2edit" runat="server" Width="86%" placeholder="Handphone 2"
                                                                    ValidationGroup="Grplead3" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator80" ControlToValidate="txtsechandphone2edit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator81" runat="server"
                                                                    ControlToValidate="txtsechandphone2edit" ErrorMessage="Handphone length must be between 10 to 18 characters"
                                                                    ValidationGroup="Grplead3" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                            </td>
                                                            <td width="10%">
                                                                Landline No.
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseclandlineedit" runat="server" Width="86%" placeholder="Landline No."
                                                                    ValidationGroup="Grplead3" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator82" ControlToValidate="txtseclandlineedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator83" runat="server"
                                                                    ControlToValidate="txtseclandlineedit" ErrorMessage="Handphone length must be between 7 to 18 characters"
                                                                    ValidationGroup="Grplead3" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{7,18}$" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                DOB
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecdobedit" Placeholder="Date of Birth" runat="server" Width="86%"
                                                                    ValidationGroup="Grplead3"></asp:TextBox>
                                                                <CC1:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MM-yyyy" TargetControlID="txtsecdobedit"
                                                                    DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                </CC1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="txtsecdobedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead3" SetFocusOnError="True" ErrorMessage="Enter Student Date of Birth" />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                                                    ControlToValidate="txtsecdobedit" ValidationGroup="Grplead3" Text="#" SetFocusOnError="True"
                                                                    ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                                <asp:Label ID="Label38" runat="server" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Address 1
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecaddress1edit" runat="server" Width="86%" placeholder="Address Line 1"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Address 2
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecaddress2edit" runat="server" Width="86%" placeholder="Address Line 2"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Street Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecstreetnameedit" runat="server" Width="86%" placeholder="Street Name"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Country Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseccountryedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" AutoPostBack="true" ValidationGroup="Grplead3" OnSelectedIndexChanged="ddlseccountryedit_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                State Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecstateedit" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    AutoPostBack="true" ValidationGroup="Grplead3" OnSelectedIndexChanged="ddlsecstateedit_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                City Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseccityedit" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    AutoPostBack="true" ValidationGroup="Grplead3" OnSelectedIndexChanged="ddlseccityedit_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Location
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseclocationedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead2">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Postal Code
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecpincodeedit" runat="server" placeholder="Postal Code" MaxLength="6"
                                                                    ValidationGroup="Grplead2" Width="86%" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator84" ControlToValidate="txtsecpincodeedit"
                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator85" ControlToValidate="txtsecpincodeedit"
                                                                    runat="server" ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="Grplead2"
                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{6,6}$" />
                                                            </td>
                                                            <td width="10%">
                                                                Email id
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecemailidedit" runat="server" Width="86%" placeholder="Email Id"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator86" runat="server"
                                                                    ControlToValidate="txtsecemailidedit" ErrorMessage="Email Address Not Valid"
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Grplead2"
                                                                    SetFocusOnError="True" Text="#"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Edit Secondary Contact Academic Information
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Institution Type
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecinstitutionedit" runat="server" AutoPostBack="true" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead3" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Institution Type" OnSelectedIndexChanged="ddlsecinstitutionedit_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Institution Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecinstunameedit" runat="server" placeholder="Institution name"
                                                                    MaxLength="100" Width="86%" ValidationGroup="Grplead3" data-trigger="hover" data-placement="top"
                                                                    data-content="Enter Institution Name"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Board / University
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecboardedit" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead3" data-trigger="hover" data-placement="top" data-content="Select Board / University">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Current Standard
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlseccurrentstandardedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead3">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Division / Section
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecsectionedit" runat="server" data-placeholder="Select"
                                                                    CssClass="chzn-select" ValidationGroup="Grplead3" data-trigger="hover" data-placement="top"
                                                                    data-content="Select Division / Section">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td width="10%">
                                                                Year of Passing
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsecyopedit" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Grplead3" data-trigger="hover" data-placement="top" data-content="Select Year of Passing">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Qualification
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecqualiedit" runat="server" placeholder="Qualification" ValidationGroup="Grplead3"
                                                                    Width="86%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Notes, If Any
                                                            </td>
                                                            <td width="20%" colspan="3">
                                                                <asp:TextBox ID="txtsecaddnotesedit" runat="server" placeholder="Additional Information"
                                                                    Width="95%" MaxLength="100" data-trigger="hover" data-placement="top" data-content="Enter Additional Information"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Edit Secondary Contact - Employment Information
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Occupation
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecoccupationedit" runat="server" Width="86%" placeholder="Company"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Company Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtseccompanyedit" runat="server" Width="86%" placeholder="Company"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Company Address
                                                            </td>
                                                            <td width="20%" colspan="3">
                                                                <asp:TextBox ID="txtsecoffaddedit" runat="server" Width="95%" placeholder="Office Address"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Designation
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtxsecdesgedit" runat="server" Width="86%" placeholder="Designation"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Office Tel No.
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecoffteledit" runat="server" placeholder="Office Telephone No."
                                                                    ValidationGroup="Grplead3" Width="86%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Annual Salary
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsecannualsaledit" runat="server" Width="86%" placeholder="Annual Salary"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Image
                                                            </td>
                                                            <td width="20%">
                                                                <asp:FileUpload ID="fileupload3" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                        <button class="btn btn-app btn-success btn-mini radius-4" id="btnSubmitSecconedit"
                                                            runat="server" validationgroup="Grplead3" onserverclick="btnSubmitSecconedit_ServerClick">
                                                            Save</button>
                                                        <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclearSecconedit"
                                                            runat="server" onserverclick="btnclearSecconedit_ServerClick">
                                                            Close</button>
                                                        <asp:ValidationSummary ID="ValidationSummary10" runat="server" ShowMessageBox="True"
                                                            ValidationGroup="Grplead3" ShowSummary="False" />
                                                    </div>
                                                </div>
                                                <div class="alert alert-danger" id="divseccontacterror" runat="server">
                                                    <strong>
                                                        <asp:Label ID="lblseccontacterror" runat="server"></asp:Label></strong>
                                                </div>
                                                <div class="well" style="text-align: center; background-color: #F0F0F0" id="divstdparinfo"
                                                    runat="server">
                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep2prev" onserverclick="btnstep2prev_ServerClick"
                                                        runat="server">
                                                        Back</button>
                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep3next" runat="server"
                                                        validationgroup="Val3" onserverclick="btnstep3next_ServerClick">
                                                        Next</button>
                                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True"
                                                        ValidationGroup="Val3" ShowSummary="False" />
                                                </div>
                                            </div>
                                            <!--End of Secondary Contact Details -->
                                            <div id="divsubjectpreference" runat="server">
                                                <div class="row-fluid">
                                                    <div class="col-md-12 ">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="6">
                                                                        Stream Selection
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tr>
                                                                <td width="10%">
                                                                    Application No.
                                                                    <asp:Label ID="label27" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtappnumber" Enabled="false" Placeholder="Application No." runat="server"
                                                                        Width="86%" ValidationGroup="val2" MaxLength="10" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                </td>
                                                                <td width="10%">
                                                                    Company
                                                                    <asp:Label ID="label28" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlcompany" Enabled="false" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                                        data-placement="top" data-content="Select Company">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator68" ControlToValidate="ddlcompany"
                                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Company"
                                                                        InitialValue="Select" />
                                                                </td>
                                                                <td width="10%">
                                                                    Division
                                                                    <asp:Label ID="label29" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddldivision" Enabled="false" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                                        data-placement="top" data-content="Select Division">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator71" ControlToValidate="ddldivision"
                                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Division"
                                                                        InitialValue="Select" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="10%">
                                                                    Center
                                                                    <asp:Label ID="label30" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlcenter" Enabled="false" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                                        data-placement="top" data-content="Select Center">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator72" ControlToValidate="ddlcenter"
                                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Center"
                                                                        InitialValue="Select" />
                                                                </td>
                                                                <td width="10%">
                                                                    Academic Year
                                                                    <asp:Label ID="label31" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlacademicyear" Enabled="false" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                                        data-placement="top" data-content="Select Academic Year">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator69" ControlToValidate="ddlacademicyear"
                                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Academic Year"
                                                                        InitialValue="Select" />
                                                                </td>
                                                                <td width="10%">
                                                                    Stream
                                                                    <asp:Label ID="label32" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlstream" Enabled="false" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                                        data-placement="top" data-content="Select Stream">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator70" ControlToValidate="ddlstream"
                                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Stream"
                                                                        InitialValue="Select" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="col-md-4">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>
                                                                        Complusory Subjects
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                        <asp:DataList ID="dlcomplusorysubject" Enabled="false" runat="server" Width="100%"
                                                            CssClass="table table-striped table-bordered table-hover">
                                                            <HeaderTemplate>
                                                                <b>Sr. No</b></th>
                                                                <th>
                                                                    Product Name
                                                                    <%--<th>Product Value--%>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%#Container.ItemIndex+1 %></td>
                                                                <td>
                                                                    <asp:Label ID="lblsgrdesc" Text='<%#DataBinder.Eval(Container.DataItem, "material_desc")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <asp:Label ID="lblmaterialcode" Text='<%#DataBinder.Eval(Container.DataItem, "material_code")%>'
                                                                    runat="server" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>
                                                                        Languages
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                        <asp:DataList ID="dlcompulsorylanguages" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                            <HeaderTemplate>
                                                                <b>Sr. No</b></th>
                                                                <th>
                                                                    Product Name
                                                                </th>
                                                                <th>
                                                                    Preference
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%#Container.ItemIndex+1 %></td>
                                                                <td>
                                                                    <asp:Label ID="lblsgrdesc1" Text='<%#DataBinder.Eval(Container.DataItem, "material_desc")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtpref" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "preference")%>'></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator22" ControlToValidate="txtpref"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                    <asp:CompareValidator ID="comparevalidator7" runat="server" ControlToValidate="txtpref"
                                                                        ValueToCompare="0" Operator="GreaterThan" ValidationGroup="Val4" Type="Integer"
                                                                        Text="#" SetFocusOnError="true" ErrorMessage="Please enter attempts greater than 0"></asp:CompareValidator>
                                                                    <asp:CompareValidator ID="comparevalidator2" runat="server" ControlToValidate="txtpref"
                                                                        ValueToCompare="4" Operator="LessThan" ValidationGroup="Val4" Type="Integer"
                                                                        Text="#" SetFocusOnError="true" ErrorMessage="Please enter attempts greater than 0"></asp:CompareValidator>
                                                                    <asp:Label ID="lblmaterialcode" Text='<%#DataBinder.Eval(Container.DataItem, "material_code")%>'
                                                                        runat="server" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>
                                                                        Combination
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                        <asp:DataList ID="dlspecialization" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                            <HeaderTemplate>
                                                                <b>Sr. No</b></th>
                                                                <th>
                                                                    Product Name
                                                                </th>
                                                                <th>
                                                                    Preference
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%#Container.ItemIndex+1 %></td>
                                                                <td>
                                                                    <asp:Label ID="lblsgrdesc2" Text='<%#DataBinder.Eval(Container.DataItem, "material_desc")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtpref1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "preference")%>'></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator22" ControlToValidate="txtpref1"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                    <asp:CompareValidator ID="comparevalidator7" runat="server" ControlToValidate="txtpref1"
                                                                        ValueToCompare="0" Operator="GreaterThan" ValidationGroup="Val4" Type="Integer"
                                                                        Text="#" SetFocusOnError="true" ErrorMessage="Please enter attempts greater than 0"></asp:CompareValidator>
                                                                    <asp:CompareValidator ID="comparevalidator1" runat="server" ControlToValidate="txtpref1"
                                                                        ValueToCompare="4" Operator="LessThan" ValidationGroup="Val4" Type="Integer"
                                                                        Text="#" SetFocusOnError="true" ErrorMessage="Please enter attempts greater than 0"></asp:CompareValidator>
                                                                    <asp:Label ID="lblmaterialcode" Text='<%#DataBinder.Eval(Container.DataItem, "material_code")%>'
                                                                        runat="server" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>
                                                </div>
                                                <div class="well" style="text-align: center; background-color: #F0F0F0" id="divsubjectchoice"
                                                    runat="server">
                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep3prev" runat="server"
                                                        onserverclick="btnstep3prev_ServerClick">
                                                        Back</button>
                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep4next" runat="server"
                                                        validationgroup="val2" onserverclick="btnstep4next_ServerClick">
                                                        Next
                                                    </button>
                                                    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True"
                                                        ValidationGroup="val2" ShowSummary="False" />
                                                </div>
                                            </div>
                                            <!--End of Subject Preference -->
                                            <div id="divMiscellaneous" runat="server">
                                                <div class="row-fluid">
                                                    <div class="col-md-12 ">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="6">
                                                                        Last Examinaton Details
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tr>
                                                                <td width="10%">
                                                                    School
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtLastSchname" runat="server" Placeholder="School Name" Width="86%"
                                                                        ValidationGroup="Val4" data-trigger="hover" data-placement="top" data-content="Enter Student Last attended School Name"> </asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator id="RequiredFieldValidator18" ControlToValidate="txtLastSchname" Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Enter Student Last attended School Name " />
                                                                    --%><%--<asp:RegularExpressionValidator ID="RegularExpressionValidator54" runat="server" ControlToValidate="txtLastSchname" ErrorMessage="Please input alphabets"  ValidationGroup ="Val4" Text ="#" SetFocusOnError ="true"  ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                    --%>
                                                                </td>
                                                                <td width="10%">
                                                                    City / Place
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtschoolplacename" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        Placeholder="School Place" data-trigger="hover" data-placement="top" data-content="Enter Student School Place"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator id="RequiredFieldValidator19" ControlToValidate="txtschoolplacename" Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Enter Student School Place " />
                                                                    --%><asp:RegularExpressionValidator ID="RegularExpressionValidator55" runat="server"
                                                                        ControlToValidate="txtschoolplacename" ErrorMessage="Please input alphabets"
                                                                        ValidationGroup="Val4" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                </td>
                                                                <td width="10%">
                                                                    Area / Location
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtschoolexactlocation" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        Placeholder="School Exact Locality" data-trigger="hover" data-placement="top"
                                                                        data-content="Enter Student School Exact Locality"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator id="RequiredFieldValidator20" ControlToValidate="txtschoolexactlocation" Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Enter Student School Exact Locality " />
                                                                    --%><asp:RegularExpressionValidator ID="RegularExpressionValidator56" runat="server"
                                                                        ControlToValidate="txtschoolexactlocation" ErrorMessage="Please input alphabets"
                                                                        ValidationGroup="Val4" Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_'.]*$" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="10%">
                                                                    Medium of Instruction
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlmediumofinstruction" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" ValidationGroup="Val4" data-trigger="hover" data-placement="top"
                                                                        data-content="Select Medium of Instruction">
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator id="RequiredFieldValidator23" ControlToValidate="ddlmediumofinstruction" Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True"  ErrorMessage="Select Medium of Instruction" InitialValue="Select" />
                                                                    --%>
                                                                </td>
                                                                <td width="10%">
                                                                    Last Exam Passed
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtlastexampassed" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        Placeholder="Last Exam Passed" data-trigger="hover" data-placement="top" data-content="Enter Last Exam passed"></asp:TextBox>
                                                                </td>
                                                                <td width="10%">
                                                                    State
                                                                    <%--<asp:Label ID="label79" runat ="server" Text =" *" ForeColor="#FF3300"></asp:Label>--%>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtlastexampassstate" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        Placeholder="Last Exam Passed State" data-trigger="hover" data-placement="top"
                                                                        data-content="Enter Last Exam passed State"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr id="tr6" runat="server" visible="False">
                                                                <td width="10%" id="td20" runat="server" visible="False">
                                                                    Specify Medium of Instru.
                                                                    <asp:Label ID="label52" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%" id="td21" runat="server" visible="False">
                                                                    <asp:TextBox ID="txtmediumofinstrspecify" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        data-trigger="hover" data-placement="top" data-content="Specify Medium of Instruction"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" ControlToValidate="txtmediumofinstrspecify"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Specify Medium of Instruction " />
                                                                </td>
                                                                <td width="10%" id="td22" runat="server" visible="False">
                                                                    Specify Exam Passed
                                                                    <asp:Label ID="label53" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%" id="td23" runat="server" visible="False">
                                                                    <asp:TextBox ID="Txtexampassedspecify" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        data-trigger="hover" data-placement="top" data-content="Specify Exam passed "></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" ControlToValidate="Txtexampassedspecify"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Specify exam passed " />
                                                                </td>
                                                                <td id="td24" runat="server" visible="false">
                                                                </td>
                                                                <td id="td25" runat="server" visible="false">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="10%">
                                                                    No. of Attempts
                                                                    <asp:Label ID="label54" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtnoofattempts" runat="server" MaxLength="1" ValidationGroup="Val4"
                                                                        Width="86%" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"
                                                                        data-trigger="hover" data-placement="top" data-content="Enter Number of Attempts"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ControlToValidate="txtnoofattempts"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Enter No. of Attemps" />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator22" ControlToValidate="txtnoofattempts"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                    <asp:CompareValidator ID="comparevalidator7" runat="server" ControlToValidate="txtnoofattempts"
                                                                        ValueToCompare="0" Operator="GreaterThan" ValidationGroup="Val4" Type="Integer"
                                                                        Text="#" SetFocusOnError="true" ErrorMessage="Please enter attempts greater than 0"></asp:CompareValidator>
                                                                </td>
                                                                <td width="10%">
                                                                    Year of Passing
                                                                    <asp:Label ID="label55" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlyearofpassing" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" ValidationGroup="Val4" data-trigger="hover" data-placement="top"
                                                                        data-content="Select Year of Passing">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ControlToValidate="ddlyearofpassing"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Select Year of Passing"
                                                                        InitialValue="Select" />
                                                                </td>
                                                                <td width="10%">
                                                                    Month of Passing
                                                                    <asp:Label ID="label56" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddlMonthofpassing" runat="server" data-placeholder="Select"
                                                                        CssClass="chzn-select" ValidationGroup="Val4" data-trigger="hover" data-placement="top"
                                                                        data-content="Select Month of Passing">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" ControlToValidate="ddlMonthofpassing"
                                                                        Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True" ErrorMessage="Select Month of Passing"
                                                                        InitialValue="Select" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="10%">
                                                                    Registration No.
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="Txtregistrationno" runat="server" Width="86%" ValidationGroup="Val4"
                                                                        Placeholder="Registration No." data-trigger="hover" data-placement="top" data-content="Enter Exam Registration No."></asp:TextBox>
                                                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtregistrationno" ErrorMessage="Please input alphabets"  ValidationGroup ="Val4" Text ="#" SetFocusOnError ="true"  ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                    --%>
                                                                </td>
                                                                <td width="10%" colspan="2">
                                                                    <button type="button" class="btn btn-sm yellow " id="btnaddmarks" runat="server"
                                                                        onserverclick="btnaddmarks_ServerClick">
                                                                        Add Subject Marks</button>
                                                                </td>
                                                                <td width="10%">
                                                                </td>
                                                                <td width="20%">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div class="row-fluid">
                                                            <div class="col-md-8 ">
                                                                <div id="divmarks" runat="server" style="height: 200px; overflow: Auto">
                                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="6">
                                                                                    Add Marks
                                                                                </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tr>
                                                                            <td width="10%">
                                                                                Subject
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:TextBox ID="txtsubjectname" runat="server" Width="86%" ValidationGroup="Val40"
                                                                                    Placeholder="Subject" data-trigger="hover" data-placement="top" data-content="Enter Subject"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator62" ControlToValidate="txtsubjectname"
                                                                                    Text="#" runat="server" ValidationGroup="Val40" SetFocusOnError="True" ErrorMessage="Enter Language 1 Name" />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator57" runat="server"
                                                                                    ControlToValidate="txtsubjectname" ErrorMessage="Please input alphabets" ValidationGroup="Val40"
                                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                            </td>
                                                                            <td width="10%">
                                                                                Max Marks
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:TextBox ID="txtmaxmarks" runat="server" Width="86%" ValidationGroup="Val40"
                                                                                    Placeholder="Max Marks" data-trigger="hover" data-placement="top" data-content="Enter MAx marks"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" ControlToValidate="txtmaxmarks"
                                                                                    Text="#" runat="server" ValidationGroup="Val40" SetFocusOnError="True" ErrorMessage="Enter Max. Marks" />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator31" ControlToValidate="txtmaxmarks"
                                                                                    Text="#" runat="server" ValidationGroup="Val40" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td width="10%">
                                                                                Marks Obtained
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:TextBox ID="txtmarksobtained" runat="server" Width="86%" ValidationGroup="Val40"
                                                                                    Placeholder="Marks Obtained" data-trigger="hover" data-placement="top" data-content="Enter Marks Obtained"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator59" ControlToValidate="txtmarksobtained"
                                                                                    Text="#" runat="server" ValidationGroup="Val40" SetFocusOnError="True" ErrorMessage="Enter Marks Obtained" />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator32" ControlToValidate="txtmarksobtained"
                                                                                    Text="#" runat="server" ValidationGroup="Val40" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                                <asp:CompareValidator ID="comparevalidator5" runat="server" ControlToValidate="txtmarksobtained"
                                                                                    ControlToCompare="txtmaxmarks" Operator="LessThanEqual" ValidationGroup="Val40"
                                                                                    Type="Integer" Text="#" SetFocusOnError="true" ErrorMessage="Marks Obtained cannot be greater than Max Marks"></asp:CompareValidator>
                                                                            </td>
                                                                            <tr>
                                                                                <td colspan="6">
                                                                                    <button class="btn btn-app btn-success btn-mini radius-4" id="btnmarksave" runat="server"
                                                                                        validationgroup="Val40" onserverclick="btnmarksave_ServerClick">
                                                                                        Save</button>
                                                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnmarkscancel" runat="server"
                                                                                        onserverclick="btnmarkscancel_ServerClick">
                                                                                        Close</button>
                                                                                    <asp:ValidationSummary ID="ValidationSummary6" runat="server" ShowMessageBox="True"
                                                                                        ValidationGroup="Val40" ShowSummary="False" />
                                                                                </td>
                                                                            </tr>
                                                                        </tr>
                                                                    </table>
                                                                    <%--<div class="form-actions fluid" id="div1" runat ="server">
                                                                    <div class="col-md-offset-4 col-md-8">
                                                                        </div>
                                                                </div>--%>
                                                                </div>
                                                                <asp:DataList ID="dlsubjectmarks" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                                                                    OnItemCommand="dlsubjectmarks_ItemCommand" OnItemDataBound="dlsubjectmarks_ItemDataBound">
                                                                    <HeaderTemplate>
                                                                        <b>Subject</b></th>
                                                                        <th>
                                                                            Max. Marks
                                                                        </th>
                                                                        <th>
                                                                            Marks Obtained
                                                                        </th>
                                                                        <th>
                                                                            Action
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl1" Text='<%#DataBinder.Eval(Container.DataItem, "Subject")%>' runat="server"></asp:Label></td>
                                                                        <td>
                                                                            <asp:Label ID="Label1" Text='<%#DataBinder.Eval(Container.DataItem, "Max_Marks")%>'
                                                                                runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label2" Text='<%#DataBinder.Eval(Container.DataItem, "Marks_Obtained")%>'
                                                                                runat="server"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lnkedit" runat="server" class="btn btn-app btn-primary btn-mini radius-4"
                                                                                CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'><i class="fa fa-edit"></i> Edit</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <div class="alert alert-danger" id="divsubjecterror" runat="server">
                                                                    <strong>
                                                                        <asp:Label ID="Label33" runat="server"></asp:Label></strong>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DataList ID="dlScore" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                                    <HeaderTemplate>
                                                                        <b>Score Type</b></th>
                                                                        <th>
                                                                            Score
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblscoretypedesc" Text='<%#DataBinder.Eval(Container.DataItem, "Score_Type_Short_Desc")%>'
                                                                            runat="server"></asp:Label></td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtscore" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Score")%>'></asp:TextBox>
                                                                            <asp:Label ID="lblscoreid" Text='<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <div class="alert alert-danger" id="divscoreerror" runat="server">
                                                                    <strong>
                                                                        <asp:Label ID="lblscoreerror" runat="server"></asp:Label></strong>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                    Extra Curricular Activities
                                                                </th>
                                                                <th width="15%">
                                                                    <button type="button" class="btn btn-app btn-primary btn-mini radius-4" id="btnaddextraactivity"
                                                                        runat="server" onserverclick="btnaddextraactivity_ServerClick">
                                                                        Add Extra Curricular Activity</button>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <div id="divextraactivity" runat="server" style="height: 200px; overflow: Auto">
                                                        <table class="table table-striped table-bordered table-advance table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="4">
                                                                        Add Extra Curricular Activities
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tr>
                                                                <td width="10%">
                                                                    Level
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:DropDownList ID="ddllevel" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                        ValidationGroup="Val41" data-trigger="hover" data-placement="top" data-content="Select Activity Level">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="ddllevel"
                                                                        Text="#" runat="server" ValidationGroup="Val41" SetFocusOnError="True" ErrorMessage="Select Activity Level"
                                                                        InitialValue="Select" />
                                                                </td>
                                                                <td width="10%">
                                                                    Details
                                                                </td>
                                                                <td width="20%">
                                                                    <asp:TextBox ID="txtdescription" runat="server" Width="86%" ValidationGroup="Val41"
                                                                        Placeholder="Activity Details" data-trigger="hover" data-placement="top" data-content="Enter Activity Details"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="txtdescription"
                                                                        Text="#" runat="server" ValidationGroup="Val41" SetFocusOnError="True" ErrorMessage="Enter Details" />
                                                                </td>
                                                                <tr>
                                                                    <td colspan="4">
                                                                        <button class="btn blue " id="btnextraactsave" runat="server" validationgroup="Val41"
                                                                            onserverclick="btnextraactsave_ServerClick">
                                                                            Save</button>
                                                                        <button class="btn default " id="btnextraactcancel" runat="server" onserverclick="btnextraactcancel_ServerClick">
                                                                            Close</button>
                                                                        <asp:ValidationSummary ID="ValidationSummary7" runat="server" ShowMessageBox="True"
                                                                            ValidationGroup="Val41" ShowSummary="False" />
                                                                    </td>
                                                                </tr>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <asp:DataList ID="dlextracurricular" OnItemCommand="dlextracurricular_ItemCommand"
                                                        OnItemDataBound="dlextracurricular_ItemDataBound" runat="server" Width="100%"
                                                        CssClass="table table-striped table-bordered table-hover" Style="height: 100px;
                                                        overflow: Auto">
                                                        <HeaderTemplate>
                                                            <b>Level</b></th>
                                                            <th>
                                                                Details
                                                            </th>
                                                            <th>
                                                                Action
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%--<asp:CheckBox ID="checkpoint" runat ="server" /></td>--%>
                                                            <asp:Label ID="lbl1" Text='<%#DataBinder.Eval(Container.DataItem, "Curricular_Activity_SDesc")%>'
                                                                runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label34" Text='<%#DataBinder.Eval(Container.DataItem, "Description")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkedit" runat="server" class="btn btn-app btn-primary btn-mini radius-4"
                                                                    CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID")%>'>Edit</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <div class="alert alert-danger" id="DivExtracurrlierror" runat="server">
                                                        <strong>
                                                            <asp:Label ID="lblextracurricuerror" runat="server"></asp:Label></strong>
                                                    </div>
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="6">
                                                                    Miscellaneous
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Hostel facility
                                                                <asp:Label ID="label50" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlstay" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                    ValidationGroup="Val4" data-trigger="hover" data-placement="top" data-content="Select Student Current Stay"
                                                                    data-original-title="Stay">
                                                                    <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator id="RequiredFieldValidator24" ControlToValidate="ddlstay" Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="True"  ErrorMessage="Select Student Current Stay" InitialValue="Select" />
                                                                --%>
                                                            </td>
                                                            <td width="10%">
                                                            </td>
                                                            <td width="20%">
                                                            </td>
                                                            <td width="10%">
                                                            </td>
                                                            <td width="20%">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="modal fade" id="Subjectmarks" tabindex="-1" role="basic" aria-hidden="true"
                                                        data-keyboard="false">
                                                        <div class="modal-dialog modal-small blue">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" id="btnsubjectmarksclose1" runat="server" onserverclick="btnsubjectmarksclose1_ServerClick">
                                                                    </button>
                                                                    <h4 class="modal-title">
                                                                        Edit Subject Details</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="scroller" style="height: 200px" data-always-visible="1" data-rail-visible1="1">
                                                                        <div class="row-fluid">
                                                                            <div class="span12">
                                                                                <div class="table-responsive">
                                                                                    <table class="table table-striped table-bordered table-advance table-hover" width="100%">
                                                                                        <tr>
                                                                                            <td width="10%">
                                                                                                Subject
                                                                                            </td>
                                                                                            <td width="20%">
                                                                                                <asp:TextBox ID="txtsubjectmarksedit" runat="server" Width="86%" ValidationGroup="Val45"
                                                                                                    Placeholder="Subject" data-trigger="hover" data-placement="top" data-content="Enter Subject"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" ControlToValidate="txtsubjectmarksedit"
                                                                                                    Text="#" runat="server" ValidationGroup="Val45" SetFocusOnError="True" ErrorMessage="Enter Language 1 Name" />
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtsubjectmarksedit"
                                                                                                    ErrorMessage="Please input alphabets" ValidationGroup="Val45" Text="#" SetFocusOnError="true"
                                                                                                    ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="10%">
                                                                                                Max Marks
                                                                                            </td>
                                                                                            <td width="20%">
                                                                                                <asp:TextBox ID="txtmaxmarksedit" runat="server" Width="86%" ValidationGroup="Val45"
                                                                                                    Placeholder="Max Marks" data-trigger="hover" data-placement="top" data-content="Enter MAx marks"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="txtmaxmarksedit"
                                                                                                    Text="#" runat="server" ValidationGroup="Val45" SetFocusOnError="True" ErrorMessage="Enter Max. Marks" />
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="txtmaxmarksedit"
                                                                                                    Text="#" runat="server" ValidationGroup="Val45" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="10%">
                                                                                                Marks Obtained
                                                                                            </td>
                                                                                            <td width="20%">
                                                                                                <asp:TextBox ID="txtmarksobtedit" runat="server" Width="86%" ValidationGroup="Val45"
                                                                                                    Placeholder="Marks Obtained" data-trigger="hover" data-placement="top" data-content="Enter Marks Obtained"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" ControlToValidate="txtmarksobtedit"
                                                                                                    Text="#" runat="server" ValidationGroup="Val45" SetFocusOnError="True" ErrorMessage="Enter Marks Obtained" />
                                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" ControlToValidate="txtmarksobtedit"
                                                                                                    Text="#" runat="server" ValidationGroup="Val45" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                                                <asp:CompareValidator ID="comparevalidator3" runat="server" ControlToValidate="txtmarksobtedit"
                                                                                                    ControlToCompare="txtmaxmarksedit" Operator="LessThanEqual" ValidationGroup="Val40"
                                                                                                    Type="Integer" Text="#" SetFocusOnError="true" ErrorMessage="Marks Obtained cannot be greater than Max Marks"></asp:CompareValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:Label ID="lblsubid" runat="server" Visible="false"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-app btn-primary btn-mini radius-4" id="btnsubjectmarksclose"
                                                                        onserverclick="btnsubjectmarksclose_ServerClick" runat="server">
                                                                        Close</button>
                                                                    <button type="button" class="btn btn-app btn-success btn-mini radius-4" runat="server"
                                                                        id="btnsubectmarkssave" validationgroup="Val45" onserverclick="btnsubectmarkssave_ServerClick">
                                                                        Save
                                                                    </button>
                                                                    <asp:ValidationSummary ID="ValidationSummary9" runat="server" ShowMessageBox="True"
                                                                        ValidationGroup="Val45" ShowSummary="False" />
                                                                </div>
                                                            </div>
                                                            <!-- /.modal-content -->
                                                        </div>
                                                        <!-- /.modal-dialog -->
                                                    </div>
                                                    <div class="modal fade" id="editextracurricular" tabindex="-1" role="basic" aria-hidden="true"
                                                        data-keyboard="false">
                                                        <div class="modal-dialog modal-small blue">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" id="btncloseextracurri1" runat="server" onserverclick="btncloseextracurri1_ServerClick">
                                                                    </button>
                                                                    <h4 class="modal-title">
                                                                        Edit Extra Curricular Activities</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="scroller" style="height: 200px" data-always-visible="1" data-rail-visible1="1">
                                                                        <div class="row-fluid">
                                                                            <div class="span12">
                                                                                <div class="table-responsive">
                                                                                    <table class="table table-striped table-bordered table-advance table-hover" width="100%">
                                                                                        <tr>
                                                                                            <td width="10%">
                                                                                                Level
                                                                                            </td>
                                                                                            <td width="20%">
                                                                                                <asp:DropDownList ID="ddleditlevel" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                                                    ValidationGroup="Val46" data-trigger="hover" data-placement="top" data-content="Select Activity Level">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" ControlToValidate="ddleditlevel"
                                                                                                    Text="#" runat="server" ValidationGroup="Val46" SetFocusOnError="True" ErrorMessage="Select Activity Level"
                                                                                                    InitialValue="Select" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="10%">
                                                                                                Details
                                                                                            </td>
                                                                                            <td width="20%">
                                                                                                <asp:TextBox ID="txtxeditdtls" runat="server" Width="86%" ValidationGroup="Val46"
                                                                                                    Placeholder="Activity Details" data-trigger="hover" data-placement="top" data-content="Enter Activity Details"
                                                                                                    TextMode="MultiLine"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" ControlToValidate="txtxeditdtls"
                                                                                                    Text="#" runat="server" ValidationGroup="Val46" SetFocusOnError="True" ErrorMessage="Enter Details" />
                                                                                            </td>
                                                                                    </table>
                                                                                    <asp:Label ID="lblcurricluarid" runat="server" Visible="false"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-app btn-primary btn-mini radius-4" id="btncloseextracurri"
                                                                        runat="server" onserverclick="btncloseextracurri_ServerClick">
                                                                        Close</button>
                                                                    <button type="button" class="btn btn-app btn-success btn-mini radius-4" runat="server"
                                                                        id="btnsaveextracurri" validationgroup="Val46" onserverclick="btnsaveextracurri_ServerClick">
                                                                        Save
                                                                    </button>
                                                                    <asp:ValidationSummary ID="ValidationSummary8" runat="server" ShowMessageBox="True"
                                                                        ValidationGroup="Val46" ShowSummary="False" />
                                                                </div>
                                                            </div>
                                                            <!-- /.modal-content -->
                                                        </div>
                                                        <!-- /.modal-dialog -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="alert alert-danger" id="divmessage" runat="server">
                                    <strong>
                                        <asp:Label ID="lblmessage" runat="server"></asp:Label></strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnstep1next" />
                    <asp:PostBackTrigger ControlID="btnstep2prev" />
                    <asp:PostBackTrigger ControlID="btnstep3next" />
                    <asp:PostBackTrigger ControlID="btnstep3prev" />
                    <asp:PostBackTrigger ControlID="btnstep4next" />
                    <asp:PostBackTrigger ControlID="btnaddSeccontact" />
                    <asp:PostBackTrigger ControlID="btnaddmarks" />
                    <asp:PostBackTrigger ControlID="btnmarksave" />
                    <asp:PostBackTrigger ControlID="btnmarkscancel" />
                    <asp:PostBackTrigger ControlID="btnextraactsave" />
                    <asp:PostBackTrigger ControlID="btnextraactcancel" />
                    <asp:PostBackTrigger ControlID="btnaddextraactivity" />
                    <asp:PostBackTrigger ControlID="btnSubmitSeccon" />
                    <asp:PostBackTrigger ControlID="btnclearSeccon" />
                    <asp:PostBackTrigger ControlID="btnSubmitSecconedit" />
                    <asp:PostBackTrigger ControlID="btnclearSecconedit" />
                    <asp:PostBackTrigger ControlID="btnsubjectmarksclose" />
                    <asp:PostBackTrigger ControlID="btnsubjectmarksclose1" />
                    <asp:PostBackTrigger ControlID="btnsubectmarkssave" />
                    <asp:PostBackTrigger ControlID="btncloseextracurri1" />
                    <asp:PostBackTrigger ControlID="btncloseextracurri" />
                    <asp:PostBackTrigger ControlID="btnsaveextracurri" />
                    <%--<asp:PostBackTrigger ControlID ="btnFormsubmit" />--%>
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upnlImage" runat="server">
                <ContentTemplate>
                    <div class="row-fluid">
                        <div class="span12">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <tr>
                                    <td width="5%">
                                        <br />
                                        <br />
                                        Image
                                    </td>
                                    <td width="20%">
                                        <asp:Image ID="Imgstudent" runat="server" AlternateText="Not Available" Height="125px"
                                            Width="112px" /><br />
                                        <asp:FileUpload ID="FileuploadStudent" runat="server" onchange="ShowpImagePreview(this);"
                                            Width="106px" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator599" ControlToValidate="FileuploadStudent"
                                            Text="#" runat="server" ValidationGroup="Val4" SetFocusOnError="true" ErrorMessage="Please Select image in jpg and jpeg format only"
                                            ValidationExpression=".*(\.jpg|\.jpeg)$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                            <div class="well" style="text-align: center; background-color: #F0F0F0" id="divsubmitbuttons"
                                runat="server">
                                <button class="btn btn-app btn-primary btn-mini radius-4" id="btnstep3prevnew" runat="server"
                                    onserverclick="btnstep3prevnew_ServerClick">
                                    Back</button>
                                <button class="btn btn-app btn-success btn-mini radius-4" id="btnFormsubmit" runat="server"
                                    validationgroup="Val4">
                                    Save</button>
                                <button class="btn btn-app btn-primary btn-mini radius-4" id="btnAccountcancel" runat="server"
                                    onserverclick="btnAccountcancel_ServerClick">
                                    Close</button>
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                                    ValidationGroup="Val4" ShowSummary="False" />
                                <asp:Label ID="lblprimarycontactid" runat="server" Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnstep3prevnew" />
                    <asp:PostBackTrigger ControlID="btnAccountcancel" />
                    <asp:PostBackTrigger ControlID="btnFormsubmit" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- END PAGE CONTENT FOR ADD OPP-->
        </div>
    </div>
    <!-- END CONTENT -->
</asp:Content>
