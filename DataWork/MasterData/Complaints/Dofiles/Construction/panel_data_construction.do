********************************************************************************** 
* This data construction script is written to create year-month panel data for   *
* bureaucrat's posting. The main goal is to create a dummy variable which is 1   *
* for the first month after post transfer and 0 otherwise.                       *
* 																				 *
* Author: Cheng-Wei Lee (2022 Summer Intern in DE JURE program, DIME, World Bank)*
* Create Date: 2022-JUL-25														 *
********************************************************************************** 

// Step 0: Setting and read data

	clear all
	set more off
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\EncryptedData\Master Complaints Encrypted\DataSet\CV dataset"
	import excel using "output.xlsx", sheet("Postings") firstrow clear //use the output dataset extracted from CVs
	
	
// Step 1: Extract day, month, year from var post_from

	* format post_from to Stata date format
	gen post_from_temp = date(post_from, "DMY")
	order post_from_temp , after(post_from)
	drop post_from
	rename post_from_temp post_from
	
	* extract day, month, year from post_from
	gen post_from_yr = year(post_from)
	gen post_from_mo = month(post_from)
	gen post_from_day = day(post_from)
	

// Step 2: Generate a dummy var = 1 to indicate a transfer month. A transfer month is defined as the next month after the transfer happened. If the transfer happened on the 1st of the month, then the same month is defined as the transfer month. 
	
	* add one month if the transfer did NOT happened on the 1st of the month
	sort worker_name post_from
	replace post_from_mo = post_from_mo + 1 if post_from_day != 1
	replace post_from_yr = post_from_yr + 1 if post_from_mo == 13
	replace post_from_mo = 1 if post_from_mo == 13
	
	* generate the dummy var = 1
	gen transfer = 1
	
	* remove observations with missing post_from
	drop if missing(post_from) == 1

// Step 3: Deal with duplicates

	* keep the highest BS post if there are >1 posts happened in the same month. If there are >1 posts with same BS happened in the same month, keep the newest one. 
	sort worker_name post_from_yr post_from_mo BS post_from
	duplicates drop worker_name post_from_yr post_from_mo , force
	
	
// Step 4: Exportation

	* redirect to final dataset folder
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Final"
	
	* export to csv file
	export delimited using "panel_data.csv", replace
	
	* export to dta file
	save "panel_data", replace