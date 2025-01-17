﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help_Help" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Welcome - Order Engine Docs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/prettify.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/ace-fonts.css" />
    <link rel="stylesheet" href="assets/css/ace.css" class="ace-main-stylesheet" />
    <!--[if lte IE 9]>
		<link rel="stylesheet" href="assets/css/ace-part2.css" class="ace-main-stylesheet" />
	<![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.css" />
    <link href="assets/js/themes/sunburst.css" rel="stylesheet" />
    <style>
        .navbar
        {
            background: #438EB9 !important;
        }
        body
        {
            font-size: 14px;
        }
        .skin-3 .main-container:before
        {
            background: #F6F6F6;
        }
        .page-content
        {
            padding-top: 25px;
            padding-bottom: 75px;
            max-width: 700px;
            margin: 0 auto;
        }
        .help-content
        {
            background-color: #FFF;
            max-width: 680px;
            margin: 0 auto;
            padding: 12px 24px;
            border: 1px solid #C5D0DC;
        }
        .help-content > .widget-box > .widget-header > .info-title
        {
            cursor: pointer;
        }
        .help-content > .widget-box > .widget-header > .info-title:hover
        {
            background-color: #DCE8F1;
        }
        .help-content > .widget-box.collapsed > .widget-header
        {
            border-bottom-width: 0;
        }
        .help-content > .widget-box
        {
            border-bottom: 1px solid #DCE8F1;
            margin-bottom: 10px;
            padding-bottom: 5px;
            transition: none;
        }
        .help-content > .widget-box.collapsed
        {
            padding-bottom: 10px;
            transition: padding-bottom 0.1s;
        }
        .help-content > .widget-box:last-child
        {
            border-bottom-width: 0;
            margin-bottom: 0;
        }
        .help-content > .widget-box:only-child
        {
            padding-bottom: 0;
            padding-bottom: 5px;
        }
        .info-list
        {
            margin: 0;
        }
        .info-list > li:nth-child(odd) > .ace-icon:first-child
        {
            color: #478FCA;
        }
        .info-list > li:nth-child(even) > .ace-icon:first-child
        {
            color: #69AA46;
        }
        .info-list > li:not(.hr)
        {
            margin-top: 0;
            margin-bottom: 0;
            padding: 16px 12px;
            line-height: 22px;
        }
        .info-list > li:not(.hr):nth-child(even)
        {
            background-color: #FFF;
            border: 1px solid #E9E9E9;
        }
        .info-list > li:not(.hr):nth-child(odd)
        {
            background-color: #F0F4F9;
        }
        .info-list > li:not(.hr):nth-child(even) code
        {
            background-color: #F0F4F9;
        }
        .info-list > li:not(.hr):nth-child(odd) code
        {
            background-color: #FFF;
        }
        .help-more
        {
            color: #4E82A3;
            border-bottom: 1px dotted #8BA8BA;
            padding: 0 1px 1px;
        }
        .help-more:hover
        {
            text-decoration: none;
            border-bottom-color: #628DB2;
            background-color: #E4EAC7;
        }
        u.dotted
        {
            text-decoration: none;
            border-bottom: 1px dotted #999;
        }
        @media only screen and (min-width: 992px)
        {
            .sidebar
            {
                padding-top: 4px;
            }
        }
        pre .close
        {
            float: inherit;
            font-size: inherit;
            font-weight: inherit;
            line-height: inherit;
            opacity: inherit;
            text-shadow: inherit;
        }
        .open-file
        {
            cursor: pointer;
            -webkit-transition: all 0.12s;
            transition: all 0.12s;
        }
        .open-file:hover
        {
            background-color: #CEE0EA !important;
        }
        .open-file .brief-show
        {
            display: none;
        }
        .open-file:hover .brief-show
        {
            display: inline;
        }
        .code-modal .modal-dialog
        {
            margin-top: 6px;
            margin-bottom: 6px;
        }
        .code-modal .modal-header
        {
            padding-top: 6px;
            padding-bottom: 6px;
        }
        .code-modal .modal-body
        {
            padding: 10px 12px;
        }
        pre
        {
            border-width: 0;
            box-shadow: none;
            border-radius: 0;
            margin-top: 8px;
        }
        a[href^="http"]:before
        {
            font-family: FontAwesome;
            font-size: 15px;
            content: "\f08e";
            display: inline;
            margin-right: 3px;
        }
        a.external_link[href^="http"]:before
        {
            display: none;
        }
        .thumbnail
        {
            margin: 12px 0 8px;
        }
    </style>
    <link rel="shortcut icon" href="../favicon.ico" />
    
</head>
<body class="no-skin skin-3">
    <div id="navbar" class="navbar navbar-default navbar-fixed-top h-navbar">
        <div class="navbar-container container" id="navbar-container">
            <div class="navbar-header pull-left ace-navbar-brand">
                <span class="no-skin">
                    <button data-target="#sidebar" type="button" class="navbar-toggle menu-toggler pull-left"
                        id="menu-toggler">
                        <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span><span class="icon-bar">
                        </span><span class="icon-bar"></span>
                    </button>
                </span><a href="#" class="navbar-brand"><small>&nbsp;<i class="glyphicon glyphicon-book"></i>&nbsp;
                    Help <span class="smaller-75">(v1.3.0)</span> </small></a>
                <!-- /.brand -->
            </div>
            <div class="navbar-header pull-right ace-navbar-buttons">
                <ul class="nav ace-nav">
                    <li class="margin-2 no-border"><a href="#" id="help-move-prev"><i class="ace-icon fa fa-chevron-left">
                    </i></a></li>
                    <li class="margin-2 no-border"><a href="#" id="help-move-next"><i class="ace-icon fa fa-chevron-right">
                    </i></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-container container">
      
        <div class="sidebar responsive sidebar-fixed" id="sidebar">
            <ul class="nav nav-list">
                <li class="highlight"><a href="#intro"><span class="menu-icon">&#x2170;.</span> <span
                    class="menu-text">Introduction</span> </a><b class="arrow"></b></li>

                <li class="highlight hover"><a href="#changes" class="dropdown-toggle"><span class="menu-icon">
                    &#x2171;.</span> <span class="menu-text">Dashboard</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#01_Dashboard.Dashboard"><i class="menu-icon fa fa-caret-right"></i>Introduction</a></li>
                        <li class="hover"><a href="#01_Dashboard.ContactStats"><i class="menu-icon fa fa-caret-right"></i>Contacts Statistics</a></li>
                        <li class="hover"><a href="#01_Dashboard.LeadStats"><i class="menu-icon fa fa-caret-right"></i>Lead Statistics</a></li>
                        <li class="hover"><a href="#01_Dashboard.OpportunityStats"><i class="menu-icon fa fa-caret-right"></i>Opportunity Statistics</a></li>
                        <li class="hover"><a href="#01_Dashboard.AccountStats"><i class="menu-icon fa fa-caret-right"></i>Account Statistics</a></li>
                        <li class="hover"><a href="#01_Dashboard.CampaignStats"><i class="menu-icon fa fa-caret-right"></i>Campaign Statistics</a></li>
                    </ul>
                    <b class="arrow"></b></li>
                <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2172;.</span> <span class="menu-text">Contacts</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#02_Contacts.DefContacts"><i class="menu-icon fa fa-caret-right"></i>Campaign Definition</a></li>
                        <li class="hover"><a href="#02_Contacts.SearchContacts"><i class="menu-icon fa fa-caret-right"></i>Search Contacts</a></li>
                        <li class="hover"><a href="#02_Contacts.AddContacts"><i class="menu-icon fa fa-caret-right"></i>Add Contacts</a></li>
                        <li class="hover"><a href="#02_Contacts.BulkContacts"><i class="menu-icon fa fa-caret-right"></i>Bulk Upload of Contacts</a></li>
                        <li class="hover"><a href="#02_Contacts.EditContacts"><i class="menu-icon fa fa-caret-right"></i>Edit Contact</a></li>
                        <li class="hover"><a href="#02_Contacts.AssignContacts"><i class="menu-icon fa fa-caret-right"></i>Assign Contacts to Lead</a></li>
                        <li class="hover"><a href="#02_Contacts.FollowupContacts"><i class="menu-icon fa fa-caret-right"></i>Contact Followup</a></li>
                    </ul>
                </li>
                <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2173;.</span> <span class="menu-text">Campaign - Admin</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#04_Campaign_Admin.DefCampaign"><i class="menu-icon fa fa-caret-right"></i>Campaign Definition</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.SearchAdmin"><i class="menu-icon fa fa-caret-right"></i>Search Created Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.CreateCampaign"><i class="menu-icon fa fa-caret-right"></i>Create Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.EditCampaign"><i class="menu-icon fa fa-caret-right"></i>Edit Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.AssignCampaign"><i class="menu-icon fa fa-caret-right"></i>Assign Contacts to Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.ReassignCampaign"><i class="menu-icon fa fa-caret-right"></i>Reassign / Remove Agents from selected Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.CloseCampaign"><i class="menu-icon fa fa-caret-right"></i>Close Campaign</a></li>
                        <li class="hover"><a href="#04_Campaign_Admin.SendSMSCampaign"><i class="menu-icon fa fa-caret-right"></i>Send SMS to Contacts within Campaign</a></li>
                    </ul>
                </li>
                <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2174;.</span> <span class="menu-text">Campaign - User</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#05_Campaign_User.DefCampaign"><i class="menu-icon fa fa-caret-right"></i>Campaign Definition</a></li>
                        <li class="hover"><a href="#05_Campaign_User.SearchAdmin"><i class="menu-icon fa fa-caret-right"></i>Search Contacts by Campaign</a></li>
                        <li class="hover"><a href="#05_Campaign_User.CreateCampaign"><i class="menu-icon fa fa-caret-right"></i>Assign to Lead</a></li>
                        <li class="hover"><a href="#05_Campaign_User.EditCampaign"><i class="menu-icon fa fa-caret-right"></i>Followup</a></li>
                        
                    </ul>
                </li>
                <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2175;.</span> <span class="menu-text">Lead</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#03_Lead.DefContacts"><i class="menu-icon fa fa-caret-right"></i>Lead Definition</a></li>
                        <li class="hover"><a href="#03_Lead.SearchContacts"><i class="menu-icon fa fa-caret-right"></i>Search Lead</a></li>
                        <li class="hover"><a href="#03_Lead.AddContacts"><i class="menu-icon fa fa-caret-right"></i>View Lead</a></li>
                        <li class="hover"><a href="#03_Lead.BulkContacts"><i class="menu-icon fa fa-caret-right"></i>Edit Lead</a></li>
                        <li class="hover"><a href="#03_Lead.EditContacts"><i class="menu-icon fa fa-caret-right"></i>Convert lead to Opportunity</a></li>
                        <li class="hover"><a href="#03_Lead.AssignContacts"><i class="menu-icon fa fa-caret-right"></i>Follow Up</a></li>
                        <li class="hover"><a href="#03_Lead.FollowupContacts"><i class="menu-icon fa fa-caret-right"></i>Block Lead</a></li>
                    </ul>
                </li>
                <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2176;.</span> <span class="menu-text">Opportunity</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#03_Lead.DefContacts"><i class="menu-icon fa fa-caret-right"></i>Opportunity Definition</a></li>
                        <li class="hover"><a href="#03_Lead.SearchContacts"><i class="menu-icon fa fa-caret-right"></i>Search Opportunity</a></li>
                        <li class="hover"><a href="#03_Lead.AddContacts"><i class="menu-icon fa fa-caret-right"></i>View Opportunity</a></li>
                        <li class="hover"><a href="#03_Lead.BulkContacts"><i class="menu-icon fa fa-caret-right"></i>Edit Opportunity</a></li>
                        <li class="hover"><a href="#03_Lead.EditContacts"><i class="menu-icon fa fa-caret-right"></i>Enrollment</a></li>
                        <li class="hover"><a href="#03_Lead.AssignContacts"><i class="menu-icon fa fa-caret-right"></i>Followup</a></li>
                        <li class="hover"><a href="#03_Lead.FollowupContacts"><i class="menu-icon fa fa-caret-right"></i>Order</a></li>
                    </ul>
                </li>

                <%--<li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2173;.</span> <span class="menu-text">Basics</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#basics/layout"><i class="menu-icon fa fa-caret-right"></i>
                            Page Layout</a></li>
                        <li class="hover"><a href="#basics/navbar"><i class="menu-icon fa fa-caret-right"></i>
                            Navbar</a></li>
                        <li class="hover"><a href="#basics/sidebar"><i class="menu-icon fa fa-caret-right"></i>
                            Sidebar</a></li>
                        <li class="hover"><a href="#basics/content"><i class="menu-icon fa fa-caret-right"></i>
                            Content</a></li>
                        <li class="hover"><a href="#basics/ajax"><i class="menu-icon fa fa-caret-right"></i>
                            Ajax Content</a></li>
                        <li class="hover"><a href="#basics/footer"><i class="menu-icon fa fa-caret-right"></i>
                            Footer</a></li>
                    </ul>
                </li>--%>
                <%--<li class="highlight hover"><a href="#elements" class="dropdown-toggle"><span class="menu-icon">
                    &#x2174;.</span> <span class="menu-text">Elements</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#elements.button"><i class="menu-icon fa fa-caret-right">
                        </i>Buttons</a></li>
                        <li class="hover"><a href="#elements.label-badge"><i class="menu-icon fa fa-caret-right">
                        </i>Labels & Badges</a></li>
                        <li class="hover"><a href="#elements.icon"><i class="menu-icon fa fa-caret-right"></i>
                            Icons</a></li>
                        <li class="hover"><a href="#elements.form"><i class="menu-icon fa fa-caret-right"></i>
                            Form Control</a></li>
                        <li class="hover"><a href="#elements.tab"><i class="menu-icon fa fa-caret-right"></i>
                            Tabs</a></li>
                        <li class="hover"><a href="#elements.accordion"><i class="menu-icon fa fa-caret-right">
                        </i>Accordion</a></li>
                        <li class="hover"><a href="#elements.tooltip"><i class="menu-icon fa fa-caret-right">
                        </i>Tooltip & Popover</a></li>
                        <li class="hover"><a href="#elements.dropdown"><i class="menu-icon fa fa-caret-right">
                        </i>Dropdown</a></li>
                        <li class="hover"><a href="#elements.other"><i class="menu-icon fa fa-caret-right"></i>
                            Other</a></li>
                    </ul>
                </li>--%>
               <%-- <li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2175;.</span> <span class="menu-text">Custom Elements</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#custom/widget-box"><i class="menu-icon fa fa-caret-right">
                        </i>Widget Boxes</a></li>
                        <li class="hover"><a href="#custom/scrollbar"><i class="menu-icon fa fa-caret-right">
                        </i>Scrollbars</a></li>
                        <li class="hover"><a href="#custom/file-input"><i class="menu-icon fa fa-caret-right">
                        </i>File Input</a></li>
                        <li class="hover"><a href="#custom/checkbox"><i class="menu-icon fa fa-caret-right">
                        </i>Checkbox & Switches</a></li>
                        <li class="hover"><a href="#custom/colorpicker"><i class="menu-icon fa fa-caret-right">
                        </i>Simple Color Picker</a></li>
                        <li class="hover"><a href="#custom/inline-editable"><i class="menu-icon fa fa-caret-right">
                        </i>Inline Editable Addons</a></li>
                        <li class="hover"><a href="#custom/content-slider"><i class="menu-icon fa fa-caret-right">
                        </i>Content Slider</a></li>
                        <li class="hover"><a href="#custom/onpage-help"><i class="menu-icon fa fa-caret-right">
                        </i>Onpage Help</a></li>
                        <li class="hover"><a href="#custom/extra"><i class="menu-icon fa fa-caret-right"></i>
                            Extra Classes</a></li>
                    </ul>
                </li>--%>
                <%--<li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2176;.</span> <span class="menu-text">Pages</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#pages/dashboard"><i class="menu-icon fa fa-caret-right">
                        </i>Dashboard</a></li>
                        <li class="hover"><a href="#pages/gallery"><i class="menu-icon fa fa-caret-right"></i>
                            Gallery</a></li>
                        <li class="hover"><a href="#pages/pricing"><i class="menu-icon fa fa-caret-right"></i>
                            Pricing</a></li>
                        <li class="hover"><a href="#pages/invoice"><i class="menu-icon fa fa-caret-right"></i>
                            Invoice</a></li>
                        <li class="hover"><a href="#pages/faq"><i class="menu-icon fa fa-caret-right"></i>FAQ</a></li>
                        <li class="hover"><a href="#pages/inbox"><i class="menu-icon fa fa-caret-right"></i>
                            Inbox</a></li>
                        <li class="hover"><a href="#pages/email"><i class="menu-icon fa fa-caret-right"></i>
                            Email Templates</a></li>
                        <li class="hover"><a href="#pages/profile"><i class="menu-icon fa fa-caret-right"></i>
                            Profile</a></li>
                        <li class="hover"><a href="#pages/timeline"><i class="menu-icon fa fa-caret-right"></i>
                            Timeline</a></li>
                        <li class="hover"><a href="#pages/login"><i class="menu-icon fa fa-caret-right"></i>
                            Login</a></li>
                        <li class="hover"><a href="#pages/error"><i class="menu-icon fa fa-caret-right"></i>
                            Error</a></li>
                    </ul>
                </li>--%>
                <%--<li class="highlight hover"><a href="#" class="dropdown-toggle"><span class="menu-icon">
                    &#x2177;.</span> <span class="menu-text">Plugins</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#plugins/tools" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Tools <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/tools.node-js">Node.js</a></li>
                                <li class="hover"><a href="#plugins/tools.less-js">Less.js</a></li>
                                <li class="hover"><a href="#plugins/tools.mustache">Mustache Compilers</a></li>
                                <li class="hover"><a href="#plugins/tools.uglifyjs">UglifyJS</a></li>
                                <li class="hover"><a href="#plugins/tools.yui-compressor">YUI Compressor</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/bootstrap"><i class="menu-icon fa fa-caret-right">
                        </i>Bootstrap</a></li>
                        <li class="hover"><a href="#plugins/jquery"><i class="menu-icon fa fa-caret-right"></i>
                            jQuery</a></li>
                        <li class="hover"><a href="#plugins/date-time" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Date & Time <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/date-time.datepicker">Date picker</a></li>
                                <li class="hover"><a href="#plugins/date-time.daterangepicker">Daterange Picker</a></li>
                                <li class="hover"><a href="#plugins/date-time.timepicker">Time Picker</a></li>
                                <li class="hover"><a href="#plugins/date-time.datetimepicker">Datetime Picker</a></li>
                                <li class="hover"><a href="#plugins/date-time.fullcalendar">FullCalendar</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/charts" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Charts <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/charts.flot">jQuery Flot Charts</a></li>
                                <li class="hover"><a href="#plugins/charts.sparkline">jQuery Sparklines</a></li>
                                <li class="hover"><a href="#plugins/charts.easypiechart">Easy Pie Chart</a></li>
                                <li class="hover"><a href="#plugins/charts.knob">jQuery Knob</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/tables" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Table & Grids <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/tables.datatables">jQuery dataTables</a></li>
                                <li class="hover"><a href="#plugins/tables.jqgrid">jQuery jqGrid</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/input" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Input & Controls <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/input.chosen">Chosen</a></li>
                                <li class="hover"><a href="#plugins/input.select2">Select2</a></li>
                                <li class="hover"><a href="#plugins/input.tag-input">Tag Input</a></li>
                                <li class="hover"><a href="#plugins/input.duallist">Dual listbox</a></li>
                                <li class="hover"><a href="#plugins/input.multiselect">Multiselect</a></li>
                                <li class="hover"><a href="#plugins/input.masked-input">Masked Input</a></li>
                                <li class="hover"><a href="#plugins/input.limiter">Input Limiter</a></li>
                                <li class="hover"><a href="#plugins/input.autosize">Textarea Autosize</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/editor" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Editors <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/editor.wysiwyg">Wysiwyg Editor</a></li>
                                <li class="hover"><a href="#plugins/editor.markdown">Markdown Editor</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/fuelux" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>FuelUX <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/fuelux.spinner">Spinner</a></li>
                                <li class="hover"><a href="#plugins/fuelux.wizard">Wizard</a></li>
                                <li class="hover"><a href="#plugins/fuelux.treeview">Treeview</a></li>
                            </ul>
                        </li>
                        <li class="hover"><a href="#plugins/misc" class="dropdown-toggle"><i class="menu-icon fa fa-caret-right">
                        </i>Miscellaneous <b class="arrow fa fa-angle-right"></b></a><b class="arrow"></b>
                            <ul class="submenu">
                                <li class="hover"><a href="#plugins/misc.inline-editable">Inline Editable</a></li>
                                <li class="hover"><a href="#plugins/misc.jquery-validate">jQuery Validate</a></li>
                                <li class="hover"><a href="#plugins/misc.colorbox">Colorbox</a></li>
                                <li class="hover"><a href="#plugins/misc.dropzone">Dropzone.js</a></li>
                                <li class="hover"><a href="#plugins/misc.colorpicker">Colorpicker</a></li>
                                <li class="hover"><a href="#plugins/misc.bootbox">Bootbox</a></li>
                                <li class="hover"><a href="#plugins/misc.gritter">Gritter</a></li>
                                <li class="hover"><a href="#plugins/misc.nestable-list">Nestable Lists</a></li>
                                <li class="hover"><a href="#plugins/misc.slimscroll">SlimScroll</a></li>
                                <li class="hover"><a href="#plugins/misc.raty">Star Rating</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>--%>
                <%--<li class="highlight hover"><a href="#settings" class="dropdown-toggle"><span class="menu-icon">
                    &#x2178;.</span> <span class="menu-text">Settings</span> <b class="arrow fa fa-angle-right">
                    </b></a><b class="arrow"></b>
                    <ul class="submenu">
                        <li class="hover"><a href="#settings.page"><i class="menu-icon fa fa-caret-right"></i>
                            Page options</a></li>
                        <li class="hover"><a href="#settings.sidebar"><i class="menu-icon fa fa-caret-right">
                        </i>Sidebar options</a></li>
                        <li class="hover"><a href="#settings.skins"><i class="menu-icon fa fa-caret-right"></i>
                            Skins</a></li>
                        <li class="hover"><a href="#settings.rtl"><i class="menu-icon fa fa-caret-right"></i>
                            RTL (right to left)</a></li>
                        <li class="hover"><a href="#settings.storage"><i class="menu-icon fa fa-caret-right">
                        </i>Cookies & Storage</a></li>
                    </ul>
                </li>--%>
              <%--  <li class="highlight"><a href="#credits"><span class="menu-icon">&#x2173;.</span> <span
                    class="menu-text">Credits</span> </a><b class="arrow"></b></li>
                <li class="highlight"><a href="#issues"><i class="menu-icon fa fa-gavel"></i><span
                    class="menu-text">Notes &amp; Issues</span> </a><b class="arrow"></b></li>--%>
            </ul>
            <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
                    data-icon2="ace-icon fa fa-angle-double-right"></i>
            </div>
        </div>
        <div class="main-content">
            <div class="page-content">
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110">
        </i></a>
        <!-- /.btn-scroll-up -->
    </div>
    <!-- /.main-container -->
    <!--[if !IE]> -->
    <script src="assets/js/jquery.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
	<script src="assets/js/jquery1x.js"></script>
	<![endif]-->
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/prettify.js"></script>
    <script src="assets/js/ace-extra.js"></script>
    <script src="assets/js/ace-elements.js"></script>
    <script src="assets/js/ace.js"></script>
    <script>
        $(function () {
            //$('body').scrollspy({ target: '.sidebar' })

            //used for top next/prev buttons
            var section_list = [], section_map = {}, current = 0;
            var sindex = 0;
            $('.sidebar .nav-list a').each(function () {
                var href = getHref($(this).attr('href'));
                if (href) {
                    section_list.push(href);
                    section_map[href] = sindex++;
                }
            });

            $('#help-move-prev').on('click', function (e) {
                e.preventDefault();
                if (--current >= 0) {
                    var href = section_list[current];
                    document.location.hash = href;
                }
                if (current < 0) current = 0;
            });
            $('#help-move-next').on('click', function (e) {
                e.preventDefault();
                if (++current < section_list.length) {
                    var href = section_list[current];
                    document.location.hash = href;
                }
                if (current >= section_list.length) current = section_list.length - 1;
            });



            //$(document).on('show.ace.widget hide.ace.widget', '.help-content > .widget-box', function(e) {
            //disable button action
            //e.preventDefault();
            //});
            $(document).on(ace.click_event, '.help-content > .widget-box > .widget-header > .info-title', function (e) {
                var widget_box = $(this).closest('.widget-box').widget_box('toggle');
                //widget_box.siblings('.widget-box').widget_box('hide');
            });


            $(document).off(ace.click_event + '.ace.submenu', '.sidebar .nav-list');
            $(document).on(ace.click_event + '.ace.submenu', '.sidebar .nav-list a', function (e) {
                var href = getHref($(this).attr('href'));
                if (!href) return false;
            });

            $(window).on('hashchange.help', function (e) {
                var href = getHref(window.location.hash);
                if (!href) return false;
                return gotoUrl(href);
            })
            $(document).on(ace.click_event + '.help', '.help-more', function (ev) {
                //clicking on a link triggers 'hashchange', so it's not needed
                //but if we already are on a hash such as '#hash1'
                //and click a '#hash1' link, 'hashchange' won't be triggered and we won't scroll to our content
                var href = $(this).attr('href');
                if (window.location.hash == href) gotoUrl(href);
            });


            var href = getHref(window.location.hash);
            if (!href) window.location.hash = '#intro';
            else $(window).triggerHandler('hashchange.help');

            var prev_target = null;

            function gotoUrl(href) {
                current = section_map[href];

                var url = href.replace(/\..*$/g, '').replace(/#/gi, '')
                var parts = url.split('/');
                if (parts.length == 1) {
                    if (url.length == 0) url = 'intro';
                    url = url + '/index.html';
                }
                else if (parts.length > 1) {
                    url = url + '.html';
                }

                $('.sidebar .active').removeClass('active');
                var link = $('a[href="' + href + '"]').eq(0);
                link.parents('li').addClass('active');

                var text = $.trim(link.find('.menu-text').text());
                if (text.length == 0) text = $.trim(link.text());
                document.title = text + " - Ace Docs";
                //if(text == '');

                var ret = scrollToTarget(href);
                if (ret === false) {
                    $('.page-content').empty().html('<i class="ace-icon fa fa-spinner fa-spin blue fa-2x"></i>');

                    //otherwise try downloading the page
                    $.ajax({ url: 'sections/' + url }).done(function (result) {
                        result = result.replace(/\<pre(?:\s+)data\-language=["'](?:html|javascript|php)["']\>([\S|\s]+?)\<\/pre\>/ig, function (a, b) {
                            return a.replace(b, b.replace(/\</g, '&lt;').replace(/\>/g, '&gt;'));
                        });

                        $('.page-content').addClass('hidden').empty().html(result);
                        formatResult();

                        ret = scrollToTarget(href);
                        if (ret) document.title = ret + " - Ace Docs";
                    }).fail(function () {
                        $('.page-content').empty().html('<div class="alert alert-danger"><i class="fa fa-warning"></i> Unable to load page!</div>');
                    });
                }
                else if (ret) document.title = ret + " - Ace Docs";


                return true;
            }

            function formatResult() {
                $('.page-content .info-section').each(function () {
                    var header = $(this).prevAll('.info-title').eq(0).addClass('widget-title').wrap('<div class="widget-header" />')
				.parent().append('<div class="widget-toolbar no-border">\
				<a href="#" data-action="collapse">\
					<i data-icon-hide="fa-minus" data-icon-show="fa-plus" class="ace-icon fa fa-plus"></i>\
				</a>\
			</div>').closest('.widget-header');

                    $(this).wrap('<div class="widget-box transparent' + (header.length > 0 ? ' collapsed' : '') + '"><div class="widget-body"><div class="widget-main"></div></div></div>');
                    $(this).closest('.widget-box').prepend(header);

                    $(this).ace_scroll({ size: parseInt($(window).height() - 200), reset: true });
                    //.parent().css({'max-height':400, 'overflow-y':'scroll'});//
                });

                Rainbow.color();

                $('.page-content').removeClass('hidden');
            }

            function getHref(href) {
                href = href && href.replace(/.*(?=#[^\s]*$)/, '') // strip for ie7
                href = $.trim(href);
                if (href.match(/[\#\/]$/i)) return false;
                return href;
            }

            function scrollToTarget(href) {
                target = $('[data-id="' + href + '"]').eq(0);
                if (target.length == 1) {
                    target.closest('.widget-box').widget_box('show');

                    //if target exists on page scroll to it
                    $('html,body').animate({ scrollTop: target.offset().top - 75 }, 300);
                    if (prev_target) prev_target.find('.fa-angle-right').remove();

                    if (!target.is('h1')) target.prepend('<i class="fa fa-angle-right red"></i> ');
                    prev_target = target;

                    return target.text().replace(/^[\d\s\.]+/ig, ''); //convert "4. something" to "something"
                }
                return false; //section not found, go back and get it via ajax
            }


            $(document).on(ace.click_event, '.open-file[data-open-file]', function () {
                var url = $(this).text();
                var language = $(this).attr('data-open-file');
                $.ajax({ url: '../' + url, dataType: 'text' }).done(function (content) {
                    if (language != 'json') {
                        if (language != 'css') {
                            //replace each tab character with two spaces (only those that start at a new line)
                            content = content.replace(/\n[\t]{1,}/g, function (p, q) {
                                return p.replace(/\t/g, "  ");
                            });
                        } else {
                            content = content.replace(/\t/g, "  ")
                        }
                    }
                    else {
                        content = JSON.stringify(JSON.parse(content), null, 2);
                    }
                    content = content.replace(/\>/g, '&gt;').replace(/\</g, '&lt;')
                    Rainbow.color(content, language, function (highlighted_code) {
                        display_code(url, highlighted_code);

                    });
                });
            });

            function display_code(url, highlighted_code) {
                var modal = $(document.body).find('#code-modal');
                if (modal.length == 0) {
                    modal = $('<div id="code-modal" class="modal fade code-modal" tabindex="-1" role="dialog" aria-labelledby="CodeDialog" aria-hidden="true">\
				  <div class="modal-dialog modal-lg">\
					<div class="modal-content">\
						<div class="modal-header">\
						  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>\
						  <i class="fa fa-file-o"></i>\
						  <code class="code-url"></code>\
						</div>\
						<div class="modal-body"><pre class="code-content"></pre></div>\
					</div>\
				  </div>\
				</div>').appendTo('body');
                }

                modal.find('.code-url').html(url);
                modal.find('.code-content').html(highlighted_code);
                modal.modal('show');
            }

            $(document).on('click', 'a[href^="http"]', function (ev) {
                //go to a url, using meta refresh tag, to avoid sending 'referrer' url,
                //maybe because of hiding development server's directory and folders

                ev.preventDefault();
                var url = $(this).attr('href');

                var win = window.open('blank.html');
                win.onload = function () {
                    win.document.write('<meta http-equiv="refresh" content="0; url=' + url + '">');
                }
            });
        });
	</script>
    <script src="assets/js/rainbow.js"></script>
    <script src="assets/js/language/generic.js"></script>
    <script src="assets/js/language/html.js"></script>
    <script src="assets/js/language/javascript.js"></script>
    <script src="assets/js/language/css.js"></script>
    <script src="assets/js/language/php.js"></script>
</body>
</html>
