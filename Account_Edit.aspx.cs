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
public partial class Account_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request["Oppur_Id"] != null)
            {
                string Oppurid = Request["oppur_id"];
                lblpagetitle1.Text = "Edit Enrollment";
                lblpagetitle2.Text = "";
                limidbreadcrumb.Visible = true;
                lblmidbreadcrumb.Text = "Manage Opportunity";
                lilastbreadcrumb.Visible = true;
                lbllastbreadcrumb.Text = "Edit Enrollment";
                divSuccessmessage.Visible = false;
                divErrormessage.Visible = false;
                divmessage.Visible = false;
                divprimarycontact.Visible = true;
                divseconadarycontact.Visible = false;
                divseccontacterror.Visible = false;
                divMiscellaneous.Visible = false;
                upnlImage.Visible = false;

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

                BindExtraCurricular();
                divextraactivity.Visible = false;
                //BindStudentInformation()
                BindEditEnrolData();
                //txtappentrydate.Text = DateTime.Now.ToString("dd-MM-yyyy")
                txtappentrydate.Enabled = false;
                BindMandateSubjects();
                BindLanguageSubjects();
                BindOptionalSubjects();
                //txtappsubmitdate.Focus()

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

                HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
                string UserID = cookie.Values["UserID"];
                string Userrole = ProductController.GerrolebyUserid(UserID);
                if (Userrole == "R001")
                {
                    txtstudentfirstname.Enabled = true;
                    txtstudentmidname.Enabled = true;
                    txtstudentlastname.Enabled = true;
                    ddlgroup.Enabled = true;
                }
                else
                {
                    txtstudentfirstname.Enabled = false;
                    txtstudentmidname.Enabled = false;
                    txtstudentlastname.Enabled = false;
                    ddlgroup.Enabled = false;
                }
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
    //Bind Edit Enroll Details
    //To Do  -  Change SP and Bind data with M100 Student Table
    public void BindEditEnrolData()
    {

        try
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
                        //txtpermanentAdd1.Text = dr("prm_address1").ToString
                        //txtpermanentAdd2.Text = dr("prm_address2").ToString
                        //txtpermanentstreet.Text = dr("prm_streetName").ToString
                        //ddlpermanentcountry.SelectedValue = dr("prm_country_Code").ToString
                        //ddlpermstate.SelectedValue = dr("prm_state_Code").ToString
                        //ddlpermanentcity.SelectedValue = dr("prm_city_Code").ToString
                        //txtpermanentpostal.Text = dr("prm_pincode").ToString
                        //txtpermanentHphone1.Text = dr("prm_Handphone1").ToString
                        //txtpermanentHPhone2.Text = dr("prm_Handphone2").ToString
                        //txtLandline1.Text = dr("prm_Landline").ToString
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
                        if (dr["Gender"].ToString() == "Male")
                        {
                            ddlgenderadd.SelectedValue = "1";
                        }
                        else if (dr["gender"].ToString() == "Female")
                        {
                            ddlgenderadd.SelectedValue = "2";
                        }
                        else
                        {
                            ddlgenderadd.SelectedValue = "0";
                        }
                        //ddlgenderadd.SelectedValue = dr("Gender").ToString

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
                        //Txtregistrationno.Text = dr("").ToString
                        if (dr["stay_preference"].ToString() == "1")
                        {
                            ddlstay.SelectedValue = "1";
                        }
                        else
                        {
                            ddlstay.SelectedValue = "2";
                        }
                        Imgstudent.ImageUrl = dr["Image"].ToString();
                        Txtregistrationno.Text = dr["xam_pass_regno"].ToString();
                        //Txtregistrationno.Text = dr("").ToString
                        lblprimarycontactid.Text = dr["con_id"].ToString();
                        BindScore();
                    }
                }
            }
            divErrormessage.Visible = false;
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message;
        }
    }



    //Binding Primary Contact Details
    //Public Sub BindStudentInformation()
    //    If Request("oppur_id") IsNot Nothing Then
    //        Dim oppid As String = Request("oppur_id")
    //        Dim cookie As HttpCookie = Request.Cookies.[Get]("MyCookiesLoginInfo")
    //        Dim UserID As String = cookie.Values("UserID")
    //        Dim Hiphen As String = "-"
    //        Dim dr As SqlDataReader = ProductController.GetContactsbyOppid(oppid)
    //        If (Not (dr) Is Nothing) Then
    //            If dr.Read Then
    //                txtappnumber.Text = dr("App_No").ToString
    //                Dim ContactType As String = dr("Con_type_id").ToString
    //                If ContactType = "01" Then
    //                    Dim Stdtitle As String = dr("Con_title").ToString
    //                    If Stdtitle = "Mr." Then
    //                        ddltitle.SelectedValue = "1"
    //                        ddltitle.Enabled = False
    //                    Else
    //                        ddltitle.SelectedValue = "2"
    //                        ddltitle.Enabled = False
    //                    End If
    //                    txtstudentfirstname.Text = dr("Con_Firstname").ToString
    //                    txtstudentfirstname.Enabled = False
    //                    txtstudentmidname.Text = dr("Con_midname").ToString
    //                    txtstudentmidname.Enabled = False
    //                    txtstudentlastname.Text = dr("Con_lastname").ToString
    //                    txtstudentlastname.Enabled = False
    //                    lblstudentname.Text = Hiphen + " " + dr("Con_Title").ToString + " " + dr("Con_FirstName").ToString + " " + dr("Con_midname").ToString + " " + dr("Con_lastname").ToString
    //                    txtflatno.Text = dr("Flatno").ToString
    //                    txtbuildingno.Text = dr("BuildingName").ToString
    //                    txtstreetname.Text = dr("StreetName").ToString
    //                    ddlcountry.SelectedValue = dr("Country").ToString
    //                    BindState()
    //                    ddlstate.SelectedValue = dr("State").ToString
    //                    Bindcity()
    //                    ddlcity.SelectedValue = dr("City").ToString
    //                    txtpincode.Text = dr("Pincode").ToString
    //                    txthandphone1.Text = dr("Handphone1").ToString
    //                    txthandphone2.Text = dr("Handphone2").ToString
    //                    txtlandline.Text = dr("Landline").ToString
    //                    txtemailidstudent.Text = dr("Emailid").ToString
    //                    BindCompany()
    //                    ddlcompany.SelectedValue = dr("Opp_Contact_Target_Company").ToString
    //                    BindDivision()
    //                    ddldivision.SelectedValue = dr("Opp_Contact_Division").ToString
    //                    Bindcenters()
    //                    ddlcenter.SelectedValue = dr("Opp_Contact_Center").ToString
    //                    BindAcademicYear()
    //                    ddlacademicyear.SelectedItem.Text = dr("Current_Year_Desc").ToString
    //                    BindStream()
    //                End If
    //            End If
    //        End If
    //    End If
    //End Sub

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
                    var = Math.Truncate(Convert.ToDouble(Convert.ToInt32(Age) / 365));
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

        try
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
                            BindboardbyidEdit();
                            if (dr["Board_id"].ToString() == "Select")
                            {
                                ddlsecboardedit.SelectedIndex = 0;
                            }
                            else
                            {
                                ddlsecboardedit.SelectedValue = dr["Board_id"].ToString();
                            }
                        }
                        txtsecaddnotesedit.Text = dr["Additional_desc"].ToString();
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

                        BindSecondaryCountry();
                        ddlseccountryedit.SelectedValue = dr["Country"].ToString();
                        if (ddlseccountryedit.SelectedValue == "Select")
                        {
                            ddlsecstateedit.SelectedIndex = 0;
                            ddlseccityedit.SelectedIndex = 0;
                        }
                        else
                        {
                            BindSecondaryStateEdit();
                            if (dr["State"].ToString() == "Select")
                            {
                                ddlseccityedit.SelectedIndex = 0;
                            }
                            else
                            {
                                ddlsecstateedit.SelectedValue = dr["state"].ToString();
                                BindSecondaryCityEdit();
                                if (dr["City"].ToString() == "Select")
                                {
                                    ddlseccity.SelectedIndex = 0;
                                }
                                else
                                {
                                    ddlseccityedit.SelectedValue = dr["City"].ToString();
                                    if (dr["Location_id"].ToString() == "Select")
                                    {
                                        ddlseclocationedit.SelectedIndex = 0;
                                    }
                                    else
                                    {
                                        Bindseclocationedit();
                                        ddlseclocationedit.SelectedValue = dr["Location_id"].ToString();
                                    }
                                }

                            }
                        }
                        txtsecqualiedit.Text = dr["qualification"].ToString();
                        txtsecoccupationedit.Text = dr["occupation"].ToString();
                        txtseccompanyedit.Text = dr["organization"].ToString();
                        txtsecoffaddedit.Text = dr["Office_Address"].ToString();
                        txtxsecdesgedit.Text = dr["Designation"].ToString();
                        txtsecoffteledit.Text = dr["Office_Phone"].ToString();
                        txtsecannualsaledit.Text = dr["Annual_income"].ToString();
                        txtsecdobedit.Text = dr["dob"].ToString();
                        if (dr["gender"].ToString() == "Male")
                        {
                            ddlsecgenderedit.SelectedValue = "1";
                        }
                        else if (dr["gender"].ToString()=="Female")
                        {
                            ddlsecgenderedit.SelectedValue = "2";
                        }
                        else
                        {
                            ddlsecgenderedit.SelectedValue = "0";
                        }

                    }
                }
            }
            divErrormessage.Visible = false;
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message ;
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

    //Secondary Contact Add and Edit
    protected void btnaddSeccontact_ServerClick(object sender, System.EventArgs e)
    {
        divseccontactadd.Visible = true;
        divstdparinfo.Visible = false;
        divseccontactedit.Visible = false;
        dlseccontact.Visible = false;
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        this.ddlcurrentstudying2.Items.Insert(0, "Select");
        this.ddlcurrentstudying2.SelectedIndex = 0;
        this.ddlboard2.Items.Insert(0, "Select");
        this.ddlboard2.SelectedIndex = 0;
        Institutetype();
        Yearofpassing();
        DivisionSession();
        ContactType();
        BindSecondaryCountry();
        //Board()
    }
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
    //Add Secondary Contact
    protected void btnSubmitSeccon_ServerClick(object sender, System.EventArgs e)
    {
        //USP_Add_Sec_Contact_Enrol
        try
        {
            if (string.IsNullOrEmpty(txtsecdob.Text))
            {
            }
            else
            {
                if (Convert.ToDateTime(ClsCommon.FormatDate(txtsecdob.Text)) > DateTime.Today)
                {
                    Label39.Visible = true;
                    Label39.Text = "DOB cannot be a future date";
                    txtsecdob.Focus();
                    //lbldateerrorsubmit.Visible = False
                    return;
                }
                else
                {
                    //lbldateerrorsubmit.Visible = False
                    Label39.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            Label39.Visible = true;
            Label39.Text = ex.Message;
            txtsecdob.Focus();
            return;
        }


        try
        {

            string Con_id = null;
            string Con_type_id = null;
            string Con_Type_desc = null;
            string Con_title = null;
            string Con_Firstname = null;
            string Con_midname = null;
            string Con_lastname = null;
            decimal Score = default(decimal);
            decimal Percentile = default(decimal);
            int Area_Rank = 0;

            int Overall_Rank = 0;
            string Score_Range_Type = null;
            string Handphone1 = null;
            string Handphone2 = null;

            string Landline = null;
            string Emailid = null;
            string Flatno = null;
            string BuildingName = null;
            string StreetName = null;

            string Country = null;
            string State = null;
            string City = null;
            string Pincode = null;
            string Category_Type_Id = null;
            string Category_Type = null;
            string Institution_Type_Id = null;
            string Institution_Type_Desc = null;
            string Institution_Description = null;
            string Current_Standard_Id = null;
            string Current_Standard_Desc = null;
            string Additional_Desc = null;
            string Board_Id = null;
            string Board_Desc = null;
            string Section_Id = null;
            string Section_Desc = null;
            string Year_of_Passing_ID = null;
            string Year_of_Passing_Desc = null;
            string Current_Year_Id = null;
            string Current_Year_Desc = null;
            string Student_Id = null;
            string Last_Course_Opted = null;
            int Discipline_Id = 0;
            string Discipline_Desc = null;
            int Field_ID = 0;
            string Field_Interested_Desc = null;
            string Competitive_Exam = null;
            int total_ms_marks = 0;
            string total_ms_marks_obt = null;
            string primary_con_id = null;
            System.DateTime dob = default(System.DateTime);
            string place_birth = null;
            string state_birth_code = null;
            string Image = null;
            string nationality = null;
            string mother_tongue = null;
            string religion = null;
            string caste = null;
            string subcaste = null;
            string prm_address1 = null;
            string prm_address2 = null;
            string prm_streetName = null;
            string prm_country_Code = null;
            string prm_state_Code = null;
            string prm_city_Code = null;
            string prm_location_id = null;
            string prm_pincode = null;
            string prm_Handphone1 = null;
            string prm_Handphone2 = null;
            string prm_Landline = null;
            string qualification = null;
            string organization = null;
            string Designation = null;
            string Office_Address = null;
            string Office_phone = null;
            string annual_income = null;
            string Location_id = null;
            string Gender = null;

            string country_birth = null;
            //Dim userid As String
            string city_birth = null;
            string occupation = null;
            string OTHER_NATIONALITY = null;
            string other_mother_tongue = null;
            string other_religion = null;
            //Dim CON_ID_RESPONSE As String

            BindSecContactDetails();
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            string UserName = cookie.Values["UserName"];

            Con_id = "";
            Con_type_id = ddlseccontacttype.SelectedValue;
            Con_Type_desc = ddlseccontacttype.SelectedItem.Text;
            Con_title = ddlsectitle.SelectedItem.Text;
            Con_Firstname = txtsecfname.Text;
            Con_midname = txtsecmname.Text;
            Con_lastname = txtseclname.Text;
            Score = 0;
            Percentile = 0;
            Area_Rank = 0;
            Overall_Rank = 0;
            Score_Range_Type = "";
            Handphone1 = txtsechandphone1.Text;
            Handphone2 = txtsechandphone2.Text;
            Landline = txtseclandline.Text;
            Emailid = txtsecemailid.Text;
            Flatno = txtsecaddress1.Text;
            BuildingName = txtsecaddress2.Text;
            StreetName = txtsecStreetname.Text;
            Country = ddlseccountry.SelectedValue;
            State = ddlsecstate.SelectedValue;
            City = ddlseccity.SelectedValue;
            Pincode = txtsecpincode.Text;
            Category_Type_Id = "";
            Category_Type = "";
            Institution_Type_Id = ddlinstitutiontype2.SelectedValue;
            Institution_Type_Desc = ddlinstitutiontype2.SelectedItem.Text;
            Institution_Description = txtnameofinstitution2.Text;
            Current_Standard_Id = ddlcurrentstudying2.SelectedValue;
            Current_Standard_Desc = ddlcurrentstudying2.SelectedItem.Text;
            Additional_Desc = txtadditiondesc2.Text;
            Board_Id = ddlboard2.SelectedValue;
            Board_Desc = ddlboard2.SelectedItem.Text;
            Section_Id = ddlsection2.SelectedValue;
            Section_Desc = ddlsection2.SelectedItem.Text;
            Year_of_Passing_ID = ddlyearofpassing2.SelectedValue;
            Year_of_Passing_Desc = ddlyearofpassing2.SelectedItem.Text;
            Current_Year_Id = ddlcurrentstudying2.SelectedValue;
            Current_Year_Desc = ddlcurrentstudying2.SelectedItem.Text;
            Student_Id = "";
            Last_Course_Opted = "";
            Discipline_Id = 0;
            Discipline_Desc = "";
            Field_ID = 0;
            Field_Interested_Desc = "";
            Competitive_Exam = "";
            total_ms_marks = 0;
            total_ms_marks_obt = "0";
            primary_con_id = lblprimaryconid.Text;
            //dob = Today
            if (string.IsNullOrEmpty(txtsecdob.Text))
            {
                dob = DateTime.Today;
            }
            else
            {
                dob = Convert.ToDateTime(txtsecdob.Text, System.Globalization.CultureInfo.GetCultureInfo("Hi-IN").DateTimeFormat);
            }
            place_birth = "";
            state_birth_code = "";
            Image = "";
            nationality = "";
            mother_tongue = "";
            religion = "";
            caste = "";
            subcaste = "";
            prm_address1 = "";
            prm_address2 = "";
            prm_streetName = "";
            prm_country_Code = "";
            prm_state_Code = "";
            prm_city_Code = "";
            prm_location_id = "";
            prm_pincode = "";
            prm_Handphone1 = "";
            prm_Handphone2 = "";
            prm_Landline = "";
            qualification = txtsecqualif.Text;
            organization = txtseccompany.Text;
            Designation = txtsecdesig.Text;
            Office_Address = txtsecoffadd.Text;
            Office_phone = txtsecofftelno.Text;
            annual_income = txtsecannalsal.Text;
            Location_id = ddlSeclocation.SelectedValue;
            Gender = ddlsecgender.SelectedItem.Text;
            country_birth = "";
            //userid = User_id
            city_birth = "";
            occupation = txtsecoccupation.Text;
            OTHER_NATIONALITY = "";
            other_mother_tongue = "";
            other_religion = "";

            string Responce_Conid = ClsEnrollment.AddEditSecondaryContact(Con_id, Con_type_id, Con_Type_desc, Con_title, Con_Firstname, Con_midname, Con_lastname, Score, Percentile, Area_Rank,
            Overall_Rank, Score_Range_Type, Handphone1, Handphone2, Landline, Emailid, Flatno, BuildingName, StreetName, Country,
            State, City, Pincode, Category_Type_Id, Category_Type, Institution_Type_Id, Institution_Type_Desc, Institution_Description, Current_Standard_Id, Current_Standard_Desc,
            Additional_Desc, Board_Id, Board_Desc, Section_Id, Section_Desc, Year_of_Passing_ID, Year_of_Passing_Desc, Current_Year_Id, Current_Year_Desc, Student_Id,
            Last_Course_Opted, Discipline_Id, Discipline_Desc, Field_ID, Field_Interested_Desc, Competitive_Exam, total_ms_marks, total_ms_marks_obt, primary_con_id, dob,
            place_birth, state_birth_code, Image, nationality, mother_tongue, religion, caste, subcaste, prm_address1, prm_address2,
            prm_streetName, prm_country_Code, prm_state_Code, prm_city_Code, prm_location_id, prm_pincode, prm_Handphone1, prm_Handphone2, prm_Landline, qualification,
            organization, Designation, Office_Address, Office_phone, annual_income, Location_id, Gender, country_birth, UserID, city_birth,
            occupation, OTHER_NATIONALITY, other_mother_tongue, other_religion);

            BindSecContact();
            divseccontactadd.Visible = false;
            dlseccontact.Visible = true;
            divstdparinfo.Visible = true;
            divErrormessage.Visible = false;
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message ;

        }

    }
    private void BindSecContactDetails()
    {
        if (Request["Oppur_Id"] != null)
        {
            string Oppur_Id = Request["Oppur_Id"];
            SqlDataReader dr = ProductController.Get_ContactbyLeadidforfield(2, Oppur_Id);
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    lblprimaryconid.Text = dr["Opp_Contact_id"].ToString();
                }
            }
        }
    }
    //Edit Secondary Contact
    protected void btnSubmitSecconedit_ServerClick(object sender, System.EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtsecdobedit.Text))
            {
            }
            else
            {
                if (Convert.ToDateTime(ClsCommon.FormatDate(txtsecdobedit.Text)) > DateTime.Today)
                {
                    Label38.Visible = true;
                    Label38.Text = "DOB cannot be a future date";
                    txtsecdobedit.Focus();
                    //lbldateerrorsubmit.Visible = False
                    return;
                }
                else
                {
                    //lbldateerrorsubmit.Visible = False
                    Label38.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            Label38.Visible = true;
            Label38.Text = ex.Message;
            txtsecdobedit.Focus();
            return;
        }

        try
        {
            string Con_id = null;
            string Con_type_id = null;
            string Con_Type_desc = null;
            string Con_title = null;
            string Con_Firstname = null;
            string Con_midname = null;
            string Con_lastname = null;
            decimal Score = default(decimal);
            decimal Percentile = default(decimal);
            int Area_Rank = 0;

            int Overall_Rank = 0;
            string Score_Range_Type = null;
            string Handphone1 = null;
            string Handphone2 = null;

            string Landline = null;
            string Emailid = null;
            string Flatno = null;
            string BuildingName = null;
            string StreetName = null;

            string Country = null;
            string State = null;
            string City = null;
            string Pincode = null;
            string Category_Type_Id = null;
            string Category_Type = null;
            string Institution_Type_Id = null;
            string Institution_Type_Desc = null;
            string Institution_Description = null;
            string Current_Standard_Id = null;
            string Current_Standard_Desc = null;
            string Additional_Desc = null;
            string Board_Id = null;
            string Board_Desc = null;
            string Section_Id = null;
            string Section_Desc = null;
            string Year_of_Passing_ID = null;
            string Year_of_Passing_Desc = null;
            string Current_Year_Id = null;
            string Current_Year_Desc = null;
            string Student_Id = null;
            string Last_Course_Opted = null;
            int Discipline_Id = 0;
            string Discipline_Desc = null;
            int Field_ID = 0;
            string Field_Interested_Desc = null;
            string Competitive_Exam = null;
            int total_ms_marks = 0;
            string total_ms_marks_obt = null;
            string primary_con_id = null;
            System.DateTime dob = default(System.DateTime);
            string place_birth = null;
            string state_birth_code = null;
            string Image = null;
            string nationality = null;
            string mother_tongue = null;
            string religion = null;
            string caste = null;
            string subcaste = null;
            string prm_address1 = null;
            string prm_address2 = null;
            string prm_streetName = null;
            string prm_country_Code = null;
            string prm_state_Code = null;
            string prm_city_Code = null;
            string prm_location_id = null;
            string prm_pincode = null;
            string prm_Handphone1 = null;
            string prm_Handphone2 = null;
            string prm_Landline = null;
            string qualification = null;
            string organization = null;
            string Designation = null;
            string Office_Address = null;
            string Office_phone = null;
            string annual_income = null;
            string Location_id = null;
            string Gender = null;

            string country_birth = null;
            //Dim userid As String
            string city_birth = null;
            string occupation = null;
            string OTHER_NATIONALITY = null;
            string other_mother_tongue = null;
            string other_religion = null;
            //Dim CON_ID_RESPONSE As String

            //BindSecContactDetails()
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            string UserName = cookie.Values["UserName"];

            Con_id = lblprimaryconid.Text;
            Con_type_id = ddlseccontacttypeedit.SelectedValue;
            Con_Type_desc = ddlseccontacttypeedit.SelectedItem.Text;
            Con_title = ddlsectitleedit.SelectedItem.Text;
            Con_Firstname = txtsecfnameedit.Text;
            Con_midname = txtsecmnameedit.Text;
            Con_lastname = txtseclnameedit.Text;
            Score = 0;
            Percentile = 0;
            Area_Rank = 0;
            Overall_Rank = 0;
            Score_Range_Type = "";
            Handphone1 = txtsechandphone1edit.Text;
            Handphone2 = txtsechandphone2edit.Text;
            Landline = txtseclandlineedit.Text;
            Emailid = txtsecemailidedit.Text;
            Flatno = txtsecaddress1edit.Text;
            BuildingName = txtsecaddress2edit.Text;
            StreetName = txtsecstreetnameedit.Text;
            Country = ddlseccountryedit.SelectedValue;
            State = ddlsecstateedit.SelectedValue;
            City = ddlseccityedit.SelectedValue;
            Pincode = txtsecpincodeedit.Text;
            Category_Type_Id = "";
            Category_Type = "";
            Institution_Type_Id = ddlsecinstitutionedit.SelectedValue;
            Institution_Type_Desc = ddlsecinstitutionedit.SelectedItem.Text;
            Institution_Description = txtsecinstunameedit.Text;
            Current_Standard_Id = ddlseccurrentstandardedit.SelectedValue;
            Current_Standard_Desc = ddlseccurrentstandardedit.SelectedItem.Text;
            Additional_Desc = txtsecaddnotesedit.Text;
            Board_Id = ddlsecboardedit.SelectedValue;
            Board_Desc = ddlsecboardedit.SelectedItem.Text;
            Section_Id = ddlsecsectionedit.SelectedValue;
            Section_Desc = ddlsecsectionedit.SelectedItem.Text;
            Year_of_Passing_ID = ddlsecyopedit.SelectedValue;
            Year_of_Passing_Desc = ddlsecyopedit.SelectedItem.Text;
            Current_Year_Id = ddlseccurrentstandardedit.SelectedValue;
            Current_Year_Desc = ddlseccurrentstandardedit.SelectedItem.Text;
            Student_Id = "";
            Last_Course_Opted = "";
            Discipline_Id = 0;
            Discipline_Desc = "";
            Field_ID = 0;
            Field_Interested_Desc = "";
            Competitive_Exam = "";
            total_ms_marks = 0;
            total_ms_marks_obt = "0";
            primary_con_id = "";
            //dob = Today
            try
            {
                if (string.IsNullOrEmpty(txtsecdobedit.Text))
                {
                    dob = DateTime.Today;
                }
                else
                {
                    dob = Convert.ToDateTime(txtsecdobedit.Text, System.Globalization.CultureInfo.GetCultureInfo("Hi-IN").DateTimeFormat);
                }
            }
            catch (Exception ex)
            {
                divErrormessage.Visible = true;
                lblerrormessage.Visible = true;
                lblerrormessage.Text = ex.Message;
                txtsecdobedit.Focus();
            }
            place_birth = "";
            state_birth_code = "";
            Image = "";
            nationality = "";
            mother_tongue = "";
            religion = "";
            caste = "";
            subcaste = "";
            prm_address1 = "";
            prm_address2 = "";
            prm_streetName = "";
            prm_country_Code = "";
            prm_state_Code = "";
            prm_city_Code = "";
            prm_location_id = "";
            prm_pincode = "";
            prm_Handphone1 = "";
            prm_Handphone2 = "";
            prm_Landline = "";
            qualification = txtsecqualiedit.Text;
            organization = txtseccompanyedit.Text;
            Designation = txtxsecdesgedit.Text;
            Office_Address = txtsecoffaddedit.Text;
            Office_phone = txtsecoffteledit.Text;
            annual_income = txtsecannualsaledit.Text;
            Location_id = ddlseclocationedit.SelectedValue;
            Gender = ddlsecgenderedit.SelectedItem.Text;
            country_birth = "";
            //userid = User_id
            city_birth = "";
            occupation = txtsecoccupationedit.Text;
            OTHER_NATIONALITY = "";
            other_mother_tongue = "";
            other_religion = "";

            string Responce_Conid = ClsEnrollment.AddEditSecondaryContact(Con_id, Con_type_id, Con_Type_desc, Con_title, Con_Firstname, Con_midname, Con_lastname, Score, Percentile, Area_Rank,
            Overall_Rank, Score_Range_Type, Handphone1, Handphone2, Landline, Emailid, Flatno, BuildingName, StreetName, Country,
            State, City, Pincode, Category_Type_Id, Category_Type, Institution_Type_Id, Institution_Type_Desc, Institution_Description, Current_Standard_Id, Current_Standard_Desc,
            Additional_Desc, Board_Id, Board_Desc, Section_Id, Section_Desc, Year_of_Passing_ID, Year_of_Passing_Desc, Current_Year_Id, Current_Year_Desc, Student_Id,
            Last_Course_Opted, Discipline_Id, Discipline_Desc, Field_ID, Field_Interested_Desc, Competitive_Exam, total_ms_marks, total_ms_marks_obt, primary_con_id, dob,
            place_birth, state_birth_code, Image, nationality, mother_tongue, religion, caste, subcaste, prm_address1, prm_address2,
            prm_streetName, prm_country_Code, prm_state_Code, prm_city_Code, prm_location_id, prm_pincode, prm_Handphone1, prm_Handphone2, prm_Landline, qualification,
            organization, Designation, Office_Address, Office_phone, annual_income, Location_id, Gender, country_birth, UserID, city_birth,
            occupation, OTHER_NATIONALITY, other_mother_tongue, other_religion);

            BindSecContact();
            divseccontactedit.Visible = false;
            dlseccontact.Visible = true;
            divstdparinfo.Visible = true;
            divErrormessage.Visible = false;
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message;
        }

    }
    //Steps
    protected void btnstep1next_ServerClick(object sender, System.EventArgs e)
    {
        try
        {
            if (Convert.ToDateTime(ClsCommon.FormatDate(txtappsubmitdate.Text)) > DateTime.Today)
            {
                lbldateerrorsubmit.Visible = true;
                lbldateerrorsubmit.Text = "App. submit Date cannot be a future date";
                txtappsubmitdate.Focus();
                return;
            }
        }
        catch (Exception ex)
        {
            lbldateerrorsubmit.Visible = true;
            lbldateerrorsubmit.Text = ex.Message;
            txtappsubmitdate.Focus();
            return;
        }

        try
        {
            if (Convert.ToDateTime(ClsCommon.FormatDate(txtdateofbirth.Text)) > DateTime.Today)
            {
                lbldateerrordob.Visible = true;
                lbldateerrordob.Text = "DOB cannot be a future date";
                txtdateofbirth.Focus();
                lbldateerrorsubmit.Visible = false;
                return;
            }
            else
            {
                lbldateerrorsubmit.Visible = false;
                lbldateerrordob.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lbldateerrordob.Visible = true;
            lbldateerrordob.Text = ex.Message;
            txtdateofbirth.Focus();
            lbldateerrorsubmit.Visible = false;
            return;
        }
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
        Response.Redirect("Opportunity.aspx");
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

        BindDDL(ddleditlevel, ds, "Curricular_Activity_SDesc", "ID");
        ddleditlevel.Items.Insert(0, "Select");
        ddleditlevel.SelectedIndex = 0;
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

    protected void btnFormsubmit_ServerClick(object sender, System.EventArgs e)
    {

        try
        {

            string Student_App_No = "";
            string Student_reg_no = "";
            string Student_Adm_no = "";
            string Student_Final_exam_No = "";
            string Gender = "";
            string Title = "";
            string Student_Firstname = "";
            string student_middlename = "";
            string Student_Lastname = "";
            string Dob = "";
            string Country_Birth = "";
            string Place_Birth = "";
            string State_birth_Code = "";
            string City_Birth = "";
            string Stud_Image = "";
            string Handphone1 = "";
            string Handphone2 = "";
            string Landline = "";
            string Emailid = "";
            string Flatno = "";
            string Buildingname = "";
            string StreetName = "";
            string CountryCode = "";
            string Statecode = "";
            string CityCode = "";
            string Location = "";

            string Pincode = "";
            decimal Score = 0;
            decimal Percentile = 0;
            int Arearank = 0;
            int Overallrank = 0;

            string Score_Range_Type = "";
            string Nationality = "";
            string Mother_Tongue = "";
            string Religion = "";

            string Caste = "";
            string Subcaste = "";
            string Category = "";
            string Physically_Challenged = "";
            string Student_from = "";
            string Company_Code = "";
            string Division_code = "";
            string Center_Code = "";
            string Acad_Year = "";
            string Stream_Code = "";
            int Discipline_id = 0;
            string Discipline_Desc = "";
            string Field_Id = "";
            string Field_Interested_desc = "";
            string Competitive_exam = "";
            string Category_TYpe_Id = "";
            string Category_Type = "";
            string Institution_Type_Id = "";
            string Institution_Type_Desc = "";
            string Institution_Description = "";
            string Current_Standard_id = "";

            string Current_Standard_Desc = "";
            string Additional_Desc = "";
            string Board_Id = "";
            string Board_Desc = "";
            string Section_id = "";
            string Section_Desc = "";
            string Year_of_passing_id = "";
            string Year_of_Passing_Desc = "";

            string Current_Year_id = "";
            string Current_Year_Desc = "";
            string S_id = "";
            string Last_Course_Opted = "";
            string Enrollon = "";
            string Total_MS_Marks = "";
            string Total_Ms_Marks_Obt = "";
            string Prm_address1 = "";
            string Prm_address2 = "";
            string prm_streetname = "";
            string prm_Countrycode = "";
            string Prm_Statecode = "";
            string Prm_CityCode = "";
            string prm_location = "";
            string prm_Pincode = "";
            string prm_Handphone1 = "";
            string prm_handphone2 = "";
            string prm_landline = "";
            string Last_School_Name = "";
            string Last_School_Place = "";
            string School_Locality = "";

            string Medium_instruction = "";
            string Stay_preference = "";
            string Last_Exam_passed = "";
            string No_attempts = "";

            string Year_Passing = "";
            string Month_passing = "";
            string Reg_No = "";
            string User_id = "";
            string Opp_Id = "";
            string Other_Nationality = "";
            string Other_Mother_Tongue = "";
            string Other_religion = "";
            string Exam_passed_State = "";
            string Qualification = "";
            string Organization = "";
            string Designation = "";
            string Office_Address = "";
            string Office_Phone = "";
            string Annual_Income = "";
            string Location_id = "";
            string Occupation = "";

            string Oppid = Request["oppur_id"];
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            User_id = cookie.Values["UserID"];

            Student_App_No = txtappnumber.Text;
            Student_reg_no = "";
            Student_Adm_no = "";
            Student_Final_exam_No = "";
            Gender = ddlgenderadd.SelectedItem.Text;
            Title = ddltitle.SelectedItem.Text;
            Student_Firstname = txtstudentfirstname.Text;
            student_middlename = txtstudentmidname.Text;
            Student_Lastname = txtstudentlastname.Text;
            Dob = txtdateofbirth.Text;
            Country_Birth = ddlplaceofbirthcountry.SelectedValue;
            Place_Birth = txtplaceofbirth.Text;
            State_birth_Code = ddlplaceofbirthstate.SelectedValue;
            City_Birth = ddlplaceofbirthcity.SelectedValue;


            Handphone1 = txthandphone1.Text;
            Handphone2 = txthandphone2.Text;
            Landline = txtlandline.Text;
            Emailid = txtemailidstudent.Text;
            Flatno = txtflatno.Text;
            Buildingname = txtbuildingno.Text;
            StreetName = txtstreetname.Text;
            CountryCode = ddlcountry.SelectedValue;
            Statecode = ddlstate.SelectedValue;
            CityCode = ddlcity.SelectedValue;
            Location = ddllocation.SelectedValue;

            Pincode = txtpincode.Text;
            Score = 0;
            Percentile = 0;
            Arearank = 0;
            Overallrank = 0;

            Score_Range_Type = "";
            Nationality = ddlnationality.SelectedValue;
            Mother_Tongue = ddlmothertongue.SelectedValue;
            Religion = ddlreligion.SelectedValue;

            Caste = ddlcaste.SelectedValue;
            Subcaste = txtsubcaste.Text;
            Category = ddlgroup.SelectedValue;
            Physically_Challenged = ddlphysicalchallenged.SelectedValue;
            Student_from = ddlstudentfrom.SelectedValue;
            Company_Code = ddlcompany.SelectedValue;
            Division_code = ddldivision.SelectedValue;
            Center_Code = ddlcenter.SelectedValue;
            Acad_Year = ddlacademicyear.SelectedValue;
            Stream_Code = ddlstream.SelectedValue;
            Discipline_id = 0;
            Discipline_Desc = "";
            Field_Id = "0";
            Field_Interested_desc = "";
            Competitive_exam = "";
            Category_TYpe_Id = "";
            Category_Type = "";
            Institution_Type_Id = "";
            Institution_Type_Desc = "";
            Institution_Description = "";
            Current_Standard_id = "";

            Current_Standard_Desc = "";
            Additional_Desc = "";
            Board_Id = "";
            Board_Desc = "";
            Section_id = "";
            Section_Desc = "";
            Year_of_passing_id = "";
            Year_of_Passing_Desc = "";

            Current_Year_id = "";
            Current_Year_Desc = "";
            S_id = "";
            Last_Course_Opted = "";
            Enrollon = txtappsubmitdate.Text;
            Total_MS_Marks = "";
            Total_Ms_Marks_Obt = "";
            Prm_address1 = txtpermanentAdd1.Text;
            Prm_address2 = txtpermanentAdd2.Text;
            prm_streetname = txtpermanentstreet.Text;
            prm_Countrycode = ddlpermanentcountry.SelectedValue;
            Prm_Statecode = ddlpermstate.SelectedValue;
            Prm_CityCode = ddlpermanentcity.SelectedValue;
            prm_location = ddlpermanentlocation.SelectedValue;
            prm_Pincode = txtpermanentpostal.Text;
            prm_Handphone1 = txtpermanentHphone1.Text;
            prm_handphone2 = txtpermanentHPhone2.Text;
            prm_landline = txtLandline1.Text;
            Last_School_Name = txtLastSchname.Text;
            Last_School_Place = txtschoolplacename.Text;
            School_Locality = txtschoolexactlocation.Text;

            Medium_instruction = ddlmediumofinstruction.SelectedValue;
            Stay_preference = ddlstay.SelectedValue;
            Last_Exam_passed = txtlastexampassed.Text;
            No_attempts = txtnoofattempts.Text;

            Year_Passing = ddlyearofpassing.SelectedValue;
            Month_passing = ddlMonthofpassing.SelectedValue;
            Reg_No = Txtregistrationno.Text;

            Other_Nationality = txtNationalitySpecify.Text;
            Other_Mother_Tongue = txtmothertonguespecify.Text;
            Other_religion = txtReligionpecify1.Text;
            Exam_passed_State = txtlastexampassstate.Text;
            Qualification = txtquali.Text;
            Organization = txtcompany.Text;
            Designation = txtdesignation.Text;
            Office_Address = txtofficeaddress.Text;
            Office_Phone = txtofficetelno.Text;
            Annual_Income = txtannaulsalary.Text;
            Location_id = ddllocation.SelectedValue;
            Occupation = "";
            string Checkedit = "";
            string StudentImage = "";
            string StudentImageUrl = "";
            Stud_Image = FileuploadStudent.FileName;
            if (FileuploadStudent.FileName != null && !string.IsNullOrEmpty(FileuploadStudent.FileName.Trim()))
            {
                StudentImageUrl = "~/Browse/StudentImage/" + Oppid + "_" + FileuploadStudent.FileName;
                FileuploadStudent.SaveAs(Server.MapPath(StudentImageUrl));
            }
            else
            {
                StudentImageUrl = "~/Browse/StudentImage/" + Oppid + "_" + FileuploadStudent.FileName;
                FileuploadStudent.SaveAs(Server.MapPath(StudentImageUrl));
            }



            string Student_id = ClsEnrollment.enrollstudent(Student_App_No, Student_reg_no, Student_Adm_no, Student_Final_exam_No, Gender, Title, Student_Firstname, student_middlename, Student_Lastname, Dob,
            Country_Birth, Place_Birth, State_birth_Code, City_Birth, StudentImageUrl, Handphone1, Handphone2, Landline, Emailid, Flatno,
            Buildingname, StreetName, CountryCode, Statecode, CityCode, Location, Pincode, Score, Percentile, Arearank,
            Overallrank, Score_Range_Type, Nationality, Mother_Tongue, Religion, Caste, Subcaste, Category, Physically_Challenged, Student_from,
            Company_Code, Division_code, Center_Code, Acad_Year, Stream_Code, Discipline_id, Discipline_Desc, Field_Id, Field_Interested_desc, Competitive_exam,
            Category_TYpe_Id, Category_Type, Institution_Type_Id, Institution_Type_Desc, Institution_Description, Current_Standard_id, Current_Standard_Desc, Additional_Desc, Board_Id, Board_Desc,
            Section_id, Section_Desc, Year_of_passing_id, Year_of_Passing_Desc, Current_Year_id, Current_Year_Desc, S_id, Last_Course_Opted, Enrollon, Total_MS_Marks,
            Total_Ms_Marks_Obt, ref Prm_address1, Prm_address2, prm_streetname, prm_Countrycode, Prm_Statecode, Prm_CityCode, prm_location, prm_Pincode, prm_Handphone1,
            prm_handphone2, prm_landline, Last_School_Name, Last_School_Place, School_Locality, Medium_instruction, Stay_preference, Last_Exam_passed, No_attempts, Year_Passing,
            Month_passing, Reg_No, User_id, Oppid, Other_Nationality, Other_Mother_Tongue, Other_religion, Exam_passed_State, Qualification, Organization,
            Designation, Office_Address, Office_Phone, Annual_Income, Location_id, Occupation);

            InsertSubjectPreference1();
            InsertSubjectPreference2();
            InsertSubjectPreference3();
            InsertScore();

            btnFormsubmit.Visible = false;
            divSuccessmessage.Visible = true;
            lblsuccessMessage.Visible = true;
            lblsuccessMessage.Text = "Enrollment Successfully Updated";
            btnAccountcancel.Visible = false;
            btnstep3prevnew.Visible = false;
            divErrormessage.Visible = false;
        }
        catch (Exception ex)
        {
            divErrormessage.Visible = true;
            lblerrormessage.Visible = true;
            lblerrormessage.Text = ex.Message;
        }

    }

    private void InsertSubjectPreference1()
    {
        string Oppid = Request["oppur_id"];
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string User_id = cookie.Values["UserID"];
        object obj = null;
        Label lbsgrdesc = default(Label);
        Label Lbsgrmaterialcode = default(Label);
        string Prefernce = "";
        string Sgrcode = "";
        foreach (DataListItem li in dlcomplusorysubject.Items)
        {
            obj = li.FindControl("lblsgrdesc");
            if (obj != null)
            {
                lbsgrdesc = (Label)obj;
            }

            obj = li.FindControl("lblmaterialcode");
            if (obj != null)
            {
                Lbsgrmaterialcode = (Label)obj;
            }
            Prefernce = "1";
            ClsEnrollment.Insertpreference(Oppid, Lbsgrmaterialcode.Text, lbsgrdesc.Text, "0", 2, User_id);
        }
    }
    private void InsertSubjectPreference2()
    {
        string Oppid = Request["oppur_id"];
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string User_id = cookie.Values["UserID"];
        object obj = null;
        Label lbsgrdesc = default(Label);
        Label Lbsgrmaterialcode = default(Label);
        TextBox txtprefernce = default(TextBox);
        string Prefernce = "";
        string Sgrcode = "";

        foreach (DataListItem li in dlcompulsorylanguages.Items)
        {
            obj = li.FindControl("lblsgrdesc1");
            if (obj != null)
            {
                lbsgrdesc = (Label)obj;
            }

            obj = li.FindControl("lblmaterialcode");
            if (obj != null)
            {
                Lbsgrmaterialcode = (Label)obj;
            }

            obj = li.FindControl("txtpref");
            if (obj != null)
            {
                txtprefernce = (TextBox)obj;
            }
            if (string.IsNullOrEmpty(txtprefernce.Text))
            {
                txtprefernce.Text = "0";
                ClsEnrollment.Insertpreference(Oppid, Lbsgrmaterialcode.Text, lbsgrdesc.Text, txtprefernce.Text, 2, User_id);
            }
            else
            {
                ClsEnrollment.Insertpreference(Oppid, Lbsgrmaterialcode.Text, lbsgrdesc.Text, txtprefernce.Text, 2, User_id);
            }

        }

    }

    private void InsertSubjectPreference3()
    {
        string Oppid = Request["oppur_id"];
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string User_id = cookie.Values["UserID"];
        object obj = null;
        Label lbsgrdesc = default(Label);
        Label Lbsgrmaterialcode = default(Label);
        string Prefernce = "";
        string Sgrcode = "";
        TextBox txtprefernce = default(TextBox);

        foreach (DataListItem li in dlspecialization.Items)
        {
            obj = li.FindControl("lblsgrdesc2");
            if (obj != null)
            {
                lbsgrdesc = (Label)obj;
            }

            obj = li.FindControl("lblmaterialcode");
            if (obj != null)
            {
                Lbsgrmaterialcode = (Label)obj;
            }

            obj = li.FindControl("txtpref1");
            if (obj != null)
            {
                txtprefernce = (TextBox)obj;
            }
            if (string.IsNullOrEmpty(txtprefernce.Text))
            {
                txtprefernce.Text = "0";
                ClsEnrollment.Insertpreference(Oppid, Lbsgrmaterialcode.Text, lbsgrdesc.Text, txtprefernce.Text, 2, User_id);
            }
            else
            {
                ClsEnrollment.Insertpreference(Oppid, Lbsgrmaterialcode.Text, lbsgrdesc.Text, txtprefernce.Text, 2, User_id);
            }

        }

    }

    private void InsertScore()
    {
        string Conid = lblprimarycontactid.Text;
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string User_id = cookie.Values["UserID"];
        object obj = null;
        Label lblscoredesc = default(Label);
        Label lblscoreid = default(Label);
        TextBox txtscore = default(TextBox);

        foreach (DataListItem li in dlScore.Items)
        {
            obj = li.FindControl("lblscoretypedesc");
            if (obj != null)
            {
                lblscoredesc = (Label)obj;
            }

            obj = li.FindControl("lblscoreid");
            if (obj != null)
            {
                lblscoreid = (Label)obj;
            }

            obj = li.FindControl("txtscore");
            if (obj != null)
            {
                txtscore = (TextBox)obj;
            }

            if (string.IsNullOrEmpty(txtscore.Text))
            {
            }
            else
            {
                ProductController.InsertScore(3, Conid, "", txtscore.Text, User_id, Convert.ToInt32(lblscoreid.Text));
            }

        }
    }

    protected void dlsubjectmarks_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            string Oppurid = Request["oppur_id"];
            string Subject = "";
            string Maxmarks = "";
            string Marksobtained = "";
            string Userid = "";
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            lblsubid.Text = id.ToString();
            //Dim Id As String = e.CommandArgument.ToString
            SqlDataReader dr = ProductController.GetSubjectdetailsbyid(5, Oppurid, Subject, Maxmarks, Marksobtained, Userid, id);
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    txtsubjectmarksedit.Text = dr["Subject"].ToString();
                    txtmaxmarksedit.Text = dr["Max_Marks"].ToString();
                    txtmarksobtedit.Text = dr["Marks_Obtained"].ToString();
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#Subjectmarks').modal('show') });</script>", false);

        }
    }

    protected void dlsubjectmarks_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ScriptManager scriptManager__1 = ScriptManager.GetCurrent(this.Page);
            scriptManager__1.RegisterPostBackControl((LinkButton)e.Item.FindControl("lnkedit"));
        }
    }


    protected void btnsubjectmarksclose_ServerClick(object sender, System.EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#Subjectmarks').modal('hide') });</script>", false);

    }

    protected void btnsubjectmarksclose1_ServerClick(object sender, System.EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#Subjectmarks').modal('hide') });</script>", false);

    }

    protected void btnsubectmarkssave_ServerClick(object sender, System.EventArgs e)
    {
        string Oppid = Request["oppur_id"];
        string Subject = "";
        string Maxmarks = "";
        string Marksobtained = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = Convert.ToInt32(lblsubid.Text);
        Subject = txtsubjectmarksedit.Text;
        Maxmarks = txtmaxmarksedit.Text;
        Marksobtained = txtmarksobtedit.Text;
        ProductController.InsertMarks(3, Oppid, Subject, Maxmarks, Marksobtained, UserID, Id);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#Subjectmarks').modal('hide') });</script>", false);
        BindSubjectMarks();
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Visible = true;
        lblsuccessMessage.Text = "Marks Successfully Updated for " + Subject;
        //txtsubjectname.Text = ""
        //txtmaxmarks.Text = ""
        //txtmarksobtained.Text = ""
        dlsubjectmarks.Visible = true;
    }

    protected void dlextracurricular_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {

        if (e.CommandName == "Edit")
        {
            string Oppid = Request["oppur_id"];
            int Extracurricular = 0;
            string Description = "";
            HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
            string UserID = cookie.Values["UserID"];
            int Id =Convert.ToInt32(e.CommandArgument.ToString());
            lblcurricluarid.Text = Id.ToString() ;
            //Dim Id As String = e.CommandArgument.ToString
            SqlDataReader dr = ProductController.Getextracurricularbyid(4, Oppid, Extracurricular, Description, UserID, Id);
            if ((((dr) != null)))
            {
                if (dr.Read())
                {
                    Bindlevel();
                    ddleditlevel.SelectedValue = dr["Curricular_Activity_id"].ToString();
                    txtxeditdtls.Text = dr["Description"].ToString();
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#editextracurricular').modal('show') });</script>", false);

        }
    }

    protected void dlextracurricular_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ScriptManager scriptManager__1 = ScriptManager.GetCurrent(this.Page);
            scriptManager__1.RegisterPostBackControl((LinkButton)e.Item.FindControl("lnkedit"));
        }
    }

    protected void btncloseextracurri_ServerClick(object sender, System.EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#editextracurricular').modal('hide') });</script>", false);

    }

    protected void btncloseextracurri1_ServerClick(object sender, System.EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "k2", "<script type=\"text/javascript\">$(function () { $('#editextracurricular').modal('hide') });</script>", false);

    }

    protected void btnsaveextracurri_ServerClick(object sender, System.EventArgs e)
    {
        string Oppid = Request["oppur_id"];
        int Extracurricular = 0;
        string Description = "";
        HttpCookie cookie = Request.Cookies.Get("MyCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        int Id = Convert.ToInt32(lblcurricluarid.Text);
        Extracurricular =Convert.ToInt32(ddleditlevel.SelectedValue);
        Description = txtxeditdtls.Text;
        ProductController.InsertExtraactivity(5, Oppid, Extracurricular, Description, UserID, Id);
        BindExtraCurricular();
        divSuccessmessage.Visible = true;
        lblsuccessMessage.Visible = true;
        lblsuccessMessage.Text = "Extra Currricular Activity Successfully Updated";
        //ddllevel.Items.Insert(0, "Select")
        //ddllevel.SelectedIndex = 0
        //txtdescription.Text = ""
        dlextracurricular.Visible = true;
    }

    protected void chkaddcopy_CheckedChanged(object sender, System.EventArgs e)
    {
        if (chkaddcopy.Checked == true)
        {
            txtpermanentAdd1.Text = txtflatno.Text;
            txtpermanentAdd2.Text = txtbuildingno.Text;
            txtpermanentstreet.Text = txtstreetname.Text;
            ddlpermanentcountry.SelectedValue = ddlcountry.SelectedValue;
            BindPermanentState();
            ddlpermstate.SelectedValue = ddlstate.SelectedValue;
            BindPermanentcity();
            ddlpermanentcity.SelectedValue = ddlcity.SelectedValue;
            BindPermanentLocation();
            ddlpermanentlocation.SelectedValue = ddllocation.SelectedValue;
            txtpermanentpostal.Text = txtpincode.Text;
            txtpermanentHphone1.Text = txthandphone1.Text;
            txtpermanentHPhone2.Text = txthandphone2.Text;
            txtLandline1.Text = txtlandline.Text;
        }
        else
        {
            txtpermanentAdd1.Text = "";
            txtpermanentAdd2.Text = "";
            txtpermanentstreet.Text = "";
            ddlpermanentcountry.SelectedIndex = 0;
            //BindPermanentState()
            ddlpermstate.SelectedIndex = 0;
            ddlpermanentcity.SelectedIndex = 0;
            ddlpermanentlocation.SelectedIndex = 0;
            txtpermanentpostal.Text = "";
            txtpermanentHphone1.Text = "";
            txtpermanentHPhone2.Text = "";
            txtLandline1.Text = "";
        }
    }


}