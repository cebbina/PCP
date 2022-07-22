********************************************************************************** 
* This data cleaning script includes the following tasks for each variable 		 *
* (if applicable) from the tidy dataset:										 *
* Step 1: Recode values															 *
* Step 2: Define value label													 *
* Step 3: Encode categorical variable as numeric variable 						 *
* Step 4: Rename variable														 *
* Step 5: Define variable label and note										 *
*																				 *
* Author: Cheng-Wei Lee (2022 Summer Intern in DE JURE program, DIME, World Bank)*
* Create Date: 2022-JUL-19														 *
********************************************************************************** 

// Step 0: Setting and read data

	clear all
	set more off
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"
	use "merged_data_tidy.dta", clear //use the tidied dta data


*** variable: v1 ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	rename v1 seq_no

// Step 5: Define variable label and note
	label variable seq_no "Sequence number"
	notes seq_no: Unique sequence number starting from 0 which was genereted by Python during the merging process of the PCP dataset and the CV dataset
	

*** variable: complaint_code ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable complaint_code "Complaint code"
	notes complaint_code: Unique code generated automatically by PCP when the complaint was submitted
	

*** variable: complaint_date ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable complaint_date "Complaint date"
	notes complaint_date: Date when the complaint was submitted
	
		
*** variable: complaint_time ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable complaint_time "Complaint time"
	notes complaint_time: Time when the complaint was submitted
	
	
*** variable: complaint_details ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable

// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable complaint_details "Complaint details"
	notes complaint_details: Details of the complaint

	

*** variable: level_one ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define level1
	1 "Health"
	2 "Education"
	3 "Municipal Services"
	4 "Land Revenue"
	5 "Land Grabbing / Encroachment"
	6 "Corruption / Malpractice"
	7 "Law & Order"
	8 "Energy & Power"
	9 "Farmer / Agriculture"
	10 "Environment & Forest"
	11 "Fisheries & Livestock"
	12 "Disaster / Emergency"
	13 "Development Projects"
	14 "Excise & Taxation"
	15 "Licenses, Certificates & Registrations"
	16 "Transport & Communications"
	17 "Human Rights"
	18 "Investments"
	19 "Media"
	20 "NADRA"
	21 "Sehat Insaf Card"
	22 "Utility Stores (USC)"
	23 "State Life (SLICP)"
	24 "FBR"
	25 "Poverty Alleviation and Social Safety"
	26 "Overseas Pakistani / Call Sarzameen"
	27 "Cantonment Boards Services"
	28 "Capital Development Authority (CDA)"
	29 "FIA / Cyber Crime"
	30 "Immigration & Passport"
	31 "Auditor General of Pakistan (AGP)"
	32 "Banking"
	33 "Kamyab Jawan / Youth Affairs"
	34 "Naya Pakistan Housing"
	35 "Provincial Development Authorities"
	36 "SECP"
	37 "Controller General of Accounts (CGA)"
	38 "Special Technology Zones Authority"
	39 "Scholarships"
	;
	#delimit cr

// Step 3: Encode categorical variable as numeric variable
	encode level_one , generate(level_one_temp) label(level1) noextend
	order level_one_temp , after(level_one)
	drop level_one
	rename level_one_temp level_one
	
// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable level_one "Complaint category: first level"
	notes level_one: First level of the complaint category selected by the citizen. Value labels were assigned according to the order appeared in PCP App on 7/19/2022.
	notes level_one: Note that "Kamyab Jawan / Youth Affairs" (appearing in the 2021 portal dataset but not in PCP App) which might be the old name of "Prime Minister's Youth Porgram (PMYP)" (appearing in PCP App but not in the 2021 portal dataset) was assigned value 63.
		
		
*** variable: level_two ***
	
// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define level2
	1 "Gas"
	2 "Electricity"
	3 "Cleanliness"
	4 "Encroachment"
	5 "Street Lights"
	101 "Illegal Practice / Quacks"
	102 "Spurious / Unregistered Medicines"
	103 "Primary Health"
	104 "Secondary Health"
	105 "Medical Teaching Institutes"
	201 "Private Schools"
	202 "Elementary & Secondary"
	203 "Colleges "
	204 "Universities"
	205 "Higher Education Commission"
	206 "Special Education"
	301 "Water Connection"
	302 "Water Supply Scheme"
	303 "Repair of Street"
	304 "Price Control"
	305 "Graveyards"
	306 "Unhygienic Food / Factory"
	307 "Parking / Adda"
	308 "Illegal Construction"
	309 "Stray Animals"
	310 "Construction material on roads"
	311 "Illegal billboards"
	312 "Low hanging electricity wires"
	401 "Transfer of Land / Mutation"
	402 "Complaint against Land Mafia"
	501 "Govt. Land"
	502 "Private Land"
	601 "Inefficiency"
	602 "Harassment"
	603 "Fraud / Forgery"
	604 "Power Abuse"
	605 "Violation of Merit  / Rules"
	606 "Financial Corruption"
	607 "Complaint against Revenue Staff"
	701 "Prisons"
	702 "Pakistan Railway Police"
	703 "Airport Security Force"
	704 "Traffic Police"
	705 "Motorway Police"
	706 "Anti-Narcotics Force (ANF)"
	707 "Police"
	801 "Pakistan State Oil (PSO)"
	802 "OGRA"
	803 "OGDCL"
	901 "Crop Insurance"
	902 "Agriculture Loan"
	903 "Kissan Card"
	904 "Agriculture Engineering"
	905 "Pesticides"
	906 "Prices of Crops / Produce"
	907 "Fertilizers"
	908 "Seeds"
	909 "Water Management"
	910 "Soil Conservation"
	911 "Miscellaneous (Farmers)"
	1001 "Industrial Pollution"
	1002 "Forest Cutting"
	1003 "10 Billion Tree Tsunami"
	1004 "Billion Tree Tsunami"
	1005 "Hospital Waste"
	1006 "Industrial Waste"
	1101 "Fisheries"
	1102 "Livestock & Dairy"
	1201 "Internally Displaced Persons"
	1202 "Rehabilitation"
	1203 "Death Compensation"
	1204 "Floods"
	1205 "Earthquake"
	1301 "NGO Infra-Projects"
	1302 "Foreign Funded Projects"
	1303 "Federal Govt. Projects"
	1304 "Provincial Govt. Projects"
	1305 "District Govt. Projects"
	1306 "TMA Projects"
	1307 "VC / NC Project"
	1401 "Islamabad Excise"
	1402 "Financial Fraud"
	1403 "Money Laundering"
	1404 "Provincial Excise"
	1501 "Pakistan Medical Commission (PMC)"
	1502 "Pakistan Engineering Council (PEC)"
	1503 "Vehicle Registration"
	1504 "Union Registration"
	1505 "NGO Registration"
	1506 "NGO NOC"
	1507 "NOC for Foreign Traveler"
	1508 "Marriage Certificate"
	1509 "Death Certificate"
	1510 "Birth Certificate"
	1511 "Domicile Certificate"
	1512 "Divorce Registration"
	1513 "Vehicle Fitness Certificate"
	1514 "Route Permit"
	1515 "Medical Store License"
	1516 "Fishing License"
	1517 "Arm License"
	1518 "Driving License"
	1601 "Ports & Shippings"
	1602 "NTC"
	1603 "Pakistan Telecommunication Company Limited (PTCL)"
	1604 "Pakistan Telecommunication Authority (PTA)"
	1605 "Pakistan Post"
	1606 "PIA"
	1607 "Motorways"
	1608 "NHA"
	1609 "C&W Roads"
	1610 "Local Govt Roads"
	1611 "Irrigation Roads"
	1612 "Railways"
	1613 "Bus Addas"
	1614 "Overloading"
	1615 "Fares"
	1616 "Airports"
	1701 "Violation of the Rights of Senior Citizens"
	1702 "Violation of the Rights of Persons with Disabilities"
	1703 "Violation of the Rights of HR Defenders"
	1704 "Torture"
	1705 "Kidnapping"
	1706 "Killing"
	1707 "Violence Against Minorities"
	1708 "Corporal Punishment"
	1709 "Rape"
	1710 "Harassment at Public Places"
	1711 "Gender Based Violence"
	1712 "Domestic Violence"
	1713 "Right to Information"
	1714 "Right to Services"
	1715 "Consumer Rights"
	1716 "Denial of Rights"
	1717 "Sexual Harassment"
	1718 "Gender Discrimination"
	1719 "Child Abuse"
	1720 "Missing Persons"
	1801 "National Savings (CDNS)"
	1802 "Board of Investment (BOI)"
	1803 "Banks related issues"
	1901 "Social Media"
	1902 "Electronic Media / PEMRA"
	1903 "Print Media"
	2001 "Correction"
	2002 "Duplicate ID Card"
	2003 "Updation"
	2004 "Modification in ID Card"
	2005 "Issuance of Form B (CRC)"
	2006 "CNIC Replacement / Renewal"
	2007 "Family Registration Certificate (FRC)"
	2008 "Overseas Pakistani Card"
	2009 "Juvenile Card (Under 18 ID Card)"
	2010 "Issuance of New CNIC"
	2011 "Blocked / Impounded CNIC"
	2101 "Complaints of Registered Hospitals"
	2102 "Public Issues / Complaints"
	2201 "Over Charges"
	2202 "Local Purchase"
	2203 "Black Marketing"
	2204 "Price Related Issue"
	2205 "Availability of Items"
	2301 "Health Insurance"
	2302 "Administrative Issues"
	2303 "Misselling & Defalcation of Premium"
	2304 "Issues Related to Policy Services"
	2401 "Customs"
	2402 "Federal Excise"
	2403 "Sales Tax"
	2404 "Income Tax"
	2501 "Pakistan Bait-ul-Mal"
	2502 "Ehsaas Program"
	2503 "BISP"
	2601 "Overseas Pakistanis & Human Resource Development (OP&HRD)"
	2602 "Community Welfare AttachÃ© (CWA)"
	2603 "Directorate of Workers Education (DWE)"
	2604 "National Industrial Relation Commission (NIRC)"
	2605 "Workers Welfare Fund (WWF)"
	2606 "Overseas Employment Corporation (OEC)"
	2607 "Employees Old Age Benefit (EOBI)"
	2608 "Bureau of Emigration & Overseas Employment (BE&OE)"
	2609 "Overseas Pakistani Foundation (OPF)"
	2610 "Pakistan Foreign Office"
	2611 "Pakistan Embassy in Resident Country"
	2701 "Sanjwal Cantonment Board"
	2702 "Faisal Cantonment Board"
	2703 "Walton Cantonment Board"
	2704 "Zhob Cantonment Board"
	2705 "Wah Cantonment Board"
	2706 "Swat Cantonment Board"
	2707 "Sialkot Cantonment Board"
	2708 "Shorkot Cantonment Board"
	2709 "Sargodha Cantonment Board"
	2710 "Risalpur Cantonment Board"
	2711 "Rawalpindi Cantonment Board"
	2712 "Quetta Cantonment Board"
	2713 "Peshawar Cantonment Board"
	2714 "Pano Aquil Cantonment Board"
	2715 "Ormara Cantonment Board"
	2716 "Okara Cantonment Board"
	2717 "Nowshera Cantonment Board"
	2718 "Murree Hills Cantonment Board"
	2719 "Multan Cantonment Board"
	2720 "Mardan Cantonment Board"
	2721 "Manora Cantonment Board"
	2722 "Mangla Cantonment Board"
	2723 "Malir Cantonment Board"
	2724 "Loralai Cantonment Board"
	2725 "Lahore Cantonment Board"
	2726 "Korangi Creek Cantonment Board"
	2727 "Kohat Cantonment Board"
	2728 "Kharian Cantonment Board"
	2729 "Karachi Cantonment Board"
	2730 "Kamra Cantonment Board"
	2731 "Jhelum Cantonment Board"
	2732 "Hyderabad Cantonment Board"
	2733 "Havelian Cantonment Board"
	2734 "Gujranwala Cantonment Board"
	2735 "D.I. Khan Cantonment Board"
	2736 "Cherat Cantonment Board"
	2737 "Chaklala Cantonment Board"
	2738 "Cantonment Board Taxila"
	2739 "Cantonment Board Clifton"
	2740 "Bannu Cantonment Board"
	2741 "Bahawalpur Cantonment Board"
	2742 "Attock Cantonment Board"
	2743 "Abbottabad Cantonment Board"
	2801 "Land Matters"
	2802 "Market & Road Maintenance"
	2803 "Building Control"
	2804 "Property Matters"
	2805 "Sewerage"
	2901 "Human Resource Management (HRM)"
	2902 "Human Trafficking & Smuggling"
	2903 "Interpol"
	2904 "Intellectual Property Rights"
	2905 "Banking Crimes"
	2906 "Counter Terrorist"
	2907 "Anti-Corruption"
	2908 "Corporate Crime"
	2909 "Electricity, Gas, Oil Anti-Theft Unit"
	2910 "Immigration"
	2911 "Cyber Crime"
	3001 "Diplomatic Passport"
	3002 "Extension of Foreigner Visa"
	3003 "Renunciation of Pakistani Citizenship"
	3004 "Blacklisting of Passport"
	3005 "Renewal of Passport"
	3006 "Pakistani Visa"
	3007 "Pakistani Citizenship"
	3008 "Official Passport"
	3009 "Issuance of New Passport"
	3101 "General Complaint"
	3102 "Complaint against Audit Activity"
	3103 "Complaint against Auditing Office"
	3104 "Complaint against Auditor"
	3105 "Citizen Participatory Audit"
	3201 "First Women Bank Ltd"
	3202 "SME Bank"
	3203 "National Bank of Pakistan (NBP)"
	3204 "Overseas / NRPs"
	3205 "Bancassurance and 3rd Party Investment Schemes"
	3206 "Home Remittances"
	3207 "Remittances through SWIFT"
	3208 "Remittance / Clearing (Inland)"
	3209 "Utility Bill"
	3210 "Over The Counter Issues"
	3211 "Account Maintenance"
	3212 "Clearing"
	3213 "Pension Accounts"
	3214 "Agent Banking"
	3215 "Call Center / Phone Banking Issues"
	3216 "Branch Issues"
	3217 "Mobile Banking / SMS Banking / Mobile App"
	3218 "E - Banking"
	3219 "ATM / Debit Cards"
	3220 "LC / BG / TC"
	3221 "Personal Loan"
	3222 "House Loan"
	3223 "Agriculture Loans"
	3224 "Auto Loan"
	3225 "Credit Cards"
	3226 "Zarai Taraqiati Bank Limited (ZTBL)"
	3301 "Hunarmand Pakistan"
	3302 "Youth Entrepreneurship Scheme (YES!)"
	3303 "Youth Programs"
	3401 "Structural Design"
	3402 "Architecture Design"
	3403 "Town Plan / Layout Plan"
	3404 "Traffic Impact"
	3405 "Height Restriction"
	3406 "Environmental Protection"
	3407 "Water / Sewerage"
	3408 "Non Encumbrance Certificate"
	3501 "Swat Development Authority (SDA)"
	3502 "Swabi Development Authority (SDA)"
	3503 "Sehwan Development Authority (SDA)"
	3504 "Sargodha Development Authority (SDA)"
	3505 "Rawalpindi Development Authority (RDA)"
	3506 "Quetta Development Authority (QDA)"
	3507 "Peshawar Development Authority (PDA)"
	3508 "Muzaffarabad Development Authority (MDA)"
	3509 "Multan Development Authority (MDA)"
	3510 "Mirpur Development Authority (MDA)"
	3511 "Mardan Development Authority (MDA)"
	3512 "Mansehra Development Authority (MDA)"
	3513 "Malir Development Authority (MDA)"
	3514 "Lyari Development Authority (LDA)"
	3515 "Larkana Development Authority (LDA)"
	3516 "Lahore Development Authority (LDA)"
	3517 "Karak Development Authority (KDA)"
	3518 "Kaghan Development Authority (KDA)"
	3519 "Hyderabad Development Authority (HDA)"
	3520 "Gwadar Development Authority (GDA)"
	3521 "Gujranwala Development Authority (GDA)"
	3522 "Gilgit Development Authority (GDA)"
	3523 "Galliat Development Authority (GDA)"
	3524 "Fort Munro Development Authority (FMDA)"
	3525 "Faisalabad Development Authority (FDA)"
	3526 "Dera Ismail Khan Development Authority (DIKDA)"
	3527 "D.G Khan Development Authority (DGKDA)"
	3528 "Cholistan Development Authority (CDA)"
	3529 "Balochistan Development Authority (BDA)"
	3530 "Bahawalpur Development Authority (BDA)"
	3531 "Abbottabad Development Authority (ADA)"
	3601 "AMC - Mutual Funds"
	3602 "Insurance"
	3603 "Capital Market"
	3604 "Supervision of Listed Companies"
	3605 "Company Registration / Compliance"
	3606 "e-Services / Technical Issues"
	3607 "SECP related issues"
	3608 "Company Registration"
	3701 "DG MIS / FABS"
	3702 "DBA Pak PWD"
	3703 "CAO GSP Quetta"
	3704 "DAPPOD"
	3705 "DG Accounts Works Lahore"
	3706 "CAO Pak Mint"
	3707 "CAO MOFA"
	3708 "Accountant General Pakistan Revenue (AGPR)"
	3709 "Accountant General, AJK"
	3710 "Accountant General, Khyber Pakhtunkhwa"
	3711 "Accountant General, Punjab"
	3712 "Accountant General, Balochistan"
	3713 "Accountant General, Sindh"
	3714 "Accountant General, Gilgit & Baltistan"
	3801 "General Matters"
	3802 "Application Process"
	3803 "Issuance of License"
	3901 "LLB Scholarships"
	3902 "phD Scholarship"
	3903 "Postgraduate Scholarships"
	3904 "Graduate Scholarship"
	3905 "Undergraduate Scholarship"
	3906 "Intermediate Scholarship"
	3907 "Fellowship Scholarship"
	3908 "Masters / MS Scholarships"
	3909 "Middle Scholarships"
	3910 "Primary Scholarships"
	3911 "CMMS Scholarships"
	3912 "DFID Scholarship"
	3913 "Rehmatul-lil-Alameen Scholarships"
	3914 "Turkey Scholarship"
	3915 "German Academic Exchange Service"
	3916 "HEC Scholarships"
	3917 "Ehsaas Program Scholarships"
	;
	#delimit cr

// Step 3: Encode categorical variable as numeric variable
	encode level_two , generate(level_two_temp) label(level2) noextend
	order level_two_temp , after(level_two)
	drop level_two
	rename level_two_temp level_two
	
// Step 4: Rename variable
	* not applicable to this variabl

// Step 5: Define variable label and note
	label variable level_two "Complaint category: second level"
	notes level_two: Second level of the complaint category selected by the citizen. Value labels were assigned according to the order appeared in PCP App on 7/19/2022.  The last two digits are the sequence of second-level categories in the corresponding first-level category, which is represented by the first one or two digit(s). Values < 100 are assigned for second-level catogeries appearing in more than one first-level categories.
	notes level_two: Note: "Citizen Participatory Audit" under the first level category "Auditor General of Pakistan (AGP)" appears in the 2021 portal dataset but not in PCP App. Value 3105 was assigned.
	
	
*** variable: category ***

// Step 1: Recode values
	replace category = "Ill-treatment with students" if category == "Ill-treatment with Students"
	replace category = "Private Housing Societies" if category == "Private Housing Socities"
	replace category = "Illegal Housing Societies" if category == "Illegal Housing Socities"
	
// Step 2: Define value label
	#delimit;
	label define level3
	1 "General Complaint"
	2 "General Complaints"
	3 "Administration"
	4 "Billing Issues"
	5 "Child Pornography"
	6 "Electricity Theft"
	7 "Encroachment"
	8 "Fee / Dues"
	9 "Harassment"
	10 "Human Resource"
	11 "IPTV"
	12 "Lack of Facilities"
	13 "Misc. Matters"
	14 "Missing Documents"
	15 "Permanent Encroachment"
	16 "Recruitment"
	17 "Registration"
	18 "Registration Issues"
	19 "Sanitation"
	20 "Temporary Encroachment"
	21 "Verification Issues"
	1001 "Fake Doctor"
	1002 "Illegal Doctor Practice"
	1003 "Illegal Private Clinic"
	1004 "Fake Medicines"
	1005 "Illegal Medicines"
	1006 "Expired Medicines"
	1007 "Unlicensed Medical Premises"
	1008 "Provision of Primary Health Unit / BHU"
	1009 "Non-operational BHU"
	1010 "Doctor / Staff Absentees"
	1011 "Lack of Medicines"
	1012 "Lack of Equipments"
	1013 "Ill-treatment with patients"
	1014 "Provision of Doctors / Staff"
	1015 "Lack of Service"
	1016 "Lack of Doctors / Staff"
	1017 "Regulations"
	2001 "Illegal School"
	2002 "Teachers Wages"
	2003 "Ill-treatment with students"
	2004 "Renovation of Schools"
	2005 "Quality of Education "
	2006 "Unregistered Schools"
	2007 "Non-Availability of Teachers"
	2008 "Non-Availability of Facilities"
	2009 "Teacher absentees"
	2010 "Miss-use of school building / facilities"
	2011 "Staff Performance"
	2012 "Staff Involvement in Illegal Activities"
	2013 "Examinations & Results"
	2014 "Admission & Enrolment"
	2015 "Transfer / Posting / Promotions"
	2016 "Damaged School"
	2017 "Closed School"
	2018 "Ghost School"
	2019 "Need for School"
	2020 "School Security"
	2021 "PTC Funds"
	2022 "Admission / Enrolment"
	2023 "False or misleading information"
	2024 "Gender, Race, Cast Discrimination"
	2025 "Unfair Results"
	2026 "Scholarships"
	2027 "Administrative Issues"
	2028 "Lack of Staff / Lecturers"
	2029 "Renovation of Colleges"
	2030 "University Recognition"
	2031 "Illegal University"
	2032 "University Administration"
	2033 "Admissions / Enrolment"
	2034 "Examinations / Results"
	2035 "Lack of Faculty"
	2036 "University Regulations"
	2037 "Hostels"
	2038 "Sports"
	2039 "Degree Verification"
	2040 "Degree Attestation"
	2041 "Equivalency Certificate"
	2042 "Quality Assurance"
	2043 "Renovation of University"
	2044 "Misuse of School Building / Facilities"
	3001 "Non collection of waste"
	3002 "Provision of waste bins"
	3003 "Blocked Drains"
	3004 "Sewerage Overflow"
	3005 "Sewerage Blockade"
	3006 "Sewerage Leakage"
	3007 "Private Property Encroachment"
	3008 "New water connection"
	3009 "Delay in water connection"
	3010 "Billing Complaint"
	3011 "Demand for Water Supply Scheme"
	3012 "Damaged Water Supply Scheme"
	3013 "Broken Pipelines"
	3014 "Shortage of Water Supply"
	3015 "Provision of Street Lights"
	3016 "Faulty Street Lights"
	3017 "Minor M&R of Street"
	3018 "Major M&R of Street"
	3019 "Over Pricing"
	3020 "No Price List"
	3021 "Delivery Service"
	3022 "Cleanliness"
	3023 "Land Issues"
	3024 "Low Quality Food"
	3025 "Illegal Food Factory"
	3026 "Unhygienic Environment"
	3027 "Illegal Parking"
	3028 "Illegal Bus Stand"
	3029 "Provision of Water"
	3030 "Provision of Toilets"
	3031 "Provision of Waiting Area"
	3032 "High Fares"
	3033 "High Parking Fee"
	3034 "Overloading Passengers"
	3035 "Illegal Wall"
	3036 "Illegal Gate / Door"
	3037 "Illegal Building"
	3038 "Dogs"
	3039 "Pigs"
	3040 "Other animals"
	3041 "Main Road"
	3042 "Sub-road / street"
	3043 "Illegal Size"
	3044 "Illegal Location"
	3045 "Risky Billboard"
	3046 "Within street / mohala"
	3047 "High tension wires"
	4001 "Mutation"
	4002 "Attestation"
	4003 "Possession of Land"
	4004 "Ownership Documents"
	4005 "Illegal Transfer of Land"
	6001 "Absenteeism"
	6002 "Non-Serious Attitude Towards Work"
	6003 "Red Tapism"
	6004 "Physical Sexual Harassment"
	6005 "Mental Harassment"
	6006 "Threatening"
	6007 "Blackmailing"
	6008 "Discrimination on Any Basis"
	6009 "Fake Degrees / Documents / Credentials"
	6010 "Impersonation"
	6011 "Favoritism"
	6012 "Unauthorized Privileges"
	6013 "Any Other Irregularity"
	6014 "In Allotment of Plots, Flats, Residence etc"
	6015 "In Recruitment Process"
	6016 "In Procurement Process"
	6017 "Corruption / Misappropriation in Govt. Funds"
	6018 "Bribery"
	6019 "Kickbacks / Commissions"
	6020 "Patwari"
	6021 "Girdawer"
	6022 "Tehsildar"
	6023 "District Revenue Officer"
	7001 "Harsh behaviour with inmates"
	7002 "Loss / damage to inmate goods"
	7003 "Non-disclosure of remission details"
	7004 "Women inmates issues"
	7005 "Juvenile inmates issues"
	7006 "Illegal Activities"
	7007 "Non-cooperation"
	7008 "No traffic warden"
	7009 "Traffic Jam"
	7010 "Faulty Traffic Lights"
	7011 "Chalan related"
	7012 "Overspeed Chalan"
	7013 "Drug Trafficking"
	7014 "Drug Abuse"
	7015 "Drugs in Schools"
	7016 "Non-registration of FIR"
	7017 "High handedness by Police"
	7018 "Bias Attitude of Police"
	7019 "Delayed response"
	7020 "FIR based on Malafide"
	8001 "Pricing"
	8002 "Quantity Issue"
	8003 "Quality Issue"
	8004 "Dealer Complaints"
	8005 "Logistics Complaints"
	8006 "HR Related Complaints"
	8007 "CSR"
	8008 "Land Management"
	8009 "HSEQ / Environment"
	8010 "Procurement"
	8011 "Production & Exploration"
	8012 "Domestic"
	8013 "Commercial"
	8014 "Industrial"
	8015 "Billing Complaint "
	8016 "Complaints against employees"
	8017 "Excess Billing"
	8018 "Fault on Line"
	8019 "Installation of new connection"
	8020 "Low Voltage"
	8021 "New Connection Delayed Billing"
	8022 "New Transformer Installation"
	8023 "Non Delivery of Bill"
	8024 "Replacement of Defective Meters"
	8025 "Tripping"
	8026 "Unscheduled Load Shedding"
	8027 "Violation of Load Management Schedule"
	8028 "Violation of Emergency Conservation Measures"
	9001 "Non-Registration of Crop"
	9002 "Non-Provision of Claim"
	9003 "Staff Behavior"
	9004 "Registration Issue"
	9005 "Loan Delay"
	9006 "Unnecessary Codal Formalities"
	9007 "Subsidy on Implements"
	9008 "Solar Tubewells"
	9009 "Quality of Pesticides"
	9010 "Complaint Against Authorized Dealers"
	9011 "Non-Availability / Shortage"
	9012 "Quantity"
	9013 "Over-Pricing"
	9014 "Non-Payment"
	9015 "Delayed Payment"
	9016 "Illegal Deduction / Under-Payment"
	9017 "High Transportation Charges"
	9018 "Price Fixation"
	9019 "Quality of Fertilizer"
	9020 "Non Provision of Subsidy"
	9021 "Quality of Seeds"
	9022 "Water-Theft / Unathorized Outlets"
	9023 "Water-Shortage / Flow"
	9024 "Subsidy on Land Levelling"
	9025 "Water-Course Improvement / Lining"
	9026 "Provision of Machinery"
	9027 "Construction of Protective Walls"
	9028 "Low Quality of Protective Walls"
	10001 "Industrial Pollution"
	10002 "Forest Cutting"
	10003 "10 Billion Tree Tsunami"
	10004 "Billion Tree Tsunami"
	10005 "Hospital Waste"
	10006 "Industrial Waste"
	11001 "Licenses"
	11002 "Lease of Fishing Right"
	11003 "Stock Replenishment in Public Waters"
	11004 "Conservation of Fish Species"
	11005 "Protection against Electric Fishing"
	11006 "Protection against Explosives and Poisons"
	11007 "Non-Vaccination"
	11008 "Diseases"
	11009 "Fascilities in Vetrinary Hospital"
	11010 "Licenses / Registration"
	12001 "Rashan"
	12002 "Return of IDPs"
	12003 "Rehabilitation"
	12004 "Facilities in Camps"
	12005 "Delay in Compensation"
	12006 "Rashan Issues / Misappropriation"
	12007 "Demand for Compensation"
	12008 "Denial of Compensation"
	12009 "Floods"
	12010 "Earthquake"
	13001 "Delay in execution"
	13002 "Irregularities"
	13003 "Substandard Material"
	13004 "Delay in Completion"
	13005 "Slow Progress"
	13006 "Delays in Fund Release"
	13007 "Non Clearance of Liabilities"
	13008 "Non Issuance of NOC"
	14001 "Motor Vehicle Taxes"
	14002 "Vehicle Registration"
	14003 "Duplicate Documents"
	14004 "Provincial Excise / Duty"
	14005 "Urban Immovable Property Tax"
	14006 "Hotel Tax"
	14007 "Professional Tax"
	14008 "Services Tax"
	14009 "Other Taxes"
	14010 "Corruption"
	14011 "Vehicle Transfer"
	15001 "Certificates"
	15002 "Transfer of Vehicle"
	15003 "Token Payment"
	15004 "Process Delay"
	15005 "Registration of Vehicle"
	15006 "Duplicate / Missing Documents"
	15007 "Renewal"
	15008 "Provision of NOC"
	15009 "Marriage Certificate"
	15010 "Death Certificate"
	15011 "Non Issuance of Death Certificate"
	15012 "Birth Certificate"
	15013 "Non Issuance of Birth Certificate"
	15014 "Correction of Birth Certificate"
	15015 "New Domicile"
	15016 "Replacement of Domicile"
	15017 "Divorce Registration"
	15018 "Vehicle Fitness Certificate"
	15019 "New Route Permit"
	15020 "Renewal of Route Permit"
	15021 "New Medical Store License"
	15022 "Renewal of Medical Store License"
	15023 "New Fishing License"
	15024 "Renewal of Fishing License"
	15025 "New Arm License"
	15026 "Renewal of Arm License"
	15027 "New Driving License"
	15028 "Renewal of Driving License"
	16001 "Clearance Issues"
	16002 "Phone Dead"
	16003 "Noice in Phone"
	16004 "Ringing Issue"
	16005 "Cross Talk Issue"
	16006 "Outgoing Call Issue"
	16007 "Call Drop Issue"
	16008 "No Browsing"
	16009 "Slow Browsing"
	16010 "Landline"
	16011 "Broadband"
	16012 "3G EVO"
	16013 "V Fone"
	16014 "Charji"
	16015 "Service Quality"
	16016 "Billing Issue"
	16017 "3G/4G/LTE Related Issues"
	16018 "Account Related Issues"
	16019 "Application Rejected"
	16020 "Billing related issue (Overcharging/Tariff/etc.)"
	16021 "Biometric Verification (BVS) related issues"
	16022 "BISP Related Complaint"
	16023 "Change of package Without User Consent"
	16024 "Custom Duties & PSID Not Generated"
	16025 "Fault Disruption in Smart TV / IPTV"
	16026 "Fault / Disruption in Broadband"
	16027 "Fault / Disruption in Telephone"
	16028 "Fraudulent Call(s) / SMS(s)"
	16029 "Illegal Blocking of number / SIM"
	16030 "Illegal Change of Network"
	16031 "Illegal Issuance of duplicate SIM"
	16032 "Illegal transfer of Connection / Ownership"
	16033 "Illegal use of CNIC"
	16034 "IMEI Registered But No Service"
	16035 "International Roaming Related Issue"
	16036 "Internet Content-Anti-State"
	16037 "Internet Content - Blasphemous"
	16038 "Internet Content - Miscellaneous Issues"
	16039 "Internet Content - Pornography / Child Abuse"
	16040 "Internet Content - Sectarian"
	16041 "Miscellaneous Issues"
	16042 "Misleading Statement(s)"
	16043 "Misuse of Credentials"
	16044 "MNP Related Issues"
	16045 "Mobile Registration Account Deletion / Creation Issue"
	16046 "Mobile Registration Verification Issue"
	16047 "Non Provision of Service / Coverage Issue"
	16048 "Obnoxious Call(s) / SMS(s)"
	16049 "Obnoxious Call(s) / SMS(s) After First Warning"
	16050 "One Slot Compliant / One Non-Compliant"
	16051 "Payment Issues Against Deleted PSID"
	16052 "Poor Helpline / Customer Care Service"
	16053 "Promotional Call(s) / SMS(s) / Spamming by Operator"
	16054 "Provision of Service(s)"
	16055 "Quality of Service"
	16056 "Refund Related Issue"
	16057 "Registration Issues Miscellaneous"
	16058 "Restoration of Suspended Telephone Number (Spamming)"
	16059 "Spamming / Bulk SMS(s)"
	16060 "Unsolicited Call(s) / SMS(s)"
	16061 "Value Added Services / Package Issues(s)"
	16062 "Verification Issue(s)"
	16063 "Withdrawal of Service(s)"
	16064 "Administrative"
	16065 "Behavior of Staff / Officials"
	16066 "Non Availability of Service"
	16067 "Non Delivery of Article / Item"
	16068 "Baggage Services"
	16069 "Ticketing & reservation"
	16070 "Flight Delay / Cancellation"
	16071 "Passengers Mishandling"
	16072 "Ticket Refund"
	16073 "Attitude & Behaviour of Staff"
	16074 "Denied Boarding"
	16075 "Call Center"
	16076 "Maintenance & Repair"
	16077 "Facilities"
	16078 "Toll Plaza"
	16079 "Incorrect Names / Millage Board"
	16080 "Blocked Road"
	16081 "Encroachment on Road"
	16082 "Damaged Road"
	16083 "Ticketing"
	16084 "Schedule"
	16085 "Staff Behaviour"
	16086 "Train Delay"
	16087 "Reservation / Booking"
	16088 "Baggage Services / Losses"
	16089 "Lost Baggage"
	16090 "Airline Related Issues"
	16091 "Lack of Services"
	17001 "Violence at Home / Public Places"
	17002 "Discrimination at Public Places"
	17003 "Violation regarding Provision of Job"
	17004 "Attach on HR Defenders"
	17005 "Killing of HR Defenders"
	17006 "Threats of HR Defenders"
	17007 "Unable to Function Properly"
	17008 "Physical / Psychological Torture in Police Custody"
	17009 "Physical / Psychological Torture in Prisons"
	17010 "Physical / Psychological Torture in Schools / Madrassas"
	17011 "Kidnapping"
	17012 "Kidnapping for Ransom"
	17013 "Murder"
	17014 "Custodual Death"
	17015 "Extra Judicial Killings"
	17016 "Target Killing"
	17017 "Allegation of Blasphemy"
	17018 "Attack on Worship Places"
	17019 "Burning of Houses"
	17020 "Forced Conversion"
	17021 "Murder / Killing"
	17022 "Denial / Lack of Worship Places"
	17023 "Hurdles in Reiligious Obligations"
	17024 "Discrimination in Social Inclusion"
	17025 "Corporal Punishment at School"
	17026 "Mosque / Madrassas"
	17027 "Rape"
	17028 "Gang Rape"
	17029 "Custodial Rape"
	17030 "Sexual Comments"
	17031 "Offensive Gestures / Staring"
	17032 "Intimidation"
	17033 "Request for Sexual Favor"
	17034 "Sexually Demeaning Attitude"
	17035 "Physical Violence"
	17036 "Secual Violence"
	17037 "Forced Marriage"
	17038 "Wani / Sawara"
	17039 "Marriage with Holy Quran"
	17040 "Karo Kari / Honor Killing"
	17041 "Dowry Related Violence"
	17042 "Trafficking of Women for Prostitution"
	17043 "Acid Attack"
	17044 "Amputation"
	17045 "Beating"
	17046 "Setting on Fire"
	17047 "Stove Burning"
	17048 "Revenue"
	17049 "Agriculture"
	17050 "Livestock & Dairy"
	17051 "Food"
	17052 "Forests & Wildlife"
	17053 "Health"
	17054 "Primary Education"
	17055 "Secondary Education"
	17056 "Higher Education"
	17057 "Home"
	17058 "Housing & Urban Planning"
	17059 "Industries & Commerce"
	17060 "Labour"
	17061 "Local Government"
	17062 "Power/ Electricity"
	17063 "Irrigation"
	17064 "Rural Water Supply"
	17065 "Science & Technology"
	17066 "Social Security"
	17067 "Technical Education"
	17068 "Town & Country Planning"
	17069 "Transport"
	17070 "Grievances & Pensions"
	17071 "Unfair Trade"
	17072 "Fraud"
	17073 "Services"
	17074 "Products"
	17075 "Denial of Rights"
	17076 "Report Sexual Harassment"
	17077 "Report Gender Discrimination"
	17078 "Report Child Abuse"
	17079 "Secual Abuse"
	17080 "Child Marriage"
	17081 "Child Prostitution"
	17082 "Child Trafficking"
	17083 "Child Neglect"
	17084 "Report Missing Person"
	18001 "Customer Services"
	18002 "Digitization Or Branch Network"
	18003 "Features Of National Saving Schemes"
	18004 "Investment Issues"
	18005 "Foreign Investment (FDI)"
	18006 "Work Visa"
	18007 "Branch / Liaison Office"
	18008 "Ease of Doing Business (EoDB)"
	18009 "Special Economic Zone (SEZ)"
	18010 "Banks related issues"
	19001 "Social Media"
	19002 "Electronic Media / PEMRA"
	19003 "Drama"
	19004 "Game Shows"
	19005 "Talk Shows"
	19006 "News Content"
	19007 "Anti Judiciary Content"
	19008 "Anti National Security"
	19009 "Blasphemy"
	19010 "Vulgarity / Obscenity"
	19011 "Indian Content"
	19012 "Crime Shows"
	19013 "Morning Shows"
	19014 "Complaint against Cable Operators"
	19015 "FM Radios"
	19016 "DTH"
	19017 "Licensing"
	19018 "Print Media"
	20001 "Correction of Parent(s) Name"
	20002 "Correction of Self Name"
	20003 "Correction of Gender"
	20004 "Correction of Spelling of Name"
	20005 "Updation of Photograph"
	20006 "Updation of Qualification"
	20007 "Updation of Profession"
	20008 "Updation of Finger Impressions"
	20009 "Change of Date of Birth"
	20010 "Change of Name"
	20011 "Correction / Change of Parents Name"
	20012 "Change of Address(s)"
	20013 "Change of Marital Status"
	20014 "Change of Place of Birth"
	20015 "Change of Religion"
	20016 "Change of Gender"
	20017 "Form B"
	20018 "Duplicate Form-B (CRC)"
	20019 "Change in Particulars in Form-B (CRC)"
	20020 "CNIC replacement / renewal"
	20021 "SNIC Renewal"
	20022 "Family Registration"
	20023 "Overseas Pakistani Crad"
	20024 "National Identity Card for Overseas Pakistanis (NICOP)"
	20025 "Pakistan Origin Crad (POC)"
	20026 "Delivery of Overseas Card"
	20027 "Online Application (Pak ID)"
	20028 "Reimbursement of Fee of Online Application"
	20029 "Juvenile Card"
	20030 "Modification in Juvenile Card"
	20031 "Correction in Juvenile Card"
	20032 "Issuance of CNIC"
	20033 "New ID Card Procedure"
	20034 "New ID Card Fees"
	20035 "New ID Card Issuance Time"
	20036 "Attestation Requirement"
	20037 "Blocked CNIC"
	20038 "Due to National Status"
	20039 "Due to Fake Particulars"
	20040 "Change of Verification Board"
	20041 "Change of District Level Committee"
	20042 "Blocked on Court Orders"
	21001 "Delay In Empanelment"
	21002 "Delay In Service Initiation / Contract Agreement"
	21003 "Conduct of HFOs (Behavior / Punctuality / Training)"
	21004 "Conduct of DMOs"
	21005 "Rate Issues"
	21006 "Procedural Lacunas"
	21007 "Payment Issues"
	21008 "Refusal Of Treatment / Services"
	21009 "Treatment Cost Details / Information"
	21010 "Lack Of Facilities"
	21011 "Behaviour of Staff"
	21012 "Cleanliness of the Fascility"
	21013 "Access to Fascilitation Desk / HFOs"
	21014 "Conduct of Facilitation Officers / HFOs (Behavior / Punctuality / Training)"
	21015 "Treatment Abuses"
	21016 "Lack of Empaneled Hospitals in the Area"
	21017 "Uncovered Procedures / Diseases"
	21018 "Lack of Awareness about Programe"
	23001 "Card not Received"
	23002 "Transportation Charges Dispute"
	23003 "Eligibility of Coverage"
	23004 "Misc. Charges not Paid"
	23005 "Disciplinary Proceedings"
	23006 "Hiring / Termination Matters"
	23007 "Medical Benefits"
	23008 "Pension / Gratuity Matters"
	23009 "Misselling orWrongful Selling"
	23010 "Cancellation of Policies (Banca)"
	23011 "Misappropriation / Deflacations of Premiums"
	23012 "Delays in Claims Settlements"
	23013 "Delays in Surrender"
	23014 "Dispute in Surrender Value"
	23015 "Delays in Cancellation of Policies"
	23016 "Delays in Premium Adjustment"
	23017 "Non Receipt of Premium Notices"
	23018 "Non Receipt of Bonus Certificates"
	23019 "Non Receipt of Policy Documents"
	23020 "Poor Services / Misconduct"
	23021 "Non Availability of Digital Services"
	24001 "Mobile Phone Duty Issues"
	24002 "Airport Clearance Issues"
	24003 "Car Duty Issues"
	24004 "Used Car Duty Issues"
	24005 "Online Import Issues"
	24006 "Concessionary Import of Used Cars for Disable Persons"
	24007 "Add IBAN"
	24008 "Calculation"
	24009 "CPR not visible in Sale Tax return"
	24010 "Null Return"
	24011 "Problem in Return Submission"
	24012 "Provincial services entry"
	24013 "Purchase Invoice Feeding"
	24014 "Sale Tax ATL"
	24015 "Sale Tax Refund"
	24016 "Sale Tax Revision"
	24017 "Sales Tax Exemption"
	24018 "Sales Tax Penalty Payment"
	24019 "Suspended/ Blacklisted taxpayer"
	24020 "Suspended / Non Active in Sale Tax"
	24021 "Non Mentioning of STRN & NTN on Invoices"
	24022 "Sales Tax Registration Issues"
	24023 "Calculation error"
	24024 "Change Accounting Period"
	24025 "Change email and cell in profile"
	24026 "Change Jurisdiction"
	24027 "Correction in Income Tax CPR"
	24028 "Correction of Name (AOP)"
	24029 "Correction of Name (Company)"
	24030 "Correction of Name (Individual)"
	24031 "CPR not visible in Payments Section"
	24032 "Extension in Return Filing"
	24033 "Foreigner's Registration/Enrollment"
	24034 "Income Tax Return Revision"
	24035 "Income Tax Withholding Statemnent Annual u/s 149"
	24036 "Income Tax Withholding Statement Monthly"
	24037 "Law-related question"
	24038 "Name not in ATL"
	24039 "Non Resident's Return Filing"
	24040 "Refund Application / Procedure"
	24041 "Revision of Statement of Final Taxation"
	24042 "Revision of Wealth Statement"
	24043 "Senior Citizen Crediit"
	24044 "Statement of Final Taxation"
	24045 "Filing of Returns"
	24046 "Update DOB"
	24047 "Benami Accounts"
	24048 "Benami Complaints"
	25001 "Payment Related Issue"
	25002 "HRM Related Issue"
	25003 "Embezzlement / Corruption / Deductions"
	25004 "Partner-Banks Related Issue"
	25005 "Administration Related Issue"
	25006 "Procurement Related Issue"
	25007 "NSER Related Issue"
	26001 "CWA, Embassy of Pakistan Riyadh-I, KSA"
	26002 "CWA, Embassy of Pakistan Riyadh-II, KSA"
	26003 "CWA, Consulate General of Pakistan Jeddah-I, KSA"
	26004 "CWA, Consulate General of Pakistan Jeddah-II, KSA"
	26005 "CWA, Consulate General of Pakistan Dubai-I, UAE"
	26006 "CWA, Consulate General of Pakistan Dubai-II, UAE"
	26007 "CWA, Embassy of Pakistan Abu Dhabi, UAE"
	26008 "CWA, Embassy of Pakistan Kuwait"
	26009 "CWA, Embassy of Pakistan Muscat, Oman"
	26010 "CWA, Embassy of Pakistan Doha, Qatar"
	26011 "CWA, Embassy of Pakistan Manama, Bahrain"
	26012 "CWA, Embassy of Pakistan Baghdad, Iraq"
	26013 "CWA, Embassy of Pakistan Seoul, South Korea"
	26014 "CWA, Consulate General of Pakistan New York, USA"
	26015 "CWA, Consulate General of Pakistan Manchester, UK"
	26016 "CWA, Consulate General of Pakistan Milan, Italy"
	26017 "CWA, Consulate General of Pakistan Barcelona, Spain"
	26018 "CWA, Embassy of Pakistan Athens, Greece"
	26019 "CWA, Consulate General of Pakistan Malaysia"
	26020 "Complaint Regarding Training for the Awareness of Workers"
	26021 "Complaint Regarding Registration of Trade Unions"
	26022 "Complaint Regarding Determination of CBA"
	26023 "Complaint Regarding Resolution of Indistrial Disputes"
	26024 "Complaint Regarding Redressal of Individual Grievances"
	26025 "Complaint Regarding Curbing Unfair Labour Practices"
	26026 "WWF Scholarships / Education Facility"
	26027 "WWF Death / Marrage Grants"
	26028 "WWF Housing Schemes"
	26029 "Complaint Regarding Advertised / Demands"
	26030 "Complaint Against Processing / Shortlisting / Interview/ Selection"
	26031 "Job & Visa Related Queries"
	26032 "Pensioner Benefits"
	26033 "Pension Increment"
	26034 "Suggestions for Pension Coverage"
	26035 "Protectors of Emigrants"
	26036 "Recruiting Agencies / Overseas Employment Promoters"
	26037 "Medical Centers / GAMCA"
	26038 "Overseas Employer"
	26039 "Trade Test Centers"
	26040 "Illegal Agents / Sub Agents"
	26041 "Problems in Issuance of Fresh Overseas Employment Promoter Licnese"
	26042 "Illegal Advertisement for Overseas Employment"
	26043 "Problems in Protector Registration"
	26044 "Queries About Protector Registration"
	26045 "Suggestions for Simplification of Protector Registration"
	26046 "Housing"
	26047 "Education"
	26048 "Emergency Relief Cell"
	26049 "Finance"
	26050 "Dues"
	26051 "Financial Aid"
	26052 "Jail"
	26053 "Airport"
	26054 "Repatriation"
	26055 "Visa Cancelation"
	26056 "Membership Card"
	26057 "Foreign Exchange Remittance Card (FERC)"
	26058 "Information Technology"
	26059 "Admin"
	26060 "Research Training & Policy Reform"
	26061 "Transportation of Dead Body"
	26062 "Whereabouts"
	26063 "Passport"
	26064 "OPF Housing Societies"
	26065 "OPF Educational Institutions"
	26066 "Welfare Initiatives of OPF"
	26067 "Document Attestation"
	26068 "Visa / Passport"
	26069 "Child Registration"
	26070 "Emergency Travel"
	26071 "Lack of Support"
	26072 "Prisoners"
	27001 "Cleanliness | Blocked Drains"
	27002 "Cleanliness | General Complaint"
	27003 "Cleanliness | Non Collection of Waste"
	27004 "Cleanliness | Provision of Waste Bins"
	27005 "Cleanliness | Sewerage Blockade"
	27006 "Cleanliness | Sewerage Leakage"
	27007 "Cleanliness | Sewerage Overflow"
	27008 "Constrction Material on Road | General Complaint"
	27009 "Constrction Material on Road | Main Road"
	27010 "Constrction Material on Road | Sub-road / Street"
	27011 "Encroachment | General Complaint"
	27012 "Encroachment | Permanent Encroachment"
	27013 "Encroachment | Private Property Encroachment"
	27014 "Encroachment | Temporary Encroachment"
	27015 "Graveyards | Cleanliness"
	27016 "Graveyards | Encroachment"
	27017 "Graveyards | General Complaint"
	27018 "Graveyards | Land Issues"
	27019 "Illegal Billboards | General Complaint"
	27020 "Illegal Billboards | Illegal Location"
	27021 "Illegal Billboards | Illegal Size"
	27022 "Illegal Billboards | Risky Billboard"
	27023 "Illegal Construction | General Complaint"
	27024 "Illegal Construction | Illegal Building"
	27025 "Illegal Construction | Illegal Gate / Door"
	27026 "Illegal Construction | Illegal Wall"
	27027 "Parking / Adda | General Complaint"
	27028 "Parking / Adda | High Fares"
	27029 "Parking / Adda | High Parking Fee"
	27030 "Parking / Adda | Illegal Bus Stand"
	27031 "Parking / Adda | Illegal Parking"
	27032 "Parking / Adda | Overloading Passengers"
	27033 "Parking / Adda | Provision of Toilets"
	27034 "Parking / Adda | Provision of Waiting Area"
	27035 "Parking / Adda | Provision of Water"
	27036 "Price Control | Delivery Service"
	27037 "Price Control | General Complaint"
	27038 "Price Control | No Price List"
	27039 "Price Control | Over Pricing"
	27040 "Repair of Street | General Complaint"
	27041 "Repair of Street | Major M&R of Street"
	27042 "Repair of Street | Minor M&R of Street"
	27043 "Stray Animals | Dogs"
	27044 "Stray Animals | Other animals"
	27045 "Stray Animals | Pigs"
	27046 "Street Lights | Faulty Street Lights"
	27047 "Street Lights | General Complaint"
	27048 "Street Lights | Provision of Street Lights"
	27049 "Unhygenic Food / Factory | General Complaint"
	27050 "Unhygenic Food / Factory | Illegal Food Factory"
	27051 "Unhygenic Food / Factory | Low Quality Food"
	27052 "Unhygenic Food / Factory | Unhygenic Environment"
	27053 "Water Connection | Billing Complaint"
	27054 "Water Connection | Delay in Water Connection"
	27055 "Water Connection | General Complaint"
	27056 "Water Connection | New Water Connection"
	27057 "Water Supply Scheme | Broken Pipelines"
	27058 "Water Supply Scheme | Damaged Water Supply Scheme"
	27059 "Water Supply Scheme | Demand for Water Supply Scheme"
	27060 "Water Supply Scheme | General Complaint"
	27061 "Water Supply Scheme | Shortage of Water Supply"
	28001 "Land Acquisition Issues"
	28002 "Rehabilitation Benefit Against Land / BUP"
	28003 "Transfer Of Affectees Property"
	28004 "Repair / Maintenance Of Footpaths Of Sectorial Areas"
	28005 "Repair / Maintenance Of Jumps On Roads"
	28006 "Repair / Maintenance Of Streets Of Sectorial Areas"
	28007 "Repair / Maintenance Of Road Drainage Falling In Sectorial Areas"
	28008 "Repair / Maintenance Of Streets Signage Of Sectorial Areas"
	28009 "Non Conforming Use Of Property"
	28010 "Approval Of Residential Building Plans (Sectorial Areas)"
	28011 "Approval Of Commercial Building Plans (Sectorial Areas)"
	28012 "Approval Of Residential Building Plans Of Private Housing Schemes"
	28013 "Approval Of Commercial Building Plans Of Private Housing Schemes"
	28014 "Issuance Of NDC"
	28015 "Transfer Matters Of Commercial Property"
	28016 "Removal Of Illegal Katchi Abbadies"
	28017 "Removal Of Illegal Kiosk / Chapper Hotels"
	28018 "Removal Of Encroachment Of CDA Land"
	28019 "Removal Of Illegal Sand, Crush & Brick Stalls"
	28020 "Removal Of Illegal Fruit & Vegetable Stalls"
	28021 "Repair / Maintenance Of Street Lights"
	28022 "Repair / Maintenance Of Traffic Signals"
	28023 "Blockage Of Sewerage Lines (Sectorial Areas)"
	28024 "Sweeping of Roads / Streets / Open Area"
	28025 "Door to Door Garbage Collection"
	28026 "Transportation of Collected Garbage"
	28027 "Collection Of Garden Waste, Tree Cuttings, Debris"
	28028 "Flowing Of Water Into Streets (Car / Floor Wash)"
	28029 "Removal Of Dead Bodies Of Animals"
	28030 "Elimination Of Stray / Pie Animals"
	29001 "Complaints against FIA Employees"
	29002 "Trafficking in Persons Across Pakistan"
	29003 "Smuggling of Migrants"
	29004 "Extradition"
	29005 "Interpol Notices"
	29006 "Copy Rights"
	29007 "Complaints against Federal Government Public Servants"
	29008 "ICT Cooperative Housing Societies"
	29009 "Oil Theft"
	29010 "Gas Theft"
	29011 "SNGPL"
	29012 "WAPDA"
	29013 "Illegal Currency Exchange"
	29014 "Money Laundering"
	29015 "Illegal Human Organs Transplant"
	29016 "Visa Fraud"
	29017 "ECL"
	29018 "Black List"
	29019 "Cyber Crime"
	29020 "Identity Theft"
	29021 "Cyber Bullying"
	29022 "Cyber Stalking"
	29023 "Digital Piracy"
	29024 "Electronic Terrorism, Vandalism and Extortion"
	29025 "Hacking"
	29026 "Cyber Harassment"
	29027 "Data Theft"
	29028 "DDoS Attack"
	29029 "Cyber Bulling"
	29030 "Cyber Financial Fraud"
	30001 "Pakistani Visa"
	30002 "Pakistani Citizenship"
	30003 "Official Passport"
	30004 "Issuance of Passport"
	31001 "General Grievance"
	31002 "Water and Sanitation"
	31003 "Energy Sector"
	31004 "Infrastructure"
	31005 "Food and Agriculture"
	31006 "Education Sector"
	31007 "Environment"
	31008 "Health Sector"
	31009 "Social Safety Nets"
	31010 "Development Projects"
	31011 "Transportation Sector"
	31012 "Revenue Sector"
	31013 "Others"
	32001 "Over The Counter Issues"
	32002 "Account Maintenance"
	32003 "ATN / Debit Cards"
	32004 "E-Banking"
	32005 "Remittance / Clearing (Inland)"
	32006 "Personal Loan"
	32007 "Other Products & Services"
	32008 "HR Related Issue"
	32009 "Bank Services"
	32010 "Account Operational Issue"
	32011 "Deceased Account Operation"
	32012 "Biometric Verification Issues"
	32013 "Updation of Customer Information"
	32014 "Freezing of Account"
	32015 "Account Statement Issue"
	32016 "Cheque Clearing / Return / Payment  / Book Issue"
	32017 "Fund Transfer Issues"
	32018 "ATM Card Issue"
	32019 "ATM Cyber Crime Issue"
	32020 "ATM Machine Not Operational"
	32021 "ATM Refund Issue"
	32022 "ATM Required"
	32023 "Branch Rental / Agreement Issue"
	32024 "Branch Own Premises Issue"
	32025 "Bid for Construction"
	32026 "Branch Renovation & Additional Work"
	32027 "Bidding Issue"
	32028 "Branch Space / Maintenance Issue"
	32029 "Bidding for Construction Issue"
	32030 "NBP Colony Maintenance Issue"
	32031 "Behavior / Attitude of NBP Staff"
	32032 "Benevolent Fund & Other Department Issues"
	32033 "Branch Timing Issue"
	32034 "Branch Facilities"
	32035 "Call Center Issue"
	32036 "Challan / Tax / Fee Submission Issue"
	32037 "Change of Currency Note / Prize Bond"
	32038 "Collection of Utility Bill"
	32039 "Delay Payment of Salary / Pension from other Dept."
	32040 "Fresh Note Issue"
	32041 "New Account Opening Issue"
	32042 "New Branch Required"
	32043 "Remittance Issue"
	32044 "Customer Data Update / Modification Issue"
	32045 "Deduction of Wealth Tax"
	32046 "Bank Charges Issue"
	32047 "Customer / Counter Service Issue"
	32048 "NBP Mobile App Issue"
	32049 "SMS Alert Issue"
	32050 "Security Issue"
	32051 "Web Base Operation Issue"
	32052 "Online Deposit Issue"
	32053 "Bank to Bank Fund Transfer Issue"
	32054 "NBP Unionpay Debit Card Issue"
	32055 "Bribe Allegation "
	32056 "Corruption Allegation"
	32057 "Fraud Allegation"
	32058 "NBP Fund Management Issue"
	32059 "Pakistan Bano Certificate"
	32060 "National Asset Insurance Share Issue"
	32061 "Behbud Fund Issue"
	32062 "Share Holder Issue"
	32063 "Advance Salary"
	32064 "Business Loan Required"
	32065 "Gold Loan Issue"
	32066 "House Building Loan Required"
	32067 "Installment Issue"
	32068 "Loan Settlement Issue"
	32069 "Student Loan"
	32070 "PMYBL Issues"
	32071 "Loan for Disabled"
	32072 "Interest Free Loan Required"
	32073 "Loan Required"
	32074 "Saiban Loan Issue"
	32075 "Property Mortage Issue"
	32076 "Qarz-e-Hasna"
	32077 "70% Increase in Pension"
	32078 "Contractual Regularization"
	32079 "APA Issue"
	32080 "Deceased Son Quota Issue"
	32081 "End Service Benefits"
	32082 "GBO, CBO, AFO Hiring 2017-18 Issue"
	32083 "Medical Payment Issue"
	32084 "Outsource Issue"
	32085 "Promotion Issue"
	32086 "Reinstate in Service"
	32087 "Transfer Posting Issue"
	32088 "Retired Employee Issue"
	32089 "Payment of Group Insurance"
	32090 "TA DA Issue"
	32091 "Security Guard Issue"
	32092 "Increase in Salary of Janitorial Staff"
	32093 "GHS Availed Employee Issue"
	32094 "Attitude Among NBP Staff"
	32095 "MTO non MTO Issue"
	32096 "Overseas Branches Issue"
	32097 "A/c Opening Issues"
	32098 "Account Blocking"
	32099 "Internet Banking Issues"
	32100 "Biometric Verification"
	32101 "A/c Closure Issues"
	32102 "Remittance Related"
	32103 "Fraud & Forgery"
	32104 "Exchange Rate Disputes"
	32105 "PRC Related"
	32106 "Auto Debit / Deduction Issues"
	32107 "Decument Related Issues"
	32108 "Misbehavior"
	32109 "Miscellaneous"
	32110 "Mis-selling"
	32111 "Policy Renewals Issue"
	32112 "Processing / Cancellations Issues"
	32113 "Return / Claim relates Disputes"
	32114 "Service Charges"
	32115 "Certificate Issues"
	32116 "Delayed Payments"
	32117 "Exchange Rate"
	32118 "Wrong Payment"
	32119 "High Service Charges by the Receiving Banks"
	32120 "Cheque not Cleared / Returned"
	32121 "Clearing Delayed"
	32122 "IBFT Issues"
	32123 "Instrument Misplaced"
	32124 "Account Debited Bill Not Paid"
	32125 "Bill not Accepted by Branch"
	32126 "Bill Paid Twice"
	32127 "Service Disruption"
	32128 "Fake Currency Payment"
	32129 "Fraud and Forgery"
	32130 "Funds Misappropriation / Short Payment"
	32131 "Non - Acceptance of Currency Notes"
	32132 "Service Disruptions"
	32133 "Service Issues - Queue / Notes / PO / DD"
	32134 "Account Opening Disputes"
	32135 "Data / Record Updation Issues"
	32136 "Delivery issues (LOT / Welcome Pack)"
	32137 "Dormant Account Activation Issues"
	32138 "Dormancy Related"
	32139 "Locker Issues"
	32140 "Not Acceptance of Old / Small Denomination Notes"
	32141 "Not delivery of SOA"
	32142 "Profit Disputes"
	32143 "Service Charges Disputes"
	32144 "SMS Alert Related Issues"
	32145 "Tax Deduction"
	32146 "Abnormal Delays in Clearing"
	32147 "RTGS related"
	32148 "Inward Clearing Issue"
	32149 "Outward Clearing Issues"
	32150 "ATM Card Issuance Delays"
	32151 "Delay in Crediting Pension in Account"
	32152 "Life Certificate Related"
	32153 "Biometric / Data Issues"
	32154 "Opening / Delayed Disputes"
	32155 "Pension Transfer Issues"
	32156 "Refuse to Pay Pension"
	32157 "Refusal of Opening of Pension Account"
	32158 "Registration Related Issues"
	32159 "Instruction Processing Issues"
	32160 "Long Queue / Wait Time Issues"
	32161 "Service Disruption / Denies"
	32162 "Wrong Information Provided"
	32163 "Accessibility Issues"
	32164 "Ambiance Related"
	32165 "Complaint Lodgement Issues"
	32166 "Discrimination"
	32167 "Parallel Banking"
	32168 "Senior Citizen Related"
	32169 "Timings Related Issues by Customer"
	32170 "Timings Related Issues by Employee"
	32171 "Zakat / WHT Related Issues"
	32172 "Activation / Deactivation Issues"
	32173 "Retailer / Agent Issues / Vendor Issues"
	32174 "SMS Charges"
	32175 "SMS Related Other Issues - OTC / Pin etc"
	32176 "Utility / Mobile Billing Issues"
	32177 "ATM Cleanliness"
	32178 "ATM Out of Order / Cash"
	32179 "ATM Security Issues"
	32180 "Card Activation / Deactivation Issues"
	32181 "Card Capture"
	32182 "Card not provided / Faulty Cards"
	32183 "Card Skimming"
	32184 "Cash Retraction"
	32185 "Debit Card Renewal Issues"
	32186 "Delivery Issues (ATM / PIN / Welcome Pack)"
	32187 "Fake Currency"
	32188 "ATM Closed /Shutter Down"
	32189 "BISP Issues"
	32190 "Non Availability / Non Functioning of Phone / Hot line"
	32191 "POS - Disputes / Claims / Issues"
	32192 "POS - Merchant Overcharging Issues"
	32193 "Short / Non-Payment of Cash / ATM Disputes"
	32194 "Delay in Amendment in BGs"
	32195 "Guarantee Non-Encashment"
	32196 "Unnecessary Delays in Issuance of BGs"
	32197 "Delivery Issues (Repayment Schedule / Welcome Pack)"
	32198 "eCIB Disputes"
	32199 "Interest Rate Disputes"
	32200 "Loan Processing Issues"
	32201 "Mis-Selling / Mis Commitments"
	32202 "NOC Issues"
	32203 "Payoff Disputes"
	32204 "Recovery Issues"
	32205 "Statement Delivery Issues"
	32206 "Recovery Issues / Harassment"
	32207 "Valuation Related Issues"
	32208 "Additional Documents other than ACD Circular no. 02 of 2010"
	32209 "Age Limit"
	32210 "Collateral / Security Issues"
	32211 "Crop Loan Insurance Scheme (CLIS) Related Issues"
	32212 "Gender Discrimination"
	32213 "Lack of Proper Disclosure"
	32214 "Livestock Insurance Scheme for Borrowers (LISB) Issues"
	32215 "Loan Processing Issues / Turn Around Time (TAT)"
	32216 "Mark Up Rate Disputes"
	32217 "Recovery / Repayment Issues"
	32218 "Auction Issues"
	32219 "Insurance Related Disputes"
	32220 "Repossession Issues"
	32221 "Card Blockage / Faulty Cards"
	32222 "Delivery / Processing / Renewal Issues"
	32223 "Internet Transaction Issues"
	32224 "Miss-Selling of Credit Cards"
	32225 "Reward Point Issues"
	32226 "Service Charges Recovered for Cards which were not Activated"
	33001 "General"
	33002 "No Record Found / Tracking Issues"
	33003 "Representatives are not well known of Youth Loan Scheme"
	33004 "Bank Representatives Asking Security on Tier 1"
	33005 "Bank Only Accepting Commercial Land in Security"
	33006 "Change the Loan Tenure"
	33007 "Increase Personal Contribution Amount"
	33008 "Technical Error / Issue on Form"
	33009 "Bank Recommend Specific Layers For Legal Documentation"
	33010 "How To Apply / Want To Apply"
	33011 "Loan Rejected"
	33012 "Loan Rejected With No Clear Reason"
	33013 "Loan Return In 1 Year"
	33014 "Nadra Verification Issue"
	33015 "SMS Issues"
	33016 "Bribery For Proceeding Loan Applications"
	33017 "Physical Verification Done By Bank But No Further Response"
	33018 "Request To Edit"
	33019 "Status Checking / Bank Not Contacted Yet"
	33020 "No Response After Phone Verification (More Than 1 Month Hold)"
	33021 "Tier 1 Loan Not Been Entertaining"
	33022 "Suggests To Change The Business Type / Category"
	33023 "Unable To Raise Equity Amount"
	33024 "Request For Application Cancel"
	33025 "KJP Dashboard is not Working"
	34001 "NOC"
	35001 "Cat Eyes"
	35002 "Land Sliding"
	35003 "Parking"
	35004 "Rest House"
	35005 "Service Roads"
	35006 "Speed Breakers"
	35007 "Street Lights"
	35008 "Waste Management"
	35009 "Establishment And Litigation"
	35010 "Lease of Land"
	35011 "Illegal Housing Societies"
	35012 "Private Housing Societies"
	35013 "Issuance of Allotment Order"
	35014 "Transfer of Plot / House"
	35015 "Issuance of Possession Letter"
	35016 "Physical Possession Of land / Plot / House"
	35017 "Road Construction"
	35018 "Commercialization"
	35019 "Katchi Abadi"
	35020 "Land Acquisition"
	35021 "NOC (before selling of property)"
	35022 "Completion Certificate (CC) of a NewBuilding"
	35023 "Map Approval"
	35024 "Snow Clearance"
	36001 "Asset Management Company"
	36002 "Housing Finance Company"
	36003 "Investment Advisory Company"
	36004 "Investment Finance Company"
	36005 "Leasing Company"
	36006 "Modaraba Management Company"
	36007 "Non-Bank Micro Finance Company"
	36008 "Private Equity & Venture Capital Company"
	36009 "REIT Management Company"
	36010 "Authorized Surveying Company"
	36011 "Insurance Broker"
	36012 "Life Insurance Company"
	36013 "Non-Life Insurance Company"
	36014 "Re-Insurance Company"
	36015 "Third Party Administrator"
	36016 "Pakistan Stock Exchange (PSX)"
	36017 "Securities Broker"
	36018 "Central Depository Company of Pakistan Limited (CDC)"
	36019 "National Clearing Company of Pakistan Limited (NCCPL)"
	36020 "Pakistan Mercantile Exchange (PMEX)"
	36021 "Commodities Broker"
	36022 "Share Registrar"
	36023 "Debt Security Trustee"
	36024 "Underwriter"
	36025 "SECP related issues"
	36026 "New Company Registration"
	36027 "Changes in Company Registration"
	36028 "Dissolution of Company"
	37001 "Pay & Allowances"
	37002 "G.P Fund"
	37003 "Pension"
	37004 "Pre-Audit"
	37005 "Contingencies & Payments"
	37006 "Account Matters"
	37007 "Loans & Advances"
	37008 "Budget Matters"
	38001 "Submission of Application"
	38002 "Application Review"
	38003 "Zone Developer"
	38004 "Zone Enterprise"
	38005 "General Services"
	39001 "Eligibility Criteria"
	39002 "Application Process/ Procedure"
	39003 "Mode Of Payment"
	39004 "Award / Distribution"
	39005 "Delay In Payments"
	39006 "Attitude Of Dealing Staff"
	39007 "Merit Violation"
	;
	#delimit cr
	
// Step 3: Encode categorical variable as numeric variable
	encode category , generate(category_temp) label(level3) noextend
	order category_temp , after(category)
	drop category
	rename category_temp category
	
// Step 4: Rename variable
	rename category level_three

// Step 5: Define variable label and note
	label variable level_three "Complaint category: third level"
	notes level_three: Third level of the complaint category selected by the citizen. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. The last three digits are the sequence of third-level categories in the corresponding second-level category, which is represented by the first one or two digit(s). Values < 1000 are assigned for third-level catogeries appearing in more than one second-level categories.
	
	
*** variable: complaint_province ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define province
	1 "Khyber Pakhtunkhwa"
	2 "Punjab"
	3 "Sindh"
	4 "Balochistan"
	5 "Federal Govt"
	6 "Gilgit-Baltistan"
	7 "Azad Jammu and Kashmir"
	;
	#delimit cr
	
// Step 3: Encode categorical variable as numeric variable
	encode complaint_province , generate(complaint_province_temp) label(province) noextend
	order complaint_province_temp , after(complaint_province)
	drop complaint_province
	rename complaint_province_temp complaint_province
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable complaint_province "Complaint province"
	notes complaint_province: Province corresponding to the complaint. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: complaint_district ***
	
// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define district
	101 "Abbottabad"
	102 "Bajaur"
	103 "Bannu"
	104 "Battagram"
	105 "Buner"
	106 "Charsadda"
	107 "Chitral"
	108 "Dera Ismail Khan"
	109 "Dir"
	110 "Hangu"
	111 "Haripur"
	112 "Karak"
	113 "Khyber"
	114 "Kohat"
	115 "Kohistan"
	116 "Kolai Pallas"
	117 "Kurram"
	118 "Lakki Marwat"
	119 "Malakand"
	120 "Mansehra"
	121 "Mardan"
	122 "Mohmand"
	123 "North Waziristan"
	124 "Nowshera"
	125 "Orakzai"
	126 "Peshawar"
	127 "Shangla"
	128 "South Waziristan"
	129 "Swabi"
	130 "Swat"
	131 "Tank"
	132 "Tor Ghar"
	201 "Attock"
	202 "Bahawalnagar"
	203 "Bahawalpur"
	204 "Bhakkar"
	205 "Chakwal"
	206 "Chiniot"
	207 "Dera Ghazi Khan"
	208 "Faisalabad"
	209 "Gujranwala"
	210 "Gujrat"
	211 "Hafizabad"
	212 "Jhang"
	213 "Jhelum"
	214 "Kasur"
	215 "Khanewal"
	216 "Khushab"
	217 "Lahore"
	218 "Layyah"
	219 "Lodhran"
	220 "Mandi Bahauddin"
	221 "Mianwali"
	222 "Multan"
	223 "Muzaffargarh"
	224 "Nankana Sahib"
	225 "Narowal"
	226 "Okara"
	227 "Pakpattan"
	228 "Rahim Yar Khan"
	229 "Rajanpur"
	230 "Rawalpindi"
	231 "Sahiwal"
	232 "Sargodha"
	233 "Sheikhupura"
	234 "Sialkot"
	235 "Toba Tek Singh"
	236 "Vehari"
	301 "Badin"
	302 "Dadu"
	303 "Ghotki"
	304 "Hyderabad"
	305 "Jacobabad"
	306 "Jamshoro"
	307 "Karachi"
	308 "Kashmore"
	309 "Keamari"
	310 "Khairpur"
	311 "Korangi"
	312 "Larkana"
	313 "Malir"
	314 "Matiari"
	315 "Mirpur Khas"
	316 "Naushahro Feroze"
	317 "Qambar Shahdadkot"
	318 "Sanghar"
	319 "Shaheed Benazir Abad"
	320 "Shikarpur"
	321 "Suhawal"
	322 "Sukkur"
	323 "Tando Allahyar"
	324 "Tando Muhammad Khan"
	325 "Tharparkar"
	326 "Thatta"
	327 "Umerkot"
	401 "Awaran"
	402 "Barkhan"
	403 "Chagai"
	404 "Chaghi"
	405 "Chaman"
	406 "Dera Bugti"
	407 "Duki"
	408 "Gwadar"
	409 "Harnai"
	410 "Jafarabad"
	411 "Jhal Magsi"
	412 "Kachhi"
	413 "Kalat"
	414 "Kech"
	415 "Kharan"
	416 "Khuzdar"
	417 "Killa Abdullah"
	418 "Killa Saifullah"
	419 "Kohlu"
	420 "Lasbela"
	421 "Lehri"
	422 "Loralai"
	423 "Mastung"
	424 "Musakhel"
	425 "Nasirabad"
	426 "Nushki"
	427 "Panjgur"
	428 "Pishin"
	429 "Quetta"
	430 "Sherani"
	431 "Sibi"
	432 "Sikandarabad"
	433 "Sohbatpur"
	434 "Washuk"
	435 "Zhob"
	436 "Ziarat"
	501 "Islamabad ICT"
	601 "Astore"
	602 "Diamer"
	603 "Ghanche"
	604 "Ghizer"
	605 "Gilgit"
	606 "Hunza"
	607 "Kharmang"
	608 "Nagar"
	609 "Shigar"
	610 "Skardu"
	701 "Bagh"
	702 "Bhimber"
	703 "Haveli"
	704 "Jhelum valley"
	705 "Kotli"
	706 "Mirpur"
	707 "Muzaffarabad"
	708 "Neelum"
	709 "Poonch"
	710 "Sudhnati"
	;
	#delimit cr
	
// Step 3: Encode categorical variable as numeric variable
	encode complaint_district , generate(complaint_district_temp) label(district) noextend
	order complaint_district_temp , after(complaint_district)
	drop complaint_district
	rename complaint_district_temp complaint_district
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable complaint_district "Complaint district"
	notes complaint_district: District corresponding to the complaint. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. The last two digits are the sequence of districts in the corresponding province, which is represented by the first one or two digit(s). 
	notes complaint_district: Note: 1. "Karachi South", "Karachi Central", "Karachi East", "Karachi West" are grouped into "Karachi". 
	notes complaint_district: 2. "Chtiral Lower" and "Chitral Upper" are grouped into "Chtiral".
	notes complaint_district: 3. "Dir Lower" and "Dir Upper" are grouped into "Dir".
	notes complaint_district: 4. "Kohistan Lower" and "Kohistan Upper" are gruoped into "Kohistan".
	
	
*** variable: complaint_tehsil ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable complaint_tehsil "Complaint tehsil"
	notes complaint_tehsil: Tehsil corresponding to the complaint
	
	
*** variable: hide_identity ***

// Step 1: Recode values
	* not applicable to this variables
	
// Step 2: Define value label
	label define yesno 0 "No" 1 "Yes"
	label values hide_identity yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable hide_identity "Hide identity"
	notes hide_identity: Option of hiding identity or not selected by the citizen
	
	
*** variable: status_id ***

// Step 1: Recode values
	recode status_id (2=1)(1=0)

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values status_id yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable status_id "Identity status"
	notes status_id: It looks like this variable is whether the identity of the citizen is completed or not	
	

*** variable: last_remarks_date ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_remarks_date "Last remark date"
	notes last_remarks_date: Date when the last remark was given
	
	
*** variable: last_remarks_time ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_remarks_time "Last remark time"
	notes last_remarks_time: Time when the last remark was given
	

*** variable: resolution_status ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define res_sta
	0 "Relief cannot be granted"
	1 "Partial relief granted"
	2 "Relief granted"
	;
	#delimit cr

// Step 3: Encode categorical variable as numeric variable
	encode resolution_status , generate(resolution_status_temp) label(res_sta) noextend
	order resolution_status_temp , after(resolution_status)
	drop resolution_status
	rename resolution_status_temp resolution_status
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable resolution_status "Resolution status"
	notes resolution_status: Resolution status determined by last_user
	

*** variable: last_remarks ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_remarks "Last remarks"
	notes last_remarks: Last remarks given by last_user

	
*** variable: last_user ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_user "Last user"
	notes last_user: The responsible bureaucrat who gave the last remark
	
	
*** variable: department ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	rename department last_user_dep

// Step 5: Define variable label and note
	label variable last_user_dep "Last user's department"
	notes last_user_dep: The department which the responsible bureaucrat who gave the last remark belonged to

	
*** variable: government ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define gov
	1 "Government of Khyber Pakhtunkhwa"
	2 "Government of Punjab"
	3 "Government of Sindh"
	4 "Government of Balochistan"
	5 "Islamabad Capital Territory"
	6 "Government of Gilgit-Baltistan"
	7 "Government of Azad Jammu and Kashmir"
	8 "Federal Government of Pakistan"
	;
	#delimit cr

// Step 3: Encode categorical variable as numeric variable
	encode government , generate(government_temp) label(gov) noextend
	order government_temp , after(government)
	drop government
	rename government_temp government
	
// Step 4: Rename variable
	rename government last_user_gov

// Step 5: Define variable label and note
	label variable last_user_gov "Last user's government"
	notes last_user_gov: The government which the responsible bureaucrat who gave the last remark belonged to
	
	
*** variable: deparment_province ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* value label "province" was already defined for variable complaint_province
	
// Step 3: Encode categorical variable as numeric variable
	encode deparment_province , generate(deparment_province_temp) label(province) noextend
	order deparment_province_temp , after(deparment_province)
	drop deparment_province
	rename deparment_province_temp deparment_province
	
// Step 4: Rename variable
	rename deparment_province last_user_pro

// Step 5: Define variable label and note
	label variable last_user_pro "Last user's province"
	notes last_user_pro: The province which the responsible bureaucrat who gave the last remark belonged to. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: oversea ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define oversea
	0 "Inland citizen"
	1 "Overseas Pakistani"
	2 "Foreigner"
	;
	#delimit cr
	
	label values oversea oversea
	
// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable oversea "Citizen overseas"
	notes oversea: If the citizen is overseas
	

*** variable: profession ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define prof
	1 "Armed Forces"
	2 "Civil Service"
	3 "Corporate Sector"
	4 "Doctor / Medical Worker"
	5 "Engineer"
	6 "Journalisim"
	7 "Lawyer"
	8 "NGO Worker"
	9 "Political Worker"
	10 "Private Business"
	11 "Senior Citizen / Retired"
	12 "Social Worker"
	13 "Student"
	14 "Teacher"
	15 "None of the above"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode profession , generate(profession_temp) label(prof) noextend
	order profession_temp , after(profession)
	drop profession
	rename profession_temp profession
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable profession "Citizen's profession"
	notes profession: The citizen's profession. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: qualification ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define quali
	1 "BS (4 years)"
	2 "Short Course"
	3 "Certification"
	4 "Training"
	5 "Matriculation / O Levels"
	6 "FA / FSc / A Levels (12 Years)"
	7 "Diploma"
	8 "Diploma of Associate Engineering (DAE 3 Years)"
	9 "Bachelors Degree (2 Years)"
	10 "Masters Degree"
	11 "Bachelors Degree (5 Years)"
	12 "MBBS (5 years)"
	13 "MPhil / MS (18 years)"
	14 "Doctorate"
	15 "Post Doctorate"
	16 "Middle School"
	17 "None of the Above"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode qualification , generate(qualification_temp) label(quali) noextend
	order qualification_temp , after(qualification)
	drop qualification
	rename qualification_temp qualification
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable qualification "Citizen's qualification"
	notes qualification: The citizen's qualification. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: citizen_province ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* value label "province" was already defined for variable complaint_province
	
// Step 3: Encode categorical variable as numeric variable
	encode citizen_province , generate(citizen_province_temp) label(province) noextend
	order citizen_province_temp , after(citizen_province)
	drop citizen_province
	rename citizen_province_temp citizen_province
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_province "Citizen's province"
	notes citizen_province: Citizen's province. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: citizen_district ***

// Step 1: Recode values
	replace citizen_district = "Karachi" if strmatch(citizen_district, "*Karachi*") == 1
	replace citizen_district = "Chitral" if strmatch(citizen_district, "*Chitral*") == 1
	replace citizen_district = "Dir" if strmatch(citizen_district, "*Dir*") == 1

	
	// Step 2: Define value label
	* value label "district" was already defined for variable complaint_district
	
// Step 3: Encode categorical variable as numeric variable
	encode citizen_district , generate(citizen_district_temp) label(district) noextend
	order citizen_district_temp , after(citizen_district)
	drop citizen_district
	rename citizen_district_temp citizen_district
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_district "Citizen's district"
	notes citizen_district: District corresponding to the complaint. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. The last two digits are the sequence of districts in the corresponding province, which is represented by the first one or two digit(s). 
	notes citizen_district: Note: 1. "Karachi South", "Karachi Central", "Karachi East", "Karachi West" are grouped into "Karachi".
	notes citizen_district: 2. "Chitral Lower" and "Chitral Upper" are grouped into "Chitral".
	notes citizen_district: 3. "Dir Lower" and "Dir Upper" are grouped into "Dir".
	notes citizen_district: 4. "Kohistan Lower" and "Kohistan Upper" are gruoped into "Kohistan".
	
	
*** variable: citizen_tehsil ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_tehsil "Citizen's tehsil"
	notes citizen_tehsil: Citizen's tehsil

	
*** variable: visually_impaired ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values visually_impaired yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable visually_impaired "Citizen visually impaired"
	notes visually_impaired: If the citizen is visually impaired		
	
	
*** variable: dob ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable dob "Citizen's dob"
	notes dob: The citizen's birthday

	
*** variable: gender ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define gender
	0 "Female"
	1 "Male"
	2 "Other"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode gender , generate(gender_temp) label(gender) noextend
	order gender_temp , after(gender)
	drop gender
	rename gender_temp gender
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable gender "Citizen's gender"
	notes gender: The citizen's gender
	
	
*** variable: disabled ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values disabled yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable disabled "Citizen disabled"
	notes disabled: If the citizen is disabled
	
	
*** variable: blood_group_abo ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define abo
	1 "A"
	2 "B"
	3 "O"
	4 "AB"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode blood_group_abo , generate(blood_group_abo_temp) label(abo) noextend
	order blood_group_abo_temp , after(blood_group_abo)
	drop blood_group_abo
	rename blood_group_abo_temp blood_group_abo
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable blood_group_abo "Citizen's ABO blood type"
	notes blood_group_abo: The citizen's ABO blood type
	
	
*** variable: blood_group_rh ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define rh
	0 "negative"
	1 "positive"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode blood_group_rh , generate(blood_group_rh_temp) label(rh) noextend
	order blood_group_rh_temp , after(blood_group_rh)
	drop blood_group_rh
	rename blood_group_rh_temp blood_group_rh
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable blood_group_rh "Citizen's Rh blood type"
	notes blood_group_rh: The citizen's Rh blood type
	

*** variable: citizen_registraion_date ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_registraion_date "Citizen's registration date"
	notes citizen_registraion_date: Date when the citizen registered on PCP App	
	
	
*** variable: citizen_registraion_time ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_registraion_time "Citizen's registration time"
	notes citizen_registraion_time: Time when the citizen registered on PCP App	
	
	
*** variable: religion ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define religion
	1 "Islam"
	2 "Hindusim"
	3 "Christianity"
	4 "Buddhism"
	5 "Sikhism"
	6 "Judaism"
	7 "Jainism"
	8 "Taoism"
	9 "Chinese traditional religion"
	10 "Primal-indigenous"
	11 "African traditional and Diasporic"
	12 "Juche"
	13 "Spiritism"
	14 "Bahai"
	15 "Shinto"
	16 "Cao Dai"
	17 "Zoroastrianism"
	18 "Tenrikyo"
	19 "Neo-Paganism"
	20 "Unitarian-Universalism"
	21 "Nonreligious (Secular/Agnostic/Atheist)"
	22 "Others"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode religion , generate(religion_temp) label(religion) noextend
	order religion_temp , after(religion)
	drop religion
	rename religion_temp religion
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable religion "Citizen's religion"
	notes religion: The citizen's religion. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 	
	
	
*** variable: mobile_operator ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define mobile
	1 "Mobilink (Jazz)"
	2 "Scom"
	3 "Telenor"
	4 "Ufone"
	5 "Warid"
	6 "Zong/Paktel"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode mobile_operator , generate(mobile_operator_temp) label(mobile) noextend
	order mobile_operator_temp , after(mobile_operator)
	drop mobile_operator
	rename mobile_operator_temp mobile_operator
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable mobile_operator "Citizen's mobile operator"
	notes mobile_operator: The citizen's mobile operator. Only availeble for inland citizen (oversea=0). Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: nationality ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define country
	1 "Pakistan"
	2 "Afghanistan"
	3 "Albania"
	4 "Algeria"
	5 "American Samoa"
	6 "Andorra"
	7 "Angola"
	8 "Anguilla"
	9 "Antarctica"
	10 "Anyigua and Barbuda"
	11 "Argentina"
	12 "Armenia"
	13 "Aruba"
	14 "Australia"
	15 "Austria"
	16 "Azerbaijan"
	17 "Bahamas"
	18 "Bahrain"
	19 "Bangladesh"
	20 "Barbados"
	21 "Belarus"
	22 "Belgium"
	23 "Belize"
	24 "Benin"
	25 "Bermuda"
	26 "Bhutan"
	27 "Bolivia"
	28 "Bosnia and Herzegovina"
	29 "Botswana"
	30 "Bouvet Island"
	31 "Brazil"
	32 "British Indian Ocean Territory"
	33 "Brunei Darussalam"
	34 "Bulgaria"
	35 "Burkina Faso"
	36 "Burundi"
	37 "Cambodia"
	38 "Cameroon"
	39 "Canada"
	40 "Cape Verde"
	41 "Cayman Islands"
	42 "Central African Repubic"
	43 "Chad"
	44 "Chile"
	45 "China"
	46 "Christmas Island"
	47 "Cocos (keeling) Islands"
	48 "Colombia"
	49 "Comoros"
	50 "Congo"
	51 "Congo, the Democratic Republic of the"
	52 "Cook Islands"
	53 "Costa Rica"
	54 "Cote D'Ivoire"
	55 "Croatia"
	56 "Cuba"
	57 "Cyprus"
	58 "Czech Republic"
	59 "Denmark"
	60 "Djibouti"
	61 "Dominica"
	62 "Dominican Republic"
	63 "Ecuador"
	64 "Egypt"
	65 "El Salvador"
	66 "Equatorial Guinea"
	67 "Eritrea"
	68 "Estonia"
	69 "Ethiopia"
	70 "Falkland Islands (Malvinas)"
	71 "Faroe Islands"
	72 "Fiji"
	73 "Finland"
	74 "France"
	75 "French Guiana"
	76 "French Polynesia"
	77 "French Southern Territories"
	78 "Gabon"
	79 "Gambia"
	80 "Georgia"
	81 "Germany"
	82 "Ghana"
	83 "Gibraltar"
	84 "Greece"
	85 "Greenland"
	86 "Grenada"
	87 "Guadeloupe"
	88 "Guam"
	89 "Guatemala"
	90 "Guinea"
	91 "Guinea-Bissau"
	92 "Guyana"
	93 "Haiti"
	94 "Heard Island and Mcdonald Islands"
	95 "Holy See (Vatican City State)"
	96 "Honduras"
	97 "Hong Kong"
	98 "Hungary"
	99 "Iceland"
	100 "India"
	101 "Indonesia"
	102 "Iran, Islamic Republic of"
	103 "Iraq"
	104 "Ireland"
	105 "Israel"
	106 "Italy"
	107 "Jamaica"
	108 "Japan"
	109 "Jordan"
	110 "Kazakhstan"
	111 "Kenya"
	112 "Kiribati"
	113 "Korea, Democratic People's Republic of"
	114 "Korea, Republic of"
	115 "Kuwait"
	116 "Kyrgyzstan"
	117 "Lao People's Democratic Republic"
	118 "Latvia"
	119 "Lebanon"
	120 "Lesotho"
	121 "Liberia"
	122 "Libyan Arab Jamahiriya"
	123 "Liechtenstein"
	124 "Lithuania"
	125 "Luxembourg"
	126 "Macao"
	127 "Macedonia, the Former Yugoslav Republic of"
	128 "Madagascar"
	129 "Malawi"
	130 "Malaysia"
	131 "Maldives"
	132 "Mali"
	133 "Malta"
	134 "Marshall Islands"
	135 "Martinique"
	136 "Mauritania"
	137 "Mauritius"
	138 "Mayotte"
	139 "Mexico"
	140 "Micronesia, Federated States of"
	141 "Moldova, Republic of"
	142 "Monaco"
	143 "Mongolia"
	144 "Montserrat"
	145 "Morocco"
	146 "Mozambique"
	147 "Myanmar"
	148 "Namibia"
	149 "Nauru"
	150 "Nepal"
	151 "Netherlands"
	152 "Netherlands Antilles"
	153 "New Caledonia"
	154 "New Zealand"
	155 "Nicaragua"
	156 "Niger"
	157 "Nigeria"
	158 "Niue"
	159 "Norfolk Island"
	160 "Northern Mariana Islands"
	161 "Norway"
	162 "Oman"
	163 "Palau"
	164 "Palestinian Teritory, Occupied"
	165 "Panama"
	166 "Papua New Guinea"
	167 "Paraguay"
	168 "Peru"
	169 "Philippines"
	170 "Pitcairn"
	171 "Poland"
	172 "Portugal"
	173 "Puerto Rico"
	174 "Qatar"
	175 "Reunion"
	176 "Romania"
	177 "Russian Federation"
	178 "Rwanda"
	179 "Saint Helena"
	180 "Saint Kitts and Nevis"
	181 "Saint Lucia"
	182 "Saint Pierre and Miquelon"
	183 "Saint Vincent and the Grenadines"
	184 "Samoa"
	185 "San Marino"
	186 "Sao Tome and Principe"
	187 "Saudi Arabia"
	188 "Senegal"
	189 "Serbia and Montenegro"
	190 "Seychelles"
	191 "Sierra Leone"
	192 "Singapore"
	193 "Slovakia"
	194 "Slovenia"
	195 "Solomon Islands"
	196 "Somalia"
	197 "South Africa"
	198 "South Georgia and the South Sandwich Islands"
	199 "Spain"
	200 "Sri Lanka"
	201 "Sudan"
	202 "Suriname"
	203 "Svalbard and Jan Mayen"
	204 "Swaziland"
	205 "Sweden"
	206 "Switzerland"
	207 "Syrian Arab Republic"
	208 "Taiwan, Province of China"
	209 "Tajikistan"
	210 "Tanzania, United Republic of"
	211 "Thailand"
	212 "Timor-Leste"
	213 "Togo"
	214 "Tokelau"
	215 "Tonga"
	216 "Trinidad and Tobago"
	217 "Tunisia"
	218 "Turkey"
	219 "Turkmenistan"
	220 "Turks and Caicos Islands"
	221 "Tuvalu"
	222 "Uganda"
	223 "Ukraine"
	224 "United Arab Emirates"
	225 "United Kingdom"
	226 "United States"
	227 "United States Minor Outlying Islands"
	228 "Uruguay"
	229 "Uzbekistan"
	230 "Vanuatu"
	231 "Venezuela"
	232 "Viet Nam"
	233 "Virgin Islands, British"
	234 "Virgin Islands, U.s."
	235 "Wallis and Futuna"
	236 "Western Sahara"
	237 "Yemen"
	238 "Zambia"
	239 "Zimbabwe"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode nationality , generate(nationality_temp) label(country) noextend
	order nationality_temp , after(nationality)
	drop nationality
	rename nationality_temp nationality
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable nationality "Citizen's nationality"
	notes nationality: The citizen's nationality. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
		
		
*** variable: resident_country ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label	
	* value label "country" was already defined for variable nationality
	
// Step 3: Encode categorical variable as numeric variable
	encode resident_country , generate(resident_country_temp) label(country) noextend
	order resident_country_temp , after(resident_country)
	drop resident_country
	rename resident_country_temp resident_country
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable resident_country "Citizen's resident country"
	notes resident_country: The citizen's resident country. Value labels were assigned according to the order appeared in PCP App on 7/19/2022. 
	
	
*** variable: email_verified ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values email_verified yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable email_verified "Citizen's email verified"
	notes email_verified: If the citizen's email is verified		
	
	
*** variable: cnic_verified ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values cnic_verified yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable cnic_verified "Citizen's CNIC verified"
	notes cnic_verified: If the citizen's Computerized National Identity Card (CNIC) is verified		
	
	
*** variable: mobile_verified ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values mobile_verified yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable mobile_verified "Citizen's mobile number verified"
	notes mobile_verified: If the citizen's mobile number is verified
	
	
*** variable: passport_verified ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity
	label values passport_verified yesno

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable passport_verified "Citizen's passport verified"
	notes passport_verified: If the citizen's passport is verified		
	
	
*** variable: satisfaction_status ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* value label "yesno" was already defined for variable hide_identity

// Step 3: Encode categorical variable as numeric variable
	encode satisfaction_status , generate(satisfaction_status_temp) label(yesno) noextend
	order satisfaction_status_temp , after(satisfaction_status)
	drop satisfaction_status
	rename satisfaction_status_temp satisfaction_status
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable satisfaction_status "Citizen's satisfaction status"
	notes satisfaction_status: If the citizen is satified with the resolution of his/her complaint		

	
*** variable: feedback_date ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable feedback_date "Citizen's feedback date"
	notes feedback_date: Date when the citizen gave feedback on the resolution of his/her complaint
	
	
*** variable: feedback_time ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable feedback_time "Citizen's feedback time"
	notes feedback_time: Time when the citizen gave feedback on the resolution of his/her complaint	
	

*** variable: citizen_resolution_status ***

// Step 1: Recode values
	* not applicable to this variable
	
// Step 2: Define value label
	#delimit;
	label define res_sta_ci
	0 "Not Resolved"
	1 "Partially Resolved"
	2 "Resolved"
	;
	#delimit cr
		
// Step 3: Encode categorical variable as numeric variable
	encode citizen_resolution_status , generate(citizen_resolution_status_temp) label(res_sta_ci) noextend
	order citizen_resolution_status_temp , after(citizen_resolution_status)
	drop citizen_resolution_status
	rename citizen_resolution_status_temp citizen_resolution_status
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable citizen_resolution_status "Citizen's satisfaction status"
	notes citizen_resolution_status: Resolution status determined by the citizen
	
	
*** variable: star ***

// Step 1: Recode values
	* not applicable to this variables
	
// Step 2: Define value label
	#delimit;
	label define star 
	1 "1 star"
	2 "2 star"
	3 "3 star"
	4 "4 star"
	5 "5 star"
	;
	#delimit cr
		
	label values star star

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable star "Citizen's rating"
	notes star: Rating of the resolution given by the citizen	
	
	
*** variable: last_user_position ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_user_position "last user's position"
	notes last_user_position: The first part of variable last_user extracted  by Python during the merging process of the PCP dataset and the CV dataset
	
	
*** variable: last_user_city_province ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable last_user_city_province "last user's department"
	notes last_user_city_province: The second part of variable last_user extracted  by Python during the merging process of the PCP dataset and the CV dataset		
	
	
*** variable: worker_name ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_name "bureaucrat's name"
	notes worker_name: The bureaucrat's name  from the CV dataset.	
	
	
*** variable: worker_post ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_post "bureaucrat's position"
	notes worker_post: The bureaucrat's position  from the CV dataset between post_from and post_to.	
	
	
*** variable: worker_post_grouped ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_post_grouped "bureaucrat's position (standardized)"
	notes worker_post_grouped: The standardized title of the bureaucrat's position from the CV dataset between post_from and post_to. This variable was matched with variable last_user_position for merging the portal dataset and the bureaucrat dataset.	
	
	
*** variable: bs ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable bs "bureaucrat's BS"
	notes bs: The bureaucrat's Basic Pay Scale (BPS or BS) during his/her worker_post. BS is the minimum sum of earnings a Pakistan government employee receives which ranges from 1 to 22. This variable is from the CV dataset.
	
	
*** variable: worker_post_organization ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_post_organization "bureaucrat's organization"
	notes worker_post_organization: The bureaucrat's organization from the CV dataset between post_from and post_to.	
	
	
*** variable: worker_post_organization_grouped ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_post_organization_grouped "bureaucrat's organization (standardized)"
	notes worker_post_organization_grouped: The standardized organization name of the bureaucrat's organization from the CV dataset between post_from and post_to. This variable was matched with variable last_user_pro for merging the portal dataset and the bureaucrat dataset.
	
	
*** variable: worker_birth_district ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable worker_birth_district "bureaucrat's birth district"
	notes worker_birth_district: The bureaucrat's birth distric from the CV dataset. This variable was matched with variable complaint_district for merging the portal dataset and the bureaucrat dataset.
	
	
*** variable: worker_birth_province ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	rename worker_birht_province worker_birth_province

// Step 5: Define variable label and note
	label variable worker_birth_province "bureaucrat's birth province"
	notes worker_birth_province: The bureaucrat's birth province from the CV dataset
	

*** variable: post_from ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable post_from "Bureaucrat's position starting date"
	notes post_from: The starting date of the bureaucrat's position from the CV dataset
	
	
*** variable: post_to ***

// Step 1: Recode values
	* not applicable to this variable

// Step 2: Define value label
	* not applicable to this variable

// Step 3: Encode categorical variable as numeric variable
	* not applicable to this variable
	
// Step 4: Rename variable
	* not applicable to this variable

// Step 5: Define variable label and note
	label variable post_to "Bureaucrat's position ending date"
	notes post_to: The ending date of the bureaucrat's position from the CV dataset. If it was a current position when the PCP dataset and the CV dataset were merged, the date of merging, 2022/6/22, was assigned.	
	

// Exportation

	* export to csv file
	export delimited using "merged_data_clean.csv", quote replace
	
	* export to dta file
	save "merged_data_clean", replace
