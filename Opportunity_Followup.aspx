﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Opportunity_Followup.aspx.cs" Inherits="Opportunity_Followup" %>

<%@ Register TagPrefix="HistoryPanel" TagName="HistoryPanel" Src="~/UserControl/uc_Contact_FollowUp_History.ascx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="CC1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .uppercase
        {
            text-transform: uppercase;
        }
    </style>
    <!--Voitekk Integration-->
    <script src="CallingSystem/jssip.js" type="text/javascript"></script>
    <script src="CallingSystem/sipfunction.js" type="text/javascript"></script>
    <script src="CallingSystem/Calling_System_Integration_Voitekk.js" type="text/javascript"></script>
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
            <li><a href="Opportunity.aspx">Opportunity</a><span class="divider"><i class="icon-angle-right"></i></span></li>
             <li><a href="#">
                            <asp:Label ID="lblbreadcrumbs" runat="server" Visible ="false" ></asp:Label></a></li>
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
    </div>
    <!-- END PAGE HEADER-->
    <div id="page-content" class="clearfix">
        <div class="page-content">
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
            <div class="alert alert-success" id="divsipregistered" runat="server" style="display: none">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblsipregistered" runat="server" Text="Ready for Call"></asp:Label></strong>
            </div>
            <div class="alert alert-danger" id="divsipunregistered" runat="server" style="display: none">
                <button class="close" data-close="alert">
                </button>
                <strong>
                    <asp:Label ID="lblsipunregistered" runat="server" Text="Check Connection. Call Cannot be made Now"></asp:Label></strong>
            </div>
            <!-- BEGIN PAGE CONTENT FOR SEARCH-->
            <div class="row-fluid" id="divSearch" runat="server">
                <div class="span12">
                    <asp:UpdatePanel ID="upnl1" runat="server">
                        <ContentTemplate>
                            <div id="tab_1_3" class="row-fluid">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <div class="table-responsive">
                                            <div class="row-fluid" runat="server" id="divConInfo" visible="false">
                                                <div class="widget-box">
                                                    <div class="widget-header">
                                                        <h5>
                                                            <i class="icon-comments"></i>Contact Basic Info
                                                        </h5>
                                                    </div>
                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <table class="table table-striped table-bordered table-advance table-hover">
                                                                <tr>
                                                                    <td width="10%">
                                                                        Contact Type
                                                                        <asp:Label ID="Label7" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        <asp:Label ID="lblPKey_Con_Id" runat="server" Style="display: none"></asp:Label>
                                                                        <asp:Label ID="lbluser_id" runat="server" Style="display: none"></asp:Label>
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
                                                                        <asp:DropDownList ID="ddlcustomertype" runat="server" data-placeholder="Select Type"
                                                                            Enabled="false" Width="215px" CssClass="chzn-select" AutoPostBack="true" ValidationGroup="Grplead2">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="ddlcustomertype"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Customer Type"
                                                                            InitialValue="Select" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        Title
                                                                        <asp:Label ID="Label11" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:DropDownList ID="ddlTitle" runat="server" Width="215px" CssClass="chzn-select"
                                                                            ValidationGroup="Grplead2" Enabled="false">
                                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                                            <asp:ListItem Value="1">Mr.</asp:ListItem>
                                                                            <asp:ListItem Value="2">Ms.</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlTitle"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Title"
                                                                            InitialValue="0" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="10%">
                                                                        First Name
                                                                        <asp:Label ID="label12" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtFirstName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                            placeholder="First Name" Enabled="false"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="txtFirstName"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Name" />
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName"
                                                                            ErrorMessage="Please input alphabets" ValidationGroup="Grplead2" Text="#" SetFocusOnError="true"
                                                                            ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        Middle Name
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtMidName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                            placeholder="Middle Name" Enabled="false"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtMidName"
                                                                            ErrorMessage="Please input alphabets" ValidationGroup="Grplead2" Text="#" SetFocusOnError="true"
                                                                            ValidationExpression="^[a-zA-Z]+[ a-zA-Z-_]*$" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        Last Name
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtLastName" runat="server" Width="205px" ValidationGroup="Grplead2"
                                                                            placeholder="Last Name" Enabled="false"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtLastName"
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
                                                                            ValidationGroup="Grplead2" Enabled="false">
                                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                                            <asp:ListItem Value="1">Male</asp:ListItem>
                                                                            <asp:ListItem Value="2">Female</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="ddlGender"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Select Gender"
                                                                            InitialValue="0" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        DOB
                                                                        <asp:Label ID="label19" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtdateofbirth" Width="205px" Placeholder="Date of Birth" runat="server"
                                                                            ValidationGroup="Grplead2" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td colspan="2">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="10%">
                                                                        Handphone 1
                                                                        <asp:Label ID="label14" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                    </td>
                                                                    <td width="20%">
                                                                        <%--  <video id="remoteView" autoplay="" poster="" src="" hidden="hidden" style="display: none">
                                                                    </video>--%>
                                                                        <asp:TextBox ID="txthandphone1" runat="server" Enabled="false" Width="205px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="txtHandPhone1"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="True" ErrorMessage="Enter Handphone 1" />
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtHandPhone1"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                            ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtHandPhone1"
                                                                            ErrorMessage="Handphone length must be between 10 to 18 characters" ValidationGroup="Grplead2"
                                                                            Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        Handphone 2
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtHandphone2" runat="server" Width="205px" placeholder="Handphone 2"
                                                                            Enabled="false" ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="txtHandphone2"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                            ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtHandphone2"
                                                                            ErrorMessage="Handphone length must be between 10 to 18 characters" ValidationGroup="Grplead2"
                                                                            Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{10,18}$" />
                                                                    </td>
                                                                    <td width="10%">
                                                                        Landline No.
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:TextBox ID="txtlandline" runat="server" Width="205px" placeholder="Landline No."
                                                                            Enabled="false" ValidationGroup="Grplead2" MaxLength="18" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="txtlandline"
                                                                            Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                            ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                                                            ControlToValidate="txtlandline" ErrorMessage="Handphone length must be between 7 to 18 characters"
                                                                            ValidationGroup="Grplead2" Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{7,18}$" />
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
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ControlToValidate="txtpincode"
                                                                                Text="#" runat="server" ValidationGroup="Grplead2" SetFocusOnError="true" ErrorMessage="Please Enter Only Numbers"
                                                                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" ControlToValidate="txtpincode"
                                                                                runat="server" ErrorMessage="Pincode length must be of 6 Character" ValidationGroup="Grplead2"
                                                                                Text="#" SetFocusOnError="true" ValidationExpression="^[0-9]{6,6}$" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Email id
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtemailid" runat="server" Width="205px" placeholder="Email Id"
                                                                                Enabled="false" ValidationGroup="Grplead2"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
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
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                <i class="icon-comments"></i>Contact Information
                                                            </h5>
                                                            <div class="btn-group" id="divEditContatc" runat="server">
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
                                                                Contact Academic Information
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
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
                                                                        <%--<th style="text-align: center">
                                                                            Action
                                                                        </th>--%>
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
                                                                        <%--<td style="text-align: center">
                                                                            <asp:LinkButton ID="lnkDLEdit" ToolTip="Edit" class="btn btn-mini btn-primary" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Record_No")%>'
                                                                                runat="server" CommandName="Edit" Height="15px"><i class=" icon-info-sign"></i></asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkDelete" ToolTip="Remove" runat="server" class="btn btn-mini btn-danger"
                                                                                CommandName="Remove" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Record_No")%>'><i class="icon-trash"></i></asp:LinkButton>
                                                                        </td>--%>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <asp:Label ID="lblAcadInfoRecord" CssClass="red" Visible="False" runat="server" Font-Bold="True"></asp:Label>
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
                                                                Contact-Account History
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <div class="row-fluid">
                                                                    <asp:DataList ID="ddlContact_AccountHistory" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover">
                                                                        <HeaderTemplate>
                                                                            <b class="center" style="text-align: left">Division</b></th>
                                                                            <th style="text-align: center">
                                                                                Center
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Acad Year
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Product
                                                                            </th>
                                                                            <th style="text-align: center">
                                                                                Account Status
                                                                            </th>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAccountId" Text='<%#DataBinder.Eval(Container.DataItem, "Account_id")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblSBEntryCode" Text='<%#DataBinder.Eval(Container.DataItem, "SbEntrycode")%>'
                                                                                runat="server" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblDivision" Text='<%#DataBinder.Eval(Container.DataItem, "Division")%>'
                                                                                runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblCenter" Text='<%#DataBinder.Eval(Container.DataItem, "Center")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblAcadYear" Text='<%#DataBinder.Eval(Container.DataItem, "AcadYear")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblProductName" Text='<%#DataBinder.Eval(Container.DataItem, "ProductName")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblAccountStatus" Text='<%#DataBinder.Eval(Container.DataItem, "AccountStatus")%>'
                                                                                    runat="server"></asp:Label>
                                                                            </td>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:Label ID="lblAccountInfoRecord" CssClass="red" Visible="False" runat="server"
                                                                        Font-Bold="True"></asp:Label>
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
                                                        <i class="icon-user"></i>Opportunity Basic Info
                                                    </h5>
                                                    
                                                </div>
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                    <table class="table table-striped table-bordered table-advance table-hover">
                                                        <tr>
                                                            <td width="10%">
                                                                Product Category
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtproductcategory" runat="server" Enabled="false" Width="79%" CssClass ="uppercase"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Product
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtproduct" runat="server" Enabled="false" Width="79%" CssClass ="uppercase"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Sales Stage
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtsalesstage" runat="server" Enabled="false" Width="79%" CssClass ="uppercase"></asp:TextBox>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td width="10%">
                                                                Expected DoJ
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtoppExpectDOJ" runat="server" Enabled="false" Width="79%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Expected Closure Date
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtexpectedate" runat="server" Enabled="false" Width="79%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Probability Percent
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtprobpercent" runat="server" Enabled="false" Width="79%"></asp:TextBox>
                                                                <asp:Label ID="lblcompany" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lbldivision" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblcenter" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblstream" runat="server" Visible="false"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Source Center
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtSourceCenter" runat="server" Enabled="false" Width="79%" CssClass ="uppercase"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                Target Center
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtTargetCenter" runat="server" Enabled="false" Width="79%" CssClass ="uppercase"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
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
                                                                Make a call
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover">
                                                                    <tr>
                                                                        <td style="text-align: center" width="30%">
                                                                            Contact Type
                                                                        </td>
                                                                        <td style="text-align: center" width="30%">
                                                                            Contact No Type
                                                                        </td>
                                                                        <td style="text-align: center" width="30%">
                                                                            Number
                                                                        </td>
                                                                        <td style="text-align: center" width="10%">
                                                                            Action
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left" width="30%">
                                                                            <asp:DropDownList ID="ddlCallingContact_Type" runat="server" Width="300px" CssClass="chzn-select"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlCallingContact_Type_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: left" width="30%">
                                                                            <asp:DropDownList ID="ddlCallingContact_NoType" runat="server" Width="215px" CssClass="chzn-select"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlCallingContact_NoType_SelectedIndexChanged">
                                                                                <asp:ListItem>Select</asp:ListItem>
                                                                                <asp:ListItem>Handphone1</asp:ListItem>
                                                                                <asp:ListItem>Handphone2</asp:ListItem>
                                                                                <asp:ListItem>Landline</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: left" width="30%">
                                                                            <video id="remoteView" autoplay="" poster="" src="" hidden="hidden" style="display: none"></video>
                                                                            <asp:TextBox ID="txtCallingNumber" runat="server" Width="205px"></asp:TextBox>
                                                                            <input type="text" runat="server" style="display: none" id="txtagentid" />
                                                                            <input type="text" runat="server" style="display: none" id="txtuserid" />
                                                                            <input type="text" runat="server" style="display: none" id="txtconid" />
                                                                            <input type="text" runat="server" style="display: none" id="txtagentname" />
                                                                            <input type="text" runat="server" style="display: none" id="txtcampaignid" value="1" />
                                                                            <input type="text" runat="server" style="display: none" id="txtcampaignname" value="fromcontact" />
                                                                        </td>
                                                                        <td style="text-align: center" width="10%">
                                                                            <div id="divCallButton" runat="server" visible="false">
                                                                                <span>
                                                                                    <button id="callStartBtn" onclick="callStart()">
                                                                                        <span class="badge badge-important">Call</span></button>&nbsp;
                                                                                    <button id="callEndBtn" onclick="endcall()" style="display: none">
                                                                                        <span class="badge badge-important">End</span></button>
                                                                                    <button id="callhold" onclick="holdCall()" style="display: none">
                                                                                        <span class="badge badge-warning">Hold</span></button>
                                                                                    <button id="callunhold" onclick="unholdCall()" style="display: none">
                                                                                        <span class="badge badge-yellow">Un Hold</span></button>
                                                                                </span>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div class="widget-box">
                                                        <div class="widget-header">
                                                            <h5>
                                                                <i class="icon-comments"></i>Follow up Details
                                                            </h5>
                                                        </div>
                                                        <div class="widget-body">
                                                            <div class="widget-main">
                                                                <table class="table table-striped table-bordered table-advance table-hover" id="Table1"
                                                                    runat="server">
                                                                    <tr id="tr4" runat="server">
                                                                        <td width="10%">
                                                                            Mode
                                                                            <asp:Label ID="label3" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlContactMode" runat="server" CssClass="chzn-select" ValidationGroup="Grplead"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlContactMode_SelectedIndexChanged">
                                                                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                                <asp:ListItem Text="System Dial" Value="1001"></asp:ListItem>
                                                                                <asp:ListItem Text="Manual Dial" Value="1002"></asp:ListItem>
                                                                                <asp:ListItem Text="Contact Visit" Value="1003"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="ddlContactMode"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Mode"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            <asp:Label ID="lblCall_Status" runat="server" Text="Call Status" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCall_Status_Asstric" runat="server" Text=" *" ForeColor="#FF3300"
                                                                                Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlCallStatus" runat="server" CssClass="chzn-select" ValidationGroup="Grplead"
                                                                                Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlCallStatus_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="ddlCallStatus"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Call Status"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td colspan="2">
                                                                        </td>
                                                                    </tr>
                                                                     <tr id="tr6" runat="server" visible="false">
                                                                        <td width="10%">
                                                                            Convert &nbsp;&nbsp;
                                                                            <asp:CheckBox ID="chkconvert" runat="server" AutoPostBack="true" />
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlconvertto" runat="server" CssClass="chzn-select" Enabled="false">
                                                                                <asp:ListItem Value="Select">Select</asp:ListItem>
                                                                                <asp:ListItem Value="Opportunity">Opportunity</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr1" runat="server" visible="false">
                                                                        <td width="10%">
                                                                            Interacted With
                                                                            <%--<asp:Label ID="label9" runat ="server" Text =" *" ForeColor="#FF3300"></asp:Label>--%>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txtinteractedwith" runat="server" Width="79%" ValidationGroup="Grplead"
                                                                                 data-trigger="hover" data-placement="top" data-content="Enter Person Name who you interacted with" CssClass ="uppercase"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator id="r2" ControlToValidate="txtinteractedwith" Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Interacted With" />
                                                                            --%>
                                                                        </td>
                                                                        <td width="10%">
                                                                            Relation
                                                                            <asp:Label ID="label1" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlinteratedrelation" runat="server" CssClass="chzn-select" ValidationGroup="Grplead"
                                                                                 data-trigger="hover" data-placement="top" data-content="Select the relation of the Person with the student whom you interacted with">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlinteratedrelation"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Interacted With"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            On
                                                                            <%--<asp:Label ID="label4" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>--%>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <input readonly="readonly" class="span8 date-picker" id="txtdate" runat="server"
                                                                                type="text" data-date-format="dd M yyyy" disabled="true" style="width:215px"/>
                                                                            <%--<asp:TextBox ID="txtdate" runat="server" Width="79%" ValidationGroup="Grplead" 
                                                                                data-trigger="hover" data-placement="top" data-content="Select the Date of Interaction"></asp:TextBox>--%>
                                                                            <%--<CC1:CalendarExtender ID="Calextender" runat="server" Format="dd-MM-yyyy" TargetControlID="txtdate"
                                                                                DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                            </CC1:CalendarExtender>--%>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtdate"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Date" />
                                                                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtdate"
                                                                                ValidationGroup="Grplead" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>--%>
                                                                            <asp:Label ID="lbldateerrorInteracted" runat="server" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr2" runat="server"  visible="false">
                                                                        <td width="10%">
                                                                            Feedback
                                                                            <asp:Label ID="label5" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td colspan="5" width="90%">
                                                                            <asp:TextBox ID="txtfeedback" placeholder="Free Text" runat="server" TextMode="SingleLine"
                                                                                Width="94%" ValidationGroup="Grplead"  data-trigger="hover"
                                                                                data-placement="top" data-content="Enter Feedback"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtfeedback"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Feedback" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr3" runat="server" visible="false">
                                                                        <td width="10%">
                                                                            Sales Stage
                                                                            <asp:Label ID="label6" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:DropDownList ID="ddlsalesstage1" AutoPostBack="true" runat="server" CssClass="chzn-select"
                                                                                ValidationGroup="Grplead"  data-trigger="hover" data-placement="top" 
                                                                                data-content="Select Sales Stage" OnSelectedIndexChanged ="ddlsalesstage1_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldVasdalidator1" ControlToValidate="ddlsalesstage1"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Select Sales Stage"
                                                                                InitialValue="Select" />
                                                                        </td>
                                                                        <td width="10%">
                                                                            Next Followup Date
                                                                            <asp:Label ID="label2" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%">
                                                                            <input readonly="readonly" class="span8 date-picker" id="txtnextfollowupdate" runat="server"
                                                                                type="text" data-date-format="dd M yyyy" style="width:215px"/>
                                                                            <%--<asp:TextBox ID="txtnextfollowupdate" Placeholder="Next Followup Date" runat="server"
                                                                                Width="79%" ValidationGroup="Grplead" Enabled="True"  data-trigger="hover"
                                                                                data-placement="top" data-content="Enter the Next Followup Date"></asp:TextBox>--%>
                                                                           <%-- <CC1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy" TargetControlID="txtnextfollowupdate"
                                                                                DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                            </CC1:CalendarExtender>--%>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtnextfollowupdate"
                                                                                Text="#" runat="server" ValidationGroup="Grplead" SetFocusOnError="True" ErrorMessage="Enter Next Followup date" />
                                                                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidatorcdf1" runat="server" ControlToValidate="txtnextfollowupdate"
                                                                                ValidationGroup="Grplead" Text="#" SetFocusOnError="True" ErrorMessage="Please Enter a valid date in the format (dd-mm-yyyy)"
                                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- -.](0[1-9]|1[012])[- -.](19|20)\d\d$"></asp:RegularExpressionValidator>--%>
                                                                            <asp:Label ID="lbldateerrorfollow" runat="server" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="10%">
                                                                            Handled By
                                                                        </td>
                                                                        <td width="20%">
                                                                            <asp:TextBox ID="txthandledby" runat="server" Enabled="false" Width="79%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="tr5" runat="server" visible="false">
                                                                        <td width="10%" id="tdapplicationno" runat="server">
                                                                            App. Form No
                                                                            <asp:Label ID="label8" runat="server" Text=" *" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td width="20%" id="tdapplicationno1" runat="server">
                                                                            <asp:TextBox ID="txtapplicationno" runat="server" Enabled="False" MaxLength="10"
                                                                                onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"
                                                                                ToolTip="Enter Application No" ValidationGroup="Grplead" Width="79%"></asp:TextBox>
                                                                            <asp:Label ID="lblappnoerror" runat="server" ForeColor="#FF3300"></asp:Label>
                                                                        </td>
                                                                        <td colspan="4"></td>
                                                                    </tr>
                                                                </table>
                                                               <%-- <table class="table table-striped table-bordered table-advance table-hover" id="tblfollowupdetails"
                                                                    runat="server" visible="false">
                                                                   
                                                                </table>--%>
                                                                <div class="well" style="text-align: center; background-color: #F0F0F0" id="divfeedbackbuttons"
                                                                    runat="server">
                                                                    <button class="btn btn-app btn-success btn-mini radius-4" id="btnSubmitFeedback"
                                                                        runat="server" validationgroup="Grplead" onserverclick="btnSubmitFeedback_ServerClick">
                                                                        <asp:Label ID="lblbuttontext" runat="server"></asp:Label>
                                                                    </button>
                                                                    <input type="text" runat="server" style="display: none" id="customerPhone" />
                                                                    <input type="text" runat="server" style="display: none" id="customerId" />
                                                                    <input type="text" runat="server" style="display: none" id="leadsetId" />
                                                                    <input type="text" runat="server" style="display: none" id="leadsetName" />
                                                                    <input type="text" runat="server" style="display: none" id="campaignId" />
                                                                    <input type="text" runat="server" style="display: none" id="campaignName" />
                                                                    <input type="text" runat="server" style="display: none" id="processId" />
                                                                    <input type="text" runat="server" style="display: none" id="processName" />
                                                                    <input type="text" runat="server" style="display: none" id="agentId" />
                                                                    <input type="text" runat="server" style="display: none" id="crUd" />
                                                                    <input type="text" runat="server" style="display: none" id="rfUd" />
                                                                    <input type="text" runat="server" style="display: none" id="rfud1" />
                                                                    <input type="text" runat="server" style="display: none" id="legType" />
                                                                    <input type="text" runat="server" style="display: none" id="snUd" />
                                                                    <input type="text" runat="server" style="display: none" id="otUd" />
                                                                    <input type="text" runat="server" style="display: none" id="atEn" />
                                                                    <input type="text" runat="server" style="display: none" id="txSt" />
                                                                    <input type="text" runat="server" style="display: none" id="moc" />
                                                                    <input type="text" runat="server" style="display: none" id="callstarttime" />
                                                                    <input type="text" runat="server" style="display: none" id="callendtime" />
                                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="Button1" runat="server"
                                                                        onclick="javascript:window.close()">
                                                                        Close</button>
                                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                                                        ValidationGroup="Grplead" ShowSummary="False" />
                                                                </div>
                                                                 <div class="row-fluid">
                                                                    <HistoryPanel:HistoryPanel runat="server" ID="HistoryPanel1"></HistoryPanel:HistoryPanel>
                                                                </div>

                                                               
                                                                <div class="well" style="text-align: center; background-color: #F0F0F0" id="divclose"
                                                                    runat="server">
                                                                    <button class="btn btn-app btn-primary btn-mini radius-4" id="btnclose" runat="server"
                                                                        onclick="javascript:window.close()">
                                                                        Close
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnSubmitFeedback" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <table class="table table-striped table-bordered table-advance table-hover" id="tblconvertOpp"
                                                        runat="server">
                                                        <thead>
                                                            <th colspan="6">
                                                                Opportunity Details
                                                            </th>
                                                        </thead>
                                                        <tr>
                                                            <td width="10%">
                                                                Product Category
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlproductcategory" runat="server" Width="95%" ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlproductcategory"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Product Category"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Sales Stage
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlsalesstage" runat="server" Width="95%" ValidationGroup="Grplead1"
                                                                    AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddlsalesstage"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Sales Stage"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Converted Date
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtconverteddate" runat="server" Width="95%" Enabled="false"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Join Date
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtjoindate" runat="server" Width="90%" ValidationGroup="Grplead1"></asp:TextBox>
                                                                <CC1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy" TargetControlID="txtjoindate"
                                                                    DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                </CC1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtjoindate"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Enter Join Date" />
                                                            </td>
                                                            <td width="10%">
                                                                Exp. Close Date
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtexpectedclosedate" runat="server" Width="90%" ValidationGroup="Grplead1"></asp:TextBox>
                                                                <CC1:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MM-yyyy" TargetControlID="txtexpectedclosedate"
                                                                    DaysModeTitleFormat="dd-MM-yyyy" Enabled="True" TodaysDateFormat="dd-MM-yyyy">
                                                                </CC1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtexpectedclosedate"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Expected Closure Date" />
                                                                </div>
                                                            </td>
                                                            <td width="10%">
                                                                Probability %
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtprobabilitypercent" runat="server" Width="95%" ValidationGroup="Grplead1"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtprobabilitypercent"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Probability Percent of Conversion" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Company
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlcompany" runat="server" Width="95%" AutoPostBack="true"
                                                                    ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="ddlcompany"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Company"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Division
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddldivision" runat="server" Width="95%" AutoPostBack="true"
                                                                    ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddldivision"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Division"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Zone / Area
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlzone" runat="server" Width="95%" AutoPostBack="true" ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ddlzone"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Zone/Area"
                                                                    InitialValue="Select" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Center
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlcenter" runat="server" Width="95%" ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ddlcenter"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Center"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Product Name
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlproduct" runat="server" Width="95%" ValidationGroup="Grplead1">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="ddlproduct"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Select Product"
                                                                    InitialValue="Select" />
                                                            </td>
                                                            <td width="10%">
                                                                Oppor. Discount
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtdiscount" runat="server" Width="95%" ValidationGroup="Grplead1"
                                                                    MaxLength="5" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%">
                                                                Assigned To
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtassignedto" runat="server" Width="95%" ValidationGroup="Grplead1"
                                                                    ToolTip="Enter User ID" MaxLength="6" onKeypress="if (event.keyCode &lt; 44 || event.keyCode &gt; 57 || event.keyCode==45 || event.keyCode==47) event.returnValue = false;"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="txtassignedto"
                                                                    Text="*" runat="server" ValidationGroup="Grplead1" SetFocusOnError="True" ErrorMessage="Assign Lead" />
                                                            </td>
                                                            <td width="10%">
                                                                Search User
                                                            </td>
                                                            <td width="20%">
                                                                <asp:TextBox ID="txtusername" runat="server" Width="90%"></asp:TextBox>
                                                            </td>
                                                            <td width="10%">
                                                                <asp:Button ID="btnseacrhbyusername" runat="server" Text="Search" CssClass="btn btn-small green" />
                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlOppstatus" runat="server" Width="95%" Visible="false">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="well" style="text-align: center; background-color: #F0F0F0" id="divconvertoppbuttons"
                                                        runat="server">
                                                        <button class="btn btn-app btn-success btn-mini radius-4" id="btnopportunitysubmit"
                                                            runat="server" validationgroup="Grplead1">
                                                            Save</button>
                                                        <button class="btn btn-app btn-primary btn-mini radius-4" id="btnopportunitycancel"
                                                            runat="server">
                                                            Cancel</button>
                                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
                                                            ValidationGroup="Grplead1" ShowSummary="False" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnopportunitysubmit" />
                                                    <asp:PostBackTrigger ControlID="btnopportunitycancel" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <!--end tabbable-->
            </div>
            <!-- END PAGE CONTENT FOR SEARCH-->
        </div>
    </div>
    <!-- END CONTENT -->
</asp:Content>
