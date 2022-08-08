********************************************************************************** 
* This data analysis script is written to do exploratory analysis on the merged  *
* dataset to show descriptive statistics including who complained, what and      *
* where the complaints were about, and how the satisfaction ratings and          *
* resolution time varied with categories and provinces.                          *
*                                                                                *
* Author: Cheng-Wei Lee (2022 Summer Intern in DE JURE program, DIME, World Bank)*
* Create Date: 2022-AUG-08														 *
********************************************************************************** 

// Step 0: Setting and read data

	clear all
	set more off
	local data "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Final"
	local output "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\Outputs\Raw"
	cd `data'	
	use "merged_data_constructed", clear //use the constructed dataset
	gen x = 1 //generate a temp variable for graphing purpose later
	
// Step 1: Who Complained

	* gender
	cd `data'
	graph	hbar (percent) x, over(gender, sort(1) descending) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))
	
	cd `output'
	graph export "gender.png" , replace
	
	* age
	cd `data'
	gen age = 2021 - year(dob)
	gen agegroup = 1 if age < 20
	replace agegroup = 2 if age < 30 & age >= 20
	replace agegroup = 3 if age < 40 & age >= 30
	replace agegroup = 4 if age < 50 & age >= 40		
	replace agegroup = 5 if age < 60 & age >= 50	
	replace agegroup = 6 if age < 70 & age >= 60	
	replace agegroup = 7 if age >= 70	
	label define agegroup 1 "less than 20 y.o." 2 "20-29 y.o." 3 "30-39 y.o." 4 "40-49 y.o." 5 "50-59 y.o." 6 "60-69 y.o." 7 "equal or more than 70 y.o."
	label values agegroup agegroup
		
	graph	hbar (percent) x, over(agegroup) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))

	cd `output'
	graph export "age.png" , replace

	* profession
	graph	hbar (percent) x, over(profession, sort(1) descending) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))
	
	cd `output'
	graph export "profession.png" , replace
	
	* qualification
	cd `data'
	graph	hbar (percent) x, over(qualification, sort(1) descending) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))

	cd `output'
	graph export "qualification.png" , replace
	

// Step 2: What the Where the Complaints were About 
	
	* top 10 complaint categories
	cd `data'
	
	preserve
	collapse (percent) x , by(level_one)
	gsort -x
	keep in 1/10
			
	graph	hbar x, over(level_one, sort(1) descending) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))
	
	cd `output'
	graph export "complaint_category.png" , replace	
	
	restore
	
	* complaint_province
	cd `data'
	graph	hbar (percent) x, over(complaint_province) ///
			blabel(bar, format(%9.1f)) graphregion(color(white)) ///
			ytitle("Percent") yscale(titlegap(2))

	cd `output'
	graph export "complaint_province.png" , replace
		

// Step 3: How the satisfaction ratings and resolution time varied with categories and provinces
	
	* satisfaction rating vs. categories (top 5 and bottom 5)
	cd `data'
	
	preserve
	
	collapse (mean) star (sd) sd = star , by(level_one)
	gsort -star
	drop if missing(level_one) == 1
	keep if _n <= 5 | _n > _N - 5 
	decode level_one, gen(level_one_str)
	drop level_one
	rename level_one_str level_one
	sencode level_one, replace
	
	gen sd_upper = star + sd
	gen sd_lower = star - sd
		
	graph twoway	(bar star level_one, horizontal barwidth(0.5) color(navy) plotregion(margin(zero))) ///
					(rcap sd_upper sd_lower level_one, horizontal) ///
					(scatter level_one star, msymbol(none) mlabel(star) mlabposition(1) mlabformat(%9.1f) mlabcolor(black)) ///
					, legend(off) graphregion(color(white)) ///
					xtitle("Rating in 1-5 Stars") xscale(range(1/5) titlegap(2)) xlabel(1/5, grid) ///
					ytitle("") ylabel(1/10, notick nogrid angle(horizontal) valuelabel) yscale(reverse)

	restore

	cd `output'
	graph export "rating_by_category.png" , replace	
	
	* satisfaction rating vs. provinces
	cd `data'
	
	preserve
	
	collapse (mean) star (sd) sd = star , by(complaint_province)
	
	gen sd_upper = star + sd
	gen sd_lower = star - sd
		
	graph twoway	(bar star complaint_province, horizontal barwidth(0.5) color(navy) plotregion(margin(zero))) ///
					(rcap sd_upper sd_lower complaint_province, horizontal) ///
					(scatter complaint_province star, msymbol(none) mlabel(star) mlabposition(1) mlabformat(%9.1f) mlabcolor(black)) ///
					, legend(off) graphregion(color(white)) ///
					xtitle("Rating in 1-5 Stars") xscale(range(1/5) titlegap(2)) xlabel(1/5, grid) ///
					ytitle("") ylabel(, notick nogrid angle(horizontal) valuelabel) yscale(reverse)

	restore

	cd `output'
	graph export "rating_by_province.png" , replace	

	* resolution time vs. categories
	cd `data'
	
	preserve
	
	collapse (mean) resolution_days (sd) sd = resolution_days , by(level_one)
	gsort resolution_days
	drop if missing(level_one) == 1
	keep if _n <= 5 | _n > _N - 5 
	decode level_one, gen(level_one_str)
	drop level_one
	rename level_one_str level_one
	sencode level_one, replace
	
	gen sd_upper = resolution_days + sd
	gen sd_lower = resolution_days - sd
		
	graph twoway	(bar resolution_days level_one, horizontal barwidth(0.5) color(navy) plotregion(margin(zero))) ///
					(rcap sd_upper sd_lower level_one, horizontal) ///
					(scatter level_one resolution_days, msymbol(none) mlabel(resolution_days) mlabposition(1) mlabformat(%9.1f) mlabcolor(black)) ///
					, legend(off) graphregion(color(white)) ///
					xtitle("Time to Resolution in Days") xscale(titlegap(2)) xlabel(0(30)240, grid) ///
					ytitle("") ylabel(1/10, notick nogrid angle(horizontal) valuelabel) yscale(reverse)

	restore

	cd `output'
	graph export "resolution_time_by_category.png" , replace		
	
	* resolution time vs. provinces	
	cd `data'
	
	preserve
	
	collapse (mean) resolution_days (sd) sd = resolution_days , by(complaint_province)
	
	gen sd_upper = resolution_days + sd
	gen sd_lower = resolution_days - sd
		
	graph twoway	(bar resolution_days complaint_province, horizontal barwidth(0.5) color(navy) plotregion(margin(zero))) ///
					(rcap sd_upper sd_lower complaint_province, horizontal) ///
					(scatter complaint_province resolution_days, msymbol(none) mlabel(resolution_days) mlabposition(1) mlabformat(%9.1f) mlabcolor(black)) ///
					, legend(off) graphregion(color(white)) ///
					xtitle("Time to Resolution in Days") xscale(titlegap(2)) xlabel(0(30)180, grid) ///
					ytitle("") ylabel(, notick nogrid angle(horizontal) valuelabel) yscale(reverse)

	restore

	cd `output'
	graph export "resolution_time_by_province.png" , replace			
	
