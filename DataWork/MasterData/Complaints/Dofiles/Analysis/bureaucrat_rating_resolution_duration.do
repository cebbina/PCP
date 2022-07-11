clear all
set more off
cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"
 
import excel using "merged_portal_part2.xlsx", firstrow clear

// Generate duration in days bewteen complaint_date and last_remarks_date

gen resolution_duration = dofc(last_remarks_date) - dofc(complaint_date)

// Summarize each bureaucrat's rating and resolution duration

sort worker_name	
collapse	(mean)	resolution_duration_average = resolution_duration ///
					citizen_rating_average = star ///
			(count)	resolution_duration_count = resolution_duration ///
					citizen_rating_count=star ///
			, by(worker_name)

// Prepare format for exportation and export the summarized data to csv file

* Capitalize the first letter in worker_name
gen bureaucrat = strproper(worker_name)
drop worker_name
order bureaucrat , first

* export to csv file
export delimited using bureaucrat_rating_resolution_duration.csv, replace