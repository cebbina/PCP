clear all
set more off
cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"
 
import delimited using "merged_data.csv", bindquote(strict) maxquotedrows(10000) clear

// Step 1: Make sure each column corresponds to one variable 
	
	* split timestamp variables into date and time, including complaint_date, last_remarks_date, dob, citizen_registraion_date, feedback_date, and then reorder date and time variables to the original order

	local timestamps complaint_date last_remarks_date dob citizen_registraion_date feedback_date
	
	foreach var in `timestamps' {
		
		gen `var'_1 = date(`var', "YMDhms")	//generate a temporary date variable from the timestamp
		format `var'_1 %td	//formate date
		gen `var'_time_1 = clock(`var', "YMDhms")	//generate a temporary time variable from the timestamp
		gen `var'_time = mod(`var'_time_1, 24*60*60000)	//use mod function to get time in seconds
		format `var'_time %tcHH:MM:SS	//format time
		
		drop `var' 
		rename `var'_1 `var'	//replace the timestamp with the temporary date variable
		drop `var'_time_1
	} 	
	
	rename *_date_time* *_time	//remove "date" from the variable name for time variable
	drop dob_time	//time variable is not necessary for dob
	
	order complaint_date complaint_time , after(complaint_code)	//reorder
	order last_remarks_date last_remarks_time , after(status_id)
	order dob , after(visually_impaired)
	order citizen_registraion_date citizen_registraion_time , after(blood_group)
	order feedback_date feedback_time , after(satisfaction_status)
		
	* split blood_group into the ABO system and the Rh system, and then reorder to the original order
	gen blood_group_abo = substr(blood_group, 1, 2)	//extract the ABO blood type
	replace blood_group_abo = trim(blood_group_abo)	//trim redundant space
	
	gen blood_group_rh_temp = substr(blood_group, -2, 1)	//extract the Rh blood type
	gen blood_group_rh = "positive" if blood_group_rh_temp == "+"
	replace blood_group_rh = "negative" if blood_group_rh_temp == "-"
	
	order blood_group_abo blood_group_rh , after(blood_group)	//reorder
	drop blood_group blood_group_rh_temp


// Step 2: Check other date format and order of variables
	
	* change post_from and post_to to Stata date format
	foreach var in post_from post_to{
		
		gen float `var'_temp = date(`var', "YMD")	//generate a temporary date variable
		format `var'_temp %td	//formate date
		drop `var'
		rename `var'_temp `var'	//replace the original variable with the temporary date variable		
	}
	
	* move worker_post_organization_grouped to be with worker_post_organization
	order worker_post_organization_grouped , after(worker_post_organization)
	
	
// Step 3: Exportation
	
	* export to csv file
	export delimited using "merged_data_tidy.csv", quote replace
	
	* export to dta file
	save "merged_data_tidy", replace