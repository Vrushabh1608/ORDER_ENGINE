﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="I_Card_Print.aspx.cs" Inherits="I_Card_Print" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" Runat="Server">
<asp:ScriptManager ID="script1" runat="server">
    </asp:ScriptManager>
    <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid hidden-print">
                <div id="breadcrumbs" class="position-relative" style="height: 53px">
                    <ul class="breadcrumb" style="height: 15px">
                        <li><i class="icon-home"></i><a href="Homepage.aspx">Home</a><span class="divider"><i
                            class="icon-angle-right"></i></span></li>
                        <li>
                            <h4 class="blue">
                                <asp:Label ID="lblpagetitle1" runat="server"></asp:Label>&nbsp;<b><asp:Label ID="lblstudentname"
                                    runat="server" ForeColor="DarkRed"></asp:Label></b><small> &nbsp;
                                        <asp:Label ID="lblpagetitle2" runat="server"></asp:Label></small>
                                <asp:Label ID="lblusercompany" runat="server" Visible="false"></asp:Label>
                                <span class="divider"></span>
                               
                            </h4>
                        </li>
                        <li id="limidbreadcrumb" runat="server" visible="false"><a href="lead.aspx">
                            <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label></a></li>
                        <li id="lilastbreadcrumb" runat="server" visible="false"><i class="fa fa-angle-right">
                        </i><a href="#">
                            <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a>
                            
                        </li>

                        
                        

                        <li class="btn-group" id="liregno" runat="server" visible ="false" >
                            <button type="button" class="btn purple dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                                data-delay="1000" data-close-others="true" visible ="false" >
                                <span>Actions </span><i class="fa fa-angle-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                                <li><a id="A2" runat="server" href="Series.aspx" target="_blank">Manage Statutory Info.</a>
                                </li>
                            </ul>
                        </li>
                        <li class="btn-group"><a data-loading-text="Loading..." class="demo-loading-btn btn blue"
                            runat="server" visible="false" target="_blank" id="btnviewenrollment" style="margin-right: 197px;
                            position: relative"><i class="fa fa-bullhorn"></i>View Order</a>&nbsp; 
                        </li>
                        
                        
                    </ul>
                    <div id="nav-search">
                        <span id="listudentstatus" runat="server">
                        <span id="badgeError" runat="server" class="badge badge-important" visible ="false">Student Status : Pending</span>
                        <span id="Span1" runat="server" class="badge badge-important" visible ="false">Student Status : Cancelled</span>
                        <span id="badgeSuccess" runat="server" class="badge badge-success" visible ="false" >Student Status : Confirmed</span>
                        <asp:Label ID="lblstdstaus" runat="server" Visible ="false" ></asp:Label>
                        </span>
                        <!-- /btn-group -->
                        
                        

                        <button type="button" class="btn btn-app btn-primary btn-mini radius-4 dropdown-toggle"
                            data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
                            <span>Actions </span><i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li><a id="A1" runat="server" href="Series.aspx" target="_blank" visible ="false">Manage Statutory Info.</a></li>
                            <li><a id="btnviewenv" runat="server" target="_blank" visible ="false"><i class="fa fa-chain"></i>View Enrollment</a></li>
                            <li><a id="a1new" href="Accounts.aspx"  runat="server"><i class="fa fa-chain"></i>Account Search</a></li>
                        </ul>
                    </div>

                    <%--<!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">
                        <asp:Label ID="lblpagetitle1" runat="server"></asp:Label>&nbsp;<b><asp:Label ID="lblstudentname"
                            runat="server" ForeColor="DarkRed"></asp:Label></b><small> &nbsp;
                                <asp:Label ID="lblpagetitle2" runat="server"></asp:Label></small>
                        <asp:Label ID="lblusercompany" runat="server" Visible="false"></asp:Label>
                    </h3>
                    <ul class="page-breadcrumb breadcrumb">
                        
                        
                        
                        
                        <li><i class="fa fa-home"></i><a href="Homepage.aspx">Home</a><i class="fa fa-angle-right"></i>
                        </li>
                        <li id="limidbreadcrumb" runat="server"><a href="Accounts.aspx">
                            <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label></a></li>
                        <li id="lilastbreadcrumb" runat="server"><i class="fa fa-angle-right"></i><a href="#">
                            <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a></li>
                    </ul>--%>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>

            <!-- END PAGE HEADER-->
    <!-- BEGIN CONTENT -->
    <div id="page-content" class="clearfix">
        <div class="page-content">
            
            <div class="alert alert-danger" id="divErrormessage" runat="server">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblerrormessage" runat="server"></asp:Label></strong>
            </div>
            <div class="alert alert-danger" id="divpendingreuesterror" runat="server">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblpendingreuesterror" runat="server"></asp:Label></strong>
            </div>
            <div class="alert alert-success" id="divSuccessmessage" runat="server">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblsuccessMessage" runat="server"></asp:Label></strong>
            </div>
            <asp:UpdatePanel ID="upnlsearch" runat="server">
                <ContentTemplate>
                    <div class="row-fluid" id="divSearch" runat="server">
                        <div class="span12">
                            <div id="tab_1_31" class="row-fluid">
                                <div class="row-fluid" id="Divsearchcriteria" runat="server">
                                    <div class="span12">

                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Organization Assignment
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Company
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcompany" runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead12"
                                                            AutoPostBack="true" OnSelectedIndexChanged ="ddlcompany_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Division
                                                        <asp:Label ID="label44" runat="server" ForeColor="#FF3300" Text=" *"></asp:Label>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddldivision" runat="server" ValidationGroup="Grplead12"  data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddldivision_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddldivision"
                                                        Text="#" runat="server" ValidationGroup="Grplead12" SetFocusOnError="True" ErrorMessage="Select Division"
                                                        InitialValue="Select" />
                                                    </td>
                                                    <td width="10%">
                                                        Zone/Area
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlzone" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlzone_SelectedIndexChanged" >
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Location / Center
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcenter" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlcenter_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover" id="tblci"
                                                runat="server" visible="false">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Customer Information
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Customer Type
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcustomertypesearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Institution Type
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlinstitutionsearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlinstitutionsearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Board
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlboardsearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Show Only Promoted
                                                    </td>
                                                    <td width="20%">
                                                        <asp:CheckBox ID="chkpromoted" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Standard
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstandardsearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Handphone
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txthandphonesearch" runat="server" Width="70%" placeholder="Search by Handphone 1"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Event
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlevent" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        From
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txteventdatefrom" runat="server" Width="70%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MM-yyyy" TargetControlID="txteventdatefrom"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txteventdatefrom"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        To
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txteventdateto" runat="server" Width="70%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MM-yyyy" TargetControlID="txteventdateto"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txteventdateto"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover" id="tblcri"
                                                runat="server" visible="false">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Customer Residential Information
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Country
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcountrysearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlcountrysearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        State
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstatesearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlstatesearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        City
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcitysearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged ="ddlcitysearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Location
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddllocationsearch" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Stream Information
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Academic Year
                                                        <asp:Label ID="label42" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlacademicyear" runat="server" ValidationGroup="Grplead12" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlacademicyear_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator55" ControlToValidate="ddlacademicyear"
                                                        Text="#" runat="server" ValidationGroup="Grplead12" SetFocusOnError="True" ErrorMessage="Select Academic Year"
                                                        InitialValue="Select" />
                                                    </td>
                                                    <td width="10%">
                                                        Product Category
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlproductcategory" runat="server" AutoPostBack="true" data-placeholder="Select" CssClass="chzn-select">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Product
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstream" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Status
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlorderstatus" runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true">
                                                            <asp:ListItem Value="All" Selected="True">All</asp:ListItem>
                                                            <asp:ListItem Value="01">Pending</asp:ListItem>
                                                            <asp:ListItem Value="03">Confirmed</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Customer Number / SB Entry Code
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtsbentrycode" runat="server" Width="70%" placeholder="Search by SBEntrycode"></asp:TextBox>
                                                    </td>
                                                    <td width="10%" id="tdapplicationid" runat="server">
                                                        App. Form No
                                                    </td>
                                                    <td width="20%" id="tdapplicationid1" runat="server">
                                                        <asp:TextBox ID="txtapplicationno" runat="server" Width="70%" placeholder="Search by Application Form No."></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Customer Name
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtstudentname" runat="server" Width="70%" placeholder="Search by Name"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Active
                                                    </td>
                                                    <td width="20%">
                                                        <asp:CheckBox ID="Chkactive" runat="server" Checked="true" /><span class="lbl"> </span>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:TextBox ID="txtcurrentout" Visible="false" runat="server"></asp:TextBox>
                                            <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                <button class="btn btn-app btn-primary btn-mini radius-4" id="btnsearch" onserverclick="btnsearch_ServerClick" ValidationGroup="Grplead12"
                                                    runat="server">
                                                    Search
                                                </button>
                                                <asp:ValidationSummary ID="ValidationSummary17" runat="server" ShowMessageBox="True"
                                                                ValidationGroup="Grplead12" ShowSummary="False" />
                                            </div>

                                    </div>
                                </div>
                                <div class="row-fluid" id="divsearchresults" runat="server">
                                    <div class="span12">
                                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                        <div class="widget-box ">
                                            <div class="widget-header header-color-dark">
				                                <h5> I-Card Printing Search Results <asp:CheckBox ID="chkStudentAllHidden_Sel" runat="server" Visible="False" /></h5>
				                                <div class="widget-toolbar">
					                                
				                                </div>
				                                <div class="widget-toolbar">
					                                <button class="btn btn-mini btn-grey smaller" id="btnrpint" runat ="server" onserverclick ="btnprint_ServerClick"><i class="icon-print"></i> Print</button>
					                                
				                                </div>
			                                </div>
                                             <div class="widget-body">
				                                <div class="widget-main">
                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-bordered table-hover Table3">
                                                            <thead>
                                                                <tr>
                                                                     <th><asp:CheckBox ID="chkStudentAll" runat="server" AutoPostBack="True" OnCheckedChanged="All_Student_ChkBox_Selected_Sel" />
                                                                                        <span class="lbl"></span>
                                                                    </th>
                                                                    <th>
                                                                        Division
                                                                    </th>
                                                                    <th>
                                                                        Location / Center
                                                                    </th>
                                                                    <th>
                                                                        Date
                                                                    </th>
                                                                    <th>
                                                                        App. Form No.
                                                                    </th>
                                                                    <th>
                                                                        Customer Name
                                                                    </th>
                                                                    <th>
                                                                        SBEntrycode
                                                                    </th>
                                                                    <th>
                                                                        Photo
                                                                    </th>
                                                                    <th>
                                                                        Academic Year
                                                                    </th>
                                                                    <th>
                                                                        Product
                                                                    </th>
                                                                    
                                                                    
                                                                    
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="odd gradeX">
                                                            <td><asp:CheckBox ID="chkStudent" runat="server" />
                                                                                    <span class="lbl"></span></span>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1" Text='<%#DataBinder.Eval(Container.DataItem, "Division")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblcenter" Text='<%#DataBinder.Eval(Container.DataItem, "Source_Center_Name")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbldate" Text='<%#DataBinder.Eval(Container.DataItem, "EventDate")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label38" Text='<%#DataBinder.Eval(Container.DataItem, "App_no")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblcustomername" Text='<%#DataBinder.Eval(Container.DataItem, "Name")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label43" Text='<%#DataBinder.Eval(Container.DataItem, "Cur_sb_code")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImagePath")=="" ? "images/studentphoto/no_photo.jpg" : DataBinder.Eval(Container.DataItem, "ImagePath") %>' Width="50px" Height="50px" class="image" />
                                                                <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>' Width="50px" Height="50px" class="image" />--%>
                                                                <%--Text='<%# Convert.ToInt32( Eval("Is_Active")) == 1 ? "Active":"Inactive"  %>'--%>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblacadyear" Text='<%#DataBinder.Eval(Container.DataItem, "acadyear")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblproduct" Text='<%#DataBinder.Eval(Container.DataItem, "Stream")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            
                                                            <%--<td>
                                                                <asp:Label ID="lbladmissionstatus" runat="server" Font-Bold="true" ></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label30" Text='<%#DataBinder.Eval(Container.DataItem, "Adm_Status")%>'
                                                                    runat="server" Visible="false"></asp:Label>&nbsp;
                                                                <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblpromotedflag" Text='<%#DataBinder.Eval(Container.DataItem, "IsPromote")%>'
                                                                    runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lbladmnreasonid" Text='<%#DataBinder.Eval(Container.DataItem, "Account_Cancel_Reason_Id")%>'
                                                                    runat="server" Visible="false"></asp:Label>
                                                                <a href='<%#DataBinder.Eval(Container.DataItem,"Oppor_Id","Account_Display.aspx?&Oppur_ID={0}") %>'
                                                                    id="btndisplay" runat="server" target="_blank" visible="false" class="btn btn-minier btn-success icon-eye-open tooltip-success" data-rel="tooltip" data-placement="top" title="Display"></a>
                                                                 
                                                                 <a href='<%#DataBinder.Eval(Container.DataItem,"Oppor_Id","Opportunity_Add.aspx?&Oppurtunity_code={0}") %>'
                                                                    id="btndisplayopp" runat="server" target="_blank" visible="false" class="btn btn-minier btn-success icon-eye-open tooltip-success" data-rel="tooltip" data-placement="top" title="Display"></a>
                                                                
                                                                <asp:LinkButton ID="lnkEdit" runat="server" Visible="false" CommandName="Edit" class="btn btn-minier btn-primary icon-edit tooltip-info" data-rel="tooltip" data-placement="top" title="Edit"
                                                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Cur_sb_code")%>'></asp:LinkButton>

                                                                <asp:LinkButton ID="lnkledger" runat="server" CommandName="Ledger"
                                                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Cur_sb_code")%>' class="btn btn-minier btn-success icon-eye-open tooltip-success" data-rel="tooltip" data-placement="top" title="View Ledger"></asp:LinkButton>
                                                                
                                                                <a href='<%#DataBinder.Eval(Container.DataItem,"Oppor_Id","Opportunity_Edit.aspx?&Opportunity_Code={0}") %>'
                                                                    id="btneditenroll" class="btn btn-minier btn-primary icon-edit tooltip-info" data-rel="tooltip" data-placement="top" title="Edit"
                                                                     runat="server" target="_blank">
                                                                </a>
                                                                <asp:Label ID="Label6" runat="server"></asp:Label>
                                                                <asp:Label ID="lblsbentrycode" Text='<%#DataBinder.Eval(Container.DataItem, "Cur_sb_code")%>'
                                                                    runat="server" Visible="false"></asp:Label>
                                                            </td>--%>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody> </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:Label ID="lbloppurid" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblaccountid" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblpromoteflag" runat="server" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END EXAMPLE TABLE PORTLET-->
                                    </div>
                                </div>
                                <div class="alert alert-danger" id="divmessage" runat="server">
                                    <strong>
                                        <asp:Label ID="lblmessage" runat="server"></asp:Label></strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end tabbable-->
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsearch" />
                    <asp:PostBackTrigger ControlID ="btnrpint" />
                    <%--<asp:AsyncPostBackTrigger ControlID ="Exporttoexcel" />--%>
                </Triggers>
            </asp:UpdatePanel>
            </div>
    </div>
</asp:Content>

