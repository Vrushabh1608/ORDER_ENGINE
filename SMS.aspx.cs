﻿using System;
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
//using Exportxls.BL;
using Encryption.BL;
using ChequeReturnRequest;
using System.Net.Mail;
using System.Net;

public partial class SMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Menuid = "117";
            if (Request.Cookies["MyCookiesLoginInfo"] != null)
            {
                HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
                string UserID = cookie.Values["UserID"];
                string UserName = cookie.Values["UserName"];
                lblpagetitle1.Text = "SMS";
                lblpagetitle2.Text = "Search Panel";
                //limidbreadcrumb.Visible = true;
                lblmidbreadcrumb.Text = "SMS";
                //lilastbreadcrumb.Visible = false;
                divSuccessmessage.Visible = false;
                divErrormessage.Visible = false;
                divpendingreuesterror.Visible = false;
               
                listudentstatus.Visible = false;
                btnviewenrollment.Visible = false;
                btnviewenv.Visible = false;
                //btnback.Visible = false;
                //liregno.Visible = true;
                SqlDataReader dr = UserController.Getuserrights(UserID, Menuid);
                try
                {
                    if ((((dr) != null)))
                    {
                        if (dr.Read())
                        {
                            int allowdisplay = Convert.ToInt32(dr["Allow_Add"].ToString());
                            if (allowdisplay == 1)
                            {
                                //btnaddlead.Visible = True
                                //btnimportlead.Visible = True
                            }
                            else
                            {
                                //btnaddlead.Visible = False
                                //btnimportlead.Visible = False
                            }

                        }
                    }


                }
                catch (Exception ex)
                {
                }
                string UserCompany = "";
                SqlDataReader dr1 = UserController.GetCompanyby_Userid(UserID);
                try
                {
                    if ((((dr1) != null)))
                    {
                        if (dr1.Read())
                        {
                            UserCompany = dr1["Company_Code"].ToString();
                        }
                    }

                }
                catch (Exception ex)
                {
                }
                lblusercompany.Text = UserCompany;
                if (lblusercompany.Text == "MPUC1")
                {
                    tdapplicationid.Visible = true;
                    tdapplicationid1.Visible = true;
                }
                else
                {
                    tdapplicationid.Visible = true;
                    tdapplicationid1.Visible = true;

                }
                divmessage.Visible = false;
                divSearch.Visible = true;
                divsearchresults.Visible = false;
                //diveditpayemnt.Visible = false;
                BindCompany();
                //BindPayplan();
                BindProductCategory();
                StudentType();
                Institutetype();
                CountrySearch();
                Board();
                Eventtype();
                BindAcademicYear();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
  
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
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
    private void Eventtype()
    {
        DataSet ds = ProductController.GetallEventtype();
        BindDDL(ddlevent, ds, "event_description", "event_type");
        ddlevent.Items.Insert(0, "All");
        ddlevent.SelectedIndex = 0;
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
        ddlstandardsearch.Items.Insert(0, "All");
        ddlstandardsearch.SelectedIndex = 0;
    }
    private void BindProductCategory()
    {
        DataSet ds = ProductController.GetallOpporProductCategory();
        BindDDL(ddlproductcategory, ds, "Description", "ID");
        ddlproductcategory.Items.Insert(0, "All");
        ddlproductcategory.SelectedIndex = 0;
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
    private void BindLocationSearch()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlcitysearch.SelectedValue);
        BindDDL(ddllocationsearch, ds, "Location_Name", "Location_Code");
        ddllocationsearch.Items.Insert(0, "All");
        ddllocationsearch.SelectedIndex = 0;
    }

    private void BindCompany()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(1, UserID, "", "", "");
        BindDDL(ddlcompany, ds, "Company_Name", "Company_Code");
        //ddlcompany.Items.Insert(0, "All")
        //ddlcompany.SelectedIndex = 1
        BindDivision();
        //ddldivision.Items.Insert(0, "All")
        //ddldivision.SelectedIndex = 0

        ddlzone.Items.Insert(0, "All");
        ddlzone.SelectedIndex = 0;

        ddlcenter.Items.Insert(0, "All");
        ddlcenter.SelectedIndex = 0;

        //ddlacademicyear.Items.Insert(0, "Select");
        //ddlacademicyear.SelectedIndex = 0;

        ddlstream.Items.Insert(0, "All");
        ddlstream.SelectedIndex = 0;
    }

    protected void ddlcompany_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindDivision();
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
    }

    protected void ddldivision_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindZone();
        //BindCenter()
    }

    private void BindZone()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(3, UserID, ddldivision.SelectedValue, "", ddlcompany.SelectedValue);
        BindDDL(ddlzone, ds, "Zone_Name", "Zone_Code");
        ddlzone.Items.Insert(0, "All");
        ddlzone.SelectedIndex = 0;
    }
    protected void ddlzone_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindCenter();
    }
    private void BindCenter()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];

        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(4, UserID, ddldivision.SelectedValue, ddlzone.SelectedValue, ddlcompany.SelectedValue);
        BindDDL(ddlcenter, ds, "Center_name", "Center_Code");
        ddlcenter.Items.Insert(0, "All");
        ddlcenter.SelectedIndex = 0;
    }
    protected void ddlcenter_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindAcademicYear();
    }
    private void BindAcademicYear()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetAllAcadyear();
        //DataSet ds = ProductController.GetAcademicYearbyCenter(ddlcenter.SelectedValue);
        BindDDL(ddlacademicyear, ds, "Acad_Year", "Acad_Year");
        ddlacademicyear.Items.Insert(0, "Select");
        ddlacademicyear.SelectedIndex = 0;
    }
    protected void ddlacademicyear_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindStream();
    }
    private void BindStream()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetStreamby_Center_AcademicYear_All(ddlcenter.SelectedValue, ddlacademicyear.SelectedValue);
        BindDDL(ddlstream, ds, "Stream_Sdesc", "Stream_Code");
        ddlstream.Items.Insert(0, "All");
        ddlstream.SelectedIndex = 0;
    }

    protected void btnsearch_ServerClick(object sender, System.EventArgs e)
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        string StudentName = "";
        string Applicationno = "";
        string Company = "";
        string Division = "";
        string Zone = "";
        string Center = "";
        string AcademicYear = "";
        string Stream = "";

        StudentName = txtstudentname.Text;
        Applicationno = txtapplicationno.Text;
        Company = ddlcompany.SelectedValue;
        Division = ddldivision.SelectedValue;
        Zone = ddlzone.SelectedValue;
        Center = ddlcenter.SelectedValue;
        AcademicYear = ddlacademicyear.SelectedValue;
        Stream = ddlstream.SelectedValue;

        string Customer_Type = "";
        string Institutiontype = "";
        string Boardid = "";
        string Standard = "";
        string Mobile = "";
        string Country = "";
        string State = "";
        string City = "";
        string Location = "";
        string Productcategory = "";
        string Fromdate = "";
        string Todate = "";
        string OrderStatus = "";
        string Sbentrycode = "";
        string Active = "";
        string Promoted = "";
        if (Chkactive.Checked == true)
        {
            Active = "1";
        }
        else
        {
            Active = "0";
        }
        if (chkpromoted.Checked == true)
        {
            Promoted = "1";
        }
        else
        {
            Promoted = "0";
        }

        Customer_Type = ddlcustomertypesearch.SelectedValue;
        Institutiontype = ddlinstitutionsearch.SelectedValue;
        Boardid = ddlboardsearch.SelectedValue;
        Standard = ddlstandardsearch.SelectedValue;
        Mobile = txthandphonesearch.Text;
        Country = ddlcountrysearch.SelectedValue;
        State = ddlstatesearch.SelectedValue;
        City = ddlcitysearch.SelectedValue;
        Location = ddllocationsearch.SelectedValue;
        Productcategory = ddlproductcategory.SelectedValue;
        Fromdate = txteventdatefrom.Text;
        Todate = txteventdateto.Text;
        OrderStatus = ddlorderstatus.SelectedValue;
        Sbentrycode = txtsbentrycode.Text;


        DataSet ds = AccountController.Get_Account_Search_Results_for_SMS(StudentName, Applicationno, Company, Division, Zone, Center, AcademicYear, Stream, UserID, Customer_Type,
        Institutiontype, Boardid, Standard, Mobile, Country, State, City, Location, Productcategory, Fromdate,
        Todate, OrderStatus, Sbentrycode, Active, Promoted);

        if (ds.Tables[0].Rows.Count > 0)
        {
            Divsearchcriteria.Visible = false;
            lblpagetitle1.Text = "SMS";
            lblpagetitle2.Text = "Search Results";
            //limidbreadcrumb.Visible = true;
            lblmidbreadcrumb.Text = "SMS";
            //lilastbreadcrumb.Visible = true;
            lbllastbreadcrumb.Text = " SMS Search Results";
            divSuccessmessage.Visible = false;
            divErrormessage.Visible = false;
            divsearchresults.Visible = true;
            divmessage.Visible = false;
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            script1.RegisterAsyncPostBackControl(Repeater1);
        }
        else
        {
            divsearchresults.Visible = false;
            Divsearchcriteria.Visible = true;
            divmessage.Visible = true;
            lblmessage.Text = "No Records Found!";
        }
    }

    public void All_Student_ChkBox_Selected_Sel(object sender, System.EventArgs e)
    {
        //Change checked status of a hidden check box
        chkStudentAllHidden_Sel.Checked = !(chkStudentAllHidden_Sel.Checked);

        //Set checked status of hidden check box to items in grid
        foreach (RepeaterItem dtlItem in Repeater1.Items)
        {
            CheckBox chkitemck = (CheckBox)dtlItem.FindControl("chkStudent");
            chkitemck.Checked = chkStudentAllHidden_Sel.Checked;
        }

    }

    public void SMSSend(string MobNo, string Msg)
    {
        if (MobNo.Length == 10)
        {
            //MobNo = MobNo; need to chk by jayant
            WebClient client = new WebClient();
            string baseurl = "http://api.smscountry.com/SMSCwebservice_bulk.aspx?User=Sciencetr&passwd=25892846&mobilenumber=" + MobNo + "&message=" + Msg + "&sid=MTEDU&mtype=N&DR=Y";
            Stream data = client.OpenRead(baseurl);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            data.Close();
            reader.Close();
        }
    }

    protected void btnSmsSend_ServerClick(object sender, System.EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalSms();", true);
        txtsmsstd.Text = "";
        //inputstd.Checked = true;
        //UpdatePaneSMSsend.Update();
    }
    protected void Linkbtnstdnm_Click(object sender, System.EventArgs e)
    {
        txtsmsstd.Text = txtsmsstd.Text + "< NAME >";
    }

    protected void Linkbtnstdfnm_Click(object sender, System.EventArgs e)
    {
        txtsmsstd.Text = txtsmsstd.Text + "< FIRSTNAME >";
    }

    protected void btnSendsmsstd_Click(object sender, System.EventArgs e)
    {
        foreach (RepeaterItem dtlItem in Repeater1.Items)
        {
            CheckBox chkitemck = (CheckBox)dtlItem.FindControl("chkStudent");
            if (chkitemck.Checked == true)
            {
                Label lblstudentmobileno = (Label)dtlItem.FindControl("lblstudentno");
                Label lblparentmobileno = (Label)dtlItem.FindControl("lblfno");
                Label lblfirststudentname = (Label)dtlItem.FindControl("lblcustomername");
                Label lbldlstudentname = (Label)dtlItem.FindControl("lblcustomername");
                string msg = txtsmsstd.Text;
                string num1 = lblstudentmobileno.Text;
                string num2 = lblparentmobileno.Text;
                string fname = lblfirststudentname.Text;
                string upmsg = msg.Replace("< NAME >", lblfirststudentname.Text);
                msg = upmsg;
                upmsg = msg.Replace("< FIRSTNAME >", fname);
                //msg = upmsg;
                //upmsg = msg.Replace("< MXMARK >", lblMaxMarks_Edit.Text);
                //msg = upmsg;
                //upmsg = msg.Replace("< MARK >", (row.FindControl("txtDLMarks") as TextBox).Text);
                //msg = upmsg;
                //upmsg = msg.Replace("< TESTDATE >", lblTestDate_Edit.Text);
                //msg = upmsg;
                //upmsg = msg.Replace("< TESTNAME >", lblTestName_Edit.Text);
                //msg = upmsg;
                //upmsg = msg.Replace("< PERCENTAGE >", perct);
                //msg = upmsg;

                if (inputstd.Checked == true & !string.IsNullOrEmpty(num1))
                {
                    string[] nums1 = num1.Split(new char[] { ',' });
                    num1 = nums1[0].ToString();
                    SMSSend(num1, msg);
                }
                else if (inputpar.Checked == true & !string.IsNullOrEmpty(num2))
                {
                    string[] nums2 = num2.Split(new char[] { ',' });
                    num2 = nums2[0].ToString();
                    SMSSend(num2, msg);
                }

                else if (inputboth.Checked == true)
                {
                    if (!string.IsNullOrEmpty(num1))
                    {
                        string[] nums1 = num1.Split(new char[] { ',' });
                        num1 = nums1[0].ToString();
                        SMSSend(num1, msg);
                    }
                    if (!string.IsNullOrEmpty(num2))
                    {
                        string[] nums2 = num2.Split(new char[] { ',' });
                        num2 = nums2[0].ToString();
                        SMSSend(num2, msg);
                    }
                }
            }
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "CloseModalSms();", true);
    }


    //protected void Linkbtnmxmark_Click(object sender, System.EventArgs e)
    //{
    //    txtsmsstd.Text = txtsmsstd.Text + "< MXMARK >";
    //}

    //protected void Linkbtnobtnmark_Click(object sender, System.EventArgs e)
    //{
    //    txtsmsstd.Text = txtsmsstd.Text + "< MARK >";
    //}


    //protected void Linkbtntestdt_Click(object sender, System.EventArgs e)
    //{
    //    txtsmsstd.Text = txtsmsstd.Text + "< TESTDATE >";
    //}

    //protected void Linkbtntestnm_Click(object sender, System.EventArgs e)
    //{
    //    txtsmsstd.Text = txtsmsstd.Text + "< TESTNAME >";
    //}

    //protected void Linkbtnperctg_Click(object sender, System.EventArgs e)
    //{
    //    txtsmsstd.Text = txtsmsstd.Text + "< PERCENTAGE >";
    //}
}