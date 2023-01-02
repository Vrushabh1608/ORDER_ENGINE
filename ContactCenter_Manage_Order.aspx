﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="ContactCenter_Manage_Order.aspx.cs" Inherits="ContactCenter_Manage_Order" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- CODE CHECKED -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContainer" runat="Server">
    <!-- BEGIN CONTENT -->
    <asp:ScriptManager ID="script1" runat="server">
    </asp:ScriptManager>
    <!-- BEGIN PAGE HEADER-->
    <div id="breadcrumbs" class="position-relative" style="height: 53px">
        <ul class="breadcrumb" style="height: 15px">
            <li><i class="icon-home"></i><a href="Homepage.aspx">Home</a><span class="divider"><i
                class="icon-angle-right"></i></span></li>
            <%--<li id="limidbreadcrumb" runat="server" visible="false"><a href="ContactCenter_Opportunity.aspx">
                <asp:Label ID="lblmidbreadcrumb" runat="server"></asp:Label></a><span class="divider"><i
                    class="icon-angle-right"></i></span></li>
            <li id="lilastbreadcrumb" runat="server" visible="false"><i class="fa fa-angle-right">
            </i><a href="#">
                <asp:Label ID="lbllastbreadcrumb" runat="server"></asp:Label></a></li>
            <li>--%>
            <li>
                <h4 class="blue">
                    <asp:Label ID="lblpagetitle1" runat="server"></asp:Label>&nbsp;<b><asp:Label ID="lblstudentname"
                        runat="server" ForeColor="DarkRed"></asp:Label></b><small> &nbsp;
                            <asp:Label ID="lblpagetitle2" runat="server"></asp:Label></small>
                    <asp:Label ID="lblusercompany" runat="server" Visible="false"></asp:Label>
                    <span class="divider"></span>
                </h4>
            </li>
        </ul>
        <%--<div id="nav-search">
            <!-- /btn-group -->
            <button type="button" class="btn btn-app btn-primary btn-mini radius-4 dropdown-toggle"
                data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
                <span>Actions </span><i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
                <li><a href="#" id="btnsearchoppor" runat="server" onserverclick="btnsearchoppor_ServerClick">
                    Search Opportunity</a> </li>
                <li><a href="#" id="btnaddOpp" runat="server">Add Opportunity</a> </li>
            </ul>
        </div>--%>
        <div id="nav-search">
            <button data-toggle="dropdown" class="btn btn-danger btn-small dropdown-toggle" runat="server"
                visible="false">
                Action <span class="caret"></span>
            </button>
            <ul class="dropdown-menu dropdown-yellow pull-right dropdown-caret dropdown-close">
                <li><a href="#" id="btnsearchoppor" runat="server" onserverclick="btnsearchoppor_ServerClick">
                    Search Opportunity</a> </li>
                <li><a href="#" id="btnviewenrollment" runat="server" visible="false">View Enrollment</a></li>
            </ul>
        </div>
        <!--#nav-search-->
    </div>
    <!-- END PAGE HEADER-->
    <div id="page-content" class="clearfix">
        <div class="page-content">
            <div class="alert alert-danger" id="divErrormessage" runat="server">
                <strong>
                    <asp:Label ID="lblerrormessage" runat="server"></asp:Label></strong>
            </div>
            <div class="alert alert-success" id="divSuccessmessage" runat="server">
                <strong>
                    <asp:Label ID="lblsuccessMessage" runat="server"></asp:Label></strong>
            </div>
            <!-- BEGIN PAGE CONTENT FOR DISPLAY-->
            <div runat="server" id="DivMessage" class="row-fluid" visible="false">
                <div class="alert alert-success" id="div3" runat="server">
                    <strong>
                        <asp:Label ID="lblOrderMessage" runat="server">Opportunity is successfully converted into Order...!</asp:Label></strong>
                    &nbsp;&nbsp;                    
                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclose" runat="server"
                        onclick="javascript:window.close()">
                        OK</button>
                </div>
            </div>

            <asp:UpdatePanel ID="UpnlAdd" runat="server">
                <ContentTemplate>
                    <div class="row-fluid" id="div1" runat="server">
                        <div class="span12">
                            <div id="Divadd" class="tab-pane active">
                                <div class="row-fluid" id="divadd" runat="server">
                                    <div class="span12">
                                        <div class="table-responsive">
                                            <%--<div class="row-fluid">
                                                <ContactInfoPanel:ContactInfoPanel runat="server" ID="ContactInfoPanel1"></ContactInfoPanel:ContactInfoPanel>
                                            </div>--%>
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                <i class="icon-comments"></i>Contact Information
                                                                <%--<asp:Label ID="lblContactId" runat="server" Visible="false"></asp:Label>--%>
                                                            </h5>
                                                            <div class="btn-group" id="divEditContatc" runat="server">
                                                                <a id="a1" runat="server" target="_blank" class="btn btn-small btn-primary tooltip-info"
                                                                    title="Edit Contact"><i class="icon-edit"></i></a>
                                                            </div>
                                                            <div class="btn-group" id="div2" runat="server">
                                                                <button type="button" class="btn btn-small btn-primary tooltip-info" id="Button1"
                                                                    runat="server" onclick="myFunction()" data-rel="tooltip" data-placement="top"
                                                                    title="Refresh Contact">
                                                                    <i class="icon-refresh"></i>
                                                                </button>
                                                            </div>
                                                            &nbsp;&nbsp;
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <div class="row-fluid">
                                                                    <asp:DataList ID="dlContactInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                                        <HeaderTemplate>
                                                                            <b class="center" style="text-align: left">Contact Type</b></th>
                                                                            <th style="text-align: center">
                                                                                Name
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Handphone1
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Handphone2
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                LandLineNo
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Gender
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Email Id
                                                                            </th>
                                                                            <%--<th style="text-align: center">
                                                                                Occupation
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Organization
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Designation
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Office Phone
                                                                            </th>--%>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContactId" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCon_type_id" Text='<%#DataBinder.Eval(Container.DataItem, "Con_type_id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCon_Type_desc" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Type_desc")%>'
                                                                                runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblName" Text='<%#DataBinder.Eval(Container.DataItem, "Name")%>' runat="server"></asp:Label>
                                                                                <asp:Label ID="lblConTitle" Text='<%#DataBinder.Eval(Container.DataItem, "Con_title")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblFName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Firstname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblMName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_midname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblLName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_lastname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblHandphone1" Text='<%#DataBinder.Eval(Container.DataItem, "Handphone1")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblHandphone2" Text='<%#DataBinder.Eval(Container.DataItem, "Handphone2")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblLandline" Text='<%#DataBinder.Eval(Container.DataItem, "Landline")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblGender" Text='<%#DataBinder.Eval(Container.DataItem, "Gender")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblEmailid" Text='<%#DataBinder.Eval(Container.DataItem, "Emailid")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <%--<td>
                                                                                <asp:Label ID="lblOccupation" Text='<%#DataBinder.Eval(Container.DataItem, "Occupation")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblOrganization" Text='<%#DataBinder.Eval(Container.DataItem, "Organization")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblDesignation" Text='<%#DataBinder.Eval(Container.DataItem, "Designation")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblOffice_phone" Text='<%#DataBinder.Eval(Container.DataItem, "Office_phone")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>--%>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:Label ID="Label4" CssClass="red" Visible="False" runat="server" Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid" runat="server" visible="false">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Primary Contact
                                                            </h5>
                                                            <asp:Label ID="lblConId" runat="server" Visible="false"></asp:Label>
                                                            <div class="btn-group" id="divEditContact" runat="server">
                                                                <a id="aedit" runat="server" target="_blank" class="btn btn-small btn-primary tooltip-info"
                                                                    title="Edit Contact"><i class="icon-edit"></i></a>
                                                            </div>
                                                            <div class="btn-group" id="divRefreshContact" runat="server">
                                                                <button type="button" class="btn btn-small btn-primary tooltip-info" id="btnRefreshCon"
                                                                    runat="server" onserverclick="btnrefersh_ServerClick" data-rel="tooltip" data-placement="top"
                                                                    title="Refresh Contact">
                                                                    <i class="icon-refresh"></i>
                                                                </button>
                                                            </div>
                                                            &nbsp;&nbsp;
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Contact Source
                                                                            <asp:Label ID="label21" runat="server" Enabled="false" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlContactsourceadd" runat="server" CssClass="chzn-select"
                                                                                Enabled="false" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                                data-content="Select Contact Source">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="ddlContactsourceadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Contact Source"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Contact Type
                                                                            <asp:Label ID="Label10" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlContactType" runat="server" Width="215px" Enabled="false"
                                                                                CssClass="chzn-select" ValidationGroup="Grplead2" data-trigger="hover" data-placement="top"
                                                                                data-content="Select Contact Type">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlContactType"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Contact Type"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Customer Type
                                                                            <asp:Label ID="Label1re7" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlstudenttypeadd" runat="server" data-placeholder="Select Type"
                                                                                Enabled="false" Width="215px" CssClass="chzn-select" AutoPostBack="true" ValidationGroup="Grplead2"
                                                                                OnSelectedIndexChanged="ddlstudenttypeadd_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlstudenttypeadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Customer Type"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Title
                                                                            <asp:Label ID="Label11" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlTitle" runat="server" Width="215px" CssClass="chzn-select"
                                                                                Enabled="false" ValidationGroup="Grplead2">
                                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                <asp:ListItem Value="1">Mr.</asp:ListItem>
                                                                                <asp:ListItem Value="2">Ms.</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ddlTitle"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Title"
                                                                                InitialValue="0" />
                                                                        </td>
                                                                        <td colspan="4">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            First Name
                                                                            <asp:Label ID="label12" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtFirstName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                                Enabled="false" placeholder="First Name"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtFirstName"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Name" />
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator121" runat="server"
                                                                                ControlToValidate="txtFirstName" ErrorMessage="Please input alphabets" ValidationGroup="Grplead2"
                                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Middle Name
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtMidName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                                Enabled="false" placeholder="Middle Name"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMidName"
                                                                                ErrorMessage="Please input alphabets" ValidationGroup="Grplead2" Text="#" SetFocusOnError="true"
                                                                                ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Last Name
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtLastName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                                Enabled="false" placeholder="Last Name"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName"
                                                                                ErrorMessage="Please input alphabets" ValidationGroup="Grplead2" Text="#" SetFocusOnError="true"
                                                                                ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Gender
                                                                            <asp:Label ID="label18" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlGender" runat="server" Width="215px" CssClass="chzn-select"
                                                                                Enabled="false" ValidationGroup="Grplead2">
                                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                <asp:ListItem Value="1">Male</asp:ListItem>
                                                                                <asp:ListItem Value="2">Female</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="ddlGender"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Gender"
                                                                                InitialValue="0" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            DOB
                                                                            <asp:Label ID="label19" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtdateofbirth" Width="205px" Placeholder="Date of Birth" runat="server"
                                                                                Enabled="false" ValidationGroup="Grplead2"></asp:TextBox>
                                                                            <CC1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtdateofbirth"
                                                                                DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                            </CC1:CalendarExtender>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtdateofbirth"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Date Of Birth" />
                                                                            <asp:RegularExpressionValidator ID="dateValRegex" runat="server" ControlToValidate="txtdateofbirth"
                                                                                ValidationGroup="Grplead2" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                                            <asp:Label ID="lbldateerrordob" runat="server" ForeColor="#FF3300"></asp:Label>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionVaxcdlidator3" runat="server"
                                                                                ControlToValidate="txtdateofbirth" ValidationGroup="Grplead2" Text="#" SetFocusOnError="True"
                                                                                ErrorMessage="Please Enter a valid date" ValidationExpression="^(((0[1-9]|[12]\d|3[01])-(0[13578]|1[02])-((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)-(0[13456789]|1[012])-((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])-02-((19|[2-9]\d)\d{2}))|(29-02-((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                        <td colspan="2">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Handphone 1
                                                                            <asp:Label ID="label1" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtHandPhone1" runat="server" Width="205px" placeholder="Handphone 1"
                                                                                Enabled="false" ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" ControlToValidate="txtHandPhone1"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Handphone 1" />
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatordsw2" ControlToValidate="txtHandPhone1"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtHandPhone1"
                                                                                ErrorMessage="Handphone length must be between 10 to 18 characters" ValidationGroup="Grplead2"
                                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Handphone 2
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtHandphone2" runat="server" Width="205px" placeholder="Handphone 2"
                                                                                Enabled="false" ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtHandphone2"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtHandphone2"
                                                                                ErrorMessage="Handphone length must be between 10 to 18 characters" ValidationGroup="Grplead2"
                                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Landline No.
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtlandline" runat="server" Width="205px" placeholder="Landline No."
                                                                                Enabled="false" ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtlandline"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtlandline"
                                                                                ErrorMessage="Handphone length must be between 7 to 18 characters" ValidationGroup="Grplead2"
                                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{7,18}$" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Address 1
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtaddress1" runat="server" Width="205px" placeholder="Address Line 1"
                                                                                Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td width="10%">
                                                                            Address 2
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtaddress2" runat="server" Width="205px" placeholder="Address Line 2"
                                                                                Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td width="10%">
                                                                            Street Name
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtStreetname" runat="server" Width="205px" placeholder="Street Name"
                                                                                Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <tr>
                                                                            <td width="10%">
                                                                                Country
                                                                                <asp:Label ID="label23" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:DropDownList ID="ddlCountry" runat="server" Width="215px" CssClass="chzn-select"
                                                                                    Enabled="false" AutoPostBack="true" ValidationGroup="Grplead2" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator133" ControlToValidate="ddlCountry"
                                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Country"
                                                                                    InitialValue="Select" />
                                                                            </td>
                                                                            <td width="10%">
                                                                                State
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:DropDownList ID="ddlstate" runat="server" Width="215px" CssClass="chzn-select"
                                                                                    Enabled="false" AutoPostBack="true" ValidationGroup="Grplead2" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td width="10%">
                                                                                City
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:DropDownList ID="ddlcity" runat="server" Width="215px" CssClass="chzn-select"
                                                                                    Enabled="false" ValidationGroup="Grplead2">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="10%">
                                                                                Location
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:DropDownList ID="ddllocation" runat="server" Width="215px" CssClass="chzn-select"
                                                                                    ValidationGroup="Grplead2" Enabled="false">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td width="10%">
                                                                                Postal Code
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:TextBox ID="txtpincode" runat="server" placeholder="Postal Code" MaxLength="6"
                                                                                    Enabled="false" ValidationGroup="Grplead2" Width="205px" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3243" ControlToValidate="txtpincode"
                                                                                    Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="txtpincode"
                                                                                    runat="server" ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="Grplead2"
                                                                                    Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{6,6}$" />
                                                                            </td>
                                                                            <td width="10%">
                                                                                Email id
                                                                            </td>
                                                                            <td width="20%">
                                                                                <asp:TextBox ID="txtemailid" runat="server" Width="205px" placeholder="Email Id"
                                                                                    Enabled="false" ValidationGroup="Grplead2"></asp:TextBox>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValasdwidator5" runat="server"
                                                                                    ControlToValidate="txtemailid" ErrorMessage="Email Address Not Valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                                    ValidationGroup="Grplead2" SetFocusOnError="True" Text="#"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <%--<td colspan="2">
                                                                            </td>--%>
                                                                        </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid" runat="server" visible="false">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Contact Academic Information
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <div class="row-fluid">
                                                                    <asp:DataList ID="dlAcadInfo" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                                        <HeaderTemplate>
                                                                            <b class="center" style="text-align: left">Institution Type</b></th>
                                                                            <th style="text-align: center">
                                                                                Institution Name
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Board
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Standard
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Division
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Year Of Passing
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Additional Desc
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Examination Name
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Final Marks Obtained
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Final Marks Total
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Grade
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Percentage
                                                                            </th>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" Text='<%#DataBinder.Eval(Container.DataItem, "Record_No")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblInstitutionTypeCode" Text='<%#DataBinder.Eval(Container.DataItem, "Institution_Type_Id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblInstitutionType" Text='<%#DataBinder.Eval(Container.DataItem, "Institution_Type_Desc")%>'
                                                                                runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblInstitutionName" Text='<%#DataBinder.Eval(Container.DataItem, "Institution_Description")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblBoardId" Text='<%#DataBinder.Eval(Container.DataItem, "Board_Id")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblBoardName" Text='<%#DataBinder.Eval(Container.DataItem, "Board_Desc")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblStandardCode" Text='<%#DataBinder.Eval(Container.DataItem, "Current_Standard_Id")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblStandardName" Text='<%#DataBinder.Eval(Container.DataItem, "Current_Standard_Desc")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblDivisionCode" Text='<%#DataBinder.Eval(Container.DataItem, "Section_Id")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblDivisionName" Text='<%#DataBinder.Eval(Container.DataItem, "Section_Desc")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblPassingYearCode" Text='<%#DataBinder.Eval(Container.DataItem, "Year_of_Passing_ID")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblPassingYearName" Text='<%#DataBinder.Eval(Container.DataItem, "Year_of_Passing_Desc")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblAditionalDesc" Text='<%#DataBinder.Eval(Container.DataItem, "Additional_Desc")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblExamName" Text='<%#DataBinder.Eval(Container.DataItem, "ExamName")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblFinalMarkObt" Text='<%#DataBinder.Eval(Container.DataItem, "FinalMarksObtained")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblFinalMarkTotal" Text='<%#DataBinder.Eval(Container.DataItem, "FinalMarksTotal")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblGrade" Text='<%#DataBinder.Eval(Container.DataItem, "Grade")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblPercentage" Text='<%#DataBinder.Eval(Container.DataItem, "Percentage")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:Label ID="lblAcadInfoRecord" CssClass="red" Visible="False" runat="server" Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid" runat="server" visible="false">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Secondary Contact Information
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <div class="row-fluid">
                                                                    <asp:DataList ID="dlSec_Con_Info" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                                        <HeaderTemplate>
                                                                            <b class="center" style="text-align: left">Contact Type</b></th>
                                                                            <th style="text-align: center">
                                                                                Name
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Handphone1
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Handphone2
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                LandLineNo
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Gender
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Email Id
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Occupation
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Organization
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Designation
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Office Phone
                                                                            </th>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContactId" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCon_type_id" Text='<%#DataBinder.Eval(Container.DataItem, "Con_type_id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCon_Type_desc" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Type_desc")%>'
                                                                                runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblName" Text='<%#DataBinder.Eval(Container.DataItem, "Name")%>' runat="server"></asp:Label>
                                                                                <asp:Label ID="lblConTitle" Text='<%#DataBinder.Eval(Container.DataItem, "Con_title")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblFName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_Firstname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblMName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_midname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblLName" Text='<%#DataBinder.Eval(Container.DataItem, "Con_lastname")%>'
                                                                                    runat="server" Visible="false"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblHandphone1" Text='<%#DataBinder.Eval(Container.DataItem, "Handphone1")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblHandphone2" Text='<%#DataBinder.Eval(Container.DataItem, "Handphone2")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblLandline" Text='<%#DataBinder.Eval(Container.DataItem, "Landline")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblGender" Text='<%#DataBinder.Eval(Container.DataItem, "Gender")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblEmailid" Text='<%#DataBinder.Eval(Container.DataItem, "Emailid")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblOccupation" Text='<%#DataBinder.Eval(Container.DataItem, "Occupation")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblOrganization" Text='<%#DataBinder.Eval(Container.DataItem, "Organization")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblDesignation" Text='<%#DataBinder.Eval(Container.DataItem, "Designation")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblOffice_phone" Text='<%#DataBinder.Eval(Container.DataItem, "Office_phone")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:Label ID="lblSecConRecord" CssClass="red" Visible="False" runat="server" Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Organization Assignments
                                                            </h5>
                                                            <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover" id="tblorgassign"
                                                                    runat="server">
                                                                    <%--<thead>
                                                                        <tr>
                                                                            <th colspan="6">
                                                                                Organization Assignments
                                                                            </th>
                                                                        </tr>
                                                                    </thead>--%>
                                                                    <tr id="trSourcecompany" runat="server">
                                                                        <td width="10%">
                                                                            Source Company
                                                                        </td>
                                                                        <td width="20%" colspan="5">
                                                                            <asp:DropDownList ID="ddlsourcecompanyadd" Width="215px" Enabled="false" runat="server"
                                                                                AutoPostBack="true" data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="ddlsourcecompanyadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Source Company"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tblrow1" runat="server">
                                                                        <td width="10%">
                                                                            Source Division
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlSourcedivisionadd" Width="215px" Enabled="false" runat="server"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSourcedivisionadd_SelectedIndexChanged"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="ddlSourcedivisionadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Source Division"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Source Area / Zone
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlSourcezoneadd" Width="215px" Enabled="false" runat="server"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSourcezoneadd_SelectedIndexChanged"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="ddlSourcezoneadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Source Zone"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Source Center
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlSourcecenteradd" Width="215px" Enabled="false" runat="server"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="ddlSourcecenteradd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Source Center"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="trtargetcompany" runat="server">
                                                                        <td width="10%">
                                                                            Target Company
                                                                        </td>
                                                                        <td width="20%" colspan="5">
                                                                            <asp:DropDownList ID="ddltargetcompanyadd" Width="215px" Enabled="false" runat="server"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddltargetcompanyadd_SelectedIndexChanged"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddltargetcompanyadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Target Company"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Target Division
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddltargetdivisionadd" Enabled="false" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddltargetdivisionadd_SelectedIndexChanged" data-placeholder="Select"
                                                                                CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="ddltargetdivisionadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Target Division"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Target Area / Zone
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddltargetzoneadd" Enabled="false" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddltargetzoneadd_SelectedIndexChanged" data-placeholder="Select"
                                                                                CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="ddltargetzoneadd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Target Zone"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Target Center
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddltargetcenteradd" Enabled="false" runat="server" data-placeholder="Select"
                                                                                CssClass="chzn-select" ValidationGroup="Grplead" OnSelectedIndexChanged="ddltargetcenter_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="ddltargetcenteradd"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Target Center"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr11" runat="server" visible="false">
                                                                        <%--<td width="10%">Role</td>
                                                <td width="20%"><asp:DropDownList ID="ddlrole" runat ="server" AutoPostBack ="true" Width="86%" ValidationGroup ="Grplead"></asp:DropDownList></td>--%>
                                                                        <td width="10%">
                                                                            Assigned To
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="TextBox1" runat="server" Width="86%" MaxLength="6" ValidationGroup="Grplead"
                                                                                onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" ControlToValidate="txtassignedto"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Assign Contact to User" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Opportunity Details
                                                            </h5>
                                                            <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                                    <%-- <thead>
                                                                        <tr>
                                                                            <th colspan="6">
                                                                                Opportunity Details
                                                                            </th>
                                                                        </tr>
                                                                    </thead>--%>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Opportunity Date
                                                                        </td>
                                                                        <td width="20%" colspan="5">
                                                                            <asp:TextBox ID="txt1" runat="server" Width="205px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Product Category
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlAddProductCategory" Width="215px" Enabled="false" runat="server"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ddlAddProductCategory"
                                                                                Text="*" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Product Category"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Acad Year
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlacademicyear" Width="215px" Enabled="false" runat="server"
                                                                                data-placeholder="Select" CssClass="chzn-select" AutoPostBack="true" ValidationGroup="Grplead"
                                                                                OnSelectedIndexChanged="ddlacademicyear_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" ControlToValidate="ddlacademicyear"
                                                                                Text="*" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Current Academic Year"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Product Name
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtproductInterested" runat="server" placeholder="Course Interested" Enabled="false"
                                                                                Width="205px" data-trigger="hover" data-placement="top" data-content="Enter Course Interested in"
                                                                                ValidationGroup="Grplead"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="txtproductInterested"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Product Name" />
                                                                            <%--<asp:DropDownList ID="ddlproduct" Width="215px" Enabled="false" runat="server" data-placeholder="Select"
                                                                                CssClass="chzn-select" ValidationGroup="Grplead">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator48" ControlToValidate="ddlproduct"
                                                                                Text="*" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Product"
                                                                                InitialValue="Select" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Sales Stage
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlAddSalesStage" Width="215px" Enabled="false" runat="server"
                                                                                data-placeholder="Select" CssClass="chzn-select" ValidationGroup="Grplead" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlAddSalesStage_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddlAddSalesStage"
                                                                                Text="*" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Sales Stage"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%" id="tdapplicationno" runat="server">
                                                                            App. Form No
                                                                        </td>
                                                                        <td width="20%" id="tdapplicationno1" runat="server">
                                                                            <asp:TextBox ID="txtapplicationno" runat="server" Enabled="False" MaxLength="10"
                                                                                onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"
                                                                                ToolTip="Enter Application No" ValidationGroup="Grplead" Width="205px"></asp:TextBox>
                                                                        </td>
                                                                        <td width="10%">
                                                                            Probability %
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtprobabilitypercent" Enabled="false" runat="server" ValidationGroup="Grplead"
                                                                                Width="205px" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtprobabilitypercent"
                                                                                ErrorMessage="Select Probability Percent of Conversion" SetFocusOnError="True"
                                                                                Text="*" ValidationGroup="Grplead" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                Convert Order
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Order No
                                                                            <asp:Label ID="label5" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtOrderNo" runat="server" Width="205px" ValidationGroup="GrpOrder"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtOrderNo"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="false" ErrorMessage="Enter Order Number" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Order Date
                                                                            <asp:Label ID="label6" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <input readonly="readonly" class="span8 date-picker" id="txtOrderDate" runat="server"
                                                                                type="text" data-date-format="dd M yyyy" style="width:215px"/>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtOrderDate"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="false" ErrorMessage="Enter Order Date" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Order Time
                                                                            <asp:Label ID="label7" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList runat="server" ID="ddlFromHour_Add" ToolTip="Select From Hour"
                                                                                CssClass="chzn-select" Width="55px" ValidationGroup="GrpOrder">
                                                                                <asp:ListItem>--</asp:ListItem>
                                                                                <asp:ListItem>00</asp:ListItem>
                                                                                <asp:ListItem>01</asp:ListItem>
                                                                                <asp:ListItem>02</asp:ListItem>
                                                                                <asp:ListItem>03</asp:ListItem>
                                                                                <asp:ListItem>04</asp:ListItem>
                                                                                <asp:ListItem>05</asp:ListItem>
                                                                                <asp:ListItem>06</asp:ListItem>
                                                                                <asp:ListItem>07</asp:ListItem>
                                                                                <asp:ListItem>08</asp:ListItem>
                                                                                <asp:ListItem>09</asp:ListItem>
                                                                                <asp:ListItem>10</asp:ListItem>
                                                                                <asp:ListItem>11</asp:ListItem>
                                                                                <asp:ListItem>12</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ddlFromHour_Add"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="True" ErrorMessage="Select Order time(Hour)"
                                                                                InitialValue="--" />
                                                                            <asp:DropDownList runat="server" ID="ddlFromMinute_add" ToolTip="Select From Minute"
                                                                                CssClass="chzn-select" Width="55px" ValidationGroup="GrpOrder">
                                                                                <asp:ListItem>--</asp:ListItem>
                                                                                <asp:ListItem>00</asp:ListItem>
                                                                                <asp:ListItem>01</asp:ListItem>
                                                                                <asp:ListItem>02</asp:ListItem>
                                                                                <asp:ListItem>03</asp:ListItem>
                                                                                <asp:ListItem>04</asp:ListItem>
                                                                                <asp:ListItem>05</asp:ListItem>
                                                                                <asp:ListItem>06</asp:ListItem>
                                                                                <asp:ListItem>07</asp:ListItem>
                                                                                <asp:ListItem>08</asp:ListItem>
                                                                                <asp:ListItem>09</asp:ListItem>
                                                                                <asp:ListItem>10</asp:ListItem>
                                                                                <asp:ListItem>11</asp:ListItem>
                                                                                <asp:ListItem>12</asp:ListItem>
                                                                                <asp:ListItem>13</asp:ListItem>
                                                                                <asp:ListItem>14</asp:ListItem>
                                                                                <asp:ListItem>15</asp:ListItem>
                                                                                <asp:ListItem>16</asp:ListItem>
                                                                                <asp:ListItem>17</asp:ListItem>
                                                                                <asp:ListItem>18</asp:ListItem>
                                                                                <asp:ListItem>19</asp:ListItem>
                                                                                <asp:ListItem>20</asp:ListItem>
                                                                                <asp:ListItem>21</asp:ListItem>
                                                                                <asp:ListItem>22</asp:ListItem>
                                                                                <asp:ListItem>23</asp:ListItem>
                                                                                <asp:ListItem>24</asp:ListItem>
                                                                                <asp:ListItem>25</asp:ListItem>
                                                                                <asp:ListItem>26</asp:ListItem>
                                                                                <asp:ListItem>27</asp:ListItem>
                                                                                <asp:ListItem>28</asp:ListItem>
                                                                                <asp:ListItem>29</asp:ListItem>
                                                                                <asp:ListItem>30</asp:ListItem>
                                                                                <asp:ListItem>31</asp:ListItem>
                                                                                <asp:ListItem>32</asp:ListItem>
                                                                                <asp:ListItem>33</asp:ListItem>
                                                                                <asp:ListItem>34</asp:ListItem>
                                                                                <asp:ListItem>35</asp:ListItem>
                                                                                <asp:ListItem>36</asp:ListItem>
                                                                                <asp:ListItem>37</asp:ListItem>
                                                                                <asp:ListItem>38</asp:ListItem>
                                                                                <asp:ListItem>39</asp:ListItem>
                                                                                <asp:ListItem>40</asp:ListItem>
                                                                                <asp:ListItem>41</asp:ListItem>
                                                                                <asp:ListItem>42</asp:ListItem>
                                                                                <asp:ListItem>43</asp:ListItem>
                                                                                <asp:ListItem>44</asp:ListItem>
                                                                                <asp:ListItem>45</asp:ListItem>
                                                                                <asp:ListItem>46</asp:ListItem>
                                                                                <asp:ListItem>47</asp:ListItem>
                                                                                <asp:ListItem>48</asp:ListItem>
                                                                                <asp:ListItem>49</asp:ListItem>
                                                                                <asp:ListItem>50</asp:ListItem>
                                                                                <asp:ListItem>51</asp:ListItem>
                                                                                <asp:ListItem>52</asp:ListItem>
                                                                                <asp:ListItem>53</asp:ListItem>
                                                                                <asp:ListItem>54</asp:ListItem>
                                                                                <asp:ListItem>55</asp:ListItem>
                                                                                <asp:ListItem>56</asp:ListItem>
                                                                                <asp:ListItem>57</asp:ListItem>
                                                                                <asp:ListItem>58</asp:ListItem>
                                                                                <asp:ListItem>59</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ddlFromMinute_add"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="True" ErrorMessage="Select Order time(Minute)"
                                                                                InitialValue="--" />
                                                                            <asp:DropDownList runat="server" ID="ddlFromAmPm_add" ToolTip="Select From AM/PM"
                                                                                CssClass="chzn-select" Width="60px" ValidationGroup="GrpOrder">
                                                                                <asp:ListItem>AM</asp:ListItem>
                                                                                <asp:ListItem>PM</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Current Status
                                                                            <asp:Label ID="label8" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList runat="server" ID="ddlCurrentStatus" ToolTip="Select Current Status"
                                                                                CssClass="chzn-select" Width="215px" ValidationGroup="GrpOrder">
                                                                                <asp:ListItem>Select</asp:ListItem>
                                                                                <asp:ListItem>Pending</asp:ListItem>
                                                                                <asp:ListItem>Confirm</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlCurrentStatus"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="True" ErrorMessage="Select Order Status"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Amount
                                                                            <asp:Label ID="label9" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%" colspan="3">
                                                                            <asp:TextBox ID="txtOrderAmount" runat="server" Width="205px" placeholder="Order Amount"
                                                                                ValidationGroup="GrpOrder" MaxLength="15" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtOrderAmount"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="True" ErrorMessage="Enter Order Amount" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="10%">
                                                                            Remark's
                                                                            <asp:Label ID="label13" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%" colspan="5">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Width="94%" ValidationGroup="GrpOrder" MaxLength="1000"
                                                                                placeholder="Free Text" data-trigger="hover" data-placement="top" data-content="Enter Remarks"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtRemarks"
                                                                                Text="#" runat="server" ValidationGroup="GrpOrder" SetFocusOnError="True" ErrorMessage="Enter Remarks" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="well" style="text-align: center; background-color: #F0F0F0">
                                                <button class="btn btn-app btn-success btn-mini radius-4" id="btnSaveOrder" runat="server"
                                                        validationgroup="GrpOrder" onserverclick="btnSaveOrder_ServerClick">
                                                        Save
                                                    </button>                                                    
                                                <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclear" runat="server"
                                                    onclick="javascript:window.close()">
                                                    Close
                                                </button>
                                                <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True"
                                                        ValidationGroup="GrpOrder" ShowSummary="False" />
                                            </div>
                                            <asp:Label ID="lblprimarycontactid" runat="server" Visible="false"></asp:Label>
                                            <%--<div class="row-fluid">
                                                <historypanel:historypanel runat="server" id="HistoryPanel1"></historypanel:historypanel>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <!-- static -->
                                </div>
                            </div>
                        </div>
                        <!--end tabbable-->
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsearchoppor" />
                    <asp:PostBackTrigger ControlID="btnSaveOrder" />                    
                </Triggers>
            </asp:UpdatePanel>
            <!-- END PAGE CONTENT FOR EDIT-->
        </div>
    </div>
    <!-- END CONTENT -->
</asp:Content>
