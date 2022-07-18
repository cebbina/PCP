clear all
set more off
cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\DataSet\Intermediate"

/****************************************************************************** 
This data cleaning script is based on the Stata command iecodebook from the package iefieldkit which is created by DIME Analytics. The iecodebook command is structured around Excel-based codebooks, which allow researchers to perform and document data cleaning tasks in Excel itself, instead of using do-files. The following data cleaning tasks are included: renaming variables, recoding and labelling missing values, encoding categorical variables as numeric variables, applying variable labels, and applying value labels. 

Reference: https://dimewiki.worldbank.org/Iecodebook
******************************************************************************/ 

ssc install iefieldkit	//intall the package if not yet installed
import delimited using "merged_data_tidy.csv", bindquote(strict) maxquotedrows(10000) clear //use the tidied data


// Step 1: Create template 
	
	cd "C:\Users\Cebbina\Documents\World_Bank\PCP\DataWork\MasterData\Complaints\Dofiles\Cleaning"	//switch to code folder
	iecodebook template	using "data_cleaning.xlsx"	//create an Excel template that each column describes different aspects of a single variable

// Step 2: Complete template: Move to Excel to fill out the template, which creates the codebook that lists all the data cleaning tasks including renaming variables, recoding and labelling missing values, encoding categorical variables as numeric variables, applying variable labels, and applying value labels. 

  *********************************************************************************
  * IMPORTANT: Remember to rename the template as cleaning_filled.xlsx, otherwise *
  * you are risking LOSING the filled information once re-running the script.     *
  *********************************************************************************
	
// Step 3: Apply changes
	iecodebook apply using "data_cleaning_filled.xlsx"
	
	
// Step 4: Export 
	* export to csv file
	export delimited using "merged_data_clean.csv", datafmt quote replace	//export data
	iecodebook export 	//export codebook
	
	