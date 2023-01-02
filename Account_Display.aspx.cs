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

public partial class Account_Display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["Oppur_Id"] != null)
            {
                string Oppurid = Request["oppur_id"];
                lblpagetitle1.Text = "Display Account";
                lblpagetitle2.Text = "";
                limidbreadcrumb.Visible = true;
                lblmidbreadcrumb.Text = "Manage Account";
                lilastbreadcrumb.Visible = true;
                lbllastbreadcrumb.Text = "Display Account";
                divSuccessmessage.Visible = false;
                divErrormessage.Visible = false;
                divmessage.Visible = false;
                divprimarycontact.Visible = true;
                divseconadarycontact.Visible = false;
                divseccontacterror.Visible = false;
                divMiscellaneous.Visible = false;

                divmessage.Visible = false;
                BindSecContact();
                BindCountry();
                BindNationality();
                BindMothertongue();
                BindReligion();
                BindCaste();
                Bindgroup();
                BindmediumofInstruction();
                Bindstay();
                Bindexampassed();
                BindYearofpassing();
                BindMonthofpassing();
                BindStudentfrom();
                BindCompany();
                BindSubjectMarks();
                divmarks.Visible = false;
                //BindScore()
                BindExtraCurricular();
                divextraactivity.Visible = false;
                Institutetype();
                Yearofpassing();
                DivisionSession();
                ContactType();
                BindSecondaryCountry();
                //BindStudentInformation()
                //txtappentrydate.Text = DateTime.Now.ToString("dd-MM-yyyy")
                txtappentrydate.Enabled = false;
                //txtappsubmitdate.Focus()
                BindEditEnrolData();
                BindMandateSubjects();
                BindLanguageSubjects();
                BindOptionalSubjects();
                //Secondary Contact
                divseccontactadd.Visible = false;
                divstdparinfo.Visible = false;
                divseccontactedit.Visible = false;
                dlseccontact.Visible = true;

                //Steps
                divprimarycontact.Visible = true;
                divseconadarycontact.Visible = false;
                divseccontacterror.Visible = false;
                divsubjectpreference.Visible = false;
                divMiscellaneous.Visible = false;
                upnlImage.Visible = false;
            }
        }

    }
    private void BindMandateSubjects()
    {
        string Oppid = Request["oppur_id"];
        DataSet ds = ProductController.GetMandatesubjectsbyStreamforedit(1, Oppid);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlcomplusorysubject.DataSource = ds;
            dlcomplusorysubject.DataBind();
            //divseccontacterror.Visible = False 
        }
        else
        {
            //divseccontacterror.Visible = True
            //lblseccontacterror.Text = "No Secondary Contact Found!"
        }
    }
    private void BindLanguageSubjects()
    {
        string Oppid = Request["oppur_id"];
        DataSet ds = ProductController.GetMandatesubjectsbyStreamforedit(2, Oppid);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlcompulsorylanguages.DataSource = ds;
            dlcompulsorylanguages.DataBind();
            //divseccontacterror.Visible = False
        }
        else
        {
            //divseccontacterror.Visible = True
            //lblseccontacterror.Text = "No Secondary Contact Found!"
        }
    }

    private void BindOptionalSubjects()
    {
        string Oppid = Request["oppur_id"];
        DataSet ds = ProductController.GetMandatesubjectsbyStreamforedit(3, Oppid);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlspecialization.DataSource = ds;
            dlspecialization.DataBind();
            //divseccontacterror.Visible = False
        }
        else
        {
            //divseccontacterror.Visible = True
            //lblseccontacterror.Text = "No Secondary Contact Found!"
        }
    }
    private void BindDDL(DropDownList ddl, DataSet ds, string txtField, string valField)
    {
        ddl.DataSource = ds;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }

    //To Do  -  Change SP and Bind data with M100 Student Table
    public void BindEditEnrolData()
    {
        if (Request["oppur_id"] != null)
        {
            string oppid = Request["oppur_id"];
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            SqlDataReader dr = ProductController.GetEnrollmentbyOppid(oppid);
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    
                    txtappentrydate.Text = dr["Createdon"].ToString();
                    txtappsubmitdate.Text = dr["enroll"].ToString();
                    if (dr["Con_title"].ToString() == "Mr.")
                    {
                        ddltitle.SelectedValue = "1";
                    }
                    else
                    {
                        ddltitle.SelectedValue = "2";
                    }
                    lblstudentname.Text = dr["Con_Title"].ToString() + " " + dr["Con_FirstName"].ToString() + " " + dr["Con_midname"].ToString() + " " + dr["Con_lastname"].ToString();
                    txtstudentfirstname.Text = dr["Con_Firstname"].ToString();
                    txtstudentmidname.Text = dr["Con_midname"].ToString();
                    txtstudentlastname.Text = dr["Con_lastname"].ToString();
                    txtflatno.Text = dr["flatno"].ToString();
                    txtbuildingno.Text = dr["Buildingname"].ToString();
                    txtstreetname.Text = dr["StreetName"].ToString();
                    BindCountry();
                    ddlcountry.SelectedValue = dr["Country"].ToString();
                    BindState();
                    ddlstate.SelectedValue = dr["State"].ToString();
                    Bindcity();
                    ddlcity.SelectedValue = dr["city"].ToString();
                    txtpincode.Text = dr["Pincode"].ToString();
                    txthandphone1.Text = dr["Handphone1"].ToString();
                    txthandphone2.Text = dr["Handphone2"].ToString();
                    txtlandline.Text = dr["Landline"].ToString();
                    txtemailidstudent.Text = dr["Emailid"].ToString();
                    txtdateofbirth.Text = dr["DoB"].ToString();
                    txtplaceofbirth.Text = dr["place_birth"].ToString();
                    //ddlplaceofbirthstate.SelectedValue = dr("state_birth_code").ToString
                    BindNationality();
                    ddlnationality.SelectedValue = dr["nationality"].ToString();
                    BindMothertongue();
                    ddlmothertongue.SelectedValue = dr["mother_tongue"].ToString();
                    BindReligion();
                    ddlreligion.SelectedValue = dr["religion"].ToString();
                    if (string.IsNullOrEmpty(dr["Other_Nationality"].ToString()))
                    {
                        txtNationalitySpecify.Text = "";
                    }
                    else
                    {
                        tr4.Visible = true;
                        td10.Visible = true;
                        td11.Visible = true;
                        txtNationalitySpecify.Text = dr["Other_Nationality"].ToString();
                    }
                    if (string.IsNullOrEmpty(dr["Other_Mother_tongue"].ToString()))
                    {
                        txtmothertonguespecify.Text = "";
                    }
                    else
                    {
                        tr4.Visible = true;
                        td14.Visible = true;
                        td15.Visible = true;
                        txtmothertonguespecify.Text = dr["Other_Mothertongue"].ToString();
                    }

                    //txtReligionpecify.Text = dr("").ToString
                    BindCaste();
                    ddlcaste.SelectedValue = dr["caste"].ToString();
                    txtsubcaste.Text = dr["subcaste"].ToString();
                    ddlgroup.SelectedValue = dr["category"].ToString();
                    //txtreligionspecify.Text = dr("").ToString
                    if (dr["Physical_Challenge"].ToString() == "Y")
                    {
                        ddlphysicalchallenged.SelectedValue = "Y";
                    }
                    else
                    {
                        ddlphysicalchallenged.SelectedValue = "N";
                    }
                    ddlstudentfrom.SelectedValue = dr["student_from"].ToString();

                    txtappnumber.Text = dr["Student_App_No"].ToString();
                    BindCompany();
                    ddlcompany.SelectedValue = dr["company_code"].ToString();
                    BindDivision();
                    ddldivision.SelectedValue = dr["division_code"].ToString();
                    Bindcenters();
                    ddlcenter.SelectedValue = dr["center_code"].ToString();
                    BindAcademicYear();
                    ddlacademicyear.SelectedValue = dr["acad_year"].ToString();
                    BindStream();
                    ddlstream.SelectedValue = dr["stream_code"].ToString();
                    BindLocation();
                    ddllocation.SelectedValue = dr["Location_id"].ToString();

                    txtLastSchname.Text = dr["last_school_name"].ToString();
                    txtschoolplacename.Text = dr["last_school_place"].ToString();
                    txtschoolexactlocation.Text = dr["school_locality"].ToString();
                    BindmediumofInstruction();
                    ddlmediumofinstruction.SelectedValue = dr["medium_instructions"].ToString();
                    Bindstay();
                    ddlstay.SelectedValue = dr["stay_preference"].ToString();

                    Bindexampassed();
                    txtnoofattempts.Text = dr["no_attempts"].ToString();
                    BindYearofpassing();
                    ddlyearofpassing.SelectedValue = dr["year_passing"].ToString();
                    BindMonthofpassing();
                    ddlMonthofpassing.SelectedValue = dr["month_passing"].ToString();

                    // New Field Added


                    ddlplaceofbirthcountry.SelectedValue = dr["country_birth"].ToString();
                    BindPlaceofbirthState();
                    ddlplaceofbirthstate.SelectedValue = dr["state_birth_code"].ToString();
                    BindPlaceofbirthcity();
                    ddlplaceofbirthcity.SelectedValue = dr["city_birth"].ToString();
                    ddlgenderadd.SelectedValue = dr["Gender"].ToString();

                    txtpermanentAdd1.Text = dr["prm_address1"].ToString();
                    txtpermanentAdd2.Text = dr["prm_address2"].ToString();
                    txtpermanentstreet.Text = dr["prm_Streetname"].ToString();
                    if (dr["prm_country_Code"].ToString() == "Select")
                    {
                        ddlpermanentcountry.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlpermanentcountry.SelectedValue = dr["prm_country_Code"].ToString();

                        if (dr["prm_state_Code"].ToString() == "Select")
                        {
                            ddlpermstate.SelectedIndex = 0;
                        }
                        else
                        {
                            BindPermanentState();
                            ddlpermstate.SelectedValue = dr["prm_state_Code"].ToString();
                            if (dr["prm_city_Code"].ToString() == "Select")
                            {
                                ddlpermanentcity.SelectedIndex = 0;
                            }
                            else
                            {
                                BindPermanentcity();
                                ddlpermanentcity.SelectedValue = dr["prm_city_Code"].ToString();
                                if (dr["prm_location_id"].ToString() == "Select")
                                {
                                    ddlpermanentlocation.SelectedIndex = 0;
                                }
                                else
                                {
                                    BindPermanentLocation();
                                    ddlpermanentlocation.SelectedValue = dr["prm_location_id"].ToString();
                                }
                            }
                        }
                    }

                    txtpermanentpostal.Text = dr["prm_pincode"].ToString();
                    txtpermanentHphone1.Text = dr["prm_handphone1"].ToString();
                    txtpermanentHPhone2.Text = dr["prm_handphone2"].ToString();
                    txtLandline1.Text = dr["prm_landline"].ToString();
                    txtquali.Text = dr["qualification"].ToString();
                    txtcompany.Text = dr["organization"].ToString();
                    txtofficeaddress.Text = dr["Office_address"].ToString();
                    txtofficetelno.Text = dr["Office_phone"].ToString();
                    txtdesignation.Text = dr["Designation"].ToString();
                    txtannaulsalary.Text = dr["annual_income"].ToString();

                    txtlastexampassed.Text = dr["last_exam_passed"].ToString();
                    txtlastexampassstate.Text = dr["exam_pass_state"].ToString();
                    if (dr["stay_preference"].ToString() == "1")
                    {
                        ddlstay.SelectedValue = "1";
                    }
                    else
                    {
                        ddlstay.SelectedValue = "2";
                    }
                    Txtregistrationno.Text = dr["xam_pass_regno"].ToString();
                    Imgstudent.ImageUrl = dr["Image"].ToString();
                    lblprimarycontactid.Text = dr["con_id"].ToString();
                    BindScore();
                }
            }
        }
    }


    private void BindCountry()
    {
        DataSet ds = ProductController.GetallCountry();
        BindDDL(ddlcountry, ds, "Country_Name", "Country_Code");
        ddlcountry.Items.Insert(0, "Select");
        ddlcountry.SelectedIndex = 0;
        ddlstate.Items.Insert(0, "Select");
        ddlstate.SelectedIndex = 0;
        ddlcity.Items.Insert(0, "Select");
        ddlcity.SelectedIndex = 0;
        ddllocation.Items.Insert(0, "Select");
        ddllocation.SelectedIndex = 0;

        BindDDL(ddlplaceofbirthcountry, ds, "Country_Name", "Country_Code");
        ddlplaceofbirthcountry.Items.Insert(0, "Select");
        ddlplaceofbirthcountry.SelectedIndex = 0;
        ddlplaceofbirthstate.Items.Insert(0, "Select");
        ddlplaceofbirthstate.SelectedIndex = 0;
        ddlplaceofbirthcity.Items.Insert(0, "Select");
        ddlplaceofbirthcity.SelectedIndex = 0;

        BindDDL(ddlpermanentcountry, ds, "Country_Name", "Country_Code");
        ddlpermanentcountry.Items.Insert(0, "Select");
        ddlpermanentcountry.SelectedIndex = 0;
        ddlpermstate.Items.Insert(0, "Select");
        ddlpermstate.SelectedIndex = 0;
        ddlpermanentcity.Items.Insert(0, "Select");
        ddlpermanentcity.SelectedIndex = 0;
        ddlpermanentlocation.Items.Insert(0, "Select");
        ddlpermanentlocation.SelectedIndex = 0;
    }

    //All Country State City and Location Binding
    protected void ddlcountry_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindState();
    }

    protected void ddlpermanentcountry_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindPermanentState();
    }
    protected void ddlplaceofbirthcountry_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindPlaceofbirthState();
    }


    private void BindState()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlcountry.SelectedValue);
        BindDDL(ddlstate, ds, "State_Name", "State_Code");
        ddlstate.Items.Insert(0, "Select");
        ddlstate.SelectedIndex = 0;
    }
    private void BindPlaceofbirthState()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlplaceofbirthcountry.SelectedValue);
        BindDDL(ddlplaceofbirthstate, ds, "State_Name", "State_Code");
        ddlplaceofbirthstate.Items.Insert(0, "Select");
        ddlplaceofbirthstate.SelectedIndex = 0;
    }
    private void BindPermanentState()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlpermanentcountry.SelectedValue);
        BindDDL(ddlpermstate, ds, "State_Name", "State_Code");
        ddlpermstate.Items.Insert(0, "Select");
        ddlpermstate.SelectedIndex = 0;
    }
    protected void ddlstate_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        Bindcity();
    }

    protected void ddlpermstate_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindPermanentcity();
    }

    protected void ddlplaceofbirthstate_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindPlaceofbirthcity();
    }
    private void Bindcity()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlstate.SelectedValue);
        BindDDL(ddlcity, ds, "City_Name", "City_Code");
        ddlcity.Items.Insert(0, "Select");
        ddlcity.SelectedIndex = 0;
    }
    private void BindPlaceofbirthcity()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlplaceofbirthstate.SelectedValue);
        BindDDL(ddlplaceofbirthcity, ds, "City_Name", "City_Code");
        ddlplaceofbirthcity.Items.Insert(0, "Select");
        ddlplaceofbirthcity.SelectedIndex = 0;
    }
    private void BindPermanentcity()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlpermstate.SelectedValue);
        BindDDL(ddlpermanentcity, ds, "City_Name", "City_Code");
        ddlpermanentcity.Items.Insert(0, "Select");
        ddlpermanentcity.SelectedIndex = 0;
    }
    protected void ddlcity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindLocation();
    }

    protected void ddlpermanentcity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindPermanentLocation();
    }

    protected void ddlplaceofbirthcity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //BindPlaceofbirthlocation()
    }
    private void BindLocation()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlcity.SelectedValue);
        BindDDL(ddllocation, ds, "Location_Name", "Location_Code");
        ddllocation.Items.Insert(0, "Select");
        ddllocation.SelectedIndex = 0;
    }
    private void BindPermanentLocation()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlpermanentcity.SelectedValue);
        BindDDL(ddlpermanentlocation, ds, "Location_Name", "Location_Code");
        ddlpermanentlocation.Items.Insert(0, "Select");
        ddlpermanentlocation.SelectedIndex = 0;
    }
    private void BindPlaceofbirthlocation()
    {
        //Dim ds As DataSet = ProductController.GetallLocationbycity(ddlplaceofbirthcity.SelectedValue)
        //BindDDL(ddlpl, ds, "Location_Name", "Location_Code")
        //ddllocation.Items.Insert(0, "Select")
        //ddllocation.SelectedIndex = 0
    }

    //Company, Division, Zone, Center Binding
    private void BindCompany()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(1, UserID, "", "", "");
        BindDDL(ddlcompany, ds, "Company_Name", "Company_Code");
        ddlcompany.Items.Insert(0, "Select");
        ddlcompany.SelectedIndex = 0;
    }
    private void BindDivision()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(2, UserID, "", "", ddlcompany.SelectedValue);
        BindDDL(ddldivision, ds, "Division_Name", "Division_Code");
        ddldivision.Items.Insert(0, "Select");
        ddldivision.SelectedIndex = 0;
    }
    private void Bindcenters()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetUser_Company_Division_Zone_Center(5, UserID, ddldivision.SelectedValue, "", ddlcompany.SelectedValue);
        BindDDL(ddlcenter, ds, "Center_name", "Center_Code");
        ddlcenter.Items.Insert(0, "Select");
        ddlcenter.SelectedIndex = 0;
    }
    private void BindAcademicYear()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetAcademicYearbyCenter(ddlcenter.SelectedValue);
        BindDDL(ddlacademicyear, ds, "AY_String", "AY_String");
        ddlacademicyear.Items.Insert(0, "Select");
        ddlacademicyear.SelectedIndex = 0;
    }
    private void BindStream()
    {
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        DataSet ds = ProductController.GetStreamby_Center_AcademicYear(ddlcenter.SelectedValue, ddlacademicyear.SelectedValue);
        BindDDL(ddlstream, ds, "Stream_Sdesc", "Stream_Code");
        ddlstream.Items.Insert(0, "Select");
        ddlstream.SelectedIndex = 0;
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
        ddlcaste.Items.Insert(0, "Select");
        ddlcaste.SelectedIndex = 0;
    }
    //Protected Sub ddlreligion_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlreligion.SelectedIndexChanged
    //    BindCaste()
    //End Sub
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

    private void BindmediumofInstruction()
    {
        DataSet ds = ProductController.GetallMediumofInstruction();
        BindDDL(ddlmediumofinstruction, ds, "Description", "id");
        ddlmediumofinstruction.Items.Insert(0, "Select");
        ddlmediumofinstruction.SelectedIndex = 0;
    }

    private void Bindstay()
    {
        //Dim ds As DataSet = ProductController.GetallStay()
        //BindDDL(ddlstay, ds, "Description", "id")
        //ddlstay.Items.Insert(0, "Select")
        //ddlstay.SelectedIndex = 0
    }

    private void Bindexampassed()
    {
        //Dim ds As DataSet = ProductController.GetallBoard()
        //BindDDL(ddlnameofexampassed, ds, "Short_Description", "ID")
        //ddlnameofexampassed.Items.Insert(0, "Select")
        //ddlnameofexampassed.SelectedIndex = 0
    }

    private void BindYearofpassing()
    {
        DataSet ds = ProductController.GetallYearofpassing();
        BindDDL(ddlyearofpassing, ds, "Description", "ID");
        ddlyearofpassing.Items.Insert(0, "Select");
        ddlyearofpassing.SelectedIndex = 0;
    }

    private void BindMonthofpassing()
    {
        DataSet ds = ProductController.GetallMonthofpassing();
        BindDDL(ddlMonthofpassing, ds, "Description", "ID");
        ddlMonthofpassing.Items.Insert(0, "Select");
        ddlMonthofpassing.SelectedIndex = 0;
    }

    private void BindStudentfrom()
    {
        DataSet ds = ProductController.GetallResidenceType();
        BindDDL(ddlstudentfrom, ds, "Description", "ID");
        ddlstudentfrom.Items.Insert(0, "Select");
        ddlstudentfrom.SelectedIndex = 0;
    }
    //Secondary Contact Details
    private void BindSecContact()
    {
        if (Request["Oppur_ID"] != null)
        {
            string Opporid = Request["Oppur_ID"];

            DataSet ds = ProductController.Get_SecondaryContactbyOpporid(Opporid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlseccontact.DataSource = ds;
                dlseccontact.DataBind();
                divseccontacterror.Visible = false;
            }
            else
            {
                divseccontacterror.Visible = true;
                lblseccontacterror.Text = "No Secondary Contact Found!";
            }
        }
    }
    protected void dlseccontact_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            divseccontactadd.Visible = false;
            divstdparinfo.Visible = false;
            divseccontactedit.Visible = true;
            dlseccontact.Visible = false;
            lblprimaryconid.Text = e.CommandArgument.ToString();
            string Conid = lblprimaryconid.Text;

            BindSecondaryCountry();
            InstitutetypeEdit();
            BoardEdit();
            YearofpassingEdit();
            DivisionSessionEdit();
            ContactType();
            BindSecContactDetails(Conid);
        }
    }

    protected void dlseccontact_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ScriptManager scriptManager__1 = ScriptManager.GetCurrent(this.Page);
            scriptManager__1.RegisterPostBackControl((LinkButton)e.Item.FindControl("lnkedit"));
            string Dob = ((Label)e.Item.FindControl("lbldob")).Text;
            if (string.IsNullOrEmpty(Dob))
            {
                ((Label)e.Item.FindControl("lblage")).Visible = false;
            }
            else
            {
                if (Convert.ToDateTime(ClsCommon.FormatDate(Dob)) < DateTime.Today)
                {
                    ((Label)e.Item.FindControl("lblage")).Visible = true;
                    //Get Open days
                    System.DateTime startDate = DateTime.Today;
                    //DateTime.Now.ToString("dd/MM/yyyy")
                    DateTime enddate = Convert.ToDateTime(ClsCommon.FormatDate(Dob));
                    TimeSpan ts = startDate.Subtract(enddate);
                    string Age = "";
                    Age = ts.Days.ToString();

                    double var = 0;
                    var = Math.Truncate(Convert.ToDouble( Convert.ToInt32(Age) / 365));
                    ((Label)e.Item.FindControl("lblage")).Text = var.ToString();
                }
                else
                {
                    ((Label)e.Item.FindControl("lblage")).Visible = false;
                }
            }

        }
    }
    private void BindSecContactDetails(string Conid)
    {
        if (Request["Oppur_Id"] != null)
        {
            string Con_id = Conid;
            SqlDataReader dr = ProductController.Get_SecondaryContactbyLeadidforfield1(Conid);
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    ContactType();
                    if (dr["Con_type_id"].ToString() == "Select")
                    {
                        ddlseccontacttypeedit.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlseccontacttypeedit.SelectedValue = dr["Con_type_id"].ToString();
                    }

                    if (dr["Con_title"].ToString() == "Mr.")
                    {
                        ddlsectitleedit.SelectedValue = "1";
                    }
                    else if (dr["Con_title"].ToString() == "Ms.")
                    {
                        ddlsectitleedit.SelectedValue = "2";
                    }
                    else
                    {
                        ddlsectitleedit.SelectedIndex = 0;
                    }
                    txtsecfnameedit.Text = dr["Con_Firstname"].ToString();
                    txtsecmnameedit.Text = dr["Con_midname"].ToString();
                    txtseclnameedit.Text = dr["Con_lastname"].ToString();
                    txtsechandphone1edit.Text = dr["handphone1"].ToString();
                    txtsechandphone2edit.Text = dr["handphone2"].ToString();
                    txtseclandlineedit.Text = dr["landline"].ToString();
                    txtsecemailidedit.Text = dr["Emailid"].ToString();
                    txtsecaddress1edit.Text = dr["Flatno"].ToString();
                    txtsecaddress2edit.Text = dr["BuildingName"].ToString();
                    txtsecstreetnameedit.Text = dr["StreetName"].ToString();
                    txtsecpincodeedit.Text = dr["Pincode"].ToString();

                    InstitutetypeEdit();
                    if (dr["Institution_Type_Id"].ToString() == "Select")
                    {
                        ddlsecinstitutionedit.SelectedIndex = 0;

                    }
                    else
                    {
                        ddlsecinstitutionedit.SelectedValue = dr["Institution_Type_Id"].ToString();
                    }

                    txtsecinstunameedit.Text = dr["Institution_Description"].ToString();
                    CurrentStudyingInEdit();
                    if (dr["Current_Standard_id"].ToString() == "Select")
                    {
                        ddlseccurrentstandardedit.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlseccurrentstandardedit.SelectedValue = dr["Current_Standard_id"].ToString();
                    }
                    txtsecaddnotesedit.Text = dr["Additional_desc"].ToString();
                    BindboardbyidEdit();
                    if (dr["Board_id"].ToString() == "Select")
                    {
                        ddlsecboardedit.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlsecboardedit.SelectedValue = dr["Board_id"].ToString();
                    }

                    DivisionSessionEdit();
                    if (dr["Section_id"].ToString() == "Select")
                    {
                        ddlsecsectionedit.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlsecsectionedit.SelectedValue = dr["Section_id"].ToString();
                    }

                    YearofpassingEdit();
                    if (dr["Year_of_Passing_Id"].ToString() == "Select")
                    {
                        ddlsecyopedit.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlsecyopedit.SelectedValue = dr["Year_of_Passing_Id"].ToString();
                    }

                    //BindSecondaryCountry()
                    //ddlseccountryedit.SelectedValue = dr("Country").ToString
                    //If ddlseccountryedit.SelectedValue = "Select" Then
                    //    ddlsecstateedit.SelectedIndex = 0
                    //    ddlseccityedit.SelectedIndex = 0
                    //Else
                    //    BindSecondaryStateEdit()
                    //    If dr("State").ToString = "Select" Then
                    //        ddlseccityedit.SelectedIndex = 0
                    //    Else
                    //        BindSecondaryCityEdit()
                    //        If dr("City").ToString = "Select" Then
                    //            ddlseccity.SelectedIndex = 0
                    //        Else
                    //            ddlseccityedit.SelectedValue = dr("City").ToString
                    //        End If

                    //    End If
                    //End If
                    txtsecdobedit.Text = dr["dob"].ToString();
                }
            }
        }
    }
    private void CurrentStudyingIn()
    {
        DataSet ds = ProductController.GetallCurrentStudyingin(ddlinstitutiontype2.SelectedValue);
        BindDDL(ddlcurrentstudying2, ds, "Description", "ID");
        this.ddlcurrentstudying2.Items.Insert(0, "Select");
        this.ddlcurrentstudying2.SelectedIndex = 0;
    }
    private void CurrentStudyingInEdit()
    {
        DataSet ds = ProductController.GetallCurrentStudyingin(ddlsecinstitutionedit.SelectedValue);
        BindDDL(ddlseccurrentstandardedit, ds, "Description", "ID");
        this.ddlseccurrentstandardedit.Items.Insert(0, "Select");
        this.ddlseccurrentstandardedit.SelectedIndex = 0;
    }
    protected void btnclearSeccon_ServerClick(object sender, System.EventArgs e)
    {
        divseccontactadd.Visible = false;
        divstdparinfo.Visible = true;
        divseccontactedit.Visible = false;
        dlseccontact.Visible = true;
        BindSecContact();
    }

    protected void btnclearSecconedit_ServerClick(object sender, System.EventArgs e)
    {
        divseccontactadd.Visible = false;
        divstdparinfo.Visible = true;
        divseccontactedit.Visible = false;
        dlseccontact.Visible = true;
        BindSecContact();
    }

    //Protected Sub btnaddSeccontact_ServerClick(sender As Object, e As System.EventArgs) Handles btnaddSeccontact.ServerClick
    //    divseccontactadd.Visible = True
    //    divstdparinfo.Visible = False
    //    divseccontactedit.Visible = False
    //    dlseccontact.Visible = False
    //    Dim cookie As HttpCookie = Request.Cookies.[Get]("MyCookiesLoginInfo")
    //    Dim UserID As String = cookie.Values("UserID")
    //    Dim UserName As String = cookie.Values("UserName")
    //    Me.ddlcurrentstudying2.Items.Insert(0, "Select")
    //    Me.ddlcurrentstudying2.SelectedIndex = 0
    //    Me.ddlboard2.Items.Insert(0, "Select")
    //    Me.ddlboard2.SelectedIndex = 0
    //    Institutetype()
    //    Yearofpassing()
    //    DivisionSession()
    //    ContactType()
    //    BindSecondaryCountry()
    //    'Board()
    //End Sub
    private void BindSecondaryCountry()
    {
        DataSet ds = ProductController.GetallCountry();
        BindDDL(ddlseccountry, ds, "Country_Name", "Country_Code");
        ddlseccountry.Items.Insert(0, "Select");
        ddlseccountry.SelectedIndex = 0;
        ddlsecstate.Items.Insert(0, "Select");
        ddlsecstate.SelectedIndex = 0;
        ddlseccity.Items.Insert(0, "Select");
        ddlseccity.SelectedIndex = 0;
        ddlSeclocation.Items.Insert(0, "Select");
        ddlSeclocation.SelectedIndex = 0;


        BindDDL(ddlseccountryedit, ds, "Country_Name", "Country_Code");
        ddlseccountryedit.Items.Insert(0, "Select");
        ddlseccountryedit.SelectedIndex = 0;
        ddlsecstateedit.Items.Insert(0, "Select");
        ddlsecstateedit.SelectedIndex = 0;
        ddlseccityedit.Items.Insert(0, "Select");
        ddlseccityedit.SelectedIndex = 0;
        ddlseclocationedit.Items.Insert(0, "Select");
        ddlseclocationedit.SelectedIndex = 0;
    }
    protected void ddlseccountry_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindSecondaryStateAdd();
    }

    protected void ddlseccountryedit_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindSecondaryStateEdit();
    }
    private void BindSecondaryStateAdd()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlseccountry.SelectedValue);
        BindDDL(ddlsecstate, ds, "State_Name", "State_Code");
        ddlsecstate.Items.Insert(0, "Select");
        ddlsecstate.SelectedIndex = 0;
    }
    private void BindSecondaryStateEdit()
    {
        DataSet ds = ProductController.GetallStatebyCountry(ddlseccountryedit.SelectedValue);
        BindDDL(ddlsecstateedit, ds, "State_Name", "State_Code");
        ddlsecstateedit.Items.Insert(0, "Select");
        ddlsecstateedit.SelectedIndex = 0;
    }
    protected void ddlsecstate_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindSecondaryCityAdd();
    }

    protected void ddlsecstateedit_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindSecondaryCityEdit();
    }
    private void BindSecondaryCityAdd()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlsecstate.SelectedValue);
        BindDDL(ddlseccity, ds, "City_Name", "City_Code");
        ddlseccity.Items.Insert(0, "Select");
        ddlseccity.SelectedIndex = 0;
    }
    private void BindSecondaryCityEdit()
    {
        DataSet ds = ProductController.GetallCitybyState(ddlsecstateedit.SelectedValue);
        BindDDL(ddlseccityedit, ds, "City_Name", "City_Code");
        ddlseccityedit.Items.Insert(0, "Select");
        ddlseccityedit.SelectedIndex = 0;
    }
    protected void ddlseccity_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        BindSeclocationadd();
    }

    protected void ddlseccityedit_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        Bindseclocationedit();
    }
    private void BindSeclocationadd()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlseccity.SelectedValue);
        BindDDL(ddlSeclocation, ds, "Location_Name", "Location_Code");
        ddlSeclocation.Items.Insert(0, "Select");
        ddlSeclocation.SelectedIndex = 0;

    }
    private void Bindseclocationedit()
    {
        DataSet ds = ProductController.GetallLocationbycity(ddlseccityedit.SelectedValue);
        BindDDL(ddlseclocationedit, ds, "Location_Name", "Location_Code");
        ddlseclocationedit.Items.Insert(0, "Select");
        ddlseclocationedit.SelectedIndex = 0;
    }
    private void Institutetype()
    {
        DataSet ds = ProductController.GetallInstituteType();
        BindDDL(ddlinstitutiontype2, ds, "Description", "ID");
        ddlinstitutiontype2.Items.Insert(0, "Select");
        ddlinstitutiontype2.SelectedIndex = 0;
    }
    private void InstitutetypeEdit()
    {
        DataSet ds = ProductController.GetallInstituteType();
        BindDDL(ddlsecinstitutionedit, ds, "Description", "ID");
        ddlsecinstitutionedit.Items.Insert(0, "Select");
        ddlsecinstitutionedit.SelectedIndex = 0;
    }
    protected void ddlinstitutiontype2_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        DataSet ds = ProductController.GetallCurrentStudyingin(ddlinstitutiontype2.SelectedValue);
        BindDDL(ddlcurrentstudying2, ds, "Description", "ID");
        this.ddlcurrentstudying2.Items.Insert(0, "Select");
        this.ddlcurrentstudying2.SelectedIndex = 0;
        //
        Bindboardbyid();
    }

    protected void ddlsecinstitutionedit_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        DataSet ds = ProductController.GetallCurrentStudyingin(ddlsecinstitutionedit.SelectedValue);
        BindDDL(ddlseccurrentstandardedit, ds, "Description", "ID");
        this.ddlseccurrentstandardedit.Items.Insert(0, "Select");
        this.ddlseccurrentstandardedit.SelectedIndex = 0;
        //
        BindboardbyidEdit();
    }
    private void Board()
    {
        DataSet ds = ProductController.GetallBoard();
        BindDDL(ddlboard2, ds, "Short_Description", "ID");
        ddlboard2.Items.Insert(0, "Select");
        ddlboard2.SelectedIndex = 0;
    }
    private void BoardEdit()
    {
        DataSet ds = ProductController.GetallBoard();
        BindDDL(ddlsecboardedit, ds, "Short_Description", "ID");
        ddlsecboardedit.Items.Insert(0, "Select");
        ddlsecboardedit.SelectedIndex = 0;
    }
    private void Bindboardbyid()
    {
        DataSet ds = ProductController.GetallBoardbyinstitutetype(ddlinstitutiontype2.SelectedValue);
        BindDDL(ddlboard2, ds, "Short_Description", "ID");
        ddlboard2.Items.Insert(0, "Select");
        ddlboard2.SelectedIndex = 0;
    }
    private void BindboardbyidEdit()
    {
        DataSet ds = ProductController.GetallBoardbyinstitutetype(ddlsecinstitutionedit.SelectedValue);
        BindDDL(ddlsecboardedit, ds, "Short_Description", "ID");
        ddlsecboardedit.Items.Insert(0, "Select");
        ddlsecboardedit.SelectedIndex = 0;
    }
    private void Yearofpassing()
    {
        DataSet ds = ProductController.GetallYearofpassing();
        BindDDL(ddlyearofpassing2, ds, "Description", "ID");
        ddlyearofpassing2.Items.Insert(0, "Select");
        ddlyearofpassing2.SelectedIndex = 0;
    }
    private void YearofpassingEdit()
    {
        DataSet ds = ProductController.GetallYearofpassing();
        BindDDL(ddlsecyopedit, ds, "Description", "ID");
        ddlsecyopedit.Items.Insert(0, "Select");
        ddlsecyopedit.SelectedIndex = 0;
    }
    private void DivisionSession()
    {
        DataSet ds = ProductController.GetAllDivisionSection();
        BindDDL(ddlsection2, ds, "Description", "ID");
        ddlsection2.Items.Insert(0, "Select");
        ddlsection2.SelectedIndex = 0;
    }
    //
    private void DivisionSessionEdit()
    {
        DataSet ds = ProductController.GetAllDivisionSection();
        BindDDL(ddlsecsectionedit, ds, "Description", "ID");
        ddlsecsectionedit.Items.Insert(0, "Select");
        ddlsecsectionedit.SelectedIndex = 0;
    }

    private void ContactType()
    {
        DataSet ds = ProductController.GetallactiveContactTypeSecondary();
        BindDDL(ddlseccontacttype, ds, "Description", "ID");
        ddlseccontacttype.Items.Insert(0, "Select");
        ddlseccontacttype.SelectedIndex = 0;

        BindDDL(ddlseccontacttypeedit, ds, "Description", "ID");
        ddlseccontacttypeedit.Items.Insert(0, "Select");
        ddlseccontacttypeedit.SelectedIndex = 0;

    }
    //Steps
    protected void btnstep1next_ServerClick(object sender, System.EventArgs e)
    {
        //If CDate(ClsCommon.FormatDate(txtappsubmitdate.Text)) > Today Then
        //    lbldateerrorsubmit.Visible = True
        //    lbldateerrorsubmit.Text = "App. submit Date cannot be a future date"
        //    txtappsubmitdate.Focus()
        //    Exit Sub
        //ElseIf CDate(ClsCommon.FormatDate(txtdateofbirth.Text)) > Today Then
        //    lbldateerrordob.Visible = True
        //    lbldateerrordob.Text = "DOB cannot be a future date"
        //    txtdateofbirth.Focus()
        //    lbldateerrorsubmit.Visible = False
        //    Exit Sub
        //Else
        //    lbldateerrorsubmit.Visible = False
        //    lbldateerrordob.Visible = False
        //End If
        //Dim startDate As Date = Today 'DateTime.Now.ToString("dd/MM/yyyy")
        //Dim enddate As DateTime = CDate(ClsCommon.FormatDate(txtdateofbirth.Text))
        //Dim ts As TimeSpan = startDate.Subtract(enddate)
        //Dim dob As String = ""
        //dob = ts.Days.ToString()
        //'txtdateofbirth.Text = 
        //Dim var As Integer
        //var = Math.Truncate(dob / 365)
        //If var < 14 Then
        //    lbldateerrordob.Visible = True
        //    lbldateerrordob.Text = "Age should be greater or equal to 14 years."
        //    Me.txtdateofbirth.Text = ""
        //    Me.txtdateofbirth.Focus()
        //    Exit Sub
        //End If
        divprimarycontact.Visible = false;
        divseconadarycontact.Visible = true;
        divstdparinfo.Visible = true;
        divsubjectpreference.Visible = false;
        divMiscellaneous.Visible = false;
        upnlImage.Visible = false;
    }

    protected void btnstep2prev_ServerClick(object sender, System.EventArgs e)
    {
        divprimarycontact.Visible = true;
        divseconadarycontact.Visible = false;
        divsubjectpreference.Visible = false;
        divMiscellaneous.Visible = false;
        upnlImage.Visible = false;
    }

    protected void btnstep3next_ServerClick(object sender, System.EventArgs e)
    {
        divprimarycontact.Visible = false;
        divseconadarycontact.Visible = false;
        divsubjectpreference.Visible = true;
        divMiscellaneous.Visible = false;
        upnlImage.Visible = false;
    }

    protected void btnstep3prev_ServerClick(object sender, System.EventArgs e)
    {
        divprimarycontact.Visible = false;
        divseconadarycontact.Visible = true;
        divsubjectpreference.Visible = false;
        divMiscellaneous.Visible = false;
        upnlImage.Visible = false;
    }

    protected void btnstep4next_ServerClick(object sender, System.EventArgs e)
    {
        divprimarycontact.Visible = false;
        divseconadarycontact.Visible = false;
        divsubjectpreference.Visible = false;
        divMiscellaneous.Visible = true;
        upnlImage.Visible = true;
    }

    protected void btnstep3prevnew_ServerClick(object sender, System.EventArgs e)
    {
        divprimarycontact.Visible = false;
        divseconadarycontact.Visible = false;
        divsubjectpreference.Visible = true;
        divMiscellaneous.Visible = false;
        upnlImage.Visible = false;
    }

    protected void btnAccountcancel_ServerClick(object sender, System.EventArgs e)
    {
        Response.Redirect("Accounts.aspx");
    }

    protected void ddlstream_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        //BindMandateSubjects()
        //BindLanguageSubjects()
        //BindOptionalSubjects()
    }



    //Binding Subjects marks obtained
    private void BindSubjectMarks()
    {
        string Oppurid = Request["oppur_id"];
        string Subject = "";
        string Maxmarks = "";
        string Marksobtained = "";
        string Userid = "";
        int id = 0;
        DataSet ds = ProductController.GetAllSubjectMarks(2, Oppurid, Subject, Maxmarks, Marksobtained, Userid, id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlsubjectmarks.DataSource = ds;
            dlsubjectmarks.DataBind();
            divsubjecterror.Visible = false;
        }
        else
        {
            divsubjecterror.Visible = true;
            Label33.Text = "No Marks Entered!";
        }
    }

    protected void btnaddmarks_ServerClick(object sender, System.EventArgs e)
    {
        divmarks.Visible = true;
        divsubjecterror.Visible = false;
        dlsubjectmarks.Visible = false;
    }

    protected void btnmarksave_ServerClick(object sender, System.EventArgs e)
    {
        divmarks.Visible = false;
        divsubjecterror.Visible = false;
        string Oppid = Request["oppur_id"];
        string Subject = "";
        string Maxmarks = "";
        string Marksobtained = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        Subject = txtsubjectname.Text;
        Maxmarks = txtmaxmarks.Text;
        Marksobtained = txtmarksobtained.Text;
        ProductController.InsertMarks(1, Oppid, Subject, Maxmarks, Marksobtained, UserID, Id);
        BindSubjectMarks();
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Visible = true;
        lblsuccessMessage.Text = "Marks Successfully Saved for " + Subject;
        txtsubjectname.Text = "";
        txtmaxmarks.Text = "";
        txtmarksobtained.Text = "";
        dlsubjectmarks.Visible = true;

    }

    protected void btnmarkscancel_ServerClick(object sender, System.EventArgs e)
    {
        divmarks.Visible = false;
        divsubjecterror.Visible = false;
        BindSubjectMarks();
        dlsubjectmarks.Visible = true;
    }

    private void BindScore()
    {
        string Conid = lblprimarycontactid.Text;
        string Scoretypeid = "";
        string Score = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        DataSet ds = ProductController.GetAllScore(4, Conid, Scoretypeid, Score, UserID, Id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlScore.DataSource = ds;
            dlScore.DataBind();
            divscoreerror.Visible = false;
        }
        else
        {
            divscoreerror.Visible = true;
            lblscoreerror.Text = "No Scores Entered!";
        }
    }

    private void BindExtraCurricular()
    {
        string Oppid = Request["oppur_id"];
        int Extracurricular = 0;
        string Description = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        dlextracurricular.Visible = true;
        DataSet ds = ProductController.Extracurricular(3, Oppid, Extracurricular, Description, UserID, Id);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dlextracurricular.DataSource = ds;
            dlextracurricular.DataBind();
            DivExtracurrlierror.Visible = false;

        }
        else
        {
            DivExtracurrlierror.Visible = true;
            lblextracurricuerror.Text = "No extra curricular activities found!";
        }
    }
    private void Bindlevel()
    {
        string Oppid = Request["oppur_id"];
        int Extracurricular = 0;
        string Description = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        DataSet ds = ProductController.Extracurricular(1, Oppid, Extracurricular, Description, UserID, Id);
        BindDDL(ddllevel, ds, "Curricular_Activity_SDesc", "ID");
        ddllevel.Items.Insert(0, "Select");
        ddllevel.SelectedIndex = 0;
    }

    protected void btnaddextraactivity_ServerClick(object sender, System.EventArgs e)
    {
        Bindlevel();
        divextraactivity.Visible = true;
        dlextracurricular.Visible = false;
        DivExtracurrlierror.Visible = false;
        divSuccessmessage.Visible = false;
    }

    protected void btnextraactcancel_ServerClick(object sender, System.EventArgs e)
    {
        BindExtraCurricular();
        divextraactivity.Visible = false;
        dlextracurricular.Visible = true;
    }


    protected void btnextraactsave_ServerClick(object sender, System.EventArgs e)
    {
        string Oppid = Request["oppur_id"];
        int Extracurricular = 0;
        string Description = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = 0;
        Extracurricular = Convert.ToInt32(ddllevel.SelectedValue);
        Description = txtdescription.Text;
        ProductController.InsertExtraactivity(2, Oppid, Extracurricular, Description, UserID, Id);
        BindExtraCurricular();
        divextraactivity.Visible = false;
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Visible = true;
        lblsuccessMessage.Text = "Extra Currricular Activity Successfully Saved";
        ddllevel.Items.Insert(0, "Select");
        ddllevel.SelectedIndex = 0;
        txtdescription.Text = "";
        dlextracurricular.Visible = true;
    }


}