********************************************************************************** 
* This data construction script is written to create new variables for data      *
* analysis, which include:														 *
* 																				 *
* resolution_days : Time to solve the complaint in days which is the duration    *	 
*                   between the last remarks date and the complaint date	     *
*																				 *
* Author: Cheng-Wei Lee (2022 Summer Intern in DE JURE program, DIME, World Bank)*
* Create Date: 2022-JUL-22														 *
********************************************************************************** 

// Step 0: Setting and read data

	clear all
	set more off
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"
	use "merged_data_clean.dta", clear //use the clean dta data
	
	
// Step 1: Create variable resolution_days	

	* calculte resolution duration in days
	gen resolution_days = last_remarks_date - complaint_date
	
	* reorder resolution_days to next to last_remarks_time
	order resolution_days , after(last_remarks_time)
	
	* define variable label and note
	label variable resolution_days "Resolution days"
	notes resolution_days: Time to solve the complaint in days which is the duration between the last remarks date and the complaint date
	
// Exportation

	* redirect to final dataset folder
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Final"

	* export to csv file
	export delimited using "merged_data_constructed.csv", quote replace
	
	* export to dta file
	save "merged_data_constructed", replace