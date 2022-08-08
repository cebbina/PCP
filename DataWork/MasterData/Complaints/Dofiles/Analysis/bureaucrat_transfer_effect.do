********************************************************************************** 
* This data analysis script is written to analize the effect of transfer on      *
* bureaucrat's performance. The transfer is indicated by a dummy var which is    *
* equal to 1 in the transfer month, and 0 otherwise. The transfer month is       *
* defined as the next month after the transfer happened. If the transfer         *
* happened on the 1st of the month, then the same month is defined as the        *
* transfer month. The performance is evaluated by two variables:                 *
* 1. resolution_days: duration in days to solve the complaint                    *
* 2. star: citizen's rating on the solution provided by bureaucrat               *
*                                                                                *
* Author: Cheng-Wei Lee (2022 Summer Intern in DE JURE program, DIME, World Bank)*
* Create Date: 2022-JUL-26														 *
********************************************************************************** 

// Step 0: Setting and read data

	clear all
	set more off
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Final"	
	use "merged_data_constructed", clear //use the constructed dataset
	
	
// Step 1: Extract year and month from last_remarks_date, and year, month, day from post_from

	* extract year and month from last_remarks_date
	gen last_remarks_yr = year(last_remarks_date)
	gen last_remarks_mo = month(last_remarks_date)
		
	* extract year, month, day from post_from
	gen post_from_yr = year(post_from)
	gen post_from_mo = month(post_from)
	gen post_from_day = day(post_from)
	

// Step 2: Generate a dummy var = 1 to indicate a transfer month. A transfer month is defined as the next month after the transfer happened. If the transfer happened on the 1st of the month, that the same month is defined as the transfer month. 
	
	* add one month if the transfer did NOT happened on the 1st of the month
	replace post_from_mo = post_from_mo + 1 if post_from_day != 1
	replace post_from_yr = post_from_yr + 1 if post_from_mo == 13
	replace post_from_mo = 1 if post_from_mo == 13
	
	* generate the dummy var = 1 if the year-month of the last remarks match the transfer month
	gen transfer = 1 if last_remarks_yr == post_from_yr & last_remarks_mo == post_from_mo
	replace transfer = 0 if missing(transfer) == 1
	

// Step 3: Regression analysis

	*
	
	
	
// Step 4: Exportation

	* redirect to raw outputs folder
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\Outputs\Raw"
	
	* export 