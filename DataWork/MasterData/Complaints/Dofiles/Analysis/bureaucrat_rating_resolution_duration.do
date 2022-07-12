clear all
set more off
cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"
 
import delimited using "merged_data_complaint_details_and_last_remarks_removed.csv", clear

// Step 1: Generate duration in days bewteen complaint_date and last_remarks_date
	
	* convert complaint_date & last_remarks_date (both are strings) to Stata date format
	gen complaint_date2 = date(complaint_date, "MDYhm")
	gen last_remarks_date2 = date(last_remarks_date, "MDYhm")

	* calculte resolution duration in days
	gen resolution_days = last_remarks_date2 - complaint_date2

// Step 2: Summarize each bureaucrat's rating and resolution duration in days

	collapse	(mean)	Resolution_days_average = resolution_days ///
						Citizen_rating_average = star ///
				(sd)	Resolution_days_sd = resolution_days ///
						Citizen_rating_sd = star ///
				(max)	Resolution_days_max = resolution_days ///
						Citizen_rating_max = star ///
				(min)	Resolution_days_min = resolution_days ///
						Citizen_rating_min = star ///
				(count)	Resolution_days_count = resolution_days ///
						Citizen_rating_count = star ///
				, by(worker_name)

// Step 3: Exportation

	* capitalize the first letter in worker_name
	gen Name = strproper(worker_name)
	drop worker_name
	
	* keep only 1 decimal points
	tostring Resolution_days_average-Citizen_rating_count , replace force format(%9.1f)
	
	* reorder variables
	order Resolution_days_average-Citizen_rating_count , alphabetic
	order Name , first
	
	* export to csv file
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\Outputs\Raw"
	export delimited using bureaucrat_rating_resolution_days.csv, replace