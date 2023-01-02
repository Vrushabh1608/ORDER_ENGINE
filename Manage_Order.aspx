﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Manage_Order.aspx.cs" Inherits="Manage_Order" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- CODE CHECKED -->
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };

        function NumberOnly() {
            var AsciiValue = event.keyCode
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                event.returnValue = true;
            else
                event.returnValue = false;
        };


    </script>
    <script type="text/javascript">
		$(function() {
	$('#accordion2').on('hide', function (e) {
		$(e.target).prev().children(0).addClass('collapsed');
    })
	$('#accordion2').on('hidden', function (e) {
		$(e.target).prev().children(0).addClass('collapsed');
    })
	$('#accordion2').on('show', function (e) {
		$(e.target).prev().children(0).removeClass('collapsed');
    })
	$('#accordion2').on('shown', function (e) {
		$(e.target).prev().children(0).removeClass('collapsed');
    })
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContainer" runat="Server">
    <asp:ScriptManager ID="script1" runat="server">
    </asp:ScriptManager>
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
                <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label><i class="icon-angle-right"></i></a></li>
            <li id="lilastbreadcrumb" runat="server" visible="false"><a href="#">
                <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a></li>
        </ul>
        <div id="nav-search" style="display: none">
            <!-- /btn-group -->
            <button type="button" class="btn btn-primary btn-small radius-4  btn-danger" id="btnback"
                runat="server" onserverclick="btnback_ServerClick">
                <i class="icon-reply"></i>Back</button>
            <button type="button" class="btn  btn-primary btn-small radius-4  btn-danger" id="btnsearchback"
                runat="server" onserverclick="btnsearchback_ServerClick">
                <i class="icon-reply"></i>Back to Order Search</button>
            <button data-toggle="dropdown" class="btn btn-danger btn-small dropdown-toggle">
                Action <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-yellow pull-right dropdown-caret dropdown-close">
                <li><a href="#" id="btnviewenrollment" runat="server" visible="false">View Enrollment</a></li>
                <li><a href="Manage_Order.aspx">Search Order</a></li>
            </ul>
        </div>
        <!--#nav-search-->
    </div>
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <!-- BEGIN PAGE CONTENT-->
            <div class="alert alert-danger" id="divErrormessage" runat="server">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="icon-remove"></i>
                </button>
                <strong>
                    <asp:Label ID="lblerrormessage" runat="server"></asp:Label></strong><br />
            </div>
            <div class="alert alert-success" id="divSuccessmessage" runat="server">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="icon-remove"></i>
                </button>
                <strong>
                    <asp:Label ID="lblsuccessMessage" runat="server"></asp:Label></strong><br />
            </div>
            <div class="alert alert-info" id="divinfo" runat="server" visible="false">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="icon-remove"></i>
                </button>
                <strong>
                    <asp:Label ID="lblInfo" runat="server"></asp:Label></strong><br />
            </div>
            <!-- BEGIN PAGE CONTENT FOR SEARCH-->
            <asp:UpdatePanel ID="upnlsearch" runat="server">
                <ContentTemplate>
                    <div class="row-fluid" id="divSearch" runat="server">
                        <div class="span12">
                            <div class="tabbable tabbable-custom tabbable-full-width">
                                <div class="row-fluid search-form-default" id="Divsearchcriteria" runat="server">
                                    <div class="span12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                <tr>
                                                    <td width="10%">
                                                        Stage
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="dlsearchstage" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                            Width="215px" Enabled="false">
                                                            <asp:ListItem Value="1"></asp:ListItem>
                                                            <asp:ListItem Value="2">Opportunity</asp:ListItem>
                                                            <asp:ListItem Value="3" Selected="True">Enrolment</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="60%">
                                                    </td>
                                                </tr>
                                            </table>
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
                                                        <asp:DropDownList ID="ddlcompany" runat="server" data-placeholder="Select Company"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlcompany_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Division
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddldivision" runat="server" AutoPostBack="true" data-placeholder="Select Division"
                                                            Width="215px" CssClass="chzn-select" OnSelectedIndexChanged="ddldivision_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Zone
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true" data-placeholder="Select Zone"
                                                            Width="215px" CssClass="chzn-select" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Center
                                                    </td>
                                                    <td width="20%" colspan="5">
                                                        <asp:DropDownList ID="ddlcenter" runat="server" AutoPostBack="true" data-placeholder="Select Center"
                                                            Width="215px" CssClass="chzn-select" OnSelectedIndexChanged="ddlcenter_SelectedIndexChanged">
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
                                                        Acad Year
                                                        <asp:Label ID="label42" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlacadyearsearch" runat="server" AutoPostBack="true" ValidationGroup="Grplead12"
                                                            Width="215px" data-placeholder="Select Acad Year" CssClass="chzn-select" OnSelectedIndexChanged="ddlacadyearsearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator55" ControlToValidate="ddlacadyearsearch"
                                                            Text="#" runat="server" ValidationGroup="Grplead12" SetFocusOnError="True" ErrorMessage="Select Acacdemic Year"
                                                            InitialValue="Select" />
                                                    </td>
                                                    <td width="10%">
                                                        Product Category
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlproductcategory" runat="server" AutoPostBack="true" data-placeholder="Select Product Category"
                                                            Width="215px" CssClass="chzn-select">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Stream
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstreamsearch" runat="server" AutoPostBack="true" data-placeholder="Select Stream"
                                                            Width="215px" CssClass="chzn-select">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <tr>
                                                        <td id="tdadmissionno" runat="server" width="10%">
                                                            Application Form No.
                                                        </td>
                                                        <td id="tdadmissionno1" runat="server" width="20%">
                                                            <asp:TextBox ID="txtadmissionformno" runat="server" placeholder="Search by Admission Form No."
                                                                Width="205px"></asp:TextBox>
                                                        </td>
                                                        <td width="10%">
                                                            Sales Stage
                                                        </td>
                                                        <td width="20%" colspan="5">
                                                            <asp:DropDownList ID="ddlsalesstage" runat="server" data-placeholder="Select Sales Stage"
                                                                Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover">
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
                                                        <asp:DropDownList ID="ddlcustomertypesearch" runat="server" data-placeholder="Select Customer Type"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Institution Type
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlinstitutionsearch" runat="server" data-placeholder="Select Institution Type"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlinstitutionsearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Board
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlboardsearch" runat="server" data-placeholder="Select Board"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Standard
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstandardsearch" runat="server" data-placeholder="Select Standard"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Student Name
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtstudentname" runat="server" Width="205px" placeholder="Search by Name"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Handphone
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txthandphonesearch" runat="server" Width="205px" placeholder="Search by Handphone 1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Gender
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlgendersearch" runat="server" data-placeholder="Select Gender"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                            <asp:ListItem Value="All">All</asp:ListItem>
                                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Age From
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtagefrom" runat="server" Width="205px" placeholder="Age From"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        To
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtageto" runat="server" Width="205px" placeholder="Age To"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Blocked Status
                                                    </td>
                                                    <td width="20%" colspan="5">
                                                        <asp:DropDownList ID="ddlblocked" runat="server" data-placeholder="Select Status"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                            <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">Include Blocked</asp:ListItem>
                                                            <asp:ListItem Value="2">Only Blocked</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover">
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
                                                        <asp:DropDownList ID="ddlcountrysearch" runat="server" data-placeholder="Select Country"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlcountrysearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        State
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstatesearch" runat="server" data-placeholder="Select State"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlstatesearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        City
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcitysearch" runat="server" data-placeholder="Select City"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true" OnSelectedIndexChanged="ddlcitysearch_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Location
                                                    </td>
                                                    <td width="20%" colspan="5">
                                                        <asp:DropDownList ID="ddllocationsearch" runat="server" data-placeholder="Select Location"
                                                            Width="215px" CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover" id="tbl1"
                                                runat="server" visible="false">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Sales & Follow-up Information
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Opportunity Created Between
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtoppcreatedfrm" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtoppcreatedfrm"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtoppcreatedfrm"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        To
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtoppcreatedto" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MM-yyyy" TargetControlID="txtoppcreatedto"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtoppcreatedto"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Follow-Up From
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtfollowupfrm" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MM-yyyy" TargetControlID="txtfollowupfrm"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtfollowupfrm"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        Follow-Up To
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtfollowupto" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd-MM-yyyy" TargetControlID="txtfollowupto"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtfollowupto"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        Overdue Follow-up
                                                    </td>
                                                    <td width="20%">
                                                        <asp:CheckBox ID="chkfollowup" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%" id="td17" runat="server" visible="false">
                                                        Last Follow-Up Over (Days)
                                                    </td>
                                                    <td width="20%" id="td18" runat="server" visible="false">
                                                        <asp:TextBox ID="txtlastfollowoverdays" runat="server" Width="90%" placeholder="Search by Last Follow-up Over (Days)"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Expected date of Joining From
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtexpecjoindatefrm" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender6" runat="server" Format="dd-MM-yyyy" TargetControlID="txtexpecjoindatefrm"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtexpecjoindatefrm"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        Expected date of Joining To
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtexpecjoindateto" runat="server" Width="79%"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender7" runat="server" Format="dd-MM-yyyy" TargetControlID="txtexpecjoindateto"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtexpecjoindateto"
                                                            ValidationGroup="Grplead1" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover" id="tbl2"
                                                runat="server" visible="false">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6">
                                                            Last Examination Details
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tr>
                                                    <td width="10%">
                                                        Board
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlboardsearch2" runat="server" data-placeholder="Select Board"
                                                            CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Standard
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstandardsearch2" runat="server" data-placeholder="Select Standard"
                                                            CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Year
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlyearsearch" runat="server" data-placeholder="Select Year"
                                                            CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Examination Details
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtexamsearch" runat="server" Width="79%" placeholder="Search by Examination Details"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="tr78" runat="server" visible="false">
                                                    <td width="10%">
                                                        Aggregrate Score
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtaggrescore" runat="server" Width="79%" placeholder="Search by Aggregrate Score"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Area Rank
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtxarearank" runat="server" Width="79%" placeholder="Search by Area rank"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Overall Rank
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtoverallrank" runat="server" Width="79%" placeholder="Search by Overall rank"></asp:TextBox>
                                                    </td>
                                                    <%-- <td width="10%">Topper</td>
                                                            <td width="20%"><asp:TextBox ID="TextBox8" runat ="server" Width ="90%" placeholder="Search by Name"></asp:TextBox></td>
                                                    --%>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Score Type
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlscoretype" runat="server" data-placeholder="Select Score Type"
                                                            CssClass="chzn-select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Condition
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlcondition" runat="server" data-placeholder="Select Condition"
                                                            CssClass="chzn-select" AutoPostBack="true">
                                                            <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                                            <asp:ListItem Value="1"><</asp:ListItem>
                                                            <asp:ListItem Value="2"><=</asp:ListItem>
                                                            <asp:ListItem Value="3">>=</asp:ListItem>
                                                            <asp:ListItem Value="4">></asp:ListItem>
                                                            <asp:ListItem Value="5">=</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="10%">
                                                        Score
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtscore" runat="server" Width="79%" placeholder="Search by Score"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="tr15" runat="server" visible="false">
                                                    <td width="10%">
                                                        Status
                                                    </td>
                                                    <td width="20%">
                                                        <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack="true" data-placeholder="Select Status"
                                                            CssClass="chzn-select">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                <button class="btn btn-app btn-primary btn-mini radius-4 btn-block" id="btnsearch"
                                                    validationgroup="Grplead12" runat="server" onserverclick="btnsearch_ServerClick">
                                                    Search
                                                </button>
                                                <asp:ValidationSummary ID="ValidationSummary17" runat="server" ShowMessageBox="True"
                                                    ValidationGroup="Grplead12" ShowSummary="False" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-fluid" id="divsearchresults" runat="server">
                                    <div class="span12">
                                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                        <div class="widget-box">
                                            <div class="widget-body">
                                                <div class="widget-header widget-hea1der-small header-color-dark">
                                                    <h4 class="smaller">
                                                        <i class="icon-briefcase"></i>Order Search Results</h4>
                                                    <div class="widget-toolbar">
                                                        <div class="btn-group">
                                                            <a class="btn btn-danger btn-mini radius-4" id="btnadd2" runat="server" visible="false"
                                                                onserverclick="btnadd2_ServerClick">Add Opportunity <i class="icon-plus-sign"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="widget-body">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"
                                                        OnItemDataBound="Repeater1_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table table-striped table-bordered table-hover Table2">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Created On
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Center
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            App. Form No.
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Name
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Product
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Sales Stage
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Open Days
                                                                        </th>
                                                                        <th align="center" style="text-align: center">
                                                                            Action
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr class="odd gradeX">
                                                                <td>
                                                                    <asp:LinkButton ID="lnkoppednrol" runat="server" class="btn default btn-xs green"
                                                                        Enabled="false" CssClass="popovers " data-trigger="hover" data-placement="top"
                                                                        data-content="Enrolled"><i class="fa fa-bookmark-o "></i> E</asp:LinkButton>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label9" Text='<%#DataBinder.Eval(Container.DataItem, "Created_On")%>'
                                                                        runat="server"></asp:Label>
                                                                <td>
                                                                    <asp:Label ID="lblPPgroup" Text='<%#DataBinder.Eval(Container.DataItem, "Center")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" Text='<%#DataBinder.Eval(Container.DataItem, "app_no")%>'
                                                                        runat="server"></asp:Label>
                                                                <td>
                                                                    <asp:Label ID="Label1" Text='<%#DataBinder.Eval(Container.DataItem, "Name")%>' runat="server"></asp:Label>
                                                                </td>
                                                                <td id="Td1" align="right" runat="server" visible="false">
                                                                    <asp:Label ID="Label10" Text='<%#DataBinder.Eval(Container.DataItem, "Age")%>' runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label2" Text='<%#DataBinder.Eval(Container.DataItem, "Oppor_product")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label7" Text='<%#DataBinder.Eval(Container.DataItem, "Sales_Stage_Desc")%>'
                                                                        runat="server"></asp:Label>
                                                                </td>
                                                                <td align="right">
                                                                    <asp:Label ID="Label5" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code","Opportunity_Display.aspx?&Opportunity_Code={0}") %>'
                                                                        id="btndisplay" runat="server" target="_blank" class="btn btn-minier btn-suceess icon-eye-open tooltip-suceess"
                                                                        visible="false" data-rel="tooltip" data-placement="top" title="Display"></a>
                                                                    <asp:LinkButton ID="lnkdisplay" runat="server" CommandName="Display" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        class="btn btn-minier btn-success icon-eye-open tooltip-suceess" Visible="false"
                                                                        data-rel="tooltip" data-placement="top" title="Display"></asp:LinkButton>
                                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code","Opportunity_Edit.aspx?&Opportunity_Code={0}") %>'
                                                                        id="btndedit" runat="server" target="_blank" class="btn btn-minier btn-primary icon-edit tooltip-info"
                                                                        visible="false" data-rel="tooltip" data-placement="top" title="Edit"></a>
                                                                    <asp:LinkButton ID="lnkedit" runat="server" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        class="btn btn-minier btn-primary icon-edit tooltip-info" Visible="false" data-rel="tooltip"
                                                                        data-placement="top" title="Edit"></asp:LinkButton>
                                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code","Opportunity_Followup.aspx?&Opportunity_Code={0}") %>'
                                                                        id="btnfollowup" runat="server" target="_blank" class="btn btn-minier btn-primary icon-comments tooltip-info"
                                                                        visible="false" data-rel="tooltip" data-placement="top" title="Follow-up"></a>
                                                                    <asp:LinkButton ID="lnkfollowup" runat="server" CommandName="Followup" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        class="btn btn-minier btn-primary icon-comments tooltip-info" Visible="false"
                                                                        data-rel="tooltip" data-placement="top" title="Follow-up"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkconvertmt" runat="server" class="btn btn-minier btn-success icon-check tooltip-info"
                                                                        CommandName="Convert_MT" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Convert">
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkformsubmit" runat="server" class="btn btn-minier btn-success icon-download tooltip-success"
                                                                        CommandName="Formsubmit" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Enroll"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkblock" runat="server" class="btn btn-minier btn-danger icon-ban-circle tooltip-Danger"
                                                                        CommandName="Block" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Block"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkunblock" runat="server" class="btn btn-minier btn-primary icon-unlock tooltip-info"
                                                                        CommandName="UnBlock" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="UnBlock"></asp:LinkButton>
                                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code","Enrollment_Display.aspx?&Oppur_ID={0}") %>'
                                                                        id="btndisplayenroll" runat="server" target="_blank" visible="false" class="btn btn-minier btn-success icon-eye-open tooltip-success"
                                                                        data-rel="tooltip" data-placement="top" title="Display"></a>
                                                                    <asp:LinkButton ID="lnldisplayenrol" runat="server" Visible="false" CommandName="Displayenrol"
                                                                        class="btn btn-minier btn-success icon-eye-open tooltip-success" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Display"></asp:LinkButton>
                                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code","Enrollment_Edit.aspx?&Oppur_ID={0}") %>'
                                                                        class="btn btn-minier btn-primary icon-edit tooltip-info" id="btneditenroll"
                                                                        runat="server" target="_blank" visible="false" data-rel="tooltip" data-placement="top"
                                                                        title="Edit"></a>
                                                                    <asp:LinkButton ID="lnkeditenroll" runat="server" Visible="true" CommandName="Editenrol"
                                                                        class="btn btn-minier btn-primary icon-edit tooltip-info" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Edit"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkfollowupenroll" runat="server" CommandName="FollowupEnroll"
                                                                        class="btn btn-minier btn-primary icon-comments tooltip-info" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        Visible="false" data-rel="tooltip" data-placement="top" title="Follow-up"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkconvert" runat="server" class="btn btn-minier btn-success icon-check tooltip-info"
                                                                        CommandName="Convert" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Order"></asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkblockenroll" runat="server" class="btn btn-minier btn-danger icon-ban-circle tooltip-Danger"
                                                                        CommandName="BlockEnroll" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Opportunity_Code")%>'
                                                                        data-rel="tooltip" data-placement="top" title="Block" Visible="false"></asp:LinkButton>
                                                                    <asp:Label ID="lblisactive" Text='<%#DataBinder.Eval(Container.DataItem, "isactive")%>'
                                                                        runat="server" Visible="false"></asp:Label>
                                                                </td>
                                                                <td id="Td15" width="2%" runat="server" visible="false">
                                                                    <asp:Label ID="lblOppor_id" Text='<%#DataBinder.Eval(Container.DataItem, "Opportunity_Code")%>'
                                                                        runat="server" Visible="false"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody> </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    <asp:Label ID="lbloppurid" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lbloppid1" runat="server" Visible="false"></asp:Label>
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
                        <!--end tabbable-->
                    </div>
                    <div class="modal fade" id="Blocklead" tabindex="-1" role="basic" aria-hidden="true"
                        data-keyboard="false" data-backdrop="static" data-keyboard="false" data-attention-animation="false">
                        <div class="modal-dialog modal-small blue">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="scroller" data-always-visible="1" data-rail-visible1="1">
                                        <p>
                                            <b>
                                                <asp:Label ID="lblnote" runat="server" ForeColor="#FF3300"></asp:Label></b>
                                        </p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-app btn-primary btn-mini radius-4" id="btncloseleadblock"
                                        runat="server" onserverclick="btncloseleadblock_ServerClick">
                                        No</button>
                                    <button type="button" class="btn btn-app btn-success btn-mini radius-4" id="btnblocklead"
                                        runat="server" onserverclick="btnblocklead_ServerClick">
                                        Yes</button>
                                    <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowMessageBox="True"
                                        ValidationGroup="Val8" ShowSummary="False" />
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <div class="modal fade" id="UnBlocklead" tabindex="-1" role="basic" aria-hidden="true"
                        data-keyboard="false" data-backdrop="static" data-keyboard="false" data-attention-animation="false">
                        <div class="modal-dialog modal-small blue">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="scroller" data-always-visible="1" data-rail-visible1="1">
                                        <p>
                                            <b>
                                                <asp:Label ID="lblnote1" runat="server" ForeColor="#FF3300"></asp:Label></b>
                                        </p>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-app btn-primary btn-mini radius-4" id="btnunblockno"
                                        runat="server" onserverclick="btnunblockno_ServerClick">
                                        No</button>
                                    <button type="button" class="btn btn-app btn-success btn-mini radius-4" id="btnunblockyes"
                                        runat="server" onserverclick="btnunblockyes_ServerClick">
                                        Yes</button>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                        ValidationGroup="Val8" ShowSummary="False" />
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:AsyncPostBackTrigger ControlID ="Exporttoexcel" />--%>
                    <asp:PostBackTrigger ControlID="btnadd2" />
                    <%--<asp:PostBackTrigger ControlID ="btnsearchoppor" />--%>
                    <asp:PostBackTrigger ControlID="btnsearch" />
                    <asp:PostBackTrigger ControlID="btnunblockno" />
                    <asp:PostBackTrigger ControlID="btnunblockyes" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- END PAGE CONTENT FOR SEARCH-->
            <!-- BEGIN PAGE CONTENT FOR CONVERT TO ACCOUNT-->
            <%--<asp:UpdatePanel id="upnlconvert" runat ="server">
                <ContentTemplate>--%>
            <div id="upnlconvert" runat="server">
                <div class="row-fluid" id="div2" runat="server">
                    <div class="span12">
                        <div id="Div3">
                            <div class="row-fluid" id="div4" runat="server">
                                <div class="span8" id="divpersonalinfo" runat="server">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-advance table-hover">
                                            <tr>
                                                <td width="10%">
                                                    App. No.
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtConapp" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    App. Entry Date
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtconAppentrydate" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    App. Submit Date
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtconappsubdate" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    Customer Name
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtconstdname" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Company
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlconCompany" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                        Width="215px" data-placement="top" data-content="Select Company" data-original-title="Company">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Division
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlcondivision" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                        Width="215px" data-placement="top" data-content="Select Division" data-original-title="Division">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr id="tr67" runat="server" visible="false">
                                                <td width="10%">
                                                    Stay Preference
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlstay" runat="server" Enabled="false" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="Val4" data-trigger="hover" data-placement="top"
                                                        Width="215px" data-content="Select Student Current Stay" data-original-title="Stay">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Passing Year
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlconyearofpassing" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="Grplead1" data-trigger="hover" data-placement="top"
                                                        Width="215px" data-content="Select Year of Passing" data-original-title="Year of Passing">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Center
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlconcenter" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                        Width="215px" data-placement="top" data-content="Select Center" data-original-title="Center">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Academic Year
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlconacademicyear" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                        Width="215px" data-placement="top" data-content="Select Academic Year" data-original-title="Academic Year">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Product
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlconstream" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" AutoPostBack="true" ValidationGroup="val2" data-trigger="hover"
                                                        Width="215px" data-placement="top" data-content="Select Stream" data-original-title="Stream">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <strong>
                                                        <asp:Label ID="lblcoursedurationover" runat="server" CssClass="error" ForeColor="Red"></asp:Label></strong>
                                                </td>
                                                <td width="10%">
                                                    Opportunity Code
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtopportunitycode" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                </td>
                                                <td id="Td1" width="10%" runat="server" visible="false">
                                                    Transportation
                                                    <asp:Label ID="label18" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                </td>
                                                <td id="Td2" width="20%" runat="server" visible="false">
                                                    <asp:DropDownList ID="ddltransport" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        AutoPostBack="true" ValidationGroup="val2" data-trigger="hover" data-placement="top"
                                                        data-content="Select Transportation required" OnSelectedIndexChanged="ddltransport_SelectedIndexChanged">
                                                        <asp:ListItem Value="00" Selected="True">Select</asp:ListItem>
                                                        <asp:ListItem Value="02">Yes</asp:ListItem>
                                                        <asp:ListItem Value="01">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" ControlToValidate="ddltransport"
                                                        Text="#" runat="server" ValidationGroup="val2" SetFocusOnError="True" ErrorMessage="Select Transportation"
                                                        InitialValue="Select" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Pay Plan
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlpayplan" runat="server" data-placeholder="Select" CssClass="chzn-select"
                                                        Width="215px" AutoPostBack="True" ValidationGroup="Val5" OnSelectedIndexChanged="ddlpayplan_SelectedIndexChanged">
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
                                        </table>
                                        <table id="tbladditionalinfoCollege" runat="server" visible="false">
                                            <tr>
                                                <td width="10%">
                                                    Medium of Instruction
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlConmediumofinstr" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="Val4" data-trigger="hover" data-placement="top"
                                                        data-content="Select Medium of Instruction" data-original-title="Medium of Instruction">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Nationality
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlnationality" Enabled="false" Placeholder="Nationality" runat="server"
                                                        data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover"
                                                        data-placement="top" data-content="Enter Student Nationality" data-original-title="Student Nationality">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Mother Tongue
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlmothertongue" Enabled="false" Placeholder="Mother Tongue"
                                                        runat="server" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1"
                                                        data-trigger="hover" data-placement="top" data-content="Enter Student Mother tongue"
                                                        data-original-title="Student Mother Tongue">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Religion
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlreligion" Enabled="false" Placeholder="Student Religion"
                                                        runat="server" data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true"
                                                        ValidationGroup="val1" data-trigger="hover" data-placement="top" data-content="Select Student Religion"
                                                        data-original-title="Student Religion">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Caste
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlcaste" Enabled="false" runat="server" Placeholder="Student Caste"
                                                        data-placeholder="Select" CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover"
                                                        data-placement="top" data-content="Enter Student Caste" data-original-title="Student Caste">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Sub Caste
                                                </td>
                                                <td width="20%">
                                                    <asp:TextBox ID="txtconsubcaste" Enabled="false" runat="server" Width="88%"></asp:TextBox>
                                                </td>
                                                <td width="10%">
                                                    Category
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlgroup" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover" data-placement="top"
                                                        data-content="Select Category" data-original-title="Select Category">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    Student From
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlstudentfrom" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover" data-placement="top"
                                                        data-content="Select student from" data-original-title="Student From">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    Physically
                                                    <br />
                                                    Challenged
                                                </td>
                                                <td width="20%">
                                                    <asp:DropDownList ID="ddlphysicalchallenged" Enabled="false" runat="server" data-placeholder="Select"
                                                        CssClass="chzn-select" ValidationGroup="val1" data-trigger="hover" data-placement="top"
                                                        data-content="Select whether student is physicaly challenged" data-original-title="Physically Challenged">
                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-- static -->
                                <div class="span4">
                                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                    <div class="widget-box">
                                        <div class="widget-header">
                                            <h5>
                                                <i class="fa fa-globe"></i>Compulsory Fee Items
                                            </h5>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <asp:DataList ID="dlproductHeader" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                                                    Height="30">
                                                    <HeaderTemplate>
                                                        <b>Description</b></th>
                                                        <th>
                                                            UOM
                                                        </th>
                                                        <th>
                                                            Qty
                                                        </th>
                                                        <th>
                                                            Amount
                                                        </th>
                                                        <th>
                                                            Calc Type
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblvoucherDesc" Text='<%#DataBinder.Eval(Container.DataItem, "Voucher_description")%>'
                                                            runat="server"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="lbluom" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "UOM_Name")%>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblqty" Text='<%#DataBinder.Eval(Container.DataItem, "min_order_Qty")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right">
                                                            <asp:Label ID="lblvoucherAmt" Text='<%#DataBinder.Eval(Container.DataItem, "Voucher_Amt")%>'
                                                                runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right">
                                                            <asp:Label ID="lblCalcType" Text='<%#DataBinder.Eval(Container.DataItem, "Value_Type")%>'
                                                                runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid" id="div5" runat="server">
                                <div class="span12">
                                    <asp:UpdatePanel ID="upnl1" runat="server">
                                        <ContentTemplate>
                                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                            <table class="table table-striped table-bordered table-advance table-hover" width="80% !important">
                                                <%--<tr>
                                                    <th colspan="6">
                                                      <asp:CheckBox ID="ckhBranchTopper" runat="server" AutoPostBack="true" 
                                                            oncheckedchanged="ckhBranchTopper_CheckedChanged" />
                                                      <span class="lbl">
                                                                </span>  Branch Topper for Standard X
                                                    </th>
                                                </tr>
                                                <tr id="trBranchTopper" runat="server" visible="false">
                                                    <td align="left" style="text-align: left">
                                                        Division
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        <asp:DropDownList ID="ddlbranchtopperdivision" runat="server" CssClass="chzn-select"
                                                            AutoPostBack="True" ValidationGroup="Val5" OnSelectedIndexChanged="ddlbranchtopperdivision_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlbranchtopperdivision"
                                                            Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Branch Division"
                                                            InitialValue="Select" Display="None" />
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        Center
                                                    </td>
                                                    <td align="left" style="text-align: left"   colspan="3">
                                                        <asp:DropDownList ID="ddlbranchtopperCenter" runat="server" CssClass="chzn-select"
                                                            AutoPostBack="True" ValidationGroup="Val5">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlbranchtopperCenter"
                                                            Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Center"
                                                            InitialValue="Select" Display="None" />
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <th colspan="6">
                                                      <asp:CheckBox ID="chkSchoolRanker" runat="server" AutoPostBack="true" 
                                                            oncheckedchanged="chkSchoolRanker_CheckedChanged" />
                                                      <span class="lbl">  
                                                      
                                                      School Ranker for Standard X
                                                    </th>
                                                </tr>
                                                <tr runat="server" visible="false" id="trSchoolRanker">
                                                    <td align="left" style="text-align: left">
                                                        School Name
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        <asp:DropDownList ID="ddlschoolranker" runat="server" CssClass="chzn-select" ValidationGroup="Val5">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlschoolranker"
                                                            Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select School"
                                                            InitialValue="Select" Display="None" />
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        School Division
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        <asp:TextBox ID="txtschooldivision" runat="server" Width="205px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        Rank
                                                    </td>
                                                    <td align="left" style="text-align: left">
                                                        <asp:TextBox ID="txtschoolrank" runat="server" Width="205px"></asp:TextBox>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="6">
                                                           <asp:CheckBox ID="ckhRankerAdditional" runat="server" AutoPostBack="true" 
                                                                oncheckedchanged="ckhRankerAdditional_CheckedChanged" />
                                                      <span class="lbl"> Ranker Additional Pre-Defined Conditions
                                                        </th>
                                                    </tr>
                                                    <tr runat="server" visible="false" id="trDiscount">
                                                        <td align="left" style="text-align: left">
                                                            Discount Condition
                                                        </td>
                                                        <td align="left" style="text-align: left" colspan="5">
                                                            <asp:DropDownList ID="ddldiscountconditions" runat="server" CssClass="chzn-select"
                                                                AutoPostBack="True" ValidationGroup="Val5">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddldiscountconditions"
                                                                Text="*" runat="server" ValidationGroup="Val5" SetFocusOnError="True" ErrorMessage="Select Center"
                                                                InitialValue="Select" Display="None" />
                                                        </td>
                                                    </tr>--%>
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
                                            <div class="widget-box">
                                                <div class="widget-header">
                                                    <h5>
                                                        <i class="fa fa-anchor"></i>Product / Item Group Selection
                                                    </h5>
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
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
                                                    <div class="alert alert-danger" id="diverrorsubject" runat="server">
                                                        <strong>
                                                            <asp:Label ID="lblerrorsub" runat="server"></asp:Label></strong>
                                                    </div>
                                                    <div class="alert alert-success" id="divSuccessrsubject" runat="server">
                                                        <strong>
                                                            <asp:Label ID="lblsuccesssub" runat="server"></asp:Label></strong>
                                                    </div>
                                                    <div id="Div6" class="well" style="text-align: center; background-color: #F0F0F0"
                                                        runat="server">
                                                        <div class="col-md-offset-4 col-md-8">
                                                              <asp:Button ID="btncontinue" runat="server" Text="Continue" OnClick="btncontinue_ServerClick" class="btn btn-app btn-success btn-mini radius-4" TabIndex="-1" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" />
                                                       <%--     <button class="btn btn-primary btn-small  radius-4" id="btncontinue" runat="server"
                                                                validationgroup="Val5" >
                                                                Continue <i class="m-icon-swapright m-icon-white"></i>
                                                            </button>--%>
                                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                                                                ValidationGroup="Val5" ShowSummary="False" />
                                                        </div>
                                                    </div>
                                                    <div id="Divreselect" class="well" style="text-align: center; background-color: #F0F0F0"
                                                        runat="server">
                                                        <div class="col-md-offset-4 col-md-8">
                                                            <button class="btn btn-primary btn-small  radius-4" id="btnreselect" runat="server"
                                                                onserverclick="btnreselect_ServerClick">
                                                                Undo
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btncontinue" />
                                            <asp:PostBackTrigger ControlID="btnreselect" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12" id="divfeedetails" runat="server">
                                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                                    <div class="widget-box">
                                        <div class="widget-header">
                                            <h5>
                                                <i class="fa fa-bitcoin"></i>Order Summary
                                            </h5>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <div class="table-responsive">
                                                    <asp:DataList ID="dlppheader" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
                                                        Height="20px">
                                                        <HeaderTemplate>
                                                            <b>Header (Fees Group)</b></th>
                                                            <th>
                                                                Voucher Type
                                                            </th>
                                                            <th>
                                                                Voucher Description
                                                            </th>
                                                            <th>
                                                                Amount
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblvoucherDesc" Text='<%#DataBinder.Eval(Container.DataItem, "Pricing_Procedure_name")%>'
                                                                runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="Label11" Text='<%#DataBinder.Eval(Container.DataItem, "Voucher_Type")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label8" Text='<%#DataBinder.Eval(Container.DataItem, "Voucher_Description")%>'
                                                                    runat="server"></asp:Label>
                                                            </td>
                                                            <td align="right">
                                                                <asp:Label ID="lblvoucherAmt" Text='<%#DataBinder.Eval(Container.DataItem, "Final_Voucher_Amount")%>'
                                                                    runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                    <div class="widget-main" id="DivFeesOffered"  runat="server" Visible="false">
                                                        <table cellpadding="6" class="table  table-bordered table-condensed">
                                                            <tr>
                                                                <td class="span4" style="text-align: left">
                                                                    <table cellpadding="0" style="border-style: none;" class="table-hover" width="100%">
                                                                        <tr>
                                                                            <td style="border-style: none; text-align: left; width: 40%;">
                                                                                <asp:Label runat="server" CssClass="red" ID="Label1">Offered Fees</asp:Label>
                                                                            </td>
                                                                            <td style="border-style: none; text-align: left; width: 60%;">
                                                                            <asp:TextBox ID="txtFeeOffered" onkeypress="return NumberOnly(event);" runat="server"></asp:TextBox>
                                                                          
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td class="span4" style="text-align: left">
                                                                <td class="span4" style="text-align: left">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div id="divcreatebutton" class="well" style="text-align: center; background-color: #F0F0F0"
                                                        runat="server">
                                                       <%-- <button class="btn btn-success btn-small radius-4 " id="btncreateaccount" runat="server"
                                                            validationgroup="Val6" onserverclick="btncreateaccount_ServerClick" UseSubmitBehavior="false" OnClientClick="this.disabled=true;">
                                                            Confirm Order
                                                        </button>--%>
                                                        <asp:Button ID="btncreateaccount" runat="server" Text="Confirm Order" OnClick="btncreateaccount_Click" CssClass="btn btn-success btn-small radius-4 " TabIndex="-1" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" />
                                                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True"
                                                            ValidationGroup="Val6" ShowSummary="False" />
                                                    </div>
                                                    <div id="divbtnexit" class="well" style="text-align: center; background-color: #F0F0F0"
                                                        runat="server">
                                                        <div class="col-md-offset-4 col-md-8">
                                                            <button class="btn btn-primary btn-mini radius-4" id="btnclose" runat="server" onserverclick="btnclose_ServerClick">
                                                                Close
                                                            </button>
                                                            <button class="btn btn-success btn-mini radius-4" id="btnaccount" runat="server"
                                                                onserverclick="btnaccount_ServerClick">
                                                                Account
                                                            </button>
                                                            <button class="btn btn-success btn-mini radius-4" id="btnpayment" runat="server"
                                                                onserverclick="btnpayment_ServerClick">
                                                                Payment
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lbloppid" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="lblsbentrycode" runat="server" Visible="False"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end tabbable-->
                </div>
            </div>
            <!-- END PAGE CONTENT FOR CONVERT TO ACCOUNT-->
            <!-- BEGIN PAGE CONTENT FOR CONVERT TO ACCOUNT FOR MT-->
            <asp:UpdatePanel ID="upnlconvertMT" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row-fluid" id="div_ConvertMT" runat="server">
                        <div class="span12">
                            <div id="Div8" class="tab-pane active">
                                <div class="row-fluid" id="div9" runat="server">
                                    <div class="span12">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                <tr>
                                                    <td width="10%">
                                                        Product Category
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtproductcategory1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Sales Stage
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtsalesstage1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Student Type
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtstudenttype" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Contact Name
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtcontactname1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Handphone #1
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txthandphone11" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Landline
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtlandline1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Join Date
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtjoindate1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Expected date
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtexpectedate1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                    <td width="10%">
                                                        Probability Percent
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtprobpercent1" runat="server" Enabled="false" Width="95%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                <tr>
                                                    <td width="10%">
                                                        Sbentrycode
                                                        <asp:Label ID="label38" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtsbentrycode" runat="server" Width="88%" ValidationGroup="Grplead"
                                                            MaxLength="16" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator47" ControlToValidate="txtsbentrycode"
                                                            Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter SBEntryCode " />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtsbentrycode"
                                                            Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                            ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                        Account Date
                                                        <asp:Label ID="label3" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                    <td width="20%">
                                                        <asp:TextBox ID="txtaccountdate" runat="server" Width="90%" ValidationGroup="Grplead"></asp:TextBox>
                                                        <CC1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtaccountdate"
                                                            DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                        </CC1:CalendarExtender>
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator50" ControlToValidate="txtaccountdate"
                                                            Text="*" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter System Admission Date" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtaccountdate"
                                                            ValidationGroup="Grplead" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td width="10%">
                                                    </td>
                                                    <td width="20%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">
                                                        Notes
                                                        <asp:Label ID="label4" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                    <td width="20%" colspan="5">
                                                        <asp:TextBox ID="txtnotes" runat="server" Width="98%" MaxLength="200" ValidationGroup="Grplead"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator51" ControlToValidate="txtnotes"
                                                            Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Notes" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="well" style="text-align: center; background-color: #F0F0F0" id="divfeedbackbuttonsCon"
                                                runat="server">
                                                <button class="btn btn-app btn-success btn-mini radius-4" id="btnconvertmt" runat="server"
                                                    validationgroup="Grplead" onserverclick="btnconvertmt_ServerClick">
                                                    Convert</button>
                                                <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclearmt" runat="server"
                                                    onserverclick="btnclearmt_ServerClick">
                                                    Cancel</button>
                                                <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowMessageBox="True"
                                                    ValidationGroup="Grplead" ShowSummary="False" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnconvertmt" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- END PAGE CONTENT FOR CONVERT TO ACCOUNT FOR MT-->
        </div>
    </div>
    <!-- END CONTENT -->
</asp:Content>
