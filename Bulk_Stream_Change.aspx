﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Bulk_Stream_Change.aspx.cs" Inherits="Bulk_Stream_Change" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContainer" runat="Server">
    <asp:ScriptManager ID="script1" runat="server">
    </asp:ScriptManager>
    <!-- BEGIN PAGE HEADER-->
    <div class="row-fluid hidden-print">
        <div id="breadcrumbs" class="position-relative">
            <ul class="breadcrumb">
                <li><i class="icon-home"></i><a href="Homepage.aspx">Home</a><span class="divider"><i
                    class="icon-angle-right"></i></span></li>
                <li>
                    <h5 class="smaller">
                        <asp:Label ID="lblpagetitle1" runat="server"></asp:Label>&nbsp;<b><asp:Label ID="lblstudentname"
                            runat="server" ForeColor="DarkRed"></asp:Label></b><small> &nbsp;
                                <asp:Label ID="lblpagetitle2" runat="server"></asp:Label></small>
                        <asp:Label ID="lblusercompany" runat="server" Visible="false"></asp:Label>
                        <span class="divider"></span>
                    </h5>
                </li>
                <li id="limidbreadcrumb" runat="server" visible="false"><a href="lead.aspx">
                    <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label></a></li>
                <li id="lilastbreadcrumb" runat="server" visible="false"><i class="fa fa-angle-right">
                </i><a href="#">
                    <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a> </li>
                <li class="btn-group" id="liregno" runat="server" visible="false">
                    <button type="button" class="btn purple dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                        data-delay="1000" data-close-others="true" visible="false">
                        <span>Actions </span><i class="fa fa-angle-down"></i>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a id="A2" runat="server" href="Series.aspx" target="_blank">Manage Statutory Info.</a>
                        </li>
                    </ul>
                </li>
                <li class="btn-group"><a data-loading-text="Loading..." class="demo-loading-btn btn blue"
                    runat="server" visible="false" target="_blank" id="btnviewenrollment" style="margin-right: 197px;
                    position: relative"><i class="fa fa-bullhorn"></i>View Order</a>&nbsp; </li>
            </ul>
            <div id="nav-search">
                <span id="listudentstatus" runat="server"><span id="badgeError" runat="server" class="badge badge-important"
                    visible="false">Student Status : Pending</span> <span id="Span1" runat="server" class="badge badge-important"
                        visible="false">Student Status : Cancelled</span> <span id="badgeSuccess" runat="server"
                            class="badge badge-success" visible="false">Student Status : Confirmed</span>
                    <asp:Label ID="lblstdstaus" runat="server" Visible="false"></asp:Label>
                </span>
                <!-- /btn-group -->
                <button type="button" class="btn btn-app btn-primary btn-mini radius-4 dropdown-toggle"
                    data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
                    <span>Actions </span><i class="fa fa-angle-down"></i>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li><a id="A1" runat="server" href="Series.aspx" target="_blank" visible="false">Manage
                        Statutory Info.</a></li>
                    <li><a id="btnviewenv" runat="server" target="_blank" visible="false"><i class="fa fa-chain">
                    </i>View Enrollment</a></li>
                    <li><a id="a1new" href="Accounts.aspx" runat="server" visible="false"><i class="fa fa-chain">
                    </i>Account Search</a></li>
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
                                                    <asp:DropDownList ID="ddlcompany" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        ValidationGroup="Grplead12" AutoPostBack="true" OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Division
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddldivision" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddldivision_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Zone/Area
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlzone" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Location / Center
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlcenter" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlcenter_SelectedIndexChanged">
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
                                                    <asp:DropDownList ID="ddlcustomertypesearch" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Institution Type
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlinstitutionsearch" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlinstitutionsearch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Board
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlboardsearch" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true">
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
                                                    <asp:DropDownList ID="ddlstandardsearch" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true">
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
                                                    <asp:DropDownList ID="ddlevent" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true">
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
                                                    <asp:DropDownList ID="ddlcountrysearch" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlcountrysearch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    State
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlstatesearch" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlstatesearch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    City
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlcitysearch" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlcitysearch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Location
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddllocationsearch" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true">
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
                                                    <asp:DropDownList ID="ddlacademicyear" runat="server" ValidationGroup="Grplead12"
                                                        data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlacademicyear_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" ControlToValidate="ddlacademicyear"
                                                        Text="#" runat="server" ValidationGroup="Grplead12" SetFocusOnError="True" ErrorMessage="Select Academic Year"
                                                        InitialValue="Select" />
                                                </td>
                                                <td width="10%">
                                                    Product Category
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlproductcategory" runat="server" AutoPostBack="true" data-placeholder="Select"
                                                        CssClass="chzn-select">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Current Product
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlstream" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    New Product
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddldestinationstream" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" 
                                                        onselectedindexchanged="ddldestinationstream_SelectedIndexChanged">
                                                    </asp:DropDownList>
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
                                            <tr>
                                                <td width="10%">
                                                    Status
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlorderstatus" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true">
                                                        <asp:ListItem Value="03" Selected="True">Confirmed</asp:ListItem>
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
                                                    <asp:CheckBox ID="Chkactive" runat="server" Checked="true" /><span class="lbl">
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="row-fluid" id="div5" runat="server">
                                            <div class="span12">
                                                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                                <div class="widget-box">
                                                    <div class="widget-header">
                                                        <h5>
                                                            <i class="fa fa-anchor"></i>Product / Item Group Selection
                                                        </h5>
                                                    </div>
                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-bordered table-advance table-hover" width="100%">
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Pay Plan
                                                                        </td>
                                                                        <td width="20%" colspan="3">
                                                                            <asp:DropDownList ID="ddlpayplan" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                                                AutoPostBack="True" ValidationGroup="Val5" OnSelectedIndexChanged="ddlpayplan_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="ddlpayplan"
                                                                                Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Pay Plan"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                        </td>
                                                                        <td width="20%">
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr19" runat="server" visible="false">
                                                                        <td width="10%">
                                                                            Opt. Product
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddllanguage" runat="server" CssClass="chzn-select" AutoPostBack="True"
                                                                                OnSelectedIndexChanged="ddllanguage_SelectedIndexChanged" ValidationGroup="Val5">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="ddllanguage"
                                                                                Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Optional Subject"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtLangvalue" runat="server" Width="88%" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td width="10%">
                                                                        </td>
                                                                        <td width="20%">
                                                                        </td>
                                                                        <td width="10%">
                                                                            Comp. Subject
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtmandateSubjects" runat="server" Width="88%" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td width="10%">
                                                                        </td>
                                                                        <td id="td3" runat="server" visible="false">
                                                                            <asp:Label ID="lblmaterialcode" runat="server" Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtvalue" runat="server" Width="88%" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataList ID="dlselective" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                                                                    Height="20px" OnItemDataBound="dlselective_ItemDataBound">
                                                                    <HeaderTemplate>
                                                                        <b></b></th>
                                                                        <th width="20%">
                                                                            Item
                                                                        </th>
                                                                        <th width="15%">
                                                                            Price
                                                                        </th>
                                                                        <%--<th width="10%">Base UOM</th>--%>
                                                                        <th width="15%">
                                                                            Unit
                                                                        </th>
                                                                        <th width="20%">
                                                                            Qty
                                                                        </th>
                                                                        <th width="10%">
                                                                            Amount
                                                                        </th>
                                                                        <th width="20%">
                                                                            Remarks
                                                                        </th>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="ckhselect1" runat="server" AutoPostBack="true" /><span class="lbl">
                                                                        </span>
                                                                        <td width="20%">
                                                                            <asp:Label ID="lblvoucherDesc" Text='<%#DataBinder.Eval(Container.DataItem, "SGR_DESC")%>'
                                                                                runat="server"></asp:Label>
                                                                        </td>
                                                                        <td width="15%">
                                                                            <asp:TextBox ID="txtvoucheramt" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Voucher_Amount")%>'
                                                                                Width="70%" AutoPostBack="true"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="txtvoucheramt"
                                                                                Text="#" runat="server" ValidationGroup="Val5" SetFocusOnError="true" ErrorMessage="Invalid amount entered"
                                                                                ValidationExpression="^[0-9]\d{0,9}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate ="txtvoucheramt" Text ="#" runat ="server" ValidationGroup ="Val5" SetFocusOnError ="true" ErrorMessage ="Please Enter Only Numbers" ValidationExpression="^(\d{1,18})(.\d{2})?$"></asp:RegularExpressionValidator>--%>
                                                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtvoucheramt" ErrorMessage="Amount cannot be more than 1000000000"  ValidationGroup ="Val5" Text ="#" SetFocusOnError ="true"  ValidationExpression="^[0-9]{1,10}$" />--%>
                                                                        </td>
                                                                        <td width="10%" id="td11" runat="server" visible="false">
                                                                            <asp:Label ID="lblbaseuom" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Uom_Base_Name")%>'></asp:Label>
                                                                            <asp:Label ID="lblbaseuomid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Uom")%>'
                                                                                Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td width="15%">
                                                                            <asp:DropDownList ID="ddluom" runat="server" AutoPostBack="true" Enabled="false"
                                                                                CssClass="chzn-select">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" ControlToValidate="ddluom"
                                                                                Text="#" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Unit "
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtquantity" runat="server" AutoPostBack="true" Width="55%" Enabled="false"
                                                                                Text='<%#DataBinder.Eval(Container.DataItem, "Uom_Value")%>'></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator26" ControlToValidate="txtquantity"
                                                                                Text="#" runat="server" ValidationGroup="Val5" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator ID="RegExp1" runat="server" ControlToValidate="txtquantity"
                                                                                ErrorMessage="Quantity cannot be more than 100" ValidationGroup="Val5" Text="#"
                                                                                SetFocusOnError="true" ValidationExpression="^[0-9]{1,3}$" />
                                                                            <asp:RequiredFieldValidator ID="r2" ControlToValidate="txtquantity" Text="#" runat="server"
                                                                                ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Enter Quantity" />
                                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtquantity"
                                                                                Type="Integer" ValueToCompare="0" SetFocusOnError="true" ValidationGroup="Val5"
                                                                                Operator="GreaterThan" ErrorMessage="Enter Quantity" Text="#"></asp:CompareValidator>
                                                                        </td>
                                                                        <td width="10%">
                                                                            <asp:TextBox ID="txttotalvalue" runat="server" Enabled="false" Width="90%"></asp:TextBox>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtremark" runat="server" Width="100px" AutoPostBack="true"></asp:TextBox>
                                                                        </td>
                                                                        <asp:Label ID="lblmaterialcodeadd" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem,"SGR_Material")%>'></asp:Label>
                                                                        <asp:Label ID="lblvoucher_mode" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem,"Voucher_Mode")%>'></asp:Label>
                                                                        <asp:Label ID="lblvoucher_typ" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem,"Voucher_Typ")%>'></asp:Label>
                                                                        <asp:Label ID="lblselgroup" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem,"sgr_sel_group")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                            <div class="alert alert-danger" id="diverrorsubject" runat="server" visible="false">
                                                                <strong>
                                                                    <asp:Label ID="lblerrorsub" runat="server"></asp:Label></strong>
                                                            </div>
                                                            <div class="alert alert-success" id="divSuccessrsubject" runat="server" visible="false">
                                                                <strong>
                                                                    <asp:Label ID="lblsuccesssub" runat="server"></asp:Label></strong>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:TextBox ID="txtcurrentout" Visible="false" runat="server"></asp:TextBox>
                                        <div class="well" style="text-align: center; background-color: #F0F0F0">
                                            <button class="btn btn-app btn-primary btn-mini radius-4" id="btnsearch" onserverclick="btnsearch_ServerClick"
                                                validationgroup="Grplead12" runat="server">
                                                Get
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
                                                <h5>
                                                    Bulk Stream Change
                                                    <asp:CheckBox ID="chkStudentAllHidden_Sel" runat="server" Visible="False" /></h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <HeaderTemplate>
                                                            <table class="table table-striped table-bordered table-hover Table3">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <asp:CheckBox ID="chkStudentAll" runat="server" AutoPostBack="True" OnCheckedChanged="All_Student_ChkBox_Selected_Sel" />
                                                                            <span class="lbl"></span>
                                                                        </th>
                                                                        
                                                                        <th>
                                                                            SBEntrycode
                                                                        </th>
                                                                        
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr class="odd gradeX">
                                                                <td>
                                                                    <asp:CheckBox ID="chkStudent" runat="server" />
                                                                    <span class="lbl"></span></span>
                                                                </td>
                                                               
                                                                <td>
                                                                    <asp:Label ID="Label43" Text='<%#DataBinder.Eval(Container.DataItem, "SBEntrycode")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                               
                                                            </tr>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody> </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                        <button class="btn btn-app btn-primary  btn-small radius-4" id="btnsync" onserverclick="btnstartsync_ServerClick"
                                                            runat="server">
                                                            Bulk Stream
                                                        </button>
                                                    </div>
                                                    <asp:Label ID="lbloppurid" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblaccountid" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblpromoteflag" runat="server" Visible="false"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END EXAMPLE TABLE PORTLET-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end tabbable-->
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsearch" />
                    <asp:PostBackTrigger ControlID="btnsync" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
