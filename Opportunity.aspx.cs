﻿
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
//using System.Data.SqlClient.SqlDataReader;
//using Exportxls.BL;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using ShoppingCart.BL;
public partial class Opportunity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //string Menuid = "103";
            if (Request.Cookies["MyCookiesLoginInfo"] != null)
            {
                HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
                string UserID = cookie.Values["UserID"];
                string UserName = cookie.Values["UserName"];
                lblpagetitle1.Text = "";
                lblpagetitle2.Text = "";
                limidbreadcrumb.Visible = true;
                lblmidbreadcrumb.Text = "Manage Opportunity";
                lilastbreadcrumb.Visible = false;
                lbllastbreadcrumb.Visible = false;
                //lbllastbreadcrumb.Text = "Search Panel";
                lilastbreadcrumb.Visible = false;
                divSuccessmessage.Visible = false;
                divErrormessage.Visible = false;
                diverrorsubject.Visible = false;
                divSuccessrsubject.Visible = false;
                upnlconvert.Visible = false;
                upnlsearch.Visible = true;
                upnlconvertMT.Visible = false;
                btnviewenrollment.Visible = false;
                tdadmissionno.Visible = false;
                tdadmissionno1.Visible = false;
                btnadd2.Visible = false;
                divmessage.Visible = false;
                divSearch.Visible = true;
                divsearchresults.Visible = false;
                BindProductCategory();
                BindSalesStage();
                BindOpporStatus();
                BindCompany();
                BindDivision();
                StudentType();
                Institutetype();
                Board();
                this.ddlstandardsearch.Items.Insert(0, "All");
                this.ddlstandardsearch.SelectedIndex = 0;
                CountrySearch();
             
                ddlstreamsearch.Items.Insert(0, "All");
                ddlstreamsearch.SelectedIndex = 0;
                Yearofpassing();
                Bindscore();
                Currentyear();
                BindStream();
              
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
        GetSumvalue();


    }


    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }
    private void Bindscore()
    {
        string Oppid = "";
        string Scoretypeid = "";
        string Score = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        DataSet ds = ProductController.GetAllScore(1, Oppid, Scoretypeid, Score, UserID, Id);
        BindDDL(ddlscoretype, ds, "Score_Type_Short_Desc", "ID");
        ddlscoretype.Items.Insert(0, "All");
        ddlscoretype.SelectedIndex = 0;
    }
    private void StudentType()
    {
        DataSet ds = ProductController.GetAllStudentType();
        BindDDL(ddlcustomertypesearch, ds, "Description", "Cust_Grp");
        ddlcustomertypesearch.Items.Insert(0, "All");
        ddlcustomertypesearch.SelectedIndex = 0;
    }
    private void Institutetype()
    {
        DataSet ds = ProductController.GetallInstituteType();
        BindDDL(ddlinstitutionsearch, ds, "Description", "ID");
        ddlinstitutionsearch.Items.Insert(0, "All");
        ddlinstitutionsearch.SelectedIndex = 0;
    }
    protected void ddlinstitutionsearch_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        DataSet ds = ProductController.GetallCurrentStudyingin(ddlinstitutionsearch.SelectedValue);
        BindDDL(ddlstandardsearch, ds, "Description", "ID");
        this.ddlstandardsearch.Items.Insert(0, "All");
        this.ddlstandardsearch.SelectedIndex = 0;
    }

    private void Board()
    {
        DataSet ds = ProductController.GetallBoard();
        BindDDL(ddlboardsearch, ds, "Short_Description", "ID");
        ddlboardsearch.Items.Insert(0, "All");
        ddlboardsearch.SelectedIndex = 0;
        BindDDL(ddlboardsearch2, ds, "Short_Description", "ID");
        ddlboardsearch2.Items.Insert(0, "All");
        ddlboardsearch2.SelectedIndex = 0;

        ddlstandardsearch2.Items.Insert(0, "All");
        ddlstandardsearch2.SelectedIndex = 0;

    }
    private void Yearofpassing()
    {
        DataSet ds = ProductController.GetallYearofpassing();
        BindDDL(ddlyearsearch, ds, "Description", "ID");
        ddlyearsearch.Items.Insert(0, "All");
        ddlyearsearch.SelectedIndex = 0;
    }

    private void CountrySearch()
    {
        DataSet ds = ProductController.GetallCountry();
        BindDDL(ddlcountrysearch, ds, "Country_Name", "Country_Code");
        ddlcountrysearch.Items.Insert(0, "All");
        ddlcountrysearch.SelectedIndex = 0;
        ddlstatesearch.Items.Insert(0, "All");
        ddlstatesearch.SelectedIndex = 0;
        ddlcitysearch.Items.Insert(0, "All");
        ddlcitysearch.SelectedIndex = 0;
        ddllocationsearch.Items.Insert(0, "All");
        ddllocationsearch.SelectedIndex = 0;
    }
    protected void ddlcountrysearch_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindStateSearch();
    }
    protected void ddlstatesearch_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindCitySearch();
    }

    protected void ddlcitysearch_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindLocationSearch();
    }


    private void BindStateSearch()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlcountrysearch.SelectedValue);
        BindDDL(ddlstatesearch, ds, "State_Name", "State_Code");
        ddlstatesearch.Items.Insert(0, "Select");
        ddlstatesearch.SelectedIndex = 0;
    }
    private void BindCitySearch()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlstatesearch.SelectedValue);
        BindDDL(ddlcitysearch, ds, "City_Name", "City_Code");
        ddlcitysearch.Items.Insert(0, "Select");
        ddlcitysearch.SelectedIndex = 0;
    }
    protected void ddlcenter_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //BindAcademicYear();
        BindStream();
    }
    private void BindLocationSearch()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlcitysearch.SelectedValue);
        BindDDL(ddllocationsearch, ds, "Location_Name", "Location_Code");
        ddllocationsearch.Items.Insert(0, "All");
        ddllocationsearch.SelectedIndex = 0;
    }

    private void Currentyear()
    {
        DataSet ds = ProductController.GetAllCurrentyear();
        BindDDL(ddlacadyearsearch, ds, "Description", "ID");
        ddlacadyearsearch.Items.Insert(0, "Select");
        ddlacadyearsearch.SelectedIndex = 0;
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlacadyearsearch.SelectedValue = ds.Tables[0].Rows[0]["ID"].ToString();
        }
    }
    
    protected void ddlacadyearsearch_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindStream();
    }
    private void BindStream()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetStreamby_Center_AcademicYear(ddlcenter.SelectedValue, ddlacadyearsearch.SelectedValue);
        BindDDL(ddlstreamsearch, ds, "Stream_Sdesc", "Stream_Code");
        ddlstreamsearch.Items.Insert(0, "All");
        ddlstreamsearch.SelectedIndex = 0;
    }

    private void BindProductCategory()
    {
        DataSet ds = ProductController.GetallOpporProductCategory();
        BindDDL(ddlproductcategory, ds, "Description", "ID");
        ddlproductcategory.Items.Insert(0, "All");
        ddlproductcategory.SelectedIndex = 0;
    }
    private void BindSalesStage()
    {
        DataSet ds = ProductController.GetallSalesStage();
        BindDDL(ddlsalesstage, ds, "Sales_Stage_Desc", "Sales_Id");
        ddlsalesstage.Items.Insert(0, "All");
        ddlsalesstage.SelectedIndex = 0;
    }
    private void BindOpporStatus()
    {
        DataSet ds = ProductController.GetallLeadStatus();
        BindDDL(ddlstatus, ds, "Description", "ID");
        ddlstatus.Items.Insert(0, "All");
        ddlstatus.SelectedIndex = 0;
    }
    //private void BindCompany()
    //{
    //    HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
    //    string UserID = cookie.Values["UserID"];
    //    string UserName = cookie.Values["UserName"];
    //    DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(1, UserID, "", "", "");
    //    BindDDL(ddlcompany, ds, "Company_Name", "Company_Code");
    //    ddlcompany.Items.Insert(0, "All");
    //    ddlcompany.SelectedIndex = 0;
    //    ddldivision.Items.Insert(0, "All");
    //    ddldivision.SelectedIndex = 0;
    //    ddlzone.Items.Insert(0, "All");
    //    ddlzone.SelectedIndex = 0;
    //    ddlcenter.Items.Insert(0, "All");
    //    ddlcenter.SelectedIndex = 0;
    //}

    private void BindCompany()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center_Top1(1, UserID, "", "", "");
        ddlcompany.DataSource = ds.Tables[0];
        ddlcompany.DataTextField = "Company_Name";
        ddlcompany.DataValueField = "Company_Code";
        ddlcompany.DataBind();
        ddlcompany.Items.Insert(0, "All");
        ddlcompany.SelectedIndex = 0;

        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlcompany.SelectedValue = ds.Tables[0].Rows[0]["Company_Code"].ToString();
            ddldivision.DataSource = ds.Tables[1];
            ddldivision.DataTextField = "division_name";
            ddldivision.DataValueField = "division_code";
            ddldivision.DataBind();
            ddldivision.Items.Insert(0, "All");
            ddldivision.SelectedIndex = 0;
            if (ddldivision.Items.Count > 1)
            {
                ddldivision.SelectedIndex = 1;
                //ddlzone.DataSource = ds.Tables[2];
                //ddlzone.DataTextField = "Zone_Name";
                //ddlzone.DataValueField = "Zone_Code";
                //ddlzone.DataBind();
                //ddlzone.Items.Insert(0, "All");
                //ddlzone.SelectedIndex = 0;
                if (ddldivision.Items.Count > 1)
                {
                    //ddlzone.SelectedIndex = 1;
                    ddlcenter.DataSource = ds.Tables[3];
                    ddlcenter.DataTextField = "center_name";
                    ddlcenter.DataValueField = "center_code";
                    ddlcenter.DataBind();
                    ddlcenter.Items.Insert(0, "All");
                    ddlcenter.SelectedIndex = 0;
                    if (ddlcenter.Items.Count > 1)
                    {
                        ddlcenter.SelectedIndex = 1;
                    }
                }
                else
                {
                    ddlcenter.Items.Insert(0, "All");
                    ddlcenter.SelectedIndex = 0;
                }
            }
            else
            {
                //ddlzone.Items.Insert(0, "All");
                //ddlzone.SelectedIndex = 0;
                ddlcenter.Items.Insert(0, "All");
                ddlcenter.SelectedIndex = 0;
            }
        }
        else
        {
            ddldivision.Items.Insert(0, "All");
            ddldivision.SelectedIndex = 0;
            //ddlzone.Items.Insert(0, "All");
            //ddlzone.SelectedIndex = 0;
            ddlcenter.Items.Insert(0, "All");
            ddlcenter.SelectedIndex = 0;
        }


    }
    private void BindDivision()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(2, UserID, "", "", ddlcompany.SelectedValue);
        BindDDL(ddldivision, ds, "Division_Name", "Division_Code");
        ddldivision.Items.Insert(0, "All");
        ddldivision.SelectedIndex = 0;
        //ddlzone.Items.Insert(0, "All");
        //ddlzone.SelectedIndex = 0;
        ddlcenter.Items.Insert(0, "All");
        ddlcenter.SelectedIndex = 0;
        BindCenter();
    }
    //private void BindZone()
    //{
    //    HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
    //    string UserID = cookie.Values["UserID"];
    //    string UserName = cookie.Values["UserName"];

    //    DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(3, UserID, ddldivision.SelectedValue, "", ddlcompany.SelectedValue);
    //    BindDDL(ddlzone, ds, "Zone_Name", "Zone_Code");
    //    ddlzone.Items.Insert(0, "All");
    //    ddlzone.SelectedIndex = 0;

    //    ddlcenter.Items.Insert(0, "All");
    //    ddlcenter.SelectedIndex = 0;
    //}
    private void BindCenter()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(5, UserID, ddldivision.SelectedValue, "", ddlcompany.SelectedValue);
        BindDDL(ddlcenter, ds, "Center_name", "Center_Code");
        ddlcenter.Items.Insert(0, "All");
        ddlcenter.SelectedIndex = 0;
    }
    protected void ddlcompany_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindDivision();
    }
    protected void ddldivision_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //BindZone();
        BindCenter();
    }
    protected void ddlzone_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindCenter();
    }

    protected void btnsearch_ServerClick(object sender, System.EventArgs e)
    {

        try
        {

            string Company = "";
            string Division = "";
            string Zone = "";
            string Center = "";
            string customer_type = "";
            string institution_type = "";
            string board_id = "";
            string standard = "";
            string name = "";
            string mobile = "";
            string country = "";
            string state = "";
            string city = "";
            string location = "";
            string acadyear = "";
            string productcategory = "";
            string Stream = "";
            string application_form_no = "";
            string salesstage = "";
            string opp_from = "";
            string opp_to = "";
            string followup_from = "";
            string followup_to = "";
            string followup_overdue = "";
            string last_followupoverdays = "";
            string joining_from = "";
            string joining_to = "";
            string boardid = "";
            string Year = "";
            string agg_score = "";
            int area_rank = 0;
            int overall_rank = 0;
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            string UserName = cookie.Values["UserName"];

            Company = ddlcompany.SelectedValue;
            Division = ddldivision.SelectedValue;
            Zone = "All";
            Center = ddlcenter.SelectedValue;
            customer_type = ddlcustomertypesearch.SelectedValue;
            institution_type = ddlinstitutionsearch.SelectedValue;
            board_id = ddlboardsearch.SelectedValue;
            standard = ddlstandardsearch.SelectedValue;
            name = txtstudentname.Text;
            mobile = txthandphonesearch.Text;
            country = ddlcountrysearch.SelectedValue;
            state = ddlstatesearch.SelectedValue;
            city = ddlcitysearch.SelectedValue;
            location = ddllocationsearch.SelectedValue;
            acadyear = ddlacadyearsearch.SelectedValue;
            productcategory = ddlproductcategory.SelectedValue;
            Stream = ddlstreamsearch.SelectedValue;
            application_form_no = txtadmissionformno.Text;
            salesstage = ddlsalesstage.SelectedValue;
            opp_from = txtoppcreatedfrm.Value;
            opp_to = txtoppcreatedto.Value;
            followup_from = txtfollowupfrm.Value;
            followup_to = txtfollowupto.Value;
            if (chkfollowup.Checked == true)
            {
                followup_overdue = "1";
            }
            else
            {
                followup_overdue = "0";
            }

            last_followupoverdays = txtlastfollowoverdays.Text;
            joining_from = txtexpecjoindatefrm.Value;
            joining_to = txtexpecjoindateto.Value;
            boardid = ddlboardsearch2.SelectedValue;
            Year = ddlyearsearch.SelectedValue;
            agg_score = txtaggrescore.Text;
            if (string.IsNullOrEmpty(txtxarearank.Text))
            {
                area_rank = 0;
            }
            else
            {
                area_rank = int.Parse(txtxarearank.Text);
            }
            if (string.IsNullOrEmpty(txtoverallrank.Text))
            {
                overall_rank = 0;
            }
            else
            {
                overall_rank = int.Parse(txtoverallrank.Text);
            }

            string Scoretype = "";
            string Condition = "";
            string Score = "";

            Scoretype = ddlscoretype.SelectedValue;
            Condition = ddlcondition.SelectedValue;
            Score = txtscore.Text;

            string Agefrom = "";
            string Ageto = "";
            string block = "";
            //Dim Onlyblock As String = ""
            string Examinationdetails = "";
            string Stage = "";


            Agefrom = txtagefrom.Text;
            Ageto = txtageto.Text;
            block = ddlblocked.SelectedValue;
            Examinationdetails = txtexamsearch.Text;
            Stage = dlsearchstage.SelectedValue;
            string Gender = "";
            Gender = ddlgendersearch.SelectedValue;
            string Orderby = "";

            DataSet ds = UserController.Get_Opportunity_Search_Results_New_New_New(Company, Division, Zone, Center, customer_type, institution_type, board_id, standard, name, mobile,
            country, state, city, location, acadyear, productcategory, Stream, application_form_no, salesstage, opp_from,
            opp_to, followup_from, followup_to, followup_overdue, last_followupoverdays, joining_from, joining_to, boardid, Year, agg_score,
            area_rank, overall_rank, UserID, Scoretype, Condition, Score, Agefrom, Ageto, block, Examinationdetails,
            Stage, Gender, Orderby);


            if (ds.Tables[0].Rows.Count > 0)
            {
                divsearchresults.Visible = true;
                Divsearchcriteria.Visible = false;
                //lblpagetitle1.Text = "Manage Opportunity";
                //lblpagetitle2.Text = "Search Results";
                limidbreadcrumb.Visible = true;
                lblmidbreadcrumb.Text = "Manage Opportunity";
                //lilastbreadcrumb.Visible = true;
                //lbllastbreadcrumb.Text = " Opportunity Search Results";
                //lilastbreadcrumb.Visible = true;
                divSuccessmessage.Visible = false;
                divErrormessage.Visible = false;
                divsearchresults.Visible = true;
                divmessage.Visible = false;
                //System.Threading.Thread.Sleep(100)
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                ScriptManager1.RegisterAsyncPostBackControl(Repeater1);
                btnsearchback.Visible = true;
            }
            else
            {
                btnsearchback.Visible = false;
                divsearchresults.Visible = false;
                divmessage.Visible = true;
                lblmessage.Text = "No Records Found!";
            }
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message;
        }
    }

    protected void btnaddOpp_ServerClick(object sender, System.EventArgs e)
    {
        Response.Redirect("Opportunity_Add.aspx");
    }
    protected void btnadd2_ServerClick(object sender, System.EventArgs e)
    {
        Response.Redirect("Opportunity_Add.aspx");
    }

    protected void Repeater1_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Display")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Opportunity_Display.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "Edit")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Opportunity_Edit.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "Followup")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Opportunity_Followup.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "Block")
        {
            lblnote.Text = "You are about to block a Opportunity. Please confirm.";
            //ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "k2", "<script type=""text/javascript"">$(function () { $('#Blocklead').modal('show') });</script>", False)
            string Opporid = e.CommandArgument.ToString();
            lbloppid1.Text = Opporid;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("$('#Blocklead').modal('show');");
            sb.Append("</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);
        }
        else if (e.CommandName == "Detailed_Enroll")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Enrollment.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "Compact_Enroll")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            //string Opportunityid = e.CommandArgument.ToString();
            lbloppurid.Text = Opportunity_Code;
            //Response.Redirect("Enrollment.aspx?&Opportunity_Code=" + Opportunity_Code);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("$('#Div1').modal('show');");
            sb.Append("</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);
        }
        else if (e.CommandName == "Displayenrol")
        {
            //System.Threading.Thread.Sleep(100)
            //String Company = ((Label)e.Item.FindControl("lblisactive")).Text;
            //if (Company =="MT")
            //{
            //    string Opportunity_Code = e.CommandArgument.ToString();
            //    Response.Redirect("Opportunity_Display.aspx?&Opportunity_Code=" + Opportunity_Code);
            //}
            //else
            //{
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Enrollment_Display.aspx?&Opportunity_Code=" + Opportunity_Code);
            //}


        }
        else if (e.CommandName == "Editenrol")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Enrollment_Edit.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "FollowupEnroll")
        {
            //System.Threading.Thread.Sleep(100)
            string Opportunity_Code = e.CommandArgument.ToString();
            Response.Redirect("Opportunity_Followup.aspx?&Opportunity_Code=" + Opportunity_Code);
        }
        else if (e.CommandName == "Convert")
        {
            System.Threading.Thread.Sleep(100);
            lblpagetitle1.Text = "Convert to Account";
            lblpagetitle2.Text = "";
            //limidbreadcrumb.Visible = true;
            lblmidbreadcrumb.Text = "Manage Opportunity";
            //lilastbreadcrumb.Visible = true;
            lbllastbreadcrumb.Text = "Convert to Account";
            divSuccessmessage.Visible = false;
            divErrormessage.Visible = false;
            upnlconvert.Visible = true;
            upnlsearch.Visible = false;
            btnAction.Visible = true;
            btnviewenrollment.Visible = true;

            string Oppid = ((LinkButton)e.Item.FindControl("lnkdisplay")).CommandArgument;
            lbloppid.Text = Oppid;
            HtmlAnchor viewenrollment = btnviewenrollment;
            viewenrollment.HRef = "Enrollment_display.aspx?&Opportunity_Code=" + Oppid;

            BindStudentdetails(Oppid);
            Session["Opp_id"] = Oppid;
            //divcreatebutton.Visible = False
            //div5.Visible = False
            div5.Visible = true;
            divcreatebutton.Visible = true;
            //Dim oppid As String = ""
            //oppid = lbloppid.Text

            //Important Do forget to uncomment
            BindConvert(Oppid);
            BindMandateSubjects();
            BindCompulsorySubjects();
            BindOptionalSubject();
            BindPayplan();
            divcreatebutton.Visible = false;
            Divreselect.Visible = false;
            Div6.Visible = true;
            divfeedetails.Visible = false;
            divbtnexit.Visible = false;
            btnclose.Visible = false;
        }
        else if (e.CommandName == "UnBlock")
        {
            lblnote1.Text = "You are about to Unblock a Opportunity. Please confirm.";
            //ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "k2", "<script type=""text/javascript"">$(function () { $('#UnBlocklead').modal('show') });</script>", False)
            string Opportunityid = e.CommandArgument.ToString();
            lbloppurid.Text = Opportunityid;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("$('#UnBlocklead').modal('show');");
            sb.Append("</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);

        }
        else if (e.CommandName == "Convert_MT")
        {
            System.Threading.Thread.Sleep(100);
            lblpagetitle1.Text = "Convert to Account";
            lblpagetitle2.Text = "";
            //limidbreadcrumb.Visible = true;
            lblmidbreadcrumb.Text = "Manage Opportunity";
            //lilastbreadcrumb.Visible = true;
            lbllastbreadcrumb.Text = "Convert to Account";
            divSuccessmessage.Visible = false;
            divErrormessage.Visible = false;
            //UpnlAdd.Visible = False
            upnlconvert.Visible = false;
            upnlsearch.Visible = false;
            upnlconvertMT.Visible = true;
            string Oppid = ((LinkButton)e.Item.FindControl("lnkdisplay")).CommandArgument;
            BindConvertMT(Oppid);
            lbloppid.Text = Oppid;
        }
    }

    protected void Repeater1_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //If lblusercompany.Text = "MPUC" Then
            string Isactive = ((Label)e.Item.FindControl("lblisactive")).Text;
            if (Isactive == "1")
            {
                ((LinkButton)e.Item.FindControl("lnkunblock")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnldisplayenrol")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkeditenroll")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkconvert")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkfollowupenroll")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkblockenroll")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkformsubmit")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkedit")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkblock")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btndisplay")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btndedit")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btnfollowup")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkconvertmt")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btndisplayenroll")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btneditenroll")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = false;
            }
            else
            {
                ((LinkButton)e.Item.FindControl("lnkunblock")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnkedit")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = true;
                ((LinkButton)e.Item.FindControl("lnkconvertmt")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = false;
                ((LinkButton)e.Item.FindControl("lnkconvertmt")).Visible = false;
                ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = false;
                ScriptManager scriptManager__1 = ScriptManager.GetCurrent(this.Page);
                scriptManager__1.RegisterPostBackControl((LinkButton)e.Item.FindControl("lnkconvert"));
                scriptManager__1.RegisterPostBackControl((LinkButton)e.Item.FindControl("lnkeditenroll"));
                //scriptManager__1.RegisterPostBackControl(DirectCast(e.Item.FindControl("lnkblock"), LinkButton))
                string followupdate = ((Label)e.Item.FindControl("Label6")).Text;
                if (string.IsNullOrEmpty(followupdate))
                {
                    ((Label)e.Item.FindControl("label8")).Visible = true;
                }
                else
                {
                    if (Convert.ToDateTime(ClsCommon.FormatDate(followupdate)) <= DateTime.Today)
                    {
                        ((Label)e.Item.FindControl("label8")).Visible = true;
                        //Get Open days
                        System.DateTime startDate = DateTime.Today;
                        //DateTime.Now.ToString("dd/MM/yyyy")
                        DateTime enddate = Convert.ToDateTime(ClsCommon.FormatDate(followupdate));
                        TimeSpan ts = startDate.Subtract(enddate);
                        string dob = "";
                        dob = ts.Days.ToString();
                        //Dim var As Integer
                        //var = Math.Truncate(dob / 365)
                        ((Label)e.Item.FindControl("Label5")).Text = dob;
                    }
                    else
                    {
                        ((Label)e.Item.FindControl("label8")).Visible = false;
                    }
                }

                string Opendays = ((Label)e.Item.FindControl("Label9")).Text;
                if (string.IsNullOrEmpty(Opendays))
                {
                    ((Label)e.Item.FindControl("Label5")).Visible = false;
                }
                else
                {
                    if (Convert.ToDateTime(ClsCommon.FormatDate(Opendays)) < DateTime.Today)
                    {
                        ((Label)e.Item.FindControl("Label5")).Visible = true;
                        //Get Open days
                        System.DateTime startDate = DateTime.Today;
                        //DateTime.Now.ToString("dd/MM/yyyy")
                        DateTime enddate = Convert.ToDateTime(ClsCommon.FormatDate(Opendays));
                        TimeSpan ts = startDate.Subtract(enddate);
                        string od = "";
                        od = ts.Days.ToString();
                        ((Label)e.Item.FindControl("Label5")).Text = od;
                    }
                    else
                    {
                        ((Label)e.Item.FindControl("Label5")).Text = "0";
                    }
                }

                string SalesStage = ((Label)e.Item.FindControl("Label7")).Text;
                if (SalesStage == "Closed Lost" | SalesStage == "Closed Won")
                {
                    ((Label)e.Item.FindControl("Label7")).Visible = true;
                    ((Label)e.Item.FindControl("label8")).Visible = false;
                }
                else
                {
                    ((Label)e.Item.FindControl("Label7")).Visible = true;
                }
                ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = true;
                string Oppid = ((LinkButton)e.Item.FindControl("lnkdisplay")).CommandArgument;
                string CheckEdit = "";
                string CheckEnrol = "";
                CheckEdit = ClsEnrollment.CheckStudentInfobyOppid(Oppid);
                if (CheckEdit == "1")
                {
                    string company = ((Label)e.Item.FindControl("Label12")).Text;
                    if (company == "MT")
                    {
                        ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnldisplayenrol")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkeditenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkconvert")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkfollowupenroll")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkblockenroll")).Visible = false;

                        ((HtmlAnchor)e.Item.FindControl("btndisplayenroll")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btneditenroll")).Visible = false;

                        ((LinkButton)e.Item.FindControl("lnkformsubmit")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkedit")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkblock")).Visible = false;


                        ((HtmlAnchor)e.Item.FindControl("btndisplay")).Visible = true;
                        ((HtmlAnchor)e.Item.FindControl("btndedit")).Visible = true;
                        ((HtmlAnchor)e.Item.FindControl("btnfollowup")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = true;
                    }
                    else
                    {
                        ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnldisplayenrol")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkeditenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkconvert")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkfollowupenroll")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkblockenroll")).Visible = false;

                        ((HtmlAnchor)e.Item.FindControl("btndisplayenroll")).Visible = true;
                        ((HtmlAnchor)e.Item.FindControl("btneditenroll")).Visible = true;

                        ((LinkButton)e.Item.FindControl("lnkformsubmit")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkedit")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkblock")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = true;

                        ((HtmlAnchor)e.Item.FindControl("btndisplay")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btndedit")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btnfollowup")).Visible = false;
                    }


                }
                else
                {
                    CheckEnrol = ClsEnrollment.CheckStudentApplicationidbyOpporid(Oppid);
                    if (CheckEnrol == "0")
                    {
                        ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = false;
                        //DirectCast(e.Item.FindControl("lblopporenr"), Label).Text = "O"
                        //DirectCast(e.Item.FindControl("lblopporenr"), Label).BackColor = Drawing.Color.Beige
                        ((LinkButton)e.Item.FindControl("lnkeditenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkconvert")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkblockenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnldisplayenrol")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btndisplayenroll")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btneditenroll")).Visible = false;

                        ((LinkButton)e.Item.FindControl("lnkformsubmit")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkedit")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkblock")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkfollowupenroll")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = false;
                    }
                    else
                    {
                        ((LinkButton)e.Item.FindControl("lnkeditenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkconvert")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkblockenroll")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnldisplayenrol")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btndisplayenroll")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btneditenroll")).Visible = false;

                        ((LinkButton)e.Item.FindControl("lnkoppednrol")).Visible = false;
                        ((LinkButton)e.Item.FindControl("lnkformsubmit")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkdisplay")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkedit")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkfollowup")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkblock")).Visible = true;
                        ((LinkButton)e.Item.FindControl("lnkfollowupenroll")).Visible = false;
                        ((HtmlAnchor)e.Item.FindControl("btnorder")).Visible = false;
                        //DirectCast(e.Item.FindControl("lnkoppednrol"), LinkButton).Visible = True
                    }
                }

                //Else
                //DirectCast(e.Item.FindControl("lnkdisplay"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkedit"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkfollowup"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkconvertmt"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkblock"), LinkButton).Visible = False
                //Dim scriptManager__1 As ScriptManager = ScriptManager.GetCurrent(Me.Page)
                //scriptManager__1.RegisterPostBackControl(DirectCast(e.Item.FindControl("lnkconvertmt"), LinkButton))

                //DirectCast(e.Item.FindControl("lnldisplayenrol"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkeditenroll"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkconvert"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkblockenroll"), LinkButton).Visible = False
                //DirectCast(e.Item.FindControl("lnkformsubmit"), LinkButton).Visible = False
                //End If
            }
        }
    }

    protected void ddltransport_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        if (ddltransport.SelectedIndex == 0)
        {
            div5.Visible = true;
            divcreatebutton.Visible = true;
        }
        else
        {
            div5.Visible = true;
            string oppid = "";
            oppid = lbloppid.Text;
            BindConvert(oppid);
            BindMandateSubjects();
            BindCompulsorySubjects();
            BindOptionalSubject();
            BindPayplan();
            divcreatebutton.Visible = false;
        }

    }
    private void BindConvertMT(string Oppid)
    {
        string Opporid = Oppid;
        string Hiphen = "-";
        SqlDataReader dr = ProductController.GetOppordetailsbyOpporid(Opporid);
        if ((((dr) != null)))
        {
            if (dr.Read())
            {
                txtproductcategory1.Text = dr["ProductCategory"].ToString();
                txtsalesstage1.Text = dr["SalesStagedesc"].ToString();
                txtcontactname1.Text = dr["Studentname"].ToString();
                lblstudentname.Text = Hiphen + " " + dr["Studentname"].ToString();
                txthandphone11.Text = dr["handphone1"].ToString();
                txtlandline1.Text = dr["landline"].ToString();
                txtjoindate1.Text = dr["Opp_Join_Date_Con"].ToString();
                txtexpectedate1.Text = dr["Opp_Expected_Close_Date_Con"].ToString();
                txtprobpercent1.Text = dr["Opp_Probability_Percent"].ToString();
                txtstudenttype.Text = dr["Category_Type"].ToString();
            }
        }
    }
    private void GetOppid(string Oppid)
    {
        string Opp_id = "";
        Opp_id = Oppid;
    }

    private void BindStudentdetails(string Oppid)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string Hiphen = "-";
        SqlDataReader dr = AccountController.GetStudentDetailsbyOppid(Oppid);
        try
        {
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    txtConapp.Text = dr["student_app_no"].ToString();
                    txtconAppentrydate.Text = dr["entrydate"].ToString();
                    txtconappsubdate.Text = dr["enrollon"].ToString();
                    txtconstdname.Text = dr["Name"].ToString();
                    lblstudentname.Text = Hiphen + " " + dr["Name"].ToString();
                    BindNationality();
                    ddlnationality.SelectedValue = dr["nationality"].ToString();
                    BindMothertongue();
                    ddlmothertongue.SelectedValue = dr["mother_tongue"].ToString();
                    BindReligion();
                    ddlreligion.SelectedValue = dr["religion"].ToString();
                    BindCaste();
                    ddlcaste.SelectedValue = dr["caste"].ToString();
                    txtconsubcaste.Text = dr["subcaste"].ToString();
                    Bindgroup();
                    ddlgroup.SelectedValue = dr["category"].ToString();
                    string PhysicallyChalleged = dr["physically_challenege"].ToString();
                    if (PhysicallyChalleged == "Y")
                    {
                        ddlphysicalchallenged.SelectedValue = "Y";
                    }
                    else
                    {
                        ddlphysicalchallenged.SelectedValue = "N";
                    }
                    BindStudentfrom();
                    ddlstudentfrom.SelectedValue = dr["student_from"].ToString();
                    BindmediumofInstruction();
                    ddlConmediumofinstr.SelectedValue = dr["medium_instructions"].ToString();
                    //Bindstay()
                    //ddlstay.SelectedValue = dr("stay_preference").ToString
                    BindConYearofpassing();
                    ddlconyearofpassing.SelectedValue = dr["year_passing"].ToString();
                    BindConCompany();
                    ddlconCompany.SelectedValue = dr["company_code"].ToString();
                    BindConDivision();
                    ddlcondivision.SelectedValue = dr["division_code"].ToString();
                    BindConcenters();
                    ddlconcenter.SelectedValue = dr["center_code"].ToString();
                    BindConAcademicYear();
                    ddlconacademicyear.SelectedValue = dr["acad_year"].ToString();
                    BindConstream();
                    ddlconstream.SelectedValue = dr["stream_code"].ToString();

                }
            }

        }
        catch (Exception ex)
        {
        }

    }
    private void BindConYearofpassing()
    {
        DataSet ds = ProductController.GetallYearofpassing();
        BindDDL(ddlconyearofpassing, ds, "Description", "ID");
        ddlconyearofpassing.Items.Insert(0, "Select");
        ddlconyearofpassing.SelectedIndex = 0;
    }

    private void BindConCompany()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(1, UserID, "", "", "");
        BindDDL(ddlconCompany, ds, "Company_Name", "Company_Code");
        ddlconCompany.Items.Insert(0, "Select");
        ddlconCompany.SelectedIndex = 0;
    }
    private void BindConDivision()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(2, UserID, "", "", ddlconCompany.SelectedValue);
        BindDDL(ddlcondivision, ds, "Division_Name", "Division_Code");
        ddlcondivision.Items.Insert(0, "Select");
        ddlcondivision.SelectedIndex = 0;
    }

    private void BindConcenters()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(5, UserID, ddlcondivision.SelectedValue, "", ddlconCompany.SelectedValue);
        BindDDL(ddlconcenter, ds, "Center_name", "Center_Code");
        ddlconcenter.Items.Insert(0, "Select");
        ddlconcenter.SelectedIndex = 0;
    }

    private void BindConAcademicYear()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetAcademicYearbyCenter(ddlconcenter.SelectedValue);
        BindDDL(ddlconacademicyear, ds, "Acad_Year", "Acad_Year");
        ddlconacademicyear.Items.Insert(0, "Select");
        ddlconacademicyear.SelectedIndex = 0;
    }


    private void BindConstream()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetStreamby_Center_AcademicYear(ddlconcenter.SelectedValue, ddlconacademicyear.SelectedValue);
        BindDDL(ddlconstream, ds, "Stream_Sdesc", "Stream_Code");
        ddlconstream.Items.Insert(0, "Select");
        ddlconstream.SelectedIndex = 0;

    }

    private void Bindstay()
    {
        DataSet ds = ProductController.GetallStay();
        BindDDL(ddlstay, ds, "Description", "id");
        ddlstay.Items.Insert(0, "Select");
        ddlstay.SelectedIndex = 0;
    }


    private void BindmediumofInstruction()
    {
        DataSet ds = ProductController.GetallMediumofInstruction();
        BindDDL(ddlConmediumofinstr, ds, "Description", "id");
        ddlConmediumofinstr.Items.Insert(0, "Select");
        ddlConmediumofinstr.SelectedIndex = 0;
    }
    private void BindStudentfrom()
    {
        DataSet ds = ProductController.GetallResidenceType();
        BindDDL(ddlstudentfrom, ds, "Description", "ID");
        ddlstudentfrom.Items.Insert(0, "Select");
        ddlstudentfrom.SelectedIndex = 0;
    }

    private void BindNationality()
    {
        DataSet ds = ProductController.GetallNationality();
        BindDDL(ddlnationality, ds, "Description", "id");
        ddlnationality.Items.Insert(0, "Select");
        ddlnationality.SelectedIndex = 0;
    }
    private void BindMothertongue()
    {
        DataSet ds = ProductController.GetallMothertongue();
        BindDDL(ddlmothertongue, ds, "Description", "id");
        ddlmothertongue.Items.Insert(0, "Select");
        ddlmothertongue.SelectedIndex = 0;
    }

    private void BindReligion()
    {
        DataSet ds = ProductController.GetallReligion();
        BindDDL(ddlreligion, ds, "Description", "id");
        ddlreligion.Items.Insert(0, "Select");
        ddlreligion.SelectedIndex = 0;
    }


    private void BindCaste()
    {
        DataSet ds = ProductController.GetallCaste();
        BindDDL(ddlcaste, ds, "Description", "id");
        ddlcaste.Items.Insert(0, "Select");
        ddlcaste.SelectedIndex = 0;
    }
    private void Bindgroup()
    {
        DataSet ds = ProductController.GetallStudentcastegroup();
        BindDDL(ddlgroup, ds, "Description", "id");
        ddlgroup.Items.Insert(0, "Select");
        ddlgroup.SelectedIndex = 0;
    }
    private void BindPayplan()
    {
        DataSet ds = AccountController.GetAllPayplan();
        BindDDL(ddlpayplan, ds, "Pay_Plan_Description", "Pay_Plan_Code");
        ddlpayplan.Items.Insert(0, "Select");
        ddlpayplan.SelectedIndex = 0;
    }
    private void GetSumvalue()
    {
        Object obj = default(Object);
        Object obj1 = default(Object);
        CheckBox chk = null;
        Label lblsid = default(Label);
        Label lblbaseuomid = default(Label);
        TextBox lblquantity = default(TextBox);
        TextBox lblvoucheramt = default(TextBox);
        TextBox lblamt = default(TextBox);
        TextBox txttotal = default(TextBox);
        DropDownList ddluom1 = default(DropDownList);
        string Totalvalue = "";
        int Sum = 0;
        int Count = 0;
        //Dim Quant As TextBox

        foreach (DataListItem li in dlselective.Items)
        {
            obj = li.FindControl("ckhselect1");
            if (obj != null)
            {
                chk = (CheckBox)obj;
            }

            obj = li.FindControl("lblmaterialcodeadd");
            if (obj != null)
            {
                lblsid = (Label)obj;
            }

            obj = li.FindControl("txtquantity");
            if (obj != null)
            {
                lblquantity = (TextBox)obj;
            }

            obj = li.FindControl("txtvoucheramt");
            if (obj != null)
            {
                lblvoucheramt = (TextBox)obj;
            }

            obj = li.FindControl("lblbaseuomid");
            if (obj != null)
            {
                lblbaseuomid = (Label)obj;
            }

            obj = li.FindControl("txttotalvalue");
            if (obj != null)
            {
                txttotal = (TextBox)obj;
            }

            obj = li.FindControl("ddluom");
            if (obj != null)
            {
                ddluom1 = (DropDownList)obj;
                if (ddluom1.SelectedValue == "Select")
                {
                    lblquantity.Enabled = false;
                }
                else
                {
                    lblquantity.Enabled = true;
                }
            }


            if (chk.Checked == true)
            {
                ddluom1.Enabled = true;
                if (ddluom1.SelectedValue == "Select")
                {
                    lblquantity.Enabled = false;
                }
                else
                {
                    lblquantity.Enabled = true;
                    if (string.IsNullOrEmpty(lblquantity.Text))
                    {
                    }
                    else
                    {
                        if (ddluom1.SelectedValue == "01")
                        {
                            Sum = Sum + Convert.ToInt32(lblquantity.Text);
                            string Uomid = "";
                            SqlDataReader dr = ProductController.GetallUomReader(2, ddluom1.SelectedValue);
                            if ((((dr) != null)))
                            {
                                if (dr.Read())
                                {
                                    Uomid = dr["UOM_Value"].ToString();
                                }
                            }
                            Totalvalue = (int.Parse(lblvoucheramt.Text) * int.Parse(lblquantity.Text) * int.Parse(Uomid)).ToString();
                            txttotal.Text = Totalvalue;
                        }
                        else if (ddluom1.SelectedValue == "02")
                        {
                            Sum = Sum + Convert.ToInt32(lblquantity.Text);
                            string Uomid = "";
                            SqlDataReader dr = ProductController.GetallUomReader(2, ddluom1.SelectedValue);
                            if ((((dr) != null)))
                            {
                                if (dr.Read())
                                {
                                    Uomid = dr["UOM_Value"].ToString();
                                }
                            }
                            Totalvalue = (int.Parse(lblvoucheramt.Text) * int.Parse(lblquantity.Text) * int.Parse(Uomid)).ToString();
                            txttotal.Text = Totalvalue;
                        }
                        else if (ddluom1.SelectedValue == "03")
                        {
                            Sum = Sum + Convert.ToInt32(lblquantity.Text);
                            string Uomid = "";
                            SqlDataReader dr = ProductController.GetallUomReader(2, ddluom1.SelectedValue);
                            if ((((dr) != null)))
                            {
                                if (dr.Read())
                                {
                                    Uomid = dr["UOM_Value"].ToString();
                                }
                            }
                            Totalvalue = (int.Parse(lblvoucheramt.Text) * int.Parse(lblquantity.Text) * int.Parse(Uomid)).ToString();
                            txttotal.Text = Totalvalue;
                        }

                        //Dim a As String = ""
                        //a = DirectCast(dlselective.Items(0).FindControl("ddluom"), DropDownList).SelectedValue
                        //txtslipamt.Text = Sum
                        //Textbox3.Text = (Integer.Parse(Textbox1.Text) * Integer.Parse(Textbox1.Text)).ToString()
                    }
                    lblquantity.Enabled = true;
                }
            }
            else
            {
                ddluom1.Enabled = false;
                lblquantity.Enabled = false;
            }
        }
    }
    protected void dlselective_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int Flag = 2;
            string Uomid = "";
            DropDownList d = (DropDownList)e.Item.FindControl("ddluom");
            Label baseuomid = (Label)e.Item.FindControl("lblbaseuomid");
            DataSet ds = ProductController.GetallUom(Flag, baseuomid.Text);
            BindDDL(d, ds, "UOM_DESC", "UOM_Id");
            d.Items.Insert(0, "Select");
            d.SelectedIndex = 0;

            Label Selgroup = (Label)e.Item.FindControl("lblselgroup");
            string Sgrgroup = Selgroup.Text;
            if (Sgrgroup == "1")
            {
                CheckBox Chk = (CheckBox)e.Item.FindControl("ckhselect1");
                Chk.Checked = true;
                Chk.Enabled = false;
            }


        }
    }

    private void BindConvert(string Oppid)
    {
        string Oppor_id = "";
        Oppor_id = Oppid;
        string Documenttype = "";
        Documenttype = "DC05";
        string Transport = "";
        Transport = "01";
        DataSet ds = AccountController.GetPricingbyOppId(1, Oppor_id, Documenttype, Transport);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlproductHeader.DataSource = ds;
            dlproductHeader.DataBind();

        }
        else
        {
        }
    }

    private void BindMandateSubjects()
    {
        //Dim cookie As HttpCookie = Request.Cookies.[Get]("MyCookiesLoginInfo")
        //Dim UserID As String = cookie.Values["UserID"]
        //Dim UserName As String = cookie.Values["UserName"]
        //Dim StreamName As String = ""
        //Dim Center As String = ""
        //StreamName = ddlconstream.SelectedValue
        //Center = ddlconcenter.SelectedValue
        //Dim dr As SqlDataReader = ProductController.GetMandatesubjectsbyStream(1, StreamName, Center)
        //Try
        //    If (Not (dr) Is Nothing) Then
        //        If dr.Read Then
        //            Dim MandateSubject As String = dr("SGR_DESC").ToString
        //            txtmandateSubjects.Text = MandateSubject
        //            txtvalue.Text = dr("Voucher_Amount").ToString
        //            lblmaterialcode.Text = dr("SGR_Material").ToString
        //        End If
        //    End If
        //Catch ex As Exception
        //End Try
    }

    private void BindCompulsorySubjects()
    {
        //Dim cookie As HttpCookie = Request.Cookies.[Get]("MyCookiesLoginInfo")
        //Dim UserID As String = cookie.Values["UserID"]
        //Dim UserName As String = cookie.Values["UserName"]
        //Dim StreamName As String = ""
        //Dim Center As String = ""
        //StreamName = ddlconstream.SelectedValue
        //Center = ddlconcenter.SelectedValue
        //Dim ds As DataSet = ProductController.GetSubjectsbyStreamCode(2, StreamName, Center)
        //BindDDL(ddllanguage, ds, "SGR_DESC", "SGR_Material")
        //ddllanguage.Items.Insert(0, "Select")
        //ddllanguage.SelectedIndex = 0
    }

    private void BindOptionalSubject()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string StreamName = "";
        string Center = "";
        StreamName = ddlconstream.SelectedValue;
        Center = ddlconcenter.SelectedValue;

        DataSet ds = ProductController.GetSubjectsbyStreamCode(5, StreamName, Center);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlselective.DataSource = ds;
            dlselective.DataBind();
        }
        else
        {
        }
    }

    protected void ddllanguage_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //Dim cookie As HttpCookie = Request.Cookies.[Get]("MyCookiesLoginInfo")
        //Dim UserID As String = cookie.Values["UserID"]
        //Dim UserName As String = cookie.Values["UserName"]
        //Dim MaterialCode As String = ""
        //Dim StreamName As String = ""
        //Dim Center As String = ""
        //StreamName = ddlconstream.SelectedValue
        //Center = ddlconcenter.SelectedValue
        //MaterialCode = ddllanguage.SelectedValue

        //Dim dr As SqlDataReader = AccountController.GetlanguageValuebyMaterialCode(Center, StreamName, MaterialCode)
        //Try
        //    If (Not (dr) Is Nothing) Then
        //        If dr.Read Then
        //            txtLangvalue.Text = dr("Voucher_amount").ToString
        //        End If
        //    End If
        //Catch ex As Exception

        //End Try

    }


    protected void btncontinue_ServerClick(object sender, System.EventArgs e)
    {

        object obj = null;
        CheckBox Chk = default(CheckBox);
        Label lblSelectmaterialcode = default(Label);
        List<string> list = new List<string>();
        List<string> List1 = new List<string>();
        string Sgrcode = "";
        CheckBox cb = default(CheckBox);



        foreach (DataListItem li in dlselective.Items)
        {
            obj = li.FindControl("lblmaterialcodeadd");
            if (obj != null)
            {
                lblSelectmaterialcode = (Label)obj;
            }

            cb = (CheckBox)li.FindControl("ckhselect1");
            if (cb != null)
            {
                Chk = (CheckBox)cb;
            }

            if (Chk.Checked == true)
            {
                list.Add(lblSelectmaterialcode.Text);
                Sgrcode = string.Join(",", list.ToArray());

            }
        }
        if (Sgrcode.Length > 0)
        {
            diverrorsubject.Visible = false;
            lblerrorsub.Visible = false;
            divcreatebutton.Visible = true;
            string Opp_id = "";
            string Doctype = "";
            int Flag = 0;
            Label lblfmaterialcode = null;
            Label lblvouchertype = null;
            TextBox txtvoucheramt = null;
            Label Baseuomdesc = null;
            Label baseuomid = null;
            DropDownList Unit = default(DropDownList);
            TextBox Quantity = null;
            TextBox Amount = null;
            TextBox Remark = null;

            Opp_id = Session["Opp_id"].ToString();
            Flag = 1;
            Doctype = "DC05";
            //Dim Trans As SqlTransaction
            //Dim Conn As SqlConnection

            //Try
            //    Conn = New SqlConnection("ConStr")
            //    Trans = Conn.BeginTransaction("BuilderTransaction")
            foreach (DataListItem li in dlselective.Items)
            {
                obj = li.FindControl("lblmaterialcodeadd");
                if (obj != null)
                {
                    lblfmaterialcode = (Label)obj;
                }

                obj = li.FindControl("lblvoucher_typ");
                if (obj != null)
                {
                    lblvouchertype = (Label)obj;
                }

                obj = li.FindControl("txtvoucheramt");
                if (obj != null)
                {
                    txtvoucheramt = (TextBox)obj;
                }

                obj = li.FindControl("lblbaseuom");
                if (obj != null)
                {
                    Baseuomdesc = (Label)obj;
                }

                obj = li.FindControl("lblbaseuomid");
                if (obj != null)
                {
                    baseuomid = (Label)obj;
                }

                obj = li.FindControl("ddluom");
                if (obj != null)
                {
                    Unit = (DropDownList)obj;
                }

                obj = li.FindControl("txtquantity");
                if (obj != null)
                {
                    Quantity = (TextBox)obj;
                }

                obj = li.FindControl("txttotalvalue");
                if (obj != null)
                {
                    Amount = (TextBox)obj;
                }

                obj = li.FindControl("txtremark");
                if (obj != null)
                {
                    Remark = (TextBox)obj;
                }

                cb = (CheckBox)li.FindControl("ckhselect1");
                if (cb != null)
                {
                    Chk = (CheckBox)cb;
                }

                if (Chk.Checked == true)
                {
                    AccountController.InserttoGetPricingprocedurevaluebyoppid(Opp_id, lblfmaterialcode.Text, lblvouchertype.Text, txtvoucheramt.Text, baseuomid.Text, Baseuomdesc.Text, Unit.SelectedValue, Quantity.Text, Amount.Text, Remark.Text,
                    Doctype, Flag);
                }
            }
            //Trans.Commit()
            //Catch ex As Exception
            //    Dim errstr As String
            //    Try
            //        If Not (Trans Is Nothing) Then
            //            Trans.Rollback("BuilderTransaction")
            //        End If
            //    Catch ex1 As SqlException
            //        Console.WriteLine("Exception" + ex1.GetType().ToString() + " encountered while rolling back transaction.")
            //        errstr = "Exception" + ex1.GetType().ToString() + " encountered while rolling back transaction."
            //    End Try
            //End Try

            DataSet ds = AccountController.GetPricingprocedureHeaderValue_New(Opp_id, "", "", "", "", "", "", "", "", "",
            "DC05", 2);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlppheader.DataSource = ds;
                dlppheader.DataBind();
                ddlpayplan.Enabled = false;
                ddllanguage.Enabled = false;
                dlselective.Enabled = false;
                Divreselect.Visible = true;
                divfeedetails.Visible = true;
                btnreselect.Visible = true;
                Div6.Visible = false;
                dlppheader.Visible = true;
                divcreatebutton.Visible = true;

            }
            else
            {
            }
        }
        else
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = "Select Product";
            //diverrorsubject.Visible = True
            //lblerrorsub.Visible = True
            //lblerrorsub.Text = "Select Product"

        }


    }
    protected void btncreateaccount_ServerClick(object sender, System.EventArgs e)
    {
        string MandateSubjects = "";
        string OptionalSubjects = "";
        string Selectivesubjects = "";
        MandateSubjects = lblmaterialcode.Text;
        OptionalSubjects = ddllanguage.SelectedValue;
        object obj = null;
        CheckBox Chk = default(CheckBox);
        Label lblSelectmaterialcode = default(Label);
        List<string> list = new List<string>();
        List<string> List1 = new List<string>();
        string Sgrcode = "";
        CheckBox cb = default(CheckBox);



        foreach (DataListItem li in dlselective.Items)
        {
            obj = li.FindControl("lblmaterialcodeadd");
            if (obj != null)
            {
                lblSelectmaterialcode = (Label)obj;
            }

            cb = (CheckBox)li.FindControl("ckhselect1");
            if (cb != null)
            {
                Chk = (CheckBox)cb;
            }

            if (Chk.Checked == true)
            {
                list.Add(lblSelectmaterialcode.Text);
                Sgrcode = string.Join(",", list.ToArray());

            }
        }
        if (Sgrcode.Length > 0)
        {
            diverrorsubject.Visible = false;
            lblerrorsub.Visible = false;
            divcreatebutton.Visible = true;
            string MaterialCode = "";
            string Doctype = "";
            string Opp_id = "";
            string Payplan = "";
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            string UserName = cookie.Values["UserName"];
            Opp_id = Session["Opp_id"].ToString();
            MaterialCode = MandateSubjects + "," + OptionalSubjects + "," + Sgrcode;
            Doctype = "DC05";
            Payplan = ddlpayplan.SelectedValue;
            string Accountid = "";
            int flag2 = 0;
            Accountid = AccountController.CreateAccount(Opp_id, MaterialCode, Doctype, Payplan, UserID, flag2);
        }
        else
        {
            diverrorsubject.Visible = true;
            lblerrorsub.Visible = true;
            lblerrorsub.Text = "Select Subject Group";
        }

        divSuccessmessage.Visible = true;
        lblsuccessMessage.Visible = true;
        lblsuccessMessage.Text = "Opportunity Successfully Converted to Account";
        btncreateaccount.Visible = false;
        btnreselect.Visible = false;
        divbtnexit.Visible = true;
        btnclose.Visible = true;

    }

    protected void btnreselect_ServerClick(object sender, System.EventArgs e)
    {
        ddlpayplan.Enabled = true;
        ddllanguage.Enabled = true;
        dlselective.Enabled = true;
        Divreselect.Visible = false;
        btnreselect.Visible = false;
        Div6.Visible = true;
        dlppheader.Visible = false;
        divcreatebutton.Visible = false;
    }
    protected void btnclearmt_ServerClick(object sender, System.EventArgs e)
    {
        //Response.Redirect("Manage_Opportunity.aspx")
    }

    protected void btnconvertmt_ServerClick(object sender, System.EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string Opporid = lbloppid.Text;
        string sbentrycode = "";
        DateTime AccountConvertDate = default(DateTime);
        string notes = "";
        string Createdby = "";
        string Modifiedby = "";
        string Accountid = "";

        sbentrycode = txtsbentrycode.Text;
        AccountConvertDate = Convert.ToDateTime(txtaccountdate.Text, System.Globalization.CultureInfo.GetCultureInfo("Hi-IN").DateTimeFormat);
        notes = txtnotes.Text;
        Createdby = UserID;

        Accountid = ProductController.InsertAccount("", Opporid, sbentrycode, AccountConvertDate, notes, Createdby, Modifiedby);
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Text = "Opportunity successfully converted to Account";
        txtsbentrycode.Text = "";
        txtnotes.Text = "";
        btnconvertmt.Visible = false;
        btnclearmt.Visible = false;
        txtaccountdate.Text = "";

    }

    protected void btncloseleadblock_ServerClick(object sender, System.EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "k2", "<script type=""text/javascript"">$(function () { $('#Blocklead').modal('hide') });</script>", False)
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type='text/javascript'>");
        sb.Append("$('#Blocklead').modal('hide');");
        sb.Append("</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);
        ScriptManager1.RegisterAsyncPostBackControl(Repeater1);
    }



    protected void btnblocklead_ServerClick(object sender, System.EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string Opporid = "";
        int flag = 0;
        Opporid = lbloppid1.Text;
        flag = 2;
        ProductController.Block(UserID, Opporid, flag);
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Text = "Opportunity blocked successfully - " + Opporid;
        divsearchresults.Visible = false;
        Divsearchcriteria.Visible = true;

    }
    protected void btnsearchoppor_ServerClick(object sender, System.EventArgs e)
    {
        Response.Redirect("Opportunity.aspx");
    }

    protected void btnclose_ServerClick(object sender, System.EventArgs e)
    {
        Response.Redirect("Opportunity.aspx");
    }

    protected void btnunblockno_ServerClick(object sender, System.EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "k2", "<script type=""text/javascript"">$(function () { $('#UnBlocklead').modal('hide') });</script>", False)
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type='text/javascript'>");
        sb.Append("$('#UnBlocklead').modal('hide');");
        sb.Append("</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);
    }

    protected void btnunblockyes_ServerClick(object sender, System.EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string Oppurid = "";
        int flag = 0;
        Oppurid = lbloppurid.Text;
        flag = 4;
        ProductController.Block(UserID, Oppurid, flag);
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Text = "Opportunity unblocked successfully - " + Oppurid;
        divsearchresults.Visible = false;
        Divsearchcriteria.Visible = true;
    }

    protected void btnno_ServerClick(object sender, System.EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "k2", "<script type=""text/javascript"">$(function () { $('#Blocklead').modal('hide') });</script>", False)
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type='text/javascript'>");
        sb.Append("$('#Div1').modal('hide');");
        sb.Append("</script>");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", sb.ToString(), false);
        ScriptManager1.RegisterAsyncPostBackControl(Repeater1);
    }

    protected void btnyes_ServerClick(object sender, System.EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string Oppurid = "";
        string Enrollon = "";
        //string studentid = "";
        //int flag = 0;
        Oppurid = lbloppurid.Text;
        Enrollon = txtappsubmitdate.Text;
        //flag = 4;
        //ProductController.Block(UserID, Oppurid, flag);
        string Student_id = ClsEnrollment.enrollstudent1(Enrollon, UserID, Oppurid, "");
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Text = "Opportunity Enrolled successfully - " + Oppurid;
        divsearchresults.Visible = false;
        Divsearchcriteria.Visible = true;
        btnsearch_ServerClick(sender, e);
    }

    protected void btnsearchback_ServerClick(object sender, System.EventArgs e)
    {
        limidbreadcrumb.Visible = true;
        lblmidbreadcrumb.Text = "Manage Opportunity";
        lilastbreadcrumb.Visible = true;
        lbllastbreadcrumb.Text = "Search Panel";
        //lilastbreadcrumb.Visible = true;
        divSuccessmessage.Visible = false;
        divErrormessage.Visible = false;
        divsearchresults.Visible = false;
        divmessage.Visible = false;
        btnsearchback.Visible = false;
        upnlsearch.Visible = true;
        divSearch.Visible = true;
        Divsearchcriteria.Visible = true;
    }
}