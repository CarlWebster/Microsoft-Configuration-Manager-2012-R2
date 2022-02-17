﻿#Requires -Version 3.0
#This File is in Unicode format.  Do not edit in an ASCII editor.

#region help text

<#
.SYNOPSIS
	Documents Configuration Manager using Microsoft Word, PDF.
.DESCRIPTION
	Creates a report of Configuration Manager using Microsoft Word, PDF, and PowerShell.
	Creates a document named InventoryScript.docx (or .PDF).
	Word and PDF documents include a Cover Page, Table of Contents, and Footer.
	Includes support for the following language versions of Microsoft Word:
		Catalan
		Chinese
		Danish
		Dutch
		English
		Finnish
		French
		German
		Norwegian
		Portuguese
		Spanish
		Swedish

.PARAMETER MSWord
	SaveAs DOCX file
	This parameter is set True if no other output format is selected.
.PARAMETER PDF
	SaveAs PDF file instead of DOCX file.
	This parameter is disabled by default.
	The PDF file is roughly 5X to 10X larger than the DOCX file.
.PARAMETER AddDateTime
	Adds a date timestamp to the end of the file name.
	The timestamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2020 at 6PM is 2020-06-01_1800.
	Output filename will be ReportName_2020-06-01_1800.docx (or .pdf).
	This parameter is disabled by default.
.PARAMETER CompanyAddress
	Company Address to use for the Cover Page, if the Cover Page has the Address field.
	
	The following Cover Pages have an Address field:
		Banded (Word 2013/2016)
		Contrast (Word 2010)
		Exposure (Word 2010)
		Filigree (Word 2013/2016)
		Ion (Dark) (Word 2013/2016)
		Retrospect (Word 2013/2016)
		Semaphore (Word 2013/2016)
		Tiles (Word 2010)
		ViewMaster (Word 2013/2016)
		
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CA.
.PARAMETER CompanyEmail
	Company Email to use for the Cover Page, if the Cover Page has the Email field.  
	
	The following Cover Pages have an Email field:
		Facet (Word 2013/2016)
	
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CE.
.PARAMETER CompanyFax
	Company Fax to use for the Cover Page, if the Cover Page has the Fax field.  
	
	The following Cover Pages have a Fax field:
		Contrast (Word 2010)
		Exposure (Word 2010)
	
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CF.
.PARAMETER CompanyName
	Company Name to use for the Cover Page.  
	Default value is contained in 
	HKCU:\Software\Microsoft\Office\Common\UserInfo\CompanyName or
	HKCU:\Software\Microsoft\Office\Common\UserInfo\Company, whichever is populated 
	on the computer running the script.
	This parameter has an alias of CN.
	If either registry key does not exist and this parameter is not specified, the report 
	will not contain a Company Name on the cover page.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER CompanyPhone
	Company Phone to use for the Cover Page if the Cover Page has the Phone field.  
	
	The following Cover Pages have a Phone field:
		Contrast (Word 2010)
		Exposure (Word 2010)
	
	This parameter is only valid with the MSWORD and PDF output parameters.
	This parameter has an alias of CPh.
.PARAMETER CoverPage
	What Microsoft Word Cover Page to use.
	Only Word 2010, 2013 and 2016 are supported.
	(default cover pages in Word en-US)
	
	Valid input is:
		Alphabet (Word 2010. Works)
		Annual (Word 2010. Doesn't work well for this report)
		Austere (Word 2010. Works)
		Austin (Word 2010/2013/2016. Doesn't work in 2013 or 2016, mostly 
		works in 2010 but Subtitle/Subject & Author fields need to be moved 
		after title box is moved up)
		Banded (Word 2013/2016. Works)
		Conservative (Word 2010. Works)
		Contrast (Word 2010. Works)
		Cubicles (Word 2010. Works)
		Exposure (Word 2010. Works if you like looking sideways)
		Facet (Word 2013/2016. Works)
		Filigree (Word 2013/2016. Works)
		Grid (Word 2010/2013/2016. Works in 2010)
		Integral (Word 2013/2016. Works)
		Ion (Dark) (Word 2013/2016. Top date doesn't fit; box needs to be 
		manually resized or font changed to 8 point)
		Ion (Light) (Word 2013/2016. Top date doesn't fit; box needs to be 
		manually resized or font changed to 8 point)
		Mod (Word 2010. Works)
		Motion (Word 2010/2013/2016. Works if top date is manually changed to 
		36 point)
		Newsprint (Word 2010. Works but date is not populated)
		Perspective (Word 2010. Works)
		Pinstripes (Word 2010. Works)
		Puzzle (Word 2010. Top date doesn't fit; box needs to be manually 
		resized or font changed to 14 point)
		Retrospect (Word 2013/2016. Works)
		Semaphore (Word 2013/2016. Works)
		Sideline (Word 2010/2013/2016. Doesn't work in 2013 or 2016, works in 
		2010)
		Slice (Dark) (Word 2013/2016. Doesn't work)
		Slice (Light) (Word 2013/2016. Doesn't work)
		Stacks (Word 2010. Works)
		Tiles (Word 2010. Date doesn't fit unless changed to 26 point)
		Transcend (Word 2010. Works)
		ViewMaster (Word 2013/2016. Works)
		Whisp (Word 2013/2016. Works)
		
	The default value is Sideline.
	This parameter has an alias of CP.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER Dev
	Clears errors at the beginning of the script.
	Outputs all errors to a text file at the end of the script.
	
	This is used when the script developer requests more troubleshooting data.
	The text file is placed in the same folder from where the script is run.
	
	This parameter is disabled by default.
.PARAMETER Folder
	Specifies the optional output folder to save the output report. 
.PARAMETER ListAllInformation
    Specifies whether the script should only output an overview of what is configured 
	(like count of collections) or a full output with verbose information.
.PARAMETER Log
	Generates a log file for troubleshooting.
.PARAMETER ScriptInfo
	Outputs information about the script to a text file.
	The text file is placed in the same folder from where the script is run.
	
	This parameter is disabled by default.
	This parameter has an alias of SI.
.PARAMETER ReportFooter
	Outputs a footer section at the end of the report.

	This parameter has an alias of RF.
	
	Report Footer
		Report information:
			Created with: <Script Name> - Release Date: <Script Release Date>
			Script version: <Script Version>
			Started on <Date Time in Local Format>
			Elapsed time: nn days, nn hours, nn minutes, nn.nn seconds
			Ran from domain <Domain Name> by user <Username>
			Ran from the folder <Folder Name>

	Script Name and Script Release date are script-specific variables.
	Script version is a script variable.
	Start Date Time in Local Format is a script variable.
	Elapsed time is a calculated value.
	Domain Name is $env:USERDNSDOMAIN.
	Username is $env:USERNAME.
	Folder Name is a script variable.
.PARAMETER SMSProvider
    Some information relies on WMI queries that need to be executed against the SMS 
	Provider directly. 
    Please specify as FQDN.
    If not specified, it assumes localhost.
.PARAMETER Software
    Specifies whether the script should run an inventory of Applications, Packages and 
	OSD related objects.
.PARAMETER UserName
	Username to use for the Cover Page and Footer.
	Default value is contained in $env:username
	This parameter has an alias of UN.
	This parameter is only valid with the MSWORD and PDF output parameters.
.PARAMETER SmtpServer
	Specifies the optional email server to send the output report. 
.PARAMETER SmtpPort
	Specifies the SMTP port. 
	The default is 25.
.PARAMETER UseSSL
	Specifies whether to use SSL for the SmtpServer.
	The default is False.
.PARAMETER From
	Specifies the username for the From email address.
	If SmtpServer is used, this is a required parameter.
.PARAMETER To
	Specifies the username for the To email address.
	If SmtpServer is used, this is a required parameter.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 -PDF
	
	Will use all default values and save the document as a PDF file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.

.EXAMPLE
	PS C:\PSScript .\DocumentCM12R2v23.ps1 -CompanyName "Carl Webster Consulting" 
	-CoverPage "Mod" -UserName "Carl Webster"

	Will use:
		Carl Webster Consulting for the Company Name.
		Mod for the Cover Page format.
		Carl Webster for the User Name.
.EXAMPLE
	PS C:\PSScript .\DocumentCM12R2v23.ps1 -CN "Carl Webster Consulting" -CP "Mod" 
	-UN "Carl Webster"

	Will use:
		Carl Webster Consulting for the Company Name (alias CN).
		Mod for the Cover Page format (alias CP).
		Carl Webster for the User Name (alias UN).
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 -AddDateTime
	
	Will use all default values.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.

	Adds a date timestamp to the end of the file name.
	The timestamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2020 at 6PM is 2020-06-01_1800.
	Output filename will be Script_Template_2020-06-01_1800.docx
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 -PDF -AddDateTime
	
	Will use all default values and save the document as a PDF file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.

	Adds a date timestamp to the end of the file name.
	The timestamp is in the format of yyyy-MM-dd_HHmm.
	June 1, 2020 at 6PM is 2020-06-01_1800.
	Output filename will be Script_Template_2020-06-01_1800.PDF
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 -Folder \\FileServer\ShareName
	
	Will use all default values and save the document as a DOCX file.
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\CompanyName="Carl 
	Webster" or
	HKEY_CURRENT_USER\Software\Microsoft\Office\Common\UserInfo\Company="Carl Webster"
	$env:username = Administrator

	Carl Webster for the Company Name.
	Sideline for the Cover Page format.
	Administrator for the User Name.
	Output file will be saved in the path \\FileServer\ShareName
.EXAMPLE
	PS C:\PSScript >.\DocumentCM12R2v23.ps1 -Dev -ScriptInfo -Log
	
	Creates the default report.
	
	Creates a text file named ConfigMgrInventoryScriptErrors_yyyyMMddTHHmmssffff.txt that 
	contains up to the last 250 errors reported by the script.
	
	Creates a text file named ConfigMgrInventoryScriptInfo_yyyy-MM-dd_HHmm.txt that 
	contains all the script parameters and other basic information.
	
	Creates a text file for transcript logging named 
	ConfigMgrDocScriptTranscript_yyyyMMddTHHmmssffff.txt.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 
	-SmtpServer mail.domain.tld
	-From XDAdmin@domain.tld 
	-To ITGroup@domain.tld	

	The script will use the email server mail.domain.tld, sending from XDAdmin@domain.tld, 
	sending to ITGroup@domain.tld.

	The script will use the default SMTP port 25 and will not use SSL.

	If the current user's credentials are not valid to send an email, 
	the user will be prompted to enter valid credentials.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 
	-SmtpServer mailrelay.domain.tld
	-From Anonymous@domain.tld 
	-To ITGroup@domain.tld	

	***SENDING UNAUTHENTICATED EMAIL***

	The script will use the email server mailrelay.domain.tld, sending from 
	anonymous@domain.tld, sending to ITGroup@domain.tld.

	To send unauthenticated email using an email relay server requires the From email account 
	to use the name Anonymous.

	The script will use the default SMTP port 25 and will not use SSL.
	
	***GMAIL/G SUITE SMTP RELAY***
	https://support.google.com/a/answer/2956491?hl=en
	https://support.google.com/a/answer/176600?hl=en

	To send email using a Gmail or g-suite account, you may have to turn ON
	the "Less secure app access" option on your account.
	***GMAIL/G SUITE SMTP RELAY***

	The script will generate an anonymous secure password for the anonymous@domain.tld 
	account.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 
	-SmtpServer labaddomain-com.mail.protection.outlook.com
	-UseSSL
	-From SomeEmailAddress@labaddomain.com 
	-To ITGroupDL@labaddomain.com	

	***OFFICE 365 Example***

	https://docs.microsoft.com/en-us/exchange/mail-flow-best-practices/how-to-set-up-a-multifunction-device-or-application-to-send-email-using-office-3
	
	This uses Option 2 from the above link.
	
	***OFFICE 365 Example***

	The script will use the email server labaddomain-com.mail.protection.outlook.com, 
	sending from SomeEmailAddress@labaddomain.com, sending to ITGroupDL@labaddomain.com.

	The script will use the default SMTP port 25 and will use SSL.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 
	-SmtpServer smtp.office365.com 
	-SmtpPort 587
	-UseSSL 
	-From Webster@CarlWebster.com 
	-To ITGroup@CarlWebster.com	

	The script will use the email server smtp.office365.com on port 587 using SSL, 
	sending from webster@carlwebster.com, sending to ITGroup@carlwebster.com.

	If the current user's credentials are not valid to send an email, 
	the user will be prompted to enter valid credentials.
.EXAMPLE
	PS C:\PSScript > .\DocumentCM12R2v23.ps1 
	-SmtpServer smtp.gmail.com 
	-SmtpPort 587
	-UseSSL 
	-From Webster@CarlWebster.com 
	-To ITGroup@CarlWebster.com	

	*** NOTE ***
	To send email using a Gmail or g-suite account, you may have to turn ON
	the "Less secure app access" option on your account.
	*** NOTE ***
	
	The script will use the email server smtp.gmail.com on port 587 using SSL, 
	sending from webster@gmail.com, sending to ITGroup@carlwebster.com.

	If the current user's credentials are not valid to send an email, 
	the user will be prompted to enter valid credentials.
.INPUTS
	None.  You cannot pipe objects to this script.
.OUTPUTS
	No objects are output from this script.  
	This script creates a Word or PDF document.
.NOTES
	NAME: DocumentCM12R2v2.ps1
	VERSION: 2.40
	AUTHOR: David O'Brien and Carl Webster
	LASTEDIT: February 17, 2022
#>

#endregion

#region script parameters
#thanks to @jeffwouters and Michael B. Smith for helping me with these parameters
[CmdletBinding(SupportsShouldProcess = $False, ConfirmImpact = "None", DefaultParameterSetName = "Word") ]

Param(
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[Switch]$MSWord=$False,

	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Switch]$PDF=$False,

	[parameter(Mandatory=$False)] 
	[Alias("ADT")]
	[Switch]$AddDateTime=$False,
	
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CA")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyAddress="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CE")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyEmail="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CF")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyFax="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CN")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyName="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CPh")]
	[ValidateNotNullOrEmpty()]
	[string]$CompanyPhone="",
    
	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("CP")]
	[ValidateNotNullOrEmpty()]
	[string]$CoverPage="Sideline", 

	[parameter(Mandatory=$False)] 
	[Switch]$Dev=$False,
	
	[parameter(Mandatory=$False)] 
	[string]$Folder="",
	
	[parameter(Mandatory=$False)] 
	[Switch]$ListAllInformation,

	[parameter(Mandatory=$False)] 
	[Switch]$Log=$False,
	
	[parameter(Mandatory=$False)] 
	[Alias("SI")]
	[Switch]$ScriptInfo=$False,
	
	[parameter(Mandatory=$False)] 
	[Alias("RF")]
	[Switch]$ReportFooter=$False,

	[parameter(Mandatory=$False)] 
	[string]$SMSProvider='localhost',

	[parameter(Mandatory=$False)] 
	[Switch]$Software,

	[parameter(ParameterSetName="Word",Mandatory=$False)] 
	[parameter(ParameterSetName="PDF",Mandatory=$False)] 
	[Alias("UN")]
	[ValidateNotNullOrEmpty()]
	[string]$UserName=$env:username,

	[parameter(Mandatory=$False)] 
	[string]$SmtpServer="",

	[parameter(Mandatory=$False)] 
	[int]$SmtpPort=25,

	[parameter(Mandatory=$False)] 
	[Switch]$UseSSL=$False,

	[parameter(Mandatory=$False)] 
	[string]$From="",

	[parameter(Mandatory=$False)] 
	[string]$To=""

	)
#endregion

#region script change log	
#originally written by David O'Brien
#webster@carlwebster.com
#@carlwebster on Twitter
#http://www.CarlWebster.com

#Version 2.40 17-Feb-2022
#	Changed the date format for the transcript and error log files from yyyy-MM-dd_HHmm format to the FileDateTime format
#		The format is yyyyMMddTHHmmssffff (case-sensitive, using a 4-digit year, 2-digit month, 2-digit day, 
#		the letter T as a time separator, 2-digit hour, 2-digit minute, 2-digit second, and 4-digit millisecond). 
#		For example: 20221225T0840107271.
#	Fixed the German Table of Contents (Thanks to Rene Bigler)
#		From 
#			'de-'	{ 'Automatische Tabelle 2'; Break }
#		To
#			'de-'	{ 'Automatisches Verzeichnis 2'; Break }
#	In Function AbortScript, add test for the winword process and terminate it if it is running
#		Added stopping the transcript log if the log was enabled and started
#	In Functions AbortScript and SaveandCloseDocumentandShutdownWord, add code from Guy Leech to test for the "Id" property before using it
#	Replaced most script Exit calls with AbortScript to stop the transcript log if the log was enabled and started
#	Updated the help text
#	Updated the ReadMe file
#
#Version 2.39 11-Sep-2021
#	Add Function OutputReportFooter
#	Add Parameter ReportFooter
#		Outputs a footer section at the end of the report.
#		Report Footer
#			Report information:
#				Created with: <Script Name> - Release Date: <Script Release Date>
#				Script version: <Script Version>
#				Started on <Date Time in Local Format>
#				Elapsed time: nn days, nn hours, nn minutes, nn.nn seconds
#				Ran from domain <Domain Name> by user <Username>
#				Ran from the folder <Folder Name>
#	Change all Write-Verbose $(Get-Date) to add -Format G to put the dates in the user's locale - recommended by Guy Leech
#	Clean up Word formatting
#	Fix $Null comparisons to put $Null on the left
#	Update the following functions to latest versions
#		AddWordTable
#		CheckWordPrereq 
#		SetWordCellFormat
#		SetWordTableAlternateRowColor
#	Update Functions ShowScriptOptions and ProcessScriptEnd to add $ReportFooter

#Version 2.38 8-May-2020
#	Add checking for a Word version of 0, which indicates the Office installation needs repairing
#	Change color variables $wdColorGray15 and $wdColorGray05 from [long] to [int]
#	Change location of the -Dev, -Log, and -ScriptInfo output files from the script folder to the -Folder location (Thanks to Guy Leech for the "suggestion")
#	Reformatted the terminating Write-Error messages to make them more visible and readable in the console
#	Update Function SetWordCellFormat to change parameter $BackgroundColor to [int]

#Version 2.37 24-Apr-2020
#	Add Log parameter to create a transaction log for troubleshooting
#	Remove the SMTP parameterset and manually verify the parameters
#	Reorder parameters
#	Update Function SendEmail to handle anonymous unauthenticated email
#	Update Functions ShowScriptOptions and ProcessScriptEnd
#	Update Help Text

#Version 2.36 17-Dec-2019
#	Fix Swedish Table of Contents (Thanks to Johan Kallio)
#		From 
#			'sv-'	{ 'Automatisk innehållsförteckning2'; Break }
#		To
#			'sv-'	{ 'Automatisk innehållsförteckn2'; Break }
#	Updated help text

#Version 2.35 6-Apr-2018
#	Code cleanup from Visual Studio Code

#Version 2.34 5-Jan-2018
#	Add back in missing parameter AddDateTime
#	Add error checking for Get-SiteCode

#Version 2.33 19-Dec-2017
#	Added error checking for retrieving Site information. Abort the script if there was an error.
#	Changed code the set the $CMMPServerName variable by adding error checking (RJimenez)
#	Removed code that made sure all Parameters were set to default values if for some reason they did not exist or values were $Null
#	Reordered the parameters in the help text and parameter list so they match and are grouped better
#	Replaced _SetDocumentProperty function with Jim Moyle's Set-DocumentProperty function
#	Updated Function ProcessScriptEnd for the new Cover Page properties and Parameters
#	Updated Function ShowScriptOptions for the new Cover Page properties and Parameters
#	Updated Function UpdateDocumentProperties for the new Cover Page properties and Parameters
#	Updated help text

#Version 2.32 13-Feb-2017
#	Fixed French wording for Table of Contents 2 (Thanks to David Rouquier)

#Version 2.31 7-Nov-2016
#	Added Chinese language support
#	Fixed typos in help text

#Version 2.3 11-Jul-2016
#	Added support for Word 2016
#	Added -Dev parameter to create a text file of script errors
#	Added more script information to the console output when script starts
#	Added -ScriptInfo (SI) parameter to create a text file of script information
#	Added specifying an optional output folder
#	Added the option to email the output file
#	Changed from using arrays to populating data in tables to strings
#	Cleaned up some issues in the help text
#	Color variables needed to be [long] and not [int] except for $wdColorBlack which is 0
#	Fixed many $Null comparison issues
#	Fixed numerous issues discovered with the latest update to PowerShell V5
#	Fixed output to HTML with -AddDateTime parameter
#	Fixed saving the HTML file when using AddDateTime, now only one file is created not two
#	Fixed several incorrect variable names that kept PDFs from saving in Windows 10 and Office 2013
#	Fixed several spacing and typo errors
#	Fixed several typos
#	Removed the 10 second pauses waiting for Word to save and close
#
#endregion


Function AbortScript
{
	If($MSWord -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): System Cleanup"
		If(Test-Path variable:global:word)
		{
			$Script:Word.quit()
			[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Script:Word) | Out-Null
			Remove-Variable -Name word -Scope Global 4>$Null
		}
	}
	[gc]::collect() 
	[gc]::WaitForPendingFinalizers()

	If($MSWord -or $PDF)
	{
		#is the winword Process still running? kill it

		#find out our session (usually "1" except on TS/RDC or Citrix)
		$SessionID = (Get-Process -PID $PID).SessionId

		#Find out if winword running in our session
		$wordprocess = ((Get-Process 'WinWord' -ea 0) | Where-Object {$_.SessionId -eq $SessionID}) | Select-Object -Property Id 
		If( $wordprocess -and $wordprocess.Id -gt 0)
		{
			Write-Verbose "$(Get-Date -Format G): WinWord Process is still running. Attempting to stop WinWord Process # $($wordprocess.Id)"
			Stop-Process $wordprocess.Id -EA 0
		}
	}
	
	Write-Verbose "$(Get-Date -Format G): Script has been aborted"
	#stop transcript logging
	If($Log -eq $True) 
	{
		If($Script:StartLog -eq $True) 
		{
			try 
			{
				Stop-Transcript | Out-Null
				Write-Verbose "$(Get-Date -Format G): $Script:LogPath is ready for use"
			} 
			catch 
			{
				Write-Verbose "$(Get-Date -Format G): Transcript/log stop failed"
			}
		}
	}
	$ErrorActionPreference = $SaveEAPreference
	Exit
}

#region initial variable testing and setup
Set-StrictMode -Version Latest

#force  on
$PSDefaultParameterValues = @{"*:Verbose"=$True}
$SaveEAPreference         = $ErrorActionPreference
$ErrorActionPreference    = 'SilentlyContinue'
$script:MyVersion         = '2.40'
$Script:ScriptName        = "DocumentCM12R2v23.ps1"
$tmpdate                  = [datetime] "02/17/2022"
$Script:ReleaseDate       = $tmpdate.ToUniversalTime().ToShortDateString()

If($Null -eq $MSWord)
{
	If($PDF)
	{
		$MSWord = $False
	}
	Else
	{
		$MSWord = $True
	}
}

If($MSWord -eq $False -and $PDF -eq $False)
{
	$MSWord = $True
}

Write-Verbose "$(Get-Date -Format G): Testing output parameters"

If($MSWord)
{
	Write-Verbose "$(Get-Date -Format G): MSWord is set"
}
ElseIf($PDF)
{
	Write-Verbose "$(Get-Date -Format G): PDF is set"
}
Else
{
	$ErrorActionPreference = $SaveEAPreference
	Write-Verbose "$(Get-Date -Format G): Unable to determine output parameter"
	If($Null -eq $MSWord)
	{
		Write-Verbose "$(Get-Date -Format G): MSWord is Null"
	}
	ElseIf($Null -eq $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): PDF is Null"
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): MSWord is $MSWord"
		Write-Verbose "$(Get-Date -Format G): PDF is $PDF"
	}
	Write-Error "Unable to determine output parameter.  Script cannot continue"
	AbortScript
}

If($Folder -ne "")
{
	Write-Verbose "$(Get-Date -Format G): Testing folder path"
	#does it exist
	If(Test-Path $Folder -EA 0)
	{
		#it exists, now check to see if it is a folder and not a file
		If(Test-Path $Folder -pathType Container -EA 0)
		{
			#it exists and it is a folder
			Write-Verbose "$(Get-Date -Format G): Folder path $Folder exists and is a folder"
		}
		Else
		{
			#it exists but it is a file not a folder
			Write-Error "Folder $Folder is a file, not a folder.  Script cannot continue"
			AbortScript
		}
	}
	Else
	{
		#does not exist
		Write-Error "Folder $Folder does not exist.  Script cannot continue"
		AbortScript
	}
}

If($Folder -eq "")
{
	$Script:pwdpath = $pwd.Path
}
Else
{
	$Script:pwdpath = $Folder
}

If($Script:pwdpath.EndsWith("\"))
{
	#remove the trailing \
	$Script:pwdpath = $Script:pwdpath.SubString(0, ($Script:pwdpath.Length - 1))
}

If($Dev)
{
	$Error.Clear()
	$Script:DevErrorFile = "$($Script:pwdpath)\ConfigMgrInventoryScriptErrors_$(Get-Date -f FileDateTime).txt"
}

If($Log) 
{
	#start transcript logging
	$Script:LogPath = "$($Script:pwdpath)\ConfigMgrInventoryScriptTranscript_$(Get-Date -f FileDateTime).txt"
	
	try 
	{
		Start-Transcript -Path $Script:LogPath -Force -Verbose:$false | Out-Null
		Write-Verbose "$(Get-Date -Format G): Transcript/log started at $Script:LogPath"
		$Script:StartLog = $true
	} 
	catch 
	{
		Write-Verbose "$(Get-Date -Format G): Transcript/log failed at $Script:LogPath"
		$Script:StartLog = $false
	}
}

If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($From) -and [String]::IsNullOrEmpty($To))
{
	Write-Error "
	`n`n
	`tYou specified an SmtpServer but did not include a From or To email address.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}
If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($From) -and ![String]::IsNullOrEmpty($To))
{
	Write-Error "
	`n`n
	`tYou specified an SmtpServer and a To email address but did not include a From email address.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}
If(![String]::IsNullOrEmpty($SmtpServer) -and [String]::IsNullOrEmpty($To) -and ![String]::IsNullOrEmpty($From))
{
	Write-Error "
	`n`n
	`tYou specified an SmtpServer and a From email address but did not include a To email address.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}
If(![String]::IsNullOrEmpty($From) -and ![String]::IsNullOrEmpty($To) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`tYou specified From and To email addresses but did not include the SmtpServer.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}
If(![String]::IsNullOrEmpty($From) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`tYou specified a From email address but did not include the SmtpServer.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}
If(![String]::IsNullOrEmpty($To) -and [String]::IsNullOrEmpty($SmtpServer))
{
	Write-Error "
	`n`n
	`tYou specified a To email address but did not include the SmtpServer.
	`n`n
	`tScript cannot continue.
	`n`n"
	AbortScript
}

#endregion

#region initialize variables for word
[string]$Script:RunningOS = (Get-WmiObject -class Win32_OperatingSystem -EA 0).Caption

If($MSWord -or $PDF)
{
	#try and fix the issue with the $CompanyName variable
	$Script:CoName = $CompanyName
	Write-Verbose "$(Get-Date -Format G): CoName is $($Script:CoName)"
	
	#the following values were attained from 
	#http://groovy.codehaus.org/modules/scriptom/1.6.0/scriptom-office-2K3-tlb/apidocs/
	#http://msdn.microsoft.com/en-us/library/office/aa211923(v=office.11).aspx
	[int]$wdAlignPageNumberRight = 2
	[int]$wdColorGray15 = 14277081
	[int]$wdColorGray05 = 15987699 
	[int]$wdMove = 0
	[int]$wdSeekMainDocument = 0
	[int]$wdSeekPrimaryFooter = 4
	[int]$wdStory = 6
	[long]$wdColorRed = 255
	[int]$wdColorBlack = 0
	[int]$wdWord2007 = 12
	[int]$wdWord2010 = 14
	[int]$wdWord2013 = 15
	[int]$wdWord2016 = 16
	[int]$wdFormatDocumentDefault = 16
	[int]$wdFormatPDF = 17
	#http://blogs.technet.com/b/heyscriptingguy/archive/2006/03/01/how-can-i-right-align-a-single-column-in-a-word-table.aspx
	#http://msdn.microsoft.com/en-us/library/office/ff835817%28v=office.15%29.aspx
	[int]$wdAlignParagraphLeft = 0
	[int]$wdAlignParagraphCenter = 1
	[int]$wdAlignParagraphRight = 2
	#http://msdn.microsoft.com/en-us/library/office/ff193345%28v=office.15%29.aspx
	[int]$wdCellAlignVerticalTop = 0
	[int]$wdCellAlignVerticalCenter = 1
	[int]$wdCellAlignVerticalBottom = 2
	#http://msdn.microsoft.com/en-us/library/office/ff844856%28v=office.15%29.aspx
	[int]$wdAutoFitFixed = 0
	[int]$wdAutoFitContent = 1
	[int]$wdAutoFitWindow = 2
	#http://msdn.microsoft.com/en-us/library/office/ff821928%28v=office.15%29.aspx
	[int]$wdAdjustNone = 0
	[int]$wdAdjustProportional = 1
	[int]$wdAdjustFirstColumn = 2
	[int]$wdAdjustSameWidth = 3

	[int]$PointsPerTabStop = 36
	[int]$Indent0TabStops = 0 * $PointsPerTabStop
	[int]$Indent1TabStops = 1 * $PointsPerTabStop
	[int]$Indent2TabStops = 2 * $PointsPerTabStop
	[int]$Indent3TabStops = 3 * $PointsPerTabStop
	[int]$Indent4TabStops = 4 * $PointsPerTabStop

	# http://www.thedoctools.com/index.php?show=wt_style_names_english_danish_german_french
	[int]$wdStyleHeading1 = -2
	[int]$wdStyleHeading2 = -3
	[int]$wdStyleHeading3 = -4
	[int]$wdStyleHeading4 = -5
	[int]$wdStyleNoSpacing = -158
	[int]$wdTableGrid = -155

	#http://groovy.codehaus.org/modules/scriptom/1.6.0/scriptom-office-2K3-tlb/apidocs/org/codehaus/groovy/scriptom/tlb/office/word/WdLineStyle.html
	[int]$wdLineStyleNone = 0
	[int]$wdLineStyleSingle = 1

	[int]$wdHeadingFormatTrue = -1
	[int]$wdHeadingFormatFalse = 0 
}

#endregion

#region word specific functions
Function SetWordHashTable
{
	Param([string]$CultureCode)

	#optimized by Michael B. SMith
	
	# DE and FR translations for Word 2010 by Vladimir Radojevic
	# Vladimir.Radojevic@Commerzreal.com

	# DA translations for Word 2010 by Thomas Daugaard
	# Citrix Infrastructure Specialist at edgemo A/S

	# CA translations by Javier Sanchez 
	# CEO & Founder 101 Consulting

	#ca - Catalan
	#da - Danish
	#de - German
	#en - English
	#es - Spanish
	#fi - Finnish
	#fr - French
	#nb - Norwegian
	#nl - Dutch
	#pt - Portuguese
	#sv - Swedish
	#zh - Chinese
	
	[string]$toc = $(
		Switch ($CultureCode)
		{
			'ca-'	{ 'Taula automática 2'; Break }
			'da-'	{ 'Automatisk tabel 2'; Break }
			#'de-'	{ 'Automatische Tabelle 2'; Break }
			'de-'	{ 'Automatisches Verzeichnis 2'; Break } #changed 17-feb-2022 rene bigler
			'en-'	{ 'Automatic Table 2'; Break }
			'es-'	{ 'Tabla automática 2'; Break }
			'fi-'	{ 'Automaattinen taulukko 2'; Break }
			'fr-'	{ 'Table automatique 2'; Break } #changed 13-feb-2017 david roquier and samuel legrand
			'nb-'	{ 'Automatisk tabell 2'; Break }
			'nl-'	{ 'Automatische inhoudsopgave 2'; Break }
			'pt-'	{ 'Sumário Automático 2'; Break }
			# fix in 2.36 thanks to Johan Kallio 'sv-'	{ 'Automatisk innehållsförteckning2'; Break }
			'sv-'	{ 'Automatisk innehållsförteckn2'; Break }
			'zh-'	{ '自动目录 2'; Break }
		}
	)

	$Script:myHash                      = @{}
	$Script:myHash.Word_TableOfContents = $toc
	$Script:myHash.Word_NoSpacing       = $wdStyleNoSpacing
	$Script:myHash.Word_Heading1        = $wdStyleheading1
	$Script:myHash.Word_Heading2        = $wdStyleheading2
	$Script:myHash.Word_Heading3        = $wdStyleheading3
	$Script:myHash.Word_Heading4        = $wdStyleheading4
	$Script:myHash.Word_TableGrid       = $wdTableGrid
}

Function GetCulture
{
	Param([int]$WordValue)
	
	#codes obtained from http://support.microsoft.com/kb/221435
	#http://msdn.microsoft.com/en-us/library/bb213877(v=office.12).aspx
	$CatalanArray = 1027
	$ChineseArray = 2052,3076,5124,4100
	$DanishArray = 1030
	$DutchArray = 2067, 1043
	$EnglishArray = 3081, 10249, 4105, 9225, 6153, 8201, 5129, 13321, 7177, 11273, 2057, 1033, 12297
	$FinnishArray = 1035
	$FrenchArray = 2060, 1036, 11276, 3084, 12300, 5132, 13324, 6156, 8204, 10252, 7180, 9228, 4108
	$GermanArray = 1031, 3079, 5127, 4103, 2055
	$NorwegianArray = 1044, 2068
	$PortugueseArray = 1046, 2070
	$SpanishArray = 1034, 11274, 16394, 13322, 9226, 5130, 7178, 12298, 17418, 4106, 18442, 19466, 6154, 15370, 10250, 20490, 3082, 14346, 8202
	$SwedishArray = 1053, 2077

	#ca - Catalan
	#da - Danish
	#de - German
	#en - English
	#es - Spanish
	#fi - Finnish
	#fr - French
	#nb - Norwegian
	#nl - Dutch
	#pt - Portuguese
	#sv - Swedish
	#zh - Chinese

	Switch ($WordValue)
	{
		{$CatalanArray -contains $_} {$CultureCode = "ca-"}
		{$ChineseArray -contains $_} {$CultureCode = "zh-"}
		{$DanishArray -contains $_} {$CultureCode = "da-"}
		{$DutchArray -contains $_} {$CultureCode = "nl-"}
		{$EnglishArray -contains $_} {$CultureCode = "en-"}
		{$FinnishArray -contains $_} {$CultureCode = "fi-"}
		{$FrenchArray -contains $_} {$CultureCode = "fr-"}
		{$GermanArray -contains $_} {$CultureCode = "de-"}
		{$NorwegianArray -contains $_} {$CultureCode = "nb-"}
		{$PortugueseArray -contains $_} {$CultureCode = "pt-"}
		{$SpanishArray -contains $_} {$CultureCode = "es-"}
		{$SwedishArray -contains $_} {$CultureCode = "sv-"}
		Default {$CultureCode = "en-"}
	}
	
	Return $CultureCode
}

Function ValidateCoverPage
{
	Param([int]$xWordVersion, [string]$xCP, [string]$CultureCode)
	
	$xArray = ""
	
	Switch ($CultureCode)
	{
		'ca-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "En bandes", "Faceta", "Filigrana",
					"Integral", "Ió (clar)", "Ió (fosc)", "Línia lateral",
					"Moviment", "Quadrícula", "Retrospectiu", "Sector (clar)",
					"Sector (fosc)", "Semàfor", "Visualització principal", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Austin", "En bandes", "Faceta", "Filigrana",
					"Integral", "Ió (clar)", "Ió (fosc)", "Línia lateral",
					"Moviment", "Quadrícula", "Retrospectiu", "Sector (clar)",
					"Sector (fosc)", "Semàfor", "Visualització", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabet", "Anual", "Austin", "Conservador",
					"Contrast", "Cubicles", "Diplomàtic", "Exposició",
					"Línia lateral", "Mod", "Mosiac", "Moviment", "Paper de diari",
					"Perspectiva", "Piles", "Quadrícula", "Sobri",
					"Transcendir", "Trencaclosques")
				}
			}

		'da-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "BevægElse", "Brusen", "Facet", "Filigran", 
					"Gitter", "Integral", "Ion (lys)", "Ion (mørk)", 
					"Retro", "Semafor", "Sidelinje", "Stribet", 
					"Udsnit (lys)", "Udsnit (mørk)", "Visningsmaster")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("BevægElse", "Brusen", "Ion (lys)", "Filigran",
					"Retro", "Semafor", "Visningsmaster", "Integral",
					"Facet", "Gitter", "Stribet", "Sidelinje", "Udsnit (lys)",
					"Udsnit (mørk)", "Ion (mørk)", "Austin")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("BevægElse", "Moderat", "Perspektiv", "Firkanter",
					"Overskrid", "Alfabet", "Kontrast", "Stakke", "Fliser", "Gåde",
					"Gitter", "Austin", "Eksponering", "Sidelinje", "Enkel",
					"Nålestribet", "Årlig", "Avispapir", "Tradionel")
				}
			}

		'de-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Bewegung", "Facette", "Filigran", 
					"Gebändert", "Integral", "Ion (dunkel)", "Ion (hell)", 
					"Pfiff", "Randlinie", "Raster", "Rückblick", 
					"Segment (dunkel)", "Segment (hell)", "Semaphor", 
					"ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Semaphor", "Segment (hell)", "Ion (hell)",
					"Raster", "Ion (dunkel)", "Filigran", "Rückblick", "Pfiff",
					"ViewMaster", "Segment (dunkel)", "Verbunden", "Bewegung",
					"Randlinie", "Austin", "Integral", "Facette")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Austin", "Bewegung", "Durchscheinend",
					"Herausgestellt", "Jährlich", "Kacheln", "Kontrast", "Kubistisch",
					"Modern", "Nadelstreifen", "Perspektive", "Puzzle", "Randlinie",
					"Raster", "Schlicht", "Stapel", "Traditionell", "Zeitungspapier")
				}
			}

		'en-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Banded", "Facet", "Filigree", "Grid",
					"Integral", "Ion (Dark)", "Ion (Light)", "Motion", "Retrospect",
					"Semaphore", "Sideline", "Slice (Dark)", "Slice (Light)", "ViewMaster",
					"Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Annual", "Austere", "Austin", "Conservative",
					"Contrast", "Cubicles", "Exposure", "Grid", "Mod", "Motion", "Newsprint",
					"Perspective", "Pinstripes", "Puzzle", "Sideline", "Stacks", "Tiles", "Transcend")
				}
			}

		'es-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Con bandas", "Cortar (oscuro)", "Cuadrícula", 
					"Whisp", "Faceta", "Filigrana", "Integral", "Ion (claro)", 
					"Ion (oscuro)", "Línea lateral", "Movimiento", "Retrospectiva", 
					"Semáforo", "Slice (luz)", "Vista principal", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Whisp", "Vista principal", "Filigrana", "Austin",
					"Slice (luz)", "Faceta", "Semáforo", "Retrospectiva", "Cuadrícula",
					"Movimiento", "Cortar (oscuro)", "Línea lateral", "Ion (oscuro)",
					"Ion (claro)", "Integral", "Con bandas")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabeto", "Anual", "Austero", "Austin", "Conservador",
					"Contraste", "Cuadrícula", "Cubículos", "Exposición", "Línea lateral",
					"Moderno", "Mosaicos", "Movimiento", "Papel periódico",
					"Perspectiva", "Pilas", "Puzzle", "Rayas", "Sobrepasar")
				}
			}

		'fi-'	{
				If($xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Filigraani", "Integraali", "Ioni (tumma)",
					"Ioni (vaalea)", "Opastin", "Pinta", "Retro", "Sektori (tumma)",
					"Sektori (vaalea)", "Vaihtuvavärinen", "ViewMaster", "Austin",
					"Kuiskaus", "Liike", "Ruudukko", "Sivussa")
				}
				ElseIf($xWordVersion -eq $wdWord2013)
				{
					$xArray = ("Filigraani", "Integraali", "Ioni (tumma)",
					"Ioni (vaalea)", "Opastin", "Pinta", "Retro", "Sektori (tumma)",
					"Sektori (vaalea)", "Vaihtuvavärinen", "ViewMaster", "Austin",
					"Kiehkura", "Liike", "Ruudukko", "Sivussa")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Aakkoset", "Askeettinen", "Austin", "Kontrasti",
					"Laatikot", "Liike", "Liituraita", "Mod", "Osittain peitossa",
					"Palapeli", "Perinteinen", "Perspektiivi", "Pinot", "Ruudukko",
					"Ruudut", "Sanomalehtipaperi", "Sivussa", "Vuotuinen", "Ylitys")
				}
			}

		'fr-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("À bandes", "Austin", "Facette", "Filigrane", 
					"Guide", "Intégrale", "Ion (clair)", "Ion (foncé)", 
					"Lignes latérales", "Quadrillage", "Rétrospective", "Secteur (clair)", 
					"Secteur (foncé)", "Sémaphore", "ViewMaster", "Whisp")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alphabet", "Annuel", "Austère", "Austin", 
					"Blocs empilés", "Classique", "Contraste", "Emplacements de bureau", 
					"Exposition", "Guide", "Ligne latérale", "Moderne", 
					"Mosaïques", "Mots croisés", "Papier journal", "Perspective",
					"Quadrillage", "Rayures fines", "Transcendant")
				}
			}

		'nb-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "BevegElse", "Dempet", "Fasett", "Filigran",
					"Integral", "Ion (lys)", "Ion (mørk)", "Retrospekt", "Rutenett",
					"Sektor (lys)", "Sektor (mørk)", "Semafor", "Sidelinje", "Stripet",
					"ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabet", "Årlig", "Avistrykk", "Austin", "Avlukker",
					"BevegElse", "Engasjement", "Enkel", "Fliser", "Konservativ",
					"Kontrast", "Mod", "Perspektiv", "Puslespill", "Rutenett", "Sidelinje",
					"Smale striper", "Stabler", "Transcenderende")
				}
			}

		'nl-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Beweging", "Facet", "Filigraan", "Gestreept",
					"Integraal", "Ion (donker)", "Ion (licht)", "Raster",
					"Segment (Light)", "Semafoor", "Slice (donker)", "Spriet",
					"Terugblik", "Terzijde", "ViewMaster")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Aantrekkelijk", "Alfabet", "Austin", "Bescheiden",
					"Beweging", "Blikvanger", "Contrast", "Eenvoudig", "Jaarlijks",
					"Krantenpapier", "Krijtstreep", "Kubussen", "Mod", "Perspectief",
					"Puzzel", "Raster", "Stapels",
					"Tegels", "Terzijde")
				}
			}

		'pt-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Animação", "Austin", "Em Tiras", "Exibição Mestra",
					"Faceta", "Fatia (Clara)", "Fatia (Escura)", "Filete", "Filigrana", 
					"Grade", "Integral", "Íon (Claro)", "Íon (Escuro)", "Linha Lateral",
					"Retrospectiva", "Semáforo")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabeto", "Animação", "Anual", "Austero", "Austin", "Baias",
					"Conservador", "Contraste", "Exposição", "Grade", "Ladrilhos",
					"Linha Lateral", "Listras", "Mod", "Papel Jornal", "Perspectiva", "Pilhas",
					"Quebra-cabeça", "Transcend")
				}
			}

		'sv-'	{
				If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ("Austin", "Band", "Fasett", "Filigran", "Integrerad", "Jon (ljust)",
					"Jon (mörkt)", "Knippe", "Rutnät", "RörElse", "Sektor (ljus)", "Sektor (mörk)",
					"Semafor", "Sidlinje", "VisaHuvudsida", "Återblick")
				}
				ElseIf($xWordVersion -eq $wdWord2010)
				{
					$xArray = ("Alfabetmönster", "Austin", "Enkelt", "Exponering", "Konservativt",
					"Kontrast", "Kritstreck", "Kuber", "Perspektiv", "Plattor", "Pussel", "Rutnät",
					"RörElse", "Sidlinje", "Sobert", "Staplat", "Tidningspapper", "Årligt",
					"Övergående")
				}
			}

		'zh-'	{
				If($xWordVersion -eq $wdWord2010 -or $xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
				{
					$xArray = ('奥斯汀', '边线型', '花丝', '怀旧', '积分',
					'离子(浅色)', '离子(深色)', '母版型', '平面', '切片(浅色)',
					'切片(深色)', '丝状', '网格', '镶边', '信号灯',
					'运动型')
				}
			}

		Default	{
					If($xWordVersion -eq $wdWord2013 -or $xWordVersion -eq $wdWord2016)
					{
						$xArray = ("Austin", "Banded", "Facet", "Filigree", "Grid",
						"Integral", "Ion (Dark)", "Ion (Light)", "Motion", "Retrospect",
						"Semaphore", "Sideline", "Slice (Dark)", "Slice (Light)", "ViewMaster",
						"Whisp")
					}
					ElseIf($xWordVersion -eq $wdWord2010)
					{
						$xArray = ("Alphabet", "Annual", "Austere", "Austin", "Conservative",
						"Contrast", "Cubicles", "Exposure", "Grid", "Mod", "Motion", "Newsprint",
						"Perspective", "Pinstripes", "Puzzle", "Sideline", "Stacks", "Tiles", "Transcend")
					}
				}
	}
	
	If($xArray -contains $xCP)
	{
		$xArray = $Null
		Return $True
	}
	Else
	{
		$xArray = $Null
		Return $False
	}
}

Function CheckWordPrereq
{
	If((Test-Path  REGISTRY::HKEY_CLASSES_ROOT\Word.Application) -eq $False)
	{
		$ErrorActionPreference = $SaveEAPreference
		
		If(($MSWord -eq $False) -and ($PDF -eq $True))
		{
			Write-Host "`n`n`t`tThis script uses Microsoft Word's SaveAs PDF function, please install Microsoft Word`n`n"
			AbortScript
		}
		Else
		{
			Write-Host "`n`n`t`tThis script directly outputs to Microsoft Word, please install Microsoft Word`n`n"
			AbortScript
		}
	}

	#find out our session (usually "1" except on TS/RDC or Citrix)
	$SessionID = (Get-Process -PID $PID).SessionId
	
	#Find out if winword runsning in our session
	[bool]$wordrunning = $null –ne ((Get-Process 'WinWord' -ea 0) | Where-Object {$_.SessionId -eq $SessionID})
	If($wordrunning)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Host "`n`n`tPlease close all instances of Microsoft Word before running this report.`n`n"
		AbortScript
	}
}

Function ValidateCompanyName
{
	[bool]$xResult = Test-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "CompanyName"
	If($xResult)
	{
		Return Get-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "CompanyName"
	}
	Else
	{
		$xResult = Test-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "Company"
		If($xResult)
		{
			Return Get-RegistryValue "HKCU:\Software\Microsoft\Office\Common\UserInfo" "Company"
		}
		Else
		{
			Return ""
		}
	}
}

Function Set-DocumentProperty {
    <#
	.SYNOPSIS
	Function to set the Title Page document properties in MS Word
	.DESCRIPTION
	Long description
	.PARAMETER Document
	Current Document Object
	.PARAMETER DocProperty
	Parameter description
	.PARAMETER Value
	Parameter description
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Title -Value 'MyTitle'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Company -Value 'MyCompany'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Author -Value 'Jim Moyle'
	.EXAMPLE
	Set-DocumentProperty -Document $Script:Doc -DocProperty Subject -Value 'MySubjectTitle'
	.NOTES
	Function Created by Jim Moyle June 2017
	Twitter : @JimMoyle
	#>
    param (
        [object]$Document,
        [String]$DocProperty,
        [string]$Value
    )
    try {
        $binding = "System.Reflection.BindingFlags" -as [type]
        $builtInProperties = $Document.BuiltInDocumentProperties
        $property = [System.__ComObject].invokemember("item", $binding::GetProperty, $null, $BuiltinProperties, $DocProperty)
        [System.__ComObject].invokemember("value", $binding::SetProperty, $null, $property, $Value)
    }
    catch {
        Write-Warning "Failed to set $DocProperty to $Value"
    }
}

Function FindWordDocumentEnd
{
	#return focus to main document    
	$Script:Doc.ActiveWindow.ActivePane.view.SeekView = $wdSeekMainDocument
	#move to the end of the current document
	$Script:Selection.EndKey($wdStory,$wdMove) | Out-Null
}

Function SetupWord
{
	Write-Verbose "$(Get-Date -Format G): Setting up Word"
    
	# Setup word for output
	Write-Verbose "$(Get-Date -Format G): Create Word comObject."
	$Script:Word = New-Object -comobject "Word.Application" -EA 0 4>$Null
	
	If(!$? -or $Null -eq $Script:Word)
	{
		Write-Warning "The Word object could not be created.  You may need to repair your Word installation."
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		The Word object could not be created.
		`n`n
		`t`t
		You may need to repair your Word installation.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	Write-Verbose "$(Get-Date -Format G): Determine Word language value"
	If( ( validStateProp $Script:Word Language Value__ ) )
	{
		[int]$Script:WordLanguageValue = [int]$Script:Word.Language.Value__
	}
	Else
	{
		[int]$Script:WordLanguageValue = [int]$Script:Word.Language
	}

	If(!($Script:WordLanguageValue -gt -1))
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		Unable to determine the Word language value.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}
	Write-Verbose "$(Get-Date -Format G): Word language value is $($Script:WordLanguageValue)"
	
	$Script:WordCultureCode = GetCulture $Script:WordLanguageValue
	
	SetWordHashTable $Script:WordCultureCode
	
	[int]$Script:WordVersion = [int]$Script:Word.Version
	If($Script:WordVersion -eq $wdWord2016)
	{
		$Script:WordProduct = "Word 2016"
	}
	ElseIf($Script:WordVersion -eq $wdWord2013)
	{
		$Script:WordProduct = "Word 2013"
	}
	ElseIf($Script:WordVersion -eq $wdWord2010)
	{
		$Script:WordProduct = "Word 2010"
	}
	ElseIf($Script:WordVersion -eq $wdWord2007)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		Microsoft Word 2007 is no longer supported.
		`n`n
		`t`t
		Script will end.
		`n`n
		"
		AbortScript
	}
	ElseIf($Script:WordVersion -eq 0)
	{
		Write-Error "
		`n`n
		`t`t
		The Word Version is 0. You should run a full online repair of your Office installation.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}
	Else
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		You are running an untested or unsupported version of Microsoft Word.
		`n`n
		`t`t
		Script will end.
		`n`n
		`t`t
		Please send info on your version of Word to webster@carlwebster.com
		`n`n
		"
		AbortScript
	}

	#only validate CompanyName if the field is blank
	If([String]::IsNullOrEmpty($Script:CoName))
	{
		Write-Verbose "$(Get-Date -Format G): Company name is blank.  Retrieve company name from registry."
		$TmpName = ValidateCompanyName
		
		If([String]::IsNullOrEmpty($TmpName))
		{
			Write-Warning "`n`n`t`tCompany Name is blank so Cover Page will not show a Company Name."
			Write-Warning "`n`t`tCheck HKCU:\Software\Microsoft\Office\Common\UserInfo for Company or CompanyName value."
			Write-Warning "`n`t`tYou may want to use the -CompanyName parameter if you need a Company Name on the cover page.`n`n"
		}
		Else
		{
			$Script:CoName = $TmpName
			Write-Verbose "$(Get-Date -Format G): Updated company name to $($Script:CoName)"
		}
	}

	If($Script:WordCultureCode -ne "en-")
	{
		Write-Verbose "$(Get-Date -Format G): Check Default Cover Page for $($WordCultureCode)"
		[bool]$CPChanged = $False
		Switch ($Script:WordCultureCode)
		{
			'ca-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Línia lateral"
						$CPChanged = $True
					}
				}

			'da-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidelinje"
						$CPChanged = $True
					}
				}

			'de-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Randlinie"
						$CPChanged = $True
					}
				}

			'es-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Línea lateral"
						$CPChanged = $True
					}
				}

			'fi-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sivussa"
						$CPChanged = $True
					}
				}

			'fr-'	{
					If($CoverPage -eq "Sideline")
					{
						If($Script:WordVersion -eq $wdWord2013 -or $Script:WordVersion -eq $wdWord2016)
						{
							$CoverPage = "Lignes latérales"
							$CPChanged = $True
						}
						Else
						{
							$CoverPage = "Ligne latérale"
							$CPChanged = $True
						}
					}
				}

			'nb-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidelinje"
						$CPChanged = $True
					}
				}

			'nl-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Terzijde"
						$CPChanged = $True
					}
				}

			'pt-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Linha Lateral"
						$CPChanged = $True
					}
				}

			'sv-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "Sidlinje"
						$CPChanged = $True
					}
				}

			'zh-'	{
					If($CoverPage -eq "Sideline")
					{
						$CoverPage = "边线型"
						$CPChanged = $True
					}
				}
		}

		If($CPChanged)
		{
			Write-Verbose "$(Get-Date -Format G): Changed Default Cover Page from Sideline to $($CoverPage)"
		}
	}

	Write-Verbose "$(Get-Date -Format G): Validate cover page $($CoverPage) for culture code $($Script:WordCultureCode)"
	[bool]$ValidCP = $False
	
	$ValidCP = ValidateCoverPage $Script:WordVersion $CoverPage $Script:WordCultureCode
	
	If(!$ValidCP)
	{
		$ErrorActionPreference = $SaveEAPreference
		Write-Verbose "$(Get-Date -Format G): Word language value $($Script:WordLanguageValue)"
		Write-Verbose "$(Get-Date -Format G): Culture code $($Script:WordCultureCode)"
		Write-Error "
		`n`n
		`t`t
		For $($Script:WordProduct), $($CoverPage) is not a valid Cover Page option.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	ShowScriptOptions

	$Script:Word.Visible = $False

	#http://jdhitsolutions.com/blog/2012/05/san-diego-2012-powershell-deep-dive-slides-and-demos/
	#using Jeff's Demo-WordReport.ps1 file for examples
	Write-Verbose "$(Get-Date -Format G): Load Word Templates"

	[bool]$Script:CoverPagesExist = $False
	[bool]$BuildingBlocksExist = $False

	$Script:Word.Templates.LoadBuildingBlocks()
	#word 2010/2013/2016
	$BuildingBlocksCollection = $Script:Word.Templates | Where-Object {$_.name -eq "Built-In Building Blocks.dotx"}

	Write-Verbose "$(Get-Date -Format G): Attempt to load cover page $($CoverPage)"
	$part = $Null

	$BuildingBlocksCollection | 
	ForEach-Object{
		If ($_.BuildingBlockEntries.Item($CoverPage).Name -eq $CoverPage) 
		{
			$BuildingBlocks = $_
		}
	}        

	If($Null -ne $BuildingBlocks)
	{
		$BuildingBlocksExist = $True

		Try 
		{
			$part = $BuildingBlocks.BuildingBlockEntries.Item($CoverPage)
		}

		Catch
		{
			$part = $Null
		}

		If($Null -ne $part)
		{
			$Script:CoverPagesExist = $True
		}
	}

	If(!$Script:CoverPagesExist)
	{
		Write-Verbose "$(Get-Date -Format G): Cover Pages are not installed or the Cover Page $($CoverPage) does not exist."
		Write-Warning "Cover Pages are not installed or the Cover Page $($CoverPage) does not exist."
		Write-Warning "This report will not have a Cover Page."
	}

	Write-Verbose "$(Get-Date -Format G): Create empty word doc"
	$Script:Doc = $Script:Word.Documents.Add()
	If($Null -eq $Script:Doc)
	{
		Write-Verbose "$(Get-Date -Format G): "
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		An empty Word document could not be created.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	$Script:Selection = $Script:Word.Selection
	If($Null -eq $Script:Selection)
	{
		Write-Verbose "$(Get-Date -Format G): "
		$ErrorActionPreference = $SaveEAPreference
		Write-Error "
		`n`n
		`t`t
		An unknown error happened selecting the entire Word document for default formatting options.
		`n`n
		`t`t
		Script cannot continue.
		`n`n
		"
		AbortScript
	}

	#set Default tab stops to 1/2 inch (this line is not from Jeff Hicks)
	#36 = .50"
	$Script:Word.ActiveDocument.DefaultTabStop = 36

	#Disable Spell and Grammar Check to resolve issue and improve performance (from Pat Coughlin)
	Write-Verbose "$(Get-Date -Format G): Disable grammar and spell checking"
	#bug reported 1-Apr-2014 by Tim Mangan
	#save current options first before turning them off
	$Script:CurrentGrammarOption = $Script:Word.Options.CheckGrammarAsYouType
	$Script:CurrentSpellingOption = $Script:Word.Options.CheckSpellingAsYouType
	$Script:Word.Options.CheckGrammarAsYouType = $False
	$Script:Word.Options.CheckSpellingAsYouType = $False

	If($BuildingBlocksExist)
	{
		#insert new page, getting ready for table of contents
		Write-Verbose "$(Get-Date -Format G): Insert new page, getting ready for table of contents"
		$part.Insert($Script:Selection.Range,$True) | Out-Null
		$Script:Selection.InsertNewPage()

		#table of contents
		Write-Verbose "$(Get-Date -Format G): Table of Contents - $($Script:MyHash.Word_TableOfContents)"
		$toc = $BuildingBlocks.BuildingBlockEntries.Item($Script:MyHash.Word_TableOfContents)
		If($Null -eq $toc)
		{
			Write-Verbose "$(Get-Date -Format G): "
			Write-Verbose "$(Get-Date -Format G): Table of Content - $($Script:MyHash.Word_TableOfContents) could not be retrieved."
			Write-Warning "This report will not have a Table of Contents."
		}
		Else
		{
			$toc.insert($Script:Selection.Range,$True) | Out-Null
		}
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G): Table of Contents are not installed."
		Write-Warning "Table of Contents are not installed so this report will not have a Table of Contents."
	}

	#set the footer
	Write-Verbose "$(Get-Date -Format G): Set the footer"
	[string]$footertext = "Report created by $username"

	#get the footer
	Write-Verbose "$(Get-Date -Format G): Get the footer and format font"
	$Script:Doc.ActiveWindow.ActivePane.view.SeekView = $wdSeekPrimaryFooter
	#get the footer and format font
	$footers = $Script:Doc.Sections.Last.Footers
	ForEach ($footer in $footers) 
	{
		If($footer.exists) 
		{
			$footer.range.Font.name = "Calibri"
			$footer.range.Font.size = 8
			$footer.range.Font.Italic = $True
			$footer.range.Font.Bold = $True
		}
	} #end ForEach
	Write-Verbose "$(Get-Date -Format G): Footer text"
	$Script:Selection.HeaderFooter.Range.Text = $footerText

	#add page numbering
	Write-Verbose "$(Get-Date -Format G): Add page numbering"
	$Script:Selection.HeaderFooter.PageNumbers.Add($wdAlignPageNumberRight) | Out-Null

	FindWordDocumentEnd
	Write-Verbose "$(Get-Date -Format G):"
	#end of Jeff Hicks 
}

Function UpdateDocumentProperties
{
	Param([string]$AbstractTitle, [string]$SubjectTitle)
	#updated 8-Jun-2017 with additional cover page fields
	#Update document properties
	If($MSWORD -or $PDF)
	{
		If($Script:CoverPagesExist)
		{
			Write-Verbose "$(Get-Date -Format G): Set Cover Page Properties"
			#8-Jun-2017 put these 4 items in alpha order
            Set-DocumentProperty -Document $Script:Doc -DocProperty Author -Value $UserName
            Set-DocumentProperty -Document $Script:Doc -DocProperty Company -Value $Script:CoName
            Set-DocumentProperty -Document $Script:Doc -DocProperty Subject -Value $SubjectTitle
            Set-DocumentProperty -Document $Script:Doc -DocProperty Title -Value $Script:title

			#Get the Coverpage XML part
			$cp = $Script:Doc.CustomXMLParts | Where-Object {$_.NamespaceURI -match "coverPageProps$"}

			#get the abstract XML part
			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "Abstract"}
			#set the text
			If([String]::IsNullOrEmpty($Script:CoName))
			{
				[string]$abstract = $AbstractTitle
			}
			Else
			{
				[string]$abstract = "$($AbstractTitle) for $($Script:CoName)"
			}
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "CompanyAddress"}
			#set the text
			[string]$abstract = $CompanyAddress
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "CompanyEmail"}
			#set the text
			[string]$abstract = $CompanyEmail
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "CompanyFax"}
			#set the text
			[string]$abstract = $CompanyFax
			$ab.Text = $abstract

			#added 8-Jun-2017
			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "CompanyPhone"}
			#set the text
			[string]$abstract = $CompanyPhone
			$ab.Text = $abstract

			$ab = $cp.documentelement.ChildNodes | Where-Object {$_.basename -eq "PublishDate"}
			#set the text
			[string]$abstract = (Get-Date -Format d).ToString()
			$ab.Text = $abstract

			Write-Verbose "$(Get-Date -Format G): Update the Table of Contents"
			#update the Table of Contents
			$Script:Doc.TablesOfContents.item(1).Update()
			$cp = $Null
			$ab = $Null
			$abstract = $Null
		}
	}
}
#endregion

#region registry functions
#http://stackoverflow.com/questions/5648931/test-if-registry-value-exists
# This Function just gets $True or $False
Function Test-RegistryValue($path, $name)
{
	$key = Get-Item -LiteralPath $path -EA 0
	$key -and $Null -ne $key.GetValue($name, $Null)
}

# Gets the specified registry value or $Null if it is missing
Function Get-RegistryValue($path, $name)
{
	$key = Get-Item -LiteralPath $path -EA 0
	If($key)
	{
		$key.GetValue($name, $Null)
	}
	Else
	{
		$Null
	}
}
#endregion

#region word line output functions

Function WriteWordLine
#Function created by Ryan Revord
#@rsrevord on Twitter
#Function created to make output to Word easy in this script
#updated 27-Mar-2014 to include font name, font size, italics and bold options
{
	Param([int]$style=0, 
	[int]$tabs = 0, 
	[string]$name = '', 
	[string]$value = '', 
	[string]$fontName=$Null,
	[int]$fontSize=0,
	[bool]$italics=$False,
	[bool]$boldface=$False,
	[Switch]$nonewline)
	
	#Build output style
	[string]$output = ""
	Switch ($style)
	{
		0 {$Script:Selection.Style = $Script:MyHash.Word_NoSpacing}
		1 {$Script:Selection.Style = $Script:MyHash.Word_Heading1}
		2 {$Script:Selection.Style = $Script:MyHash.Word_Heading2}
		3 {$Script:Selection.Style = $Script:MyHash.Word_Heading3}
		4 {$Script:Selection.Style = $Script:MyHash.Word_Heading4}
		Default {$Script:Selection.Style = $Script:MyHash.Word_NoSpacing}
	}
	
	#build # of tabs
	While($tabs -gt 0)
	{ 
		$output += "`t"; $tabs--; 
	}
 
	If(![String]::IsNullOrEmpty($fontName)) 
	{
		$Script:Selection.Font.name = $fontName
	} 

	If($fontSize -ne 0) 
	{
		$Script:Selection.Font.size = $fontSize
	} 
 
	If($italics -eq $True) 
	{
		$Script:Selection.Font.Italic = $True
	} 
 
	If($boldface -eq $True) 
	{
		$Script:Selection.Font.Bold = $True
	} 

	#output the rest of the parameters.
	$output += $name + $value
	$Script:Selection.TypeText($output)
 
	#test for new WriteWordLine 0.
	If($nonewline)
	{
		# Do nothing.
	} 
	Else 
	{
		$Script:Selection.TypeParagraph()
	}
}

#endregion

#region Iain's Word table functions

<#
.Synopsis
	Add a table to a Microsoft Word document
.DESCRIPTION
	This function adds a table to a Microsoft Word document from either an array of
	Hashtables or an array of PSCustomObjects.

	Using this function is quicker than setting each table cell individually but can
	only utilise the built-in MS Word table autoformats. Individual tables cells can
	be altered after the table has been appended to the document (a table reference
	is returned).
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray

	This example adds table to the MS Word document, utilising all key/value pairs in
	the array of hashtables. Column headers will display the key names as defined.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray -List

	This example adds table to the MS Word document, utilising all key/value pairs in
	the array of hashtables. No column headers will be added, in a ListView format.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -CustomObject $PSCustomObjectArray

	This example adds table to the MS Word document, utilising all note property names
	the array of PSCustomObjects. Column headers will display the note property names.
	Note: the columns might not be displayed in the order that they were defined. To
	ensure columns are displayed in the required order utilise the -Columns parameter.
.EXAMPLE
	AddWordTable -Hashtable $HashtableArray -Columns FirstName,LastName,EmailAddress

	This example adds a table to the MS Word document, but only using the specified
	key names: FirstName, LastName and EmailAddress. If other keys are present in the
	array of Hashtables they will be ignored.
.EXAMPLE
	AddWordTable -CustomObject $PSCustomObjectArray -Columns FirstName,LastName,EmailAddress -Headers "First Name","Last Name","Email Address"

	This example adds a table to the MS Word document, but only using the specified
	PSCustomObject note properties: FirstName, LastName and EmailAddress. If other note
	properties are present in the array of PSCustomObjects they will be ignored. The
	display names for each specified column header has been overridden to display a
	custom header. Note: the order of the header names must match the specified columns.
#>

Function AddWordTable
{
	[CmdletBinding()]
	Param
	(
		# Array of Hashtable (including table headers)
		[Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ParameterSetName='Hashtable', Position=0)]
		[ValidateNotNullOrEmpty()] [System.Collections.Hashtable[]] $Hashtable,
		# Array of PSCustomObjects
		[Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ParameterSetName='CustomObject', Position=0)]
		[ValidateNotNullOrEmpty()] [PSCustomObject[]] $CustomObject,
		# Array of Hashtable key names or PSCustomObject property names to include, in display order.
		# If not supplied then all Hashtable keys or all PSCustomObject properties will be displayed.
		[Parameter(ValueFromPipelineByPropertyName=$True)] [AllowNull()] [string[]] $Columns = $Null,
		# Array of custom table header strings in display order.
		[Parameter(ValueFromPipelineByPropertyName=$True)] [AllowNull()] [string[]] $Headers = $Null,
		# AutoFit table behavior.
		[Parameter(ValueFromPipelineByPropertyName=$True)] [AllowNull()] [int] $AutoFit = -1,
		# List view (no headers)
		[Switch] $List,
		# Grid lines
		[Switch] $NoGridLines,
		[Switch] $NoInternalGridLines,
		# Built-in Word table formatting style constant
		# Would recommend only $wdTableFormatContempory for normal usage (possibly $wdTableFormatList5 for List view)
		[Parameter(ValueFromPipelineByPropertyName=$True)] [int] $Format = 0
	)

	Begin 
	{
		Write-Debug ("Using parameter set '{0}'" -f $PSCmdlet.ParameterSetName);
		## Check if -Columns wasn't specified but -Headers were (saves some additional parameter sets!)
		If(($Null -eq $Columns) -and ($Null -eq $Headers)) 
		{
			Write-Warning "No columns specified and therefore, specified headers will be ignored.";
			$Columns = $Null;
		}
		ElseIf(($Null -ne $Columns) -and ($Null -ne $Headers)) 
		{
			## Check if number of specified -Columns matches number of specified -Headers
			If($Columns.Length -ne $Headers.Length) 
			{
				Write-Error "The specified number of columns does not match the specified number of headers.";
			}
		} ## end ElseIf
	} ## end Begin

	Process
	{
		## Build the Word table data string to be converted to a range and then a table later.
		[System.Text.StringBuilder] $WordRangeString = New-Object System.Text.StringBuilder;

		Switch ($PSCmdlet.ParameterSetName) 
		{
			'CustomObject' 
			{
				If($Null -eq $Columns) 
				{
					## Build the available columns from all availble PSCustomObject note properties
					[string[]] $Columns = @();
					## Add each NoteProperty name to the array
					ForEach($Property in ($CustomObject | Get-Member -MemberType NoteProperty)) 
					{ 
						$Columns += $Property.Name; 
					}
				}

				## Add the table headers from -Headers or -Columns (except when in -List(view)
				If(-not $List) 
				{
					Write-Debug ("$(Get-Date -Format G): `t`tBuilding table headers");
					If($Null -ne $Headers) 
					{
                        [ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Headers));
					}
					Else 
					{ 
                        [ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Columns));
					}
				}

				## Iterate through each PSCustomObject
				Write-Debug ("$(Get-Date -Format G): `t`tBuilding table rows");
				ForEach($Object in $CustomObject) 
				{
					$OrderedValues = @();
					## Add each row item in the specified order
					ForEach($Column in $Columns) 
					{ 
						$OrderedValues += $Object.$Column; 
					}
					## Use the ordered list to add each column in specified order
					[ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $OrderedValues));
				} ## end ForEach
				Write-Debug ("$(Get-Date -Format G): `t`t`tAdded '{0}' table rows" -f ($CustomObject.Count));
			} ## end CustomObject

			Default 
			{   ## Hashtable
				If($Null -eq $Columns) 
				{
					## Build the available columns from all available hashtable keys. Hopefully
					## all Hashtables have the same keys (they should for a table).
					$Columns = $Hashtable[0].Keys;
				}

				## Add the table headers from -Headers or -Columns (except when in -List(view)
				If(-not $List) 
				{
					Write-Debug ("$(Get-Date -Format G): `t`tBuilding table headers");
					If($Null -ne $Headers) 
					{ 
						[ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Headers));
					}
					Else 
					{
						[ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $Columns));
					}
				}
                
				## Iterate through each Hashtable
				Write-Debug ("$(Get-Date -Format G): `t`tBuilding table rows");
				ForEach($Hash in $Hashtable) 
				{
					$OrderedValues = @();
					## Add each row item in the specified order
					ForEach($Column in $Columns) 
					{ 
						$OrderedValues += $Hash.$Column; 
					}
					## Use the ordered list to add each column in specified order
					[ref] $Null = $WordRangeString.AppendFormat("{0}`n", [string]::Join("`t", $OrderedValues));
				} ## end ForEach

				Write-Debug ("$(Get-Date -Format G): `t`t`tAdded '{0}' table rows" -f $Hashtable.Count);
			} ## end default
		} ## end Switch

		## Create a MS Word range and set its text to our tab-delimited, concatenated string
		Write-Debug ("$(Get-Date -Format G): `t`tBuilding table range");
		$WordRange = $Script:Doc.Application.Selection.Range;
		$WordRange.Text = $WordRangeString.ToString();

		## Create hash table of named arguments to pass to the ConvertToTable method
		$ConvertToTableArguments = @{ Separator = [Microsoft.Office.Interop.Word.WdTableFieldSeparator]::wdSeparateByTabs; }

		## Negative built-in styles are not supported by the ConvertToTable method
		If($Format -ge 0) 
		{
			$ConvertToTableArguments.Add("Format", $Format);
			$ConvertToTableArguments.Add("ApplyBorders", $True);
			$ConvertToTableArguments.Add("ApplyShading", $True);
			$ConvertToTableArguments.Add("ApplyFont", $True);
			$ConvertToTableArguments.Add("ApplyColor", $True);
			If(!$List) 
			{ 
				$ConvertToTableArguments.Add("ApplyHeadingRows", $True); 
			}
			$ConvertToTableArguments.Add("ApplyLastRow", $True);
			$ConvertToTableArguments.Add("ApplyFirstColumn", $True);
			$ConvertToTableArguments.Add("ApplyLastColumn", $True);
		}

		## Invoke ConvertToTable method - with named arguments - to convert Word range to a table
		## See http://msdn.microsoft.com/en-us/library/office/aa171893(v=office.11).aspx
		Write-Debug ("$(Get-Date -Format G): `t`tConverting range to table");
		## Store the table reference just in case we need to set alternate row coloring
		$WordTable = $WordRange.GetType().InvokeMember(
			"ConvertToTable",                               # Method name
			[System.Reflection.BindingFlags]::InvokeMethod, # Flags
			$Null,                                          # Binder
			$WordRange,                                     # Target (self!)
			([Object[]]($ConvertToTableArguments.Values)),  ## Named argument values
			$Null,                                          # Modifiers
			$Null,                                          # Culture
			([String[]]($ConvertToTableArguments.Keys))     ## Named argument names
		);

		## Implement grid lines (will wipe out any existing formatting
		If($Format -lt 0) 
		{
			Write-Debug ("$(Get-Date -Format G): `t`tSetting table format");
			$WordTable.Style = $Format;
		}

		## Set the table autofit behavior
		If($AutoFit -ne -1) 
		{ 
			$WordTable.AutoFitBehavior($AutoFit); 
		}

		If(!$List)
		{
			#the next line causes the heading row to flow across page breaks
			$WordTable.Rows.First.Headingformat = $wdHeadingFormatTrue;
		}

		If(!$NoGridLines) 
		{
			$WordTable.Borders.InsideLineStyle = $wdLineStyleSingle;
			$WordTable.Borders.OutsideLineStyle = $wdLineStyleSingle;
		}
		If($NoGridLines) 
		{
			$WordTable.Borders.InsideLineStyle = $wdLineStyleNone;
			$WordTable.Borders.OutsideLineStyle = $wdLineStyleNone;
		}
		If($NoInternalGridLines) 
		{
			$WordTable.Borders.InsideLineStyle = $wdLineStyleNone;
			$WordTable.Borders.OutsideLineStyle = $wdLineStyleSingle;
		}

		Return $WordTable;

	} ## end Process
}

<#
.Synopsis
	Sets the format of one or more Word table cells
.DESCRIPTION
	This function sets the format of one or more table cells, either from a collection
	of Word COM object cell references, an individual Word COM object cell reference or
	a hashtable containing Row and Column information.

	The font name, font size, bold, italic , underline and shading values can be used.
.EXAMPLE
	SetWordCellFormat -Hashtable $Coordinates -Table $TableReference -Bold

	This example sets all text to bold that is contained within the $TableReference
	Word table, using an array of hashtables. Each hashtable contain a pair of co-
	ordinates that is used to select the required cells. Note: the hashtable must
	contain the.Row and.Column key names. For example:
	@ { Row = 7; Column = 3 } to set the cell at row 7 and column 3 to bold.
.EXAMPLE
	$RowCollection = $Table.Rows.First.Cells
	SetWordCellFormat -Collection $RowCollection -Bold -Size 10

	This example sets all text to size 8 and bold for all cells that are contained
	within the first row of the table.
	Note: the $Table.Rows.First.Cells Returns a collection of Word COM cells objects
	that are in the first table row.
.EXAMPLE
	$ColumnCollection = $Table.Columns.Item(2).Cells
	SetWordCellFormat -Collection $ColumnCollection -BackgroundColor 255

	This example sets the background (shading) of all cells in the table's second
	column to red.
	Note: the $Table.Columns.Item(2).Cells Returns a collection of Word COM cells objects
	that are in the table's second column.
.EXAMPLE
	SetWordCellFormat -Cell $Table.Cell(17,3) -Font "Tahoma" -Color 16711680

	This example sets the font to Tahoma and the text color to blue for the cell located
	in the table's 17th row and 3rd column.
	Note: the $Table.Cell(17,3) Returns a single Word COM cells object.
#>

Function SetWordCellFormat 
{
	[CmdletBinding(DefaultParameterSetName='Collection')]
	Param (
		# Word COM object cell collection reference
		[Parameter(Mandatory=$True, ValueFromPipeline=$True, ParameterSetName='Collection', Position=0)] [ValidateNotNullOrEmpty()] $Collection,
		# Word COM object individual cell reference
		[Parameter(Mandatory=$True, ParameterSetName='Cell', Position=0)] [ValidateNotNullOrEmpty()] $Cell,
		# Hashtable of cell co-ordinates
		[Parameter(Mandatory=$True, ParameterSetName='Hashtable', Position=0)] [ValidateNotNullOrEmpty()] [System.Collections.Hashtable[]] $Coordinates,
		# Word COM object table reference
		[Parameter(Mandatory=$True, ParameterSetName='Hashtable', Position=1)] [ValidateNotNullOrEmpty()] $Table,
		# Font name
		[Parameter()] [AllowNull()] [string] $Font = $Null,
		# Font color
		[Parameter()] [AllowNull()] $Color = $Null,
		# Font size
		[Parameter()] [ValidateNotNullOrEmpty()] [int] $Size = 0,
		# Cell background color
		[Parameter()] [AllowNull()] [int]$BackgroundColor = $Null,
		# Force solid background color
		[Switch] $Solid,
		[Switch] $Bold,
		[Switch] $Italic,
		[Switch] $Underline
	)

	Begin 
	{
		Write-Debug ("Using parameter set '{0}'." -f $PSCmdlet.ParameterSetName);
	}

	Process 
	{
		Switch ($PSCmdlet.ParameterSetName) 
		{
			'Collection' {
				ForEach($Cell in $Collection) 
				{
					If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
					If($Bold) { $Cell.Range.Font.Bold = $True; }
					If($Italic) { $Cell.Range.Font.Italic = $True; }
					If($Underline) { $Cell.Range.Font.Underline = 1; }
					If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
					If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
					If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
					If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
				} # end ForEach
			} # end Collection
			'Cell' 
			{
				If($Bold) { $Cell.Range.Font.Bold = $True; }
				If($Italic) { $Cell.Range.Font.Italic = $True; }
				If($Underline) { $Cell.Range.Font.Underline = 1; }
				If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
				If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
				If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
				If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
				If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
			} # end Cell
			'Hashtable' 
			{
				ForEach($Coordinate in $Coordinates) 
				{
					$Cell = $Table.Cell($Coordinate.Row, $Coordinate.Column);
					If($Bold) { $Cell.Range.Font.Bold = $True; }
					If($Italic) { $Cell.Range.Font.Italic = $True; }
					If($Underline) { $Cell.Range.Font.Underline = 1; }
					If($Null -ne $Font) { $Cell.Range.Font.Name = $Font; }
					If($Null -ne $Color) { $Cell.Range.Font.Color = $Color; }
					If($Size -ne 0) { $Cell.Range.Font.Size = $Size; }
					If($Null -ne $BackgroundColor) { $Cell.Shading.BackgroundPatternColor = $BackgroundColor; }
					If($Solid) { $Cell.Shading.Texture = 0; } ## wdTextureNone
				}
			} # end Hashtable
		} # end Switch
	} # end process
}

<#
.Synopsis
	Sets alternate row colors in a Word table
.DESCRIPTION
	This function sets the format of alternate rows within a Word table using the
	specified $BackgroundColor. This function is expensive (in performance terms) as
	it recursively sets the format on alternate rows. It would be better to pick one
	of the predefined table formats (if one exists)? Obviously the more rows, the
	longer it takes :'(

	Note: this function is called by the AddWordTable function if an alternate row
	format is specified.
.EXAMPLE
	SetWordTableAlternateRowColor -Table $TableReference -BackgroundColor 255

	This example sets every-other table (starting with the first) row and sets the
	background color to red (wdColorRed).
.EXAMPLE
	SetWordTableAlternateRowColor -Table $TableReference -BackgroundColor 39423 -Seed Second

	This example sets every other table (starting with the second) row and sets the
	background color to light orange (weColorLightOrange).
#>

Function SetWordTableAlternateRowColor 
{
	[CmdletBinding()]
	Param (
		# Word COM object table reference
		[Parameter(Mandatory=$True, ValueFromPipeline=$True, Position=0)] [ValidateNotNullOrEmpty()] $Table,
		# Alternate row background color
		[Parameter(Mandatory=$True, Position=1)] [ValidateNotNull()] [int] $BackgroundColor,
		# Alternate row starting seed
		[Parameter(ValueFromPipelineByPropertyName=$True, Position=2)] [ValidateSet('First','Second')] [string] $Seed = 'First'
	)

	Process 
	{
		$StartDateTime = Get-Date;
		Write-Debug ("{0}: `t`tSetting alternate table row colors.." -f $StartDateTime);

		## Determine the row seed (only really need to check for 'Second' and default to 'First' otherwise
		If($Seed.ToLower() -eq 'second') 
		{ 
			$StartRowIndex = 2; 
		}
		Else 
		{ 
			$StartRowIndex = 1; 
		}

		For($AlternateRowIndex = $StartRowIndex; $AlternateRowIndex -lt $Table.Rows.Count; $AlternateRowIndex += 2) 
		{ 
			$Table.Rows.Item($AlternateRowIndex).Shading.BackgroundPatternColor = $BackgroundColor;
		}

		## I've put verbose calls in here we can see how expensive this functionality actually is.
		$EndDateTime = Get-Date;
		$ExecutionTime = New-TimeSpan -Start $StartDateTime -End $EndDateTime;
		Write-Debug ("{0}: `t`tDone setting alternate row style color in '{1}' seconds" -f $EndDateTime, $ExecutionTime.TotalSeconds);
	}
}
#endregion

#region general script functions
Function ShowScriptOptions
{
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): Add DateTime      : $AddDateTime"
	If($MSWORD -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Company Address   : $CompanyAddress"
		Write-Verbose "$(Get-Date -Format G): Company Email     : $CompanyEmail"
		Write-Verbose "$(Get-Date -Format G): Company Fax       : $CompanyFax"
		Write-Verbose "$(Get-Date -Format G): Company Name      : $Script:CoName"
		Write-Verbose "$(Get-Date -Format G): Company Phone     : $CompanyPhone"
		Write-Verbose "$(Get-Date -Format G): Cover Page        : $CoverPage"
	}
	Write-Verbose "$(Get-Date -Format G): Dev               : $Dev"
	If($Dev)
	{
		Write-Verbose "$(Get-Date -Format G): DevErrorFile      : $Script:DevErrorFile"
	}
	Write-Verbose "$(Get-Date -Format G): Filename1         : $Script:FileName1"
	If($PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Filename2         : $Script:FileName2"
	}
	Write-Verbose "$(Get-Date -Format G): Folder            : $Folder"
	Write-Verbose "$(Get-Date -Format G): From              : $From"
	Write-Verbose "$(Get-Date -Format G): ListAllInformation: $ListAllInformation"
	Write-Verbose "$(Get-Date -Format G): Log               : $Log"
	Write-Verbose "$(Get-Date -Format G): Report Footer     : $ReportFooter"
	Write-Verbose "$(Get-Date -Format G): Save As PDF       : $PDF"
	Write-Verbose "$(Get-Date -Format G): Save As WORD      : $MSWORD"
	Write-Verbose "$(Get-Date -Format G): ScriptInfo        : $ScriptInfo"
	Write-Verbose "$(Get-Date -Format G): SMSProvider       : $SMSProvider"
	Write-Verbose "$(Get-Date -Format G): Smtp Port         : $SmtpPort"
	Write-Verbose "$(Get-Date -Format G): Smtp Server       : $SmtpServer"
	Write-Verbose "$(Get-Date -Format G): Software          : $Software"
	Write-Verbose "$(Get-Date -Format G): To                : $To"
	Write-Verbose "$(Get-Date -Format G): Use SSL           : $UseSSL"
	If($MSWORD -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): User Name         : $UserName"
	}
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): OS Detected       : $RunningOS"
	Write-Verbose "$(Get-Date -Format G): PSUICulture       : $PSUICulture"
	Write-Verbose "$(Get-Date -Format G): PSCulture         : $PSCulture"
	If($MSWORD -or $PDF)
	{
		Write-Verbose "$(Get-Date -Format G): Word version      : $Script:WordProduct"
		Write-Verbose "$(Get-Date -Format G): Word language     : $Script:WordLanguageValue"
	}
	Write-Verbose "$(Get-Date -Format G): PoSH version      : $($Host.Version)"
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): Script start      : $Script:ScriptStartTime"
	Write-Verbose "$(Get-Date -Format G): "
	Write-Verbose "$(Get-Date -Format G): "
}

Function validStateProp( [object] $object, [string] $topLevel, [string] $secondLevel )
{
	#function created 8-jan-2014 by Michael B. Smith
	if( $object )
	{
		If( ( Get-Member -Name $topLevel -InputObject $object ) )
		{
			If( ( Get-Member -Name $secondLevel -InputObject $object.$topLevel ) )
			{
				Return $True
			}
		}
	}
	Return $False
}

Function SaveandCloseDocumentandShutdownWord
{
	#bug fix 1-Apr-2014
	#reset Grammar and Spelling options back to their original settings
	$Script:Word.Options.CheckGrammarAsYouType = $Script:CurrentGrammarOption
	$Script:Word.Options.CheckSpellingAsYouType = $Script:CurrentSpellingOption

	Write-Verbose "$(Get-Date -Format G): Save and Close document and Shutdown Word"
	If($Script:WordVersion -eq $wdWord2010)
	{
		#the $saveFormat below passes StrictMode 2
		#I found this at the following two links
		#http://blogs.technet.com/b/bshukla/archive/2011/09/27/3347395.aspx
		#http://msdn.microsoft.com/en-us/library/microsoft.office.interop.word.wdsaveformat(v=office.14).aspx
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Saving as DOCX file first before saving to PDF"
		}
		Else
		{
			Write-Verbose "$(Get-Date -Format G): Saving DOCX file"
		}
		If($AddDateTime)
		{
			$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).docx"
			If($PDF)
			{
				$Script:FileName2 += "_$(Get-Date -f yyyy-MM-dd_HHmm).pdf"
			}
		}
		Write-Verbose "$(Get-Date -Format G): Running $($Script:WordProduct) and detected operating system $($Script:RunningOS)"
		$saveFormat = [Enum]::Parse([Microsoft.Office.Interop.Word.WdSaveFormat], "wdFormatDocumentDefault")
		$Script:Doc.SaveAs([REF]$Script:FileName1, [ref]$SaveFormat)
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Now saving as PDF"
			$saveFormat = [Enum]::Parse([Microsoft.Office.Interop.Word.WdSaveFormat], "wdFormatPDF")
			$Script:Doc.SaveAs([REF]$Script:FileName2, [ref]$saveFormat)
		}
	}
	ElseIf($Script:WordVersion -eq $wdWord2013 -or $Script:WordVersion -eq $wdWord2016)
	{
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Saving as DOCX file first before saving to PDF"
		}
		Else
		{
			Write-Verbose "$(Get-Date -Format G): Saving DOCX file"
		}
		If($AddDateTime)
		{
			$Script:FileName1 += "_$(Get-Date -f yyyy-MM-dd_HHmm).docx"
			If($PDF)
			{
				$Script:FileName2 += "_$(Get-Date -f yyyy-MM-dd_HHmm).pdf"
			}
		}
		Write-Verbose "$(Get-Date -Format G): Running $($Script:WordProduct) and detected operating system $($Script:RunningOS)"
		$Script:Doc.SaveAs2([REF]$Script:FileName1, [ref]$wdFormatDocumentDefault)
		If($PDF)
		{
			Write-Verbose "$(Get-Date -Format G): Now saving as PDF"
			$Script:Doc.SaveAs([REF]$Script:FileName2, [ref]$wdFormatPDF)
		}
	}

	Write-Verbose "$(Get-Date -Format G): Closing Word"
	$Script:Doc.Close()
	$Script:Word.Quit()
	Write-Verbose "$(Get-Date -Format G): System Cleanup"
	[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Script:Word) | Out-Null
	If(Test-Path variable:global:word)
	{
		Remove-Variable -Name word -Scope Global 4>$Null
	}
	$SaveFormat = $Null
	[gc]::collect() 
	[gc]::WaitForPendingFinalizers()
	
	#is the winword Process still running? kill it

	#find out our session (usually "1" except on TS/RDC or Citrix)
	$SessionID = (Get-Process -PID $PID).SessionId

	#Find out if winword running in our session
	$wordprocess = ((Get-Process 'WinWord' -ea 0) | Where-Object {$_.SessionId -eq $SessionID}) | Select-Object -Property Id 
	If( $wordprocess -and $wordprocess.Id -gt 0)
	{
		Write-Verbose "$(Get-Date -Format G): WinWord Process is still running. Attempting to stop WinWord Process # $($wordprocess.Id)"
		Stop-Process $wordprocess.Id -EA 0
	}
}

Function SetFileName1andFileName2
{
	Param([string]$OutputFileName)

	#set $filename1 and $filename2 with no file extension
	If($AddDateTime)
	{
		[string]$Script:FileName1 = "$($Script:pwdpath)\$($OutputFileName)"
		If($PDF)
		{
			[string]$Script:FileName2 = "$($Script:pwdpath)\$($OutputFileName)"
		}
	}

	If($MSWord -or $PDF)
	{
		CheckWordPreReq

		If(!$AddDateTime)
		{
			[string]$Script:FileName1 = "$($Script:pwdpath)\$($OutputFileName).docx"
			If($PDF)
			{
				[string]$Script:FileName2 = "$($Script:pwdpath)\$($OutputFileName).pdf"
			}
		}

		SetupWord
	}
}

Function OutputReportFooter
{
	<#
	Report Footer
		Report information:
			Created with: <Script Name> - Release Date: <Script Release Date>
			Script version: <Script Version>
			Started on <Date Time in Local Format>
			Elapsed time: nn days, nn hours, nn minutes, nn.nn seconds
			Ran from domain <Domain Name> by user <Username>
			Ran from the folder <Folder Name>

	Script Name and Script Release date are script-specific variables.
	Script version is a script variable.
	Start Date Time in Local Format is a script variable.
	Domain Name is $env:USERDNSDOMAIN.
	Username is $env:USERNAME.
	Folder Name is a script variable.
	#>

	$runtime = $(Get-Date) - $Script:ScriptStartTime
	$Str = [string]::format("{0} days, {1} hours, {2} minutes, {3}.{4} seconds",
		$runtime.Days,
		$runtime.Hours,
		$runtime.Minutes,
		$runtime.Seconds,
		$runtime.Milliseconds)

	If($MSWORD -or $PDF)
	{
		$Script:selection.InsertNewPage()
		WriteWordLine 1 0 "Report Footer"
		WriteWordLine 2 0 "Report Information:"
		WriteWordLine 0 1 "Created with: $Script:ScriptName - Release Date: $Script:ReleaseDate"
		WriteWordLine 0 1 "Script version: $Script:MyVersion"
		WriteWordLine 0 1 "Started on $Script:ScriptStartTime"
		WriteWordLine 0 1 "Elapsed time: $Str"
		WriteWordLine 0 1 "Ran from domain $env:USERDNSDOMAIN by user $env:USERNAME"
		WriteWordLine 0 1 "Ran from the folder $Script:pwdpath"
	}
}

Function ProcessDocumentOutput
{
	If($MSWORD -or $PDF)
	{
		SaveandCloseDocumentandShutdownWord
	}

	$GotFile = $False

	If($PDF)
	{
		If(Test-Path "$($Script:FileName2)")
		{
			Write-Verbose "$(Get-Date -Format G): $($Script:FileName2) is ready for use"
			Write-Verbose "$(Get-Date -Format G): "
			$GotFile = $True
		}
		Else
		{
			Write-Warning "$(Get-Date): Unable to save the output file, $($Script:FileName2)"
			Write-Error "Unable to save the output file, $($Script:FileName2)"
		}
	}
	Else
	{
		If(Test-Path "$($Script:FileName1)")
		{
			Write-Verbose "$(Get-Date -Format G): $($Script:FileName1) is ready for use"
			Write-Verbose "$(Get-Date -Format G): "
			$GotFile = $True
		}
		Else
		{
			Write-Warning "$(Get-Date): Unable to save the output file, $($Script:FileName1)"
			Write-Error "Unable to save the output file, $($Script:FileName1)"
		}
	}

	#email output file if requested
	If($GotFile -and ![System.String]::IsNullOrEmpty( $SmtpServer ))
	{
		If($PDF)
		{
			$emailAttachment = $Script:FileName2
		}
		Else
		{
			$emailAttachment = $Script:FileName1
		}
		SendEmail $emailAttachment
	}
}
#endregion

#region script setup function
Function ProcessScriptSetup
{
	$Script:ScriptStartTime = Get-Date
}
#endregion

#region email function
Function SendEmail
{
	Param([array]$Attachments)
	Write-Verbose "$(Get-Date -Format G): Prepare to email"

	$emailAttachment = $Attachments
	$emailSubject = $Script:Title
	$emailBody = @"
Hello, <br />
<br />
$Script:Title is attached.

"@ 

	If($Dev)
	{
		Out-File -FilePath $Script:DevErrorFile -InputObject $error 4>$Null
	}

	$error.Clear()
	
	If($From -Like "anonymous@*")
	{
		#https://serverfault.com/questions/543052/sending-unauthenticated-mail-through-ms-exchange-with-powershell-windows-server
		$anonUsername = "anonymous"
		$anonPassword = ConvertTo-SecureString -String "anonymous" -AsPlainText -Force
		$anonCredentials = New-Object System.Management.Automation.PSCredential($anonUsername,$anonPassword)

		If($UseSSL)
		{
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-UseSSL -credential $anonCredentials *>$Null 
		}
		Else
		{
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-credential $anonCredentials *>$Null 
		}
		
		If($?)
		{
			Write-Verbose "$(Get-Date -Format G): Email successfully sent using anonymous credentials"
		}
		ElseIf(!$?)
		{
			$e = $error[0]

			Write-Verbose "$(Get-Date -Format G): Email was not sent:"
			Write-Warning "$(Get-Date): Exception: $e.Exception" 
		}
	}
	Else
	{
		If($UseSSL)
		{
			Write-Verbose "$(Get-Date -Format G): Trying to send email using current user's credentials with SSL"
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
			-UseSSL *>$Null
		}
		Else
		{
			Write-Verbose  "$(Get-Date): Trying to send email using current user's credentials without SSL"
			Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
			-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To *>$Null
		}

		If(!$?)
		{
			$e = $error[0]
			
			#error 5.7.57 is O365 and error 5.7.0 is gmail
			If($null -ne $e.Exception -and $e.Exception.ToString().Contains("5.7"))
			{
				#The server response was: 5.7.xx SMTP; Client was not authenticated to send anonymous mail during MAIL FROM
				Write-Verbose "$(Get-Date -Format G): Current user's credentials failed. Ask for usable credentials."

				If($Dev)
				{
					Out-File -FilePath $Script:DevErrorFile -InputObject $error -Append 4>$Null
				}

				$error.Clear()

				$emailCredentials = Get-Credential -UserName $From -Message "Enter the password to send email"

				If($UseSSL)
				{
					Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
					-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
					-UseSSL -credential $emailCredentials *>$Null 
				}
				Else
				{
					Send-MailMessage -Attachments $emailAttachment -Body $emailBody -BodyAsHtml -From $From `
					-Port $SmtpPort -SmtpServer $SmtpServer -Subject $emailSubject -To $To `
					-credential $emailCredentials *>$Null 
				}

				If($?)
				{
					Write-Verbose "$(Get-Date -Format G): Email successfully sent using new credentials"
				}
				ElseIf(!$?)
				{
					$e = $error[0]

					Write-Verbose "$(Get-Date -Format G): Email was not sent:"
					Write-Warning "$(Get-Date): Exception: $e.Exception" 
				}
			}
			Else
			{
				Write-Verbose "$(Get-Date -Format G): Email was not sent:"
				Write-Warning "$(Get-Date): Exception: $e.Exception" 
			}
		}
	}
}
#endregion

#region script core
#Script begins

ProcessScriptSetup


###REPLACE AFTER THIS SECTION WITH YOUR SCRIPT###

###The function SetFileName1andFileName2 needs your script output filename###
SetFileName1andFileName2 'InventoryScript'

###change title for your report###
[string]$Script:Title = 'System Center 2012 R2 Configuration Manager Documentation Script for {0}' -f $CompanyName;

###REPLACE AFTER THIS SECTION WITH YOUR SCRIPT###

Function Convert-NormalDateToConfigMgrDate 
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[string]$starttime
	)

	Return [System.Management.ManagementDateTimeconverter]::ToDMTFDateTime($starttime)
}

Function Read-ScheduleToken 
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[object]$ServiceWindow
	)

	$SMS_ScheduleMethods = 'SMS_ScheduleMethods'
	$class_SMS_ScheduleMethods = [wmiclass]''
	$class_SMS_ScheduleMethods.psbase.Path ="ROOT\SMS\Site_$($SiteCode):$($SMS_ScheduleMethods)"

	Return $class_SMS_ScheduleMethods.ReadFromString($ServiceWindow.ServiceWindowSchedules)
}

Function Convert-WeekDay 
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[string]$Day
	)
	### day of week
	Switch ($Day)
	{
		1 {$weekday = 'Sunday'}
		2 {$weekday = 'Monday'}
		3 {$weekday = 'Tuesday'}
		4 {$weekday = 'Wednesday'}
		5 {$weekday = 'Thursday'}
		6 {$weekday = 'Friday'}
		7 {$weekday = 'Saturday'}
	}
	Return $weekday
}

Function Convert-Time {
	param (
		[int]$time
	)
	$min = $time % 60
	If($min -le 9) 
	{
		$min = "0$($min)" 
	}
	$hrs = [Math]::Truncate($time/60)

	$NewTime = "$($hrs):$($min)"
	Return $NewTime
}

Function Get-SiteCode
{
	$wqlQuery = 'SELECT * FROM SMS_ProviderLocation'
	$a = Get-WmiObject -Query $wqlQuery -Namespace 'root\sms' -ComputerName $SMSProvider 4>$Null
	$a | ForEach-Object {
		If($_.ProviderForLocalSite)
		{
			$script:SiteCode = $_.SiteCode
		}
	}
	Return $SiteCode
}

Function Get-ExecuteWqlQuery
{
	param
	(
		[System.Object]
		$siteServerName,

		[System.Object]
		$query
	)

	$ReturnValue = $null
	$connectionManager = New-Object Microsoft.ConfigurationManagement.ManagementProvider.WqlQueryEngine.WqlConnectionManager

	If($connectionManager.Connect($siteServerName))
	{
		$result = $connectionManager.QueryProcessor.ExecuteQuery($query)

		ForEach($i in $result.GetEnumerator())
		{
			$ReturnValue = $i
			break
		}

		$connectionManager.Dispose() 
	}

	$ReturnValue
}

Function Get-ApplicationObjectFromServer
{
	param
	(
		[System.Object]
		$appName,

		[System.Object]
		$siteServerName
	)

	$resultObject = Get-ExecuteWqlQuery $siteServerName 'select thissitecode from sms_identification' 
	$siteCode = $resultObject['thissitecode'].StringValue

	$path = [string]::Format('\\{0}\ROOT\sms\site_{1}', $siteServerName, $siteCode)
	$scope = New-Object System.Management.ManagementScope -ArgumentList $path

	$query = [string]::Format("select * from sms_application where LocalizedDisplayName='{0}' AND ISLatest='true'", $appName.Trim())

	$oQuery = New-Object System.Management.ObjectQuery -ArgumentList $query
	$obectSearcher = New-Object System.Management.ManagementObjectSearcher -ArgumentList $scope,$oQuery
	$applicationFoundInCollection = $obectSearcher.Get()    
	$applicationFoundInCollectionEnumerator = $applicationFoundInCollection.GetEnumerator()

	If($applicationFoundInCollectionEnumerator.MoveNext())
	{
		$ReturnValue = $applicationFoundInCollectionEnumerator.Current
		#$getResult = $ReturnValue.Get()        
		$sdmPackageXml = $ReturnValue.Properties['SDMPackageXML'].Value.ToString()
		[Microsoft.ConfigurationManagement.ApplicationManagement.Serialization.SccmSerializer]::DeserializeFromString($sdmPackageXml)
	}
}

Function Load-ConfigMgrAssemblies()
{
	$AdminConsoleDirectory = Split-Path $env:SMS_ADMIN_UI_PATH -Parent
	$filesToLoad = 'Microsoft.ConfigurationManagement.ApplicationManagement.dll',`
	'AdminUI.WqlQueryEngine.dll', `
	'AdminUI.DcmObjectWrapper.dll' 

	Set-Location $AdminConsoleDirectory
	[System.IO.Directory]::SetCurrentDirectory($AdminConsoleDirectory)

	ForEach($fileName in $filesToLoad)
	{
		$fullAssemblyName = [System.IO.Path]::Combine($AdminConsoleDirectory, $fileName)
		If([System.IO.File]::Exists($fullAssemblyName ))
		{   
			$FileLoaded = [Reflection.Assembly]::LoadFrom($fullAssemblyName )
		}
		Else
		{
			Write-Output ([System.String]::Format('File not found {0}',$fileName )) -backgroundcolor 'red'
		}
	}
}

#v2.34 change
If($Dev)
{
	Out-File -FilePath $Script:DevErrorFile -InputObject $error 4>$Null
}

# clear error variable in case Get-SiteCode fails
$error.Clear()

$SiteCode = Get-SiteCode -EA 0

#V2.34 add error checking
If ($? -and $Null -ne $SiteCode)
{

	Write-Verbose "$(Get-Date -Format G): Start writing report data"

	$LocationBeforeExecution = Get-Location

	$Script:selection.InsertNewPage() | Out-Null

	#Import the CM12 Powershell cmdlets
	If(-not (Test-Path -Path $SiteCode))
	{
		Write-Verbose "$(Get-Date -Format G):   CM12 module has not been imported yet, will import it now."
		#Import-Module ($env:SMS_ADMIN_UI_PATH.Substring(0,$env:SMS_ADMIN_UI_PATH.Length – 5) + '\ConfigurationManager.psd1') | Out-Null
		Import-Module ($env:SMS_ADMIN_UI_PATH.Substring(0,$env:SMS_ADMIN_UI_PATH.Length – 5) + '\ConfigurationManager.psd1') 4>$Null
	}
	#CM12 cmdlets need to be run from the CM12 drive
	Set-Location "$($SiteCode):" | Out-Null
	If(-not (Get-PSDrive -Name $SiteCode))
	{
		Write-Error "
		`n`n
		`t`t
		There was a problem loading the Configuration Manager powershell module and accessing the site's PSDrive.
		`n`n
		`t`t
		Script will now abort.
		`n`n
		"
		AbortScript
	}
}
Else
{
	#V2.34 change
	Write-Error "
	`n`n
	`t`t
	There was a problem retrieving the Site Code.
	`n`n
	`t`t
	Script will now abort.
	`n`n
	"
	$error
	AbortScript
}

#### Administration
#### Site Configuration

WriteWordLine 1 0 'Summary of all Sites in this Hierarchy'
Write-Verbose "$(Get-Date -Format G):   Getting Site Information"
$CMSites = Get-CMSite -EA 0 4>$Null

#V2.33 change
If($? -and $Null -ne $CMSites)
{
	Write-Verbose "$(Get-Date -Format G):   Successfully retrieved Site Information"
	$CAS                    = $CMSites | Where-Object {$_.Type -eq 4}
	$ChildPrimarySites      = $CMSites | Where-Object {$_.Type -eq 3}
	$StandAlonePrimarySite  = $CMSites | Where-Object {$_.Type -eq 2}
	$SecondarySites         = $CMSites | Where-Object {$_.Type -eq 1}
}
Else
{
	Write-Error "
	`n`n
	`t`t
	There was a problem retrieving Site Information.
	`n`n
	`t`t
	Script will now abort.
	`n`n
	"
	AbortScript
}

#region CAS
If(-not [string]::IsNullOrEmpty($CAS))
{
	WriteWordLine 0 1 'The following Central Administration Site is installed:'
	$CAS = @{'Site Name' = $CAS.SiteName; 'Site Code' = $CAS.SiteCode; Version = $CAS.Version };

	$Table = AddWordTable -Hashtable $CAS -Format -155 -AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	## IB - set column widths without recursion
	$Table.Columns.Item(1).Width = 100;
	$Table.Columns.Item(2).Width = 170;

	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
	$Table.AutoFitBehavior($wdAutoFitFixed)

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else 
{
	WriteWordLine 0 0 'No' -nonewline
	WriteWordLine 0 0 ' CAS' -boldface $true -nonewline
	WriteWordLine 0 0 ' detected. Continue with Primary Sites.'
}
#endregion CAS

#region Child Primary Sites
If(-not [string]::IsNullOrEmpty($ChildPrimarySites))
{
	Write-Verbose "$(Get-Date -Format G):   Enumerating all child Primary Site."
	WriteWordLine 0 1 'The following child Primary Sites are installed:'
	$StandAlonePrimarySite = @{'Site Name' = $ChildPrimarySites.SiteName; `
								'Site Code' = $ChildPrimarySites.SiteCode; `
								Version = $ChildPrimarySites.Version };

	$Table = AddWordTable -Hashtable $ChildPrimarySites -Format -155 -AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	## IB - set column widths without recursion
	$Table.Columns.Item(1).Width = 100;
	$Table.Columns.Item(2).Width = 170;

	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
	$Table.AutoFitBehavior($wdAutoFitFixed)

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
#endregion Child Primary Sites

#region Standalone Primary
If(-not [string]::IsNullOrEmpty($StandAlonePrimarySite))
{
	Write-Verbose "$(Get-Date -Format G):   Enumerating a standalone Primary Site."
	WriteWordLine 0 0 'The following Primary Site is installed:'
	$SiteCULevel = (Invoke-Command -ComputerName $(Get-CMSiteRole -RoleName 'SMS Site Server').NALPath.tostring().split('\\')[2] `
	-ScriptBlock {Get-ItemProperty `
	-Path registry::hklm\software\microsoft\sms\setup | `
	Select-Object CULevel} `
	-ErrorAction SilentlyContinue ).CULevel
	$StandAlonePrimarySite = @{'Site Name' = $StandAlonePrimarySite.SiteName; `
								'Site Code' = $StandAlonePrimarySite.SiteCode; `
								Version = $StandAlonePrimarySite.Version; `
								'CU Installed' = $SiteCULevel };

	$Table = AddWordTable -Hashtable $StandAlonePrimarySite -Format -155 -AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	## IB - set column widths without recursion
	$Table.Columns.Item(1).Width = 100;
	$Table.Columns.Item(2).Width = 170;

	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
	$Table.AutoFitBehavior($wdAutoFitFixed)

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}

#endregion Standalone Primary

#region Secondary Sites
If(-not [string]::IsNullOrEmpty($SecondarySites))
{
	Write-Verbose "$(Get-Date -Format G):   Enumerating all secondary sites."
	WriteWordLine 0 0 'The following Secondary Sites are installed:'
	$SecondarySites = @{'Site Name' = $SecondarySites.SiteName; `
						'Site Code' = $SecondarySites.SiteCode; `
						Version = $SecondarySites.Version };

	$Table = AddWordTable -Hashtable $SecondarySites -Format -155 -AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	## IB - set column widths without recursion
	$Table.Columns.Item(1).Width = 100;
	$Table.Columns.Item(2).Width = 170;

	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
	$Table.AutoFitBehavior($wdAutoFitFixed)

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
#endregion Secondary Sites

#region Site Configuration report

ForEach($CMSite in $CMSites)
{  
	Write-Verbose "$(Get-Date -Format G):   Checking each site's configuration."
	WriteWordLine 1 0 "Configuration Summary for Site $($CMSite.SiteCode)"
	WriteWordLine 0 0 ''   

	$SiteRoleWordTable = @()  
	$SiteRoles = Get-CMSiteRole -SiteCode $CMSite.SiteCode | Select-Object -Property NALPath, rolename

	WriteWordLine 2 0 'Site Roles'
	WriteWordLine 0 0 'The following Site Roles are installed in this site:'
	ForEach($SiteRole in $SiteRoles) {
		If(-not (($SiteRole.rolename -eq 'SMS Component Server') -or ($SiteRole.rolename -eq 'SMS Site System'))) 
		{
			$SiteRoleRowHash = @{'Server Name' = ($SiteRole.NALPath).ToString().Split('\\')[2]; `
									'Role' = $SiteRole.RoleName}
			$SiteRoleWordTable += $SiteRoleRowHash
		}
	}

	$Table = AddWordTable -Hashtable $SiteRoleWordTable -Format -155 -AutoFit $wdAutoFitContent

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15 -Underline -Italic

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null

	$SiteMaintenanceTaskWordTable = @()
	$SiteMaintenanceTasks = Get-CMSiteMaintenanceTask -SiteCode $CMSite.SiteCode -EA 0 4>$Null
	WriteWordLine 2 0 "Site Maintenance Tasks for Site $($CMSite.SiteCode)"

	ForEach($SiteMaintenanceTask in $SiteMaintenanceTasks) {
		$SiteMaintenanceTaskRowHash = @{'Task Name' = $SiteMaintenanceTask.TaskName; `
										Enabled = $SiteMaintenanceTask.Enabled};
		$SiteMaintenanceTaskWordTable += $SiteMaintenanceTaskRowHash;
	}

	$Table = AddWordTable -Hashtable $SiteMaintenanceTaskWordTable -Format -155 -AutoFit $wdAutoFitContent;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;
	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null

	#change for 2.33
	#$CMManagementPoints = Get-CMManagementPoint -SiteCode $CMSite.SiteCode
	#WriteWordLine 2 0 "Summary of Management Points for Site $($CMSite.SiteCode)"
	#ForEach($CMManagementPoint in $CMManagementPoints)
	#{
	#	Write-Verbose "$(Get-Date -Format G):   Management Point: $($CMManagementPoint)"
	#	$CMMPServerName = $CMManagementPoint.NetworkOSPath.Split('\\')[2]
	#	WriteWordLine 0 0 "$($CMMPServerName)"
	#}

	WriteWordLine 2 0 "Summary of Management Points for Site $($CMSite.SiteCode)"
	Write-Verbose "$(Get-Date -Format G):   Retrieving Management Points"
	$CMManagementPoints = Get-CMManagementPoint -SiteCode $CMSite.SiteCode -EA 0 4>$Null
	
	If($? -and $Null -ne $CMManagementPoints)
	{
		$MPCount = 0
		If($CMManagementPoints -is [array])
		{
			$MPCount = $CMManagementPoints.Count
		}
		Else
		{
			$MPCount = 1
		}
		
		Write-Verbose "$(Get-Date -Format G):   $MPCount Management Points were found"
		$CMMPServerName = $Null
		
		ForEach($CMManagementPoint in $CMManagementPoints)
		{
			Write-Verbose "$(Get-Date -Format G):   Management Point: $($CMManagementPoint)"
			If(($Null -ne $CMManagementPoint.NetworkOSPath.Split('\\')[2]) -and ($Null -ne $CMMPServerName))
			{
				$CMMPServerName = $CMManagementPoint.NetworkOSPath.Split('\\')[2]
				Write-Verbose "$(Get-Date -Format G):   CMMPServerName has been set to $CMMPServerName"
				WriteWordLine 0 0 "$($CMMPServerName)"
				#As soon as the variable is set, we are done with the loop
				Break
			}
		}
	}
	ElseIf($? -and $Null -eq $CMManagementPoints)
	{
		Write-Verbose "$(Get-Date -Format G):   No Management Points were found"
		#no error happened but nothing was found
		#set the variable $CMMPServerName to $SMSProvider
		$CMMPServerName = $SMSProvider
	}
	Else
	{
		Write-Verbose "$(Get-Date -Format G):   An error happened while looking for Management Points"
		#some error happened
		#set the variable $CMMPServerName to $SMSProvider
		$CMMPServerName = $SMSProvider
	}
	Write-Verbose "$(Get-Date -Format G):   Completed Management Points"
	#end of 2.33 change
	
	WriteWordLine 2 0 "Summary of Distribution Points for Site $($CMSite.SiteCode)"
	$CMDistributionPoints = Get-CMDistributionPoint -SiteCode $CMSite.SiteCode -EA 0 4>$Null

	ForEach($CMDistributionPoint in $CMDistributionPoints)
	{
		$CMDPServerName = $CMDistributionPoint.NetworkOSPath.Split('\\')[2]
		Write-Verbose "$(Get-Date -Format G):   Found DP: $($CMDPServerName)"
		WriteWordLine 0 1 "$($CMDPServerName)" -boldface $true
		Write-Verbose "Trying to ping $($CMDPServerName)"
		$PingResult = Test-NetConnection -ComputerName $CMDPServerName
		If(-not ($PingResult.PingSucceeded))
		{
			WriteWordLine 0 2 "The Distribution Point $($CMDPServerName) is not reachable. Check connectivity."
		}
		Else
		{
			WriteWordLine 0 2 'Disk information:'
			$CMDPDrives = (Get-WmiObject -Class SMS_DistributionPointDriveInfo `
				-Namespace root\sms\site_$SiteCode `
				-ComputerName $SMSProvider).Where({$PSItem.NALPath -like "*$CMDPServerName*"})
				
			ForEach($CMDPDrive in $CMDPDrives)
			{
				WriteWordLine 0 2 "Partition $($CMDPDrive.Drive):" -boldface $true
				$Size = ''
				$Size = $CMDPDrive.BytesTotal / 1024 / 1024
				$Freesize = ''
				$Freesize = $CMDPDrive.BytesFree / 1024 / 1024

				WriteWordLine 0 3 "$([MATH]::Round($Size,2)) GB Size in total"
				WriteWordLine 0 3 "$([MATH]::Round($Freesize,2)) GB Free Space"
				WriteWordLine 0 3 "Still $($CMDPDrive.PercentFree) percent free."
				WriteWordLine 0 0 ''
			}

			WriteWordLine -style 0 -tabs 2 -value 'Hardware Info:' -boldface $true
			try 
			{
				$Capacity = 0
				Get-WmiObject -Class win32_physicalmemory -ComputerName $CMDPServerName | `
				ForEach-Object {[int64]$Capacity = $Capacity + [int64]$_.Capacity}
				$TotalMemory = $Capacity / 1024 / 1024 / 1024
				WriteWordLine 0 3 "This server has a total of $($TotalMemory) GB RAM."
			}
			catch 
			{
				WriteWordLine 0 3 "Failed to access server $CMDPServerName." 
			}	
		}

		$DPInfo = $CMDistributionPoint.Props
		$IsPXE = ($DPInfo.Where({$_.PropertyName -eq 'IsPXE'})).Value
		$UnknownMachines = ($DPInfo.Where({$_.PropertyName -eq 'SupportUnknownMachines'})).Value
		Switch ($IsPXE)
		{
			1 
				{
					WriteWordLine 0 2 'PXE Enabled'
					Switch ($UnknownMachines)
					{
						1 { WriteWordLine 0 2 'Supports unknown machines: true' }
						0 { WriteWordLine 0 2 'Supports unknown machines: false' }
					}
				}
			0
				{
					WriteWordLine 0 2 'PXE disabled'
				}
		}

		$DPGroupMembers = $Null
		$DPGroupIDs = $Null
		$DPGroupMembers = (Get-WmiObject -class SMS_DPGroupMembers `
		-Namespace root\sms\site_$SiteCode `
		-ComputerName $SMSProvider).Where({$_.DPNALPath -ilike "*$($CMDPServerName)*"});
		If(-not [string]::IsNullOrEmpty($DPGroupMembers))
		{
			$DPGroupIDs = $DPGroupMembers.GroupID
		}

		#enumerating DP Group Membership
		If(-not [string]::IsNullOrEmpty($DPGroupIDs))
		{
			WriteWordLine 0 1 'This Distribution Point is a member of the following DP Groups:'
			ForEach($DPGroupID in $DPGroupIDs)
			{
				$DPGroupName = (Get-CMDistributionPointGroup -Id "$($DPGroupID)").Name
				WriteWordLine 0 2 "$($DPGroupName)"
			}
		}
		Else
		{
			WriteWordLine 0 1 'This Distribution Point is not a member of any DP Group.'
		}
	}
	#enumerating Software Update Points
	Write-Verbose "$(Get-Date -Format G):   Enumerating all Software Update Points"
	WriteWordLine 2 0 "Summary of Software Update Point Servers for Site $($CMSite.SiteCode)"
	$CMSUPs = Get-WmiObject -Class sms_sci_sysresuse `
	-Namespace root\sms\site_$($CMSite.SiteCode) `
	-ComputerName $CMMPServerName | `
	Where-Object {$_.rolename -eq 'SMS Software Update Point'}

	##V2.33 change - bug found by RJimenez
	#$CMSUPs = Get-WmiObject -Class sms_sci_sysresuse `
	#-Namespace root\sms\site_$($CMSite.SiteCode) `
	#-ComputerName $SMSProvider | `
	#Where-Object {$_.rolename -eq 'SMS Software Update Point'}
	
	#$CMSUPs = (Get-CMSoftwareUpdatePoint).Where({$_.SiteCode -eq "$($CMSite.SiteCode)"})
	If(-not [string]::IsNullOrEmpty($CMSUPs))
	{
		ForEach($CMSUP in $CMSUPs) {
			$SUPHashTable = @();
			$CMSUPServerName = $CMSUP.NetworkOSPath.split('\\')[2]
			Write-Verbose "$(Get-Date -Format G):   Found SUP: $($CMSUPServerName)"
			WriteWordLine 0 0 "$($CMSUPServerName)"
			ForEach($SUPProp in $CMSUP.Props) {
				$SUPHash = @{Value2 = $SUPProp.Value2; `
								Value1 = $SUPProp.Value1; `
								Value = $SUPProp.Value; `
								'Property Name' = $SUPProp.PropertyName};
				$SUPHashTable += $SUPHash;
			}
			$Table = AddWordTable -Hashtable $SUPHashTable -Format -155 -AutoFit $wdAutoFitFixed;

			## Set first column format
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			## IB - set column widths without recursion
			$Table.Columns.Item(1).Width = 100;
			$Table.Columns.Item(2).Width = 170;

			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
			$Table.AutoFitBehavior($wdAutoFitFixed)

			FindWordDocumentEnd
			WriteWordLine 0 0 ""
			$Table = $Null
		}
	}
	Else
	{
		WriteWordLine 0 1 'This site has no Software Update Points installed.'
	}
}

##### Hierarchy wide configuration
WriteWordLine 1 0 'Summary of Hierarchy Wide Configuration'

#region enumerating Boundaries
Write-Verbose "$(Get-Date -Format G): Enumerating all Site Boundaries"
WriteWordLine 2 0 'Summary of Site Boundaries'

$Boundaries = Get-CMBoundary -EA 0 4>$Null
If(-not [string]::IsNullOrEmpty($Boundaries))
{
	$SubnetHashTable  = @();
	$ADHashTable      = @();
	$IPv6HashTable    = @();
	$IPRangeHashTable = @();

	ForEach($Boundary in $Boundaries) {       
		If($Boundary.BoundaryType -eq 0) {
			$BoundaryType = 'IP Subnet';
			$NamesOfBoundarySiteSystems = $Null
			If(-not [string]::IsNullOrEmpty($Boundary.SiteSystems))
			{
				ForEach-Object `
				-Begin {$BoundarySiteSystems = $Boundary.SiteSystems} `
				-Process {$NamesOfBoundarySiteSystems += $BoundarySiteSystems.split(',')} `
				-End {$NamesOfBoundarySiteSystems} | Out-Null
			}
			Else 
			{
				$NamesOfBoundarySiteSystems = 'n/a'
			} 
			$SubnetHash = @{'Boundary Type' = $BoundaryType; 
				'Default Site Code' = "$($Boundary.DefaultSiteCode)"
				'Associated Site Systems' = "$NamesOfBoundarySiteSystems"
				Description = $Boundary.DisplayName;
				Value = $Boundary.Value;
			}
			$SubnetHashTable += $SubnetHash;
		}
		ElseIf($Boundary.BoundaryType -eq 1) 
		{ 
			$BoundaryType = 'Active Directory Site';
			$NamesOfBoundarySiteSystems = $Null
			If(-not [string]::IsNullOrEmpty($Boundary.SiteSystems))
			{
				ForEach-Object `
				-Begin {$BoundarySiteSystems= $Boundary.SiteSystems} `
				-Process {$NamesOfBoundarySiteSystems += $BoundarySiteSystems.split(',')} `
				-End {$NamesOfBoundarySiteSystems} | Out-Null
			}
			Else 
			{
				$NamesOfBoundarySiteSystems = 'n/a'
			} 
			$ADHash = @{'Boundary Type' = $BoundaryType; 
				'Default Site Code' = "$($Boundary.DefaultSiteCode)"
				'Associated Site Systems' = "$NamesOfBoundarySiteSystems";
				Description = $Boundary.DisplayName;
				Value = $Boundary.Value;
			}
			$ADHashTable += $ADHash;
		}
		ElseIf($Boundary.BoundaryType -eq 2) 
		{ 
			$BoundaryType = 'IPv6 Prefix';
			$NamesOfBoundarySiteSystems = $Null
			If(-not [string]::IsNullOrEmpty($Boundary.SiteSystems))
			{
				ForEach-Object `
				-Begin {$BoundarySiteSystems= $Boundary.SiteSystems} `
				-Process {$NamesOfBoundarySiteSystems += $BoundarySiteSystems.split(',')} `
				-End {$NamesOfBoundarySiteSystems} | Out-Null
			}
			Else 
			{
				$NamesOfBoundarySiteSystems = 'n/a'
			} 
			$IPv6Hash = @{'Boundary Type' = $BoundaryType; 
				'Default Site Code' = "$($Boundary.DefaultSiteCode)"
				'Associated Site Systems' = "$NamesOfBoundarySiteSystems";
				Description = $Boundary.DisplayName;
				Value = $Boundary.Value;
			}
			$IPv6HashTable += $IPv6Hash;
		}
		ElseIf($Boundary.BoundaryType -eq 3) 
		{ 
			$BoundaryType = 'IP Range';
			$NamesOfBoundarySiteSystems = $Null
			If(-not [string]::IsNullOrEmpty($Boundary.SiteSystems))
			{
				ForEach-Object `
				-Begin {$BoundarySiteSystems= $Boundary.SiteSystems} `
				-Process {$NamesOfBoundarySiteSystems += $BoundarySiteSystems.split(',')} `
				-End {$NamesOfBoundarySiteSystems} | Out-Null
			}
			Else 
			{
				$NamesOfBoundarySiteSystems = 'n/a'
			} 
			$IPRangeHash = @{'Boundary Type' = $BoundaryType
				'Default Site Code' = "$($Boundary.DefaultSiteCode)"
				'Associated Site Systems' = "$NamesOfBoundarySiteSystems"
				Description = $Boundary.DisplayName
				Value = $Boundary.Value
			}
			$IPRangeHashTable += $IPRangeHash
		}
	}
}
          
#region IPv6 Boundaries Table
If($IPv6HashTable.Count -gt 0)
{
	$Table = AddWordTable -Hashtable $IPv6HashTable -Format -155 -AutoFit $wdAutoFitContent;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15
	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional) 
	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 0 "There are no IPv6 Prefix Boundaries"
}
#endregion IPv6 Boundaries Table
WriteWordLine 0 0 ''
WriteWordLine 0 0 ''

#region IP Subnet Boundaries Table
If($SubnetHashTable.Count -gt 0)
{
	$Table = AddWordTable -Hashtable $SubnetHashTable -Format -155 -AutoFit $wdAutoFitContent

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15
	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional) 
	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 0 "There are no IP Subnet Boundaries"
}
#endregion IP Subnet Boundaries Table

WriteWordLine 0 0 ''
WriteWordLine 0 0 ''

#region IP Range Boundaries Table
If($IPRangeHashTable.Count -gt 0)
{
	$Table = AddWordTable -Hashtable $IPRangeHashTable -Format -155 -AutoFit $wdAutoFitContent ;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;
	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional) 
	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 0 "There are no IP Range Boundaries"
}
#endregion IP Range Boundaries Table

WriteWordLine 0 0 ''
WriteWordLine 0 0 ''

#region AD Site Boundaries Table
If($ADHashTable.Count -gt 0)
{
	$Table = AddWordTable -Hashtable $ADHashTable -Format -155 -AutoFit $wdAutoFitContent;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;
	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional) 
	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 0 "There are no Active Directory Site Boundaries"
}
#endregion AD Site Boundaries Table

WriteWordLine 0 0 ''
WriteWordLine 0 0 ''

#endregion enumerating Boundaries

#region enumerating all Boundary Groups and their members
Write-Verbose "$(Get-Date -Format G):   Enumerating all Boundary Groups and their members"

$BoundaryGroups = Get-CMBoundaryGroup -EA 0 4>$Null
WriteWordLine 2 0 'Summary of Site Boundary Groups'

$BoundaryGroupHashTable = @();
If(-not [string]::IsNullOrEmpty($BoundaryGroups))
{
	ForEach($BoundaryGroup in $BoundaryGroups) {
		$MemberNames = @();
		If($BoundaryGroup.SiteSystemCount -gt 0)
		{
			$MemberIds = $null
			$bgMembers = Get-WmiObject -Class SMS_BoundaryGroupMembers `
			-Namespace root\sms\site_$SiteCode `
			-ComputerName $SMSProvider
			If( $null –ne $bgMembers )
			{
				$bgFiltered = $bgMembers | Where-Object -FilterScript {$_.GroupID -eq "$($BoundaryGroup.GroupID)"}
				If( $null –ne $bgFiltered –and (Get-Member –InputObject $bgFiltered BoundaryId ) )
				{
					$MemberIds = $bgFiltered.BoundaryId
					ForEach($MemberID in $MemberIDs)
					{
						$MemberName = (Get-CMBoundary -Id $MemberID).DisplayName
						$MemberNames += "$MemberName (ID: $MemberID); "
						Write-Verbose "Member names: $($MemberName)"
					}
				}
			}
		}
		Else
		{
			$MemberNames += 'There are no Site Systems associated to this Boundary Group.'
			Write-Verbose 'There are no Site Systems associated to this Boundary Group.'
		}
		$BoundaryGroupRow = @{Name = $BoundaryGroup.Name; `
								Description = $BoundaryGroup.Description; `
								'Boundary members' = "$MemberNames"};
		$BoundaryGroupHashTable += $BoundaryGroupRow;
	}

	$Table = AddWordTable -Hashtable $BoundaryGroupHashTable -Format -155 -AutoFit $wdAutoFitContent
	#-Columns Name, Description, 'Boundary Members' -Headers Name, Description, 'Boundary Members'
	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 1 'There are no Boundary Groups configured. It is mandatory to configure a Boundary Group in order for CM12 to work properly.'
}

#endregion enumerating all Boundary Groups and their members

#region enumerating Client Policies
Write-Verbose "$(Get-Date -Format G):   Enumerating all Client/Device Settings"
WriteWordLine 2 0 'Summary of Custom Client Device Settings'

$AllClientSettings = Get-CMClientSetting | Where-Object -FilterScript {$_.SettingsID -ne '0'}
ForEach($ClientSetting in $AllClientSettings)
{
	WriteWordLine 0 0 "Client Settings Name: $($ClientSetting.Name)" -boldface $true
	WriteWordLine 0 1 "Client Settings Description: $($ClientSetting.Description)"
	WriteWordLine 0 1 "Client Settings ID: $($ClientSetting.SettingsID)"
	WriteWordLine 0 1 "Client Settings Priority: $($ClientSetting.Priority)"
	If($ClientSetting.Type -eq '1')
	{
		WriteWordLine 0 1 'This is a custom client Device Setting.'
	}
	Else
	{
		WriteWordLine 0 1 'This is a custom client User Setting.'
	}
	WriteWordLine 0 0 'Configurations'
	ForEach($AgentConfig in $ClientSetting.AgentConfigurations)
	{
		try
		{
			Switch ($AgentConfig.AgentID)
			{
				1
					{
						WriteWordLine 0 1 'Compliance Settings'
						WriteWordLine 0 1 "Enable compliance evaluation on clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 "Enable user data and profiles: $($AgentConfig.EnableUserStateManagement)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				2
					{
						WriteWordLine 0 1 'Software Inventory'
						WriteWordLine 0 1 "Enable software inventory on clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 'Schedule software inventory and file collection: ' -nonewline
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.Schedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 0 " Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 0 " Occurs the last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 0 " Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 1 'Inventory reporting detail: ' -nonewline
						Switch ($AgentConfig.ReportOptions)
						{
							1 { WriteWordLine 0 0 'Product only' }
							2 { WriteWordLine 0 0 'File only' }
							7 { WriteWordLine 0 0 'Full details' }
						}

						WriteWordLine 0 1 'Inventory these file types: '
						If($AgentConfig.InventoriableTypes)
						{
							WriteWordLine 0 2 "$($AgentConfig.InventoriableTypes)"
						}
						If($AgentConfig.Path)
						{                               
							WriteWordLine 0 2 "$($AgentConfig.Path)"
						}
						If(($AgentConfig.InventoriableTypes) -and ($AgentConfig.ExcludeWindirAndSubfolders -eq 'true'))
						{
							WriteWordLine 0 2 'Exclude WinDir and Subfolders'
						}
						Else 
						{
							WriteWordLine 0 2 'Do not exclude WinDir and Subfolders'
						}

						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				3
					{
						WriteWordLine 0 1 'Remote Tools'
						WriteWordLine 0 1 'Enable Remote Control on clients: ' -nonewline
						Switch ($AgentConfig.FirewallExceptionProfiles)
						{
							0 { WriteWordLine 0 0 'Disabled' }
							8 { WriteWordLine 0 0 'Enabled: No Firewall Profile.' }
							9 { WriteWordLine 0 1 'Enabled: Public.' }
							10 { WriteWordLine 0 1 'Enabled: Private.' }
							11 { WriteWordLine 0 1 'Enabled: Private, Public.' }
							12 { WriteWordLine 0 1 'Enabled: Domain.' }
							13 { WriteWordLine 0 1 'Enabled: Domain, Public.' }
							14 { WriteWordLine 0 1 'Enabled: Domain, Private.' }
							15 { WriteWordLine 0 1 'Enabled: Domain, Private, Public.' }
						}
						WriteWordLine 0 1 "Users can change policy or notification settings in Software Center: $($AgentConfig.AllowClientChange)"
						WriteWordLine 0 1 "Allow Remote Control of an unattended computer: $($AgentConfig.AllowRemCtrlToUnattended)"
						WriteWordLine 0 1 "Prompt user for Remote Control permission: $($AgentConfig.PermissionRequired)"
						WriteWordLine 0 1 "Grant Remote Control permission to local Administrators group: $($AgentConfig.AllowLocalAdminToDoRemoteControl)"
						WriteWordLine 0 1 'Access level allowed: ' -nonewline
						Switch ($AgentConfig.AccessLevel)
						{
							0 { WriteWordLine 0 0 'No access' }
							1 { WriteWordLine 0 0 'View only' }
							2 { WriteWordLine 0 0 'Full Control' }
						}
						WriteWordLine 0 1 'Permitted viewers of Remote Control and Remote Assistance:'
						ForEach($Viewer in $AgentConfig.PermittedViewers)
						{
							WriteWordLine 0 2 "$($Viewer)"
						}
						WriteWordLine 0 1 "Show session notification icon on taskbar: $($AgentConfig.RemCtrlTaskbarIcon)"
						WriteWordLine 0 1 "Show session connection bar: $($AgentConfig.RemCtrlConnectionBar)"
						WriteWordLine 0 1 'Play a sound on client: ' -nonewline
						Switch ($AgentConfig.AudibleSignal)
						{
							0 { WriteWordLine 0 0 'None.' }
							1 { WriteWordLine 0 0 'Beginning and end of session.' }
							2 { WriteWordLine 0 0 'Repeatedly during session.' }
						}
						WriteWordLine 0 1 "Manage unsolicited Remote Assistance settings: $($AgentConfig.ManageRA)"
						WriteWordLine 0 1 "Manage solicited Remote Assistance settings: $($AgentConfig.EnforceRAandTSSettings)"
						WriteWordLine 0 1 'Level of access for Remote Assistance: ' -nonewline
						If(($AgentConfig.AllowRAUnsolicitedView -ne 'True') -and `
						($AgentConfig.AllowRAUnsolicitedControl -ne 'True'))
						{
							WriteWordLine 0 0 'None.'
						}
						ElseIf(($AgentConfig.AllowRAUnsolicitedView -eq 'True') -and `
						($AgentConfig.AllowRAUnsolicitedControl -ne 'True'))
						{
							WriteWordLine 0 0 'Remote viewing.'
						}
						ElseIf(($AgentConfig.AllowRAUnsolicitedView -eq 'True') -and `
						($AgentConfig.AllowRAUnsolicitedControl -eq 'True'))
						{
							WriteWordLine 0 0 'Full Control.'
						}
						WriteWordLine 0 1 "Manage Remote Desktop settings: $($AgentConfig.ManageTS)"
						If($AgentConfig.ManageTS -eq 'True')
						{
							WriteWordLine 0 1 "Allow permitted viewers to connect by using Remote Desktop connection: $($AgentConfig.EnableTS)"
							WriteWordLine 0 1 "Require network level authentication on computers that run Windows Vista operating system and later versions: $($AgentConfig.TSUserAuthentication)"
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				4
					{
						WriteWordLine 0 1 'Computer Agent'
						WriteWordLine 0 1 "Deployment deadline greater than 24 hours, remind user every (hours): $([string]($AgentConfig.ReminderInterval) / 60 / 60)"
						WriteWordLine 0 1 "Deployment deadline less than 24 hours, remind user every (hours): $([string]($AgentConfig.DayReminderInterval) / 60 / 60)"
						WriteWordLine 0 1 "Deployment deadline less than 1 hour, remind user every (minutes): $([string]($AgentConfig.HourReminderInterval) / 60)"
						WriteWordLine 0 1 "Default application catalog website point: $($AgentConfig.PortalUrl)"
						WriteWordLine 0 1 "Add default Application Catalog website to Internet Explorer trusted sites zone: $($AgentConfig.AddPortalToTrustedSiteList)"
						WriteWordLine 0 1 "Allow Silverlight applications to run in elevated trust mode: $($AgentConfig.AllowPortalToHaveElevatedTrust)"
						WriteWordLine 0 1 "Organization name displayed in Software Center: $($AgentConfig.BrandingTitle)"
						Switch ($AgentConfig.InstallRestriction)
						{
							0 { $InstallRestriction = 'All Users' }
							1 { $InstallRestriction = 'Only Administrators' }
							3 { $InstallRestriction = 'Only Administrators and primary Users'}
							4 { $InstallRestriction = 'No users' }
						}
						WriteWordLine 0 1 "Install Permissions: $($InstallRestriction)"
						Switch ($AgentConfig.SuspendBitLocker)
						{
							0 { $SuspendBitlocker = 'Never' }
							1 { $SuspendBitlocker = 'Always' }
						}
						WriteWordLine 0 1 "Suspend Bitlocker PIN entry on restart: $($SuspendBitlocker)"
						Switch ($AgentConfig.EnableThirdPartyOrchestration)
						{
							0 { $EnableThirdPartyTool = 'No' }
							1 { $EnableThirdPartyTool = 'Yes' }
						}
						WriteWordLine 0 1 "Additional software manages the deployment of applications and software updates: $($EnableThirdPartyTool)"
						Switch ($AgentConfig.PowerShellExecutionPolicy)
						{
							0 { $ExecutionPolicy = 'All signed' }
							1 { $ExecutionPolicy = 'Bypass' }
							2 { $ExecutionPolicy = 'Restricted' }
						}
						WriteWordLine 0 1 "Powershell execution policy: $($ExecutionPolicy)"
						Switch ($AgentConfig.DisplayNewProgramNotification)
						{
							False { $DisplayNotifications = 'No' }
							True { $DisplayNotifications = 'Yes' }
						}
						WriteWordLine 0 1 "Show notifications for new deployments: $($DisplayNotifications)"
						Switch ($AgentConfig.DisableGlobalRandomization)
						{
							False { $DisableGlobalRandomization = 'No' }
							True { $DisableGlobalRandomization = 'Yes' }
						}
						WriteWordLine 0 1 "Disable deadline randomization: $($DisableGlobalRandomization)"
						WriteWordLine 0 0 '---------------------'
					}
				5
					{
						WriteWordLine 0 1 'Network Access Protection (NAP)'
						WriteWordLine 0 1 "Enable Network Access Protection on clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 "Use UTC (Universal Time Coordinated) for evaluation time: $($AgentConfig.EffectiveTimeinUTC)"
						WriteWordLine 0 1 "Require a new scan for each evaluation: $($AgentConfig.ForceScan)"
						WriteWordLine 0 1 'NAP re-evaluation schedule:' -nonewline
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.ComputeComplianceSchedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 0 " Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 0 " Occurs the last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 0 " Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 0 '---------------------'
					}
				8
					{
						WriteWordLine 0 1 'Software Metering'
						WriteWordLine 0 1 "Enable software metering on clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 'Schedule data collection: ' -nonewline
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.DataCollectionSchedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 0 " Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 0 " Occurs the last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 0 " Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				9
					{
						WriteWordLine 0 1 'Software Updates'
						WriteWordLine 0 1 "Enable software updates on clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 'Software Update scan schedule: ' -nonewline
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.ScanSchedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 0 " Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 0 " Occurs the last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 0 " Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 1 'Schedule deployment re-evaluation: ' -nonewline
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.EvaluationSchedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 0 " Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 0 " Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 0 " Occurs the last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 0 " Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 1 'When any software update deployment deadline is reached, install all other software update deployments with deadline coming within a specified period of time: ' -nonewline
						If($AgentConfig.AssignmentBatchingTimeout -eq '0')
						{
							WriteWordLine 0 0 'No.'
						}
						Else 
						{
							WriteWordLine 0 0 'Yes.'    
							WriteWordLine 0 1 'Period of time for which all pending deployments with deadline in this time will also be installed: ' -nonewline
							If($AgentConfig.AssignmentBatchingTimeout -le '82800')
							{
								$hours = [string]$AgentConfig.AssignmentBatchingTimeout / 60 / 60 
								WriteWordLine 0 0 "$($hours) hours"
							}
							Else 
							{
								$days = [string]$AgentConfig.AssignmentBatchingTimeout / 60 / 60 / 24
								WriteWordLine 0 0 "$($days) days"
							}
						}

						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				10
					{
						WriteWordLine 0 1 'User and Device Affinity'
						WriteWordLine 0 1 "User device affinity usage threshold (minutes): $($AgentConfig.ConsoleMinutes)"
						WriteWordLine 0 1 "User device affinity usage threshold (days): $($AgentConfig.IntervalDays)"
						WriteWordLine 0 1 'Automatically configure user device affinity from usage data: ' -nonewline 
						If($AgentConfig.AutoApproveAffinity -eq '0')
						{
							WriteWordLine 0 0 'No'
						}
						Else
						{
							WriteWordLine 0 0 'Yes'
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				11
					{
						WriteWordLine 0 1 'Background Intelligent Transfer'
						WriteWordLine 0 1 "Limit the maximum network bandwidth for BITS background transfers: $($AgentConfig.EnableBitsMaxBandwidth)"
						WriteWordLine 0 1 "Throttling window start time: $($AgentConfig.MaxBandwidthValidFrom)"
						WriteWordLine 0 1 "Throttling window end time: $($AgentConfig.MaxBandwidthValidTo)"
						WriteWordLine 0 1 "Maximum transfer rate during throttling window (kbps): $($AgentConfig.MaxTransferRateOnSchedule)"
						WriteWordLine 0 1 "Allow BITS downloads outside the throttling window: $($AgentConfig.EnableDownloadOffSchedule)"
						WriteWordLine 0 1 "Maximum transfer rate outside the throttling window (Kbps): $($AgentConfig.MaxTransferRateOffSchedule)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				12
					{
						WriteWordLine 0 1 'Enrollment'
						WriteWordLine 0 1 'Allow users to enroll mobile devices and Mac computers: ' -nonewline
						If($AgentConfig.EnableDeviceEnrollment -eq '0')
						{
							WriteWordLine 0 0 'No'
						}
						Else
						{
							WriteWordLine 0 0 'Yes'
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				13
					{
						WriteWordLine 0 1 'Client Policy'
						WriteWordLine 0 1 "Client policy polling interval (minutes): $($AgentConfig.PolicyRequestAssignmentTimeout)"
						WriteWordLine 0 1 "Enable user policy on clients: $($AgentConfig.PolicyEnableUserPolicyPolling)"
						WriteWordLine 0 1 "Enable user policy requests from Internet clients: $($AgentConfig.PolicyEnableUserPolicyOnInternet)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				15
					{
						WriteWordLine 0 1 'Hardware Inventory'
						WriteWordLine 0 1 "Enable hardware inventory on clients: $($AgentConfig.Enabled)"
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.Schedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 1 "Hardware inventory schedule: Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 1 "Hardware inventory schedule: Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 1 "Hardware inventory schedule: Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 1 "Hardware inventory schedule: Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 1 "Hardware inventory schedule: Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 1 "Hardware inventory schedule: Occurs on last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 1 "Hardware inventory schedule: Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				16 
					{
						WriteWordLine 0 1 'State Messaging'
						WriteWordLine 0 1 "State message reporting cycle (minutes): $($AgentConfig.BulkSendInterval)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				17
					{
						WriteWordLine 0 1 'Software Deployment'
						$Schedule = Convert-CMSchedule -ScheduleString $AgentConfig.EvaluationSchedule
						If($Schedule.DaySpan -gt 0)
						{
							WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs every $($Schedule.DaySpan) days effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.HourSpan -gt 0)
						{
							WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs every $($Schedule.HourSpan) hours effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.MinuteSpan -gt 0)
						{
							WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs every $($Schedule.MinuteSpan) minutes effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfWeeks)
						{
							WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs every $($Schedule.ForNumberOfWeeks) weeks on $(Convert-WeekDay $Schedule.Day) effective $($Schedule.StartTime)"
						}
						ElseIf($Schedule.ForNumberOfMonths)
						{
							If($Schedule.MonthDay -gt 0)
							{
								WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs on day $($Schedule.MonthDay) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.MonthDay -eq 0)
							{
								WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs on last day of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
							ElseIf($Schedule.WeekOrder -gt 0)
							{
								Switch ($Schedule.WeekOrder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 1 "Schedule re-evaluation for deployments: Occurs the $($order) $(Convert-WeekDay $Schedule.Day) of every $($Schedule.ForNumberOfMonths) months effective $($Schedule.StartTime)"
							}
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				18
					{
						WriteWordLine 0 1 'Power Management'
						WriteWordLine 0 1 "Allow power management of clients: $($AgentConfig.Enabled)"
						WriteWordLine 0 1 "Allow users to exclude their device from power management: $($AgentConfig.AllowUserToOptOutFromPowerPlan)"
						WriteWordLine 0 1 "Enable wake-up proxy: $($AgentConfig.EnableWakeupProxy)"
						If($AgentConfig.EnableWakeupProxy -eq 'True')
						{
							WriteWordLine 0 1 "Wake-up proxy port number (UDP): $($AgentConfig.Port)"
							WriteWordLine 0 1 "Wake On LAN port number (UDP): $($AgentConfig.WolPort)"
							WriteWordLine 0 1 'Windows Firewall exception for wake-up proxy: ' -nonewline
							Switch ($AgentConfig.WakeupProxyFirewallFlags)
							{
								0 { WriteWordLine 0 1 'disabled' }
								9 { WriteWordLine 0 1 'Enabled: Public.' }
								10 { WriteWordLine 0 1 'Enabled: Private.' }
								11 { WriteWordLine 0 1 'Enabled: Private, Public.' }
								12 { WriteWordLine 0 1 'Enabled: Domain.' }
								13 { WriteWordLine 0 1 'Enabled: Domain, Public.' }
								14 { WriteWordLine 0 1 'Enabled: Domain, Private.' }
								15 { WriteWordLine 0 1 'Enabled: Domain, Private, Public.' }
							}
							WriteWordLine 0 1 "IPv6 prefixes if required for DirectAccess or other intervening network devices. Use a comma to specifiy multiple entries: $($AgentConfig.WakeupProxyDirectAccessPrefixList)"
						}
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				20
					{
						WriteWordLine 0 1 'Endpoint Protection'
						WriteWordLine 0 1 "Manage Endpoint Protection client on client computers: $($AgentConfig.EnableEP)"
						WriteWordLine 0 1 "Install Endpoint Protection client on client computers: $($AgentConfig.InstallSCEPClient)"
						WriteWordLine 0 1 "Automatically remove previously installed antimalware software before Endpoint Protection is installed: $($AgentConfig.Remove3rdParty)"
						WriteWordLine 0 1 "Allow Endpoint Protection client installation and restarts outside maintenance windows. Maintenance windows must be at least 30 minutes long for client installation: $($AgentConfig.OverrideMaintenanceWindow)"
						WriteWordLine 0 1 "For Windows Embedded devices with write filters, commit Endpoint Protection client installation (requires restart): $($AgentConfig.PersistInstallation)"
						WriteWordLine 0 1 "Suppress any required computer restarts after the Endpoint Protection client is installed: $($AgentConfig.SuppressReboot)"
						WriteWordLine 0 1 "Allowed period of time users can postpone a required restart to complete the Endpoint Protection installation (hours): $($AgentConfig.ForceRebootPeriod)"
						WriteWordLine 0 1 "Disable alternate sources (such as Microsoft Windows Update, Microsoft Windows Server Update Services, or UNC shares) for the initial definition update on client computers: $($AgentConfig.DisableFirstSignatureUpdate)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				21
					{
						WriteWordLine 0 1 'Computer Restart'
						WriteWordLine 0 1 "Display a temporary notification to the user that indicates the interval before the user is logged off or the computer restarts (minutes): $($AgentConfig.RebootLogoffNotificationCountdownDuration)"
						WriteWordLine 0 1 "Display a dialog box that the user cannot close, which displays the countdown interval before the user is logged of or the computer restarts (minutes): $([string]$AgentConfig.RebootLogoffNotificationFinalWindow / 60)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				22
					{
						WriteWordLine 0 1 'Cloud Services'
						WriteWordLine 0 1 "Allow access to Cloud Distribution Point: $($AgentConfig.AllowCloudDP)"
						WriteWordLine 0 0 ''
						WriteWordLine 0 0 '---------------------'
					}
				23
					{
						WriteWordLine 0 1 'Metered Internet Connections'
						Switch ($AgentConfig.MeteredNetworkUsage)
						{
							1 { $Usage = 'Allow' }
							2 { $Usage = 'Limit' }
							4 { $Usage = 'Block' }
						}
						WriteWordLine 0 1 "Specifiy how clients communicate on metered network connections: $($Usage)"
						WriteWordLine 0 0 ''
					}

			}
		}
		catch [System.Management.Automation.PropertyNotFoundException] 
		{
			WriteWordLine 0 0 ''
		}
	}
}
#endregion enumerating Client Policies

#region Security

Write-Verbose "$(Get-Date -Format G):   Collecting all administrative users"
WriteWordLine 2 0 'Administrative Users'
$Admins = Get-CMAdministrativeUser -EA 0 4>$Null

$AdminHashArray = @();

ForEach($Admin in $Admins) 
{
	Switch ($Admin.AccountType)
	{
		0 { $AccountType = 'User' }
		1 { $AccountType = 'Group' }
		2 { $AccountType = 'Machine' } 
	} 

	$AdminRow = @{Name = $Admin.LogonName; 'Account Type' = $AccountType; `
	'Security Roles' = "$($Admin.RoleNames)"; `
	'Security Scopes' = "$($Admin.CategoryNames)"; `
	Collections = "$($Admin.CollectionNames)";}
	$AdminHashArray += $AdminRow;
}

$Table = AddWordTable -Hashtable $AdminHashArray `
-Columns Name, 'Account Type', 'Security Roles', 'Security Scopes', Collections `
-Headers Name, 'Account Type', 'Security Roles', 'Security Scopes', Collections `
-Format -155 -AutoFit $wdAutoFitContent;
  
## Set first column format
SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

  
FindWordDocumentEnd
WriteWordLine 0 0 ""
$Table = $Null

#endregion Security

#region enumerating all custom Security roles
Write-Verbose "$(Get-Date -Format G):   enumerating all custom build security roles"
WriteWordLine 2 0 'Custom Security Roles'
$SecurityRoles = Get-CMSecurityRole | Where-Object -FilterScript {-not $_.IsBuiltIn}
If(-not [string]::IsNullOrEmpty($SecurityRoles))
{
	$SRHashArray = @();

	ForEach($SecurityRole in $SecurityRoles)
	{
		If($SecurityRole.NumberOfAdmins -gt 0)
		{
			$Members = $(Get-CMAdministrativeUser | Where-Object -FilterScript {$_.Roles -ilike "$($SecurityRole.RoleID)"}).LogonName
		}
		$SRRow = @{Name = $SecurityRole.RoleName; `
		Description = $SecurityRole.RoleDescription; `
		'Copied From' = $((Get-CMSecurityRole -Id $SecurityRole.CopiedFromID).RoleName); `
		Members = "$Members"; 'Role ID' = $SecurityRole.RoleID;}
		$SRHashArray += $SRRow;
	}

	$Table = AddWordTable -Hashtable $SRHashArray `
	-Columns Name, Description, 'Copied From', Members `
	-Headers Name, Description, 'Copied From', Members `
	-Format -155 `
	-AutoFit $wdAutoFitContent;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null

}
Else
{
	WriteWordLine 0 1 'There are no custom built security roles.'
}

#endregion enumerating all custom Security roles

#region Used Accounts

Write-Verbose "$(Get-Date -Format G):   Enumerating all used accounts"
WriteWordLine 2 0 'Configured Accounts'
$Accounts = Get-CMAccount -EA 0 4>$Null

$AccountsHashArray = @();

ForEach($Account in $Accounts)
{
	$AccountRow = @{'User Name'= $Account.UserName; `
	'Account Usage' = If([string]::IsNullOrEmpty($Account.AccountUsage)) {'not assigned'} `
	Else {"$($Account.AccountUsage)"}; `
	'Site Code' = $Account.SiteCode};
	$AccountsHashArray += $AccountRow;
}

$Table = AddWordTable -Hashtable $AccountsHashArray `
-Columns 'User Name', 'Account Usage', 'Site Code' `
-Headers 'User Name', 'Account Usage', 'Site Code' `
-Format -155 `
-AutoFit $wdAutoFitContent;
  
## Set first column format
SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;
  
FindWordDocumentEnd
WriteWordLine 0 0 ""
$Table = $Null

#endregion Used Accounts

####
#region Assets and Compliance
####
Write-Verbose "$(Get-Date -Format G):   Done with Administration, next Assets and Compliance"
WriteWordLine 1 0 'Assets and Compliance'

#region enumerating all User Collections
WriteWordLine 2 0 'Summary of User Collections'
$UserCollections = Get-CMUserCollection -EA 0 4>$Null
If($ListAllInformation)
{
	$UserCollHashArray = @();

	ForEach($UserCollection in $UserCollections)
	{
		Write-Verbose "$(Get-Date -Format G):   Found User Collection: $($UserCollection.Name)"

		$UserCollRow = @{'Collection Name' = $UserCollection.Name; `
		'Collection ID' = $UserCollection.CollectionID; `
		'Member Count' = $UserCollection.MemberCount; `
		'Limited To' = "$($UserCollection.LimitToCollectionName) / $($UserCollection.LimitToCollectionID)";};
		$UserCollHashArray += $UserCollRow;
	}
	$Table = AddWordTable -Hashtable $UserCollHashArray `
	-Columns 'Collection Name', 'Collection ID', 'Member Count', 'Limited To' `
	-Headers 'Collection Name', 'Collection ID', 'Member Count', 'Limited To' `
	-Format -155 `
	-AutoFit $wdAutoFitContent;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null
}
Else
{
	WriteWordLine 0 1 "There are $($UserCollections.count) User Collections." 
}

#endregion enumerating all User Collections

#region enumerating all Device Collections
WriteWordLine 2 0 'Summary of Device Collections'
$DeviceCollections = Get-CMDeviceCollection -EA 0 4>$Null
If($ListAllInformation)
{
	ForEach($DeviceCollection in $DeviceCollections)
	{
		Write-Verbose "$(Get-Date -Format G):   Found Device Collection: $($DeviceCollection.Name)"
		WriteWordLine 0 1 "Collection Name: $($DeviceCollection.Name)" -boldface $true
		WriteWordLine 0 1 "Collection ID: $($DeviceCollection.CollectionID)"
		WriteWordLine 0 1 "Total count of members: $($DeviceCollection.MemberCount)"
		WriteWordLine 0 1 "Limited to Device Collection: $($DeviceCollection.LimitToCollectionName) / $($DeviceCollection.LimitToCollectionID)"
		$CollSettings = Get-WmiObject -Class SMS_CollectionSettings `
		-Namespace root\sms\site_$SiteCode -ComputerName $SMSProvider | `
		Where-Object {$_.CollectionID -eq "$($DeviceCollection.CollectionID)"}
		
		If(-not [String]::IsNullOrEmpty($CollSettings))
		{
			$CollSettings = [wmi]$CollSettings.__PATH
			$ServiceWindows = $($CollSettings.ServiceWindows)
			If(-not [string]::IsNullOrEmpty($ServiceWindows))
			{
				#$ServiceWindows
				WriteWordLine 0 2 'Checking Maintenance Windows on Collection:' 
				#$ServiceWindows = [wmi]$ServiceWindows.__PATH

				ForEach($ServiceWindow in $ServiceWindows)
				{

					$ScheduleString = Read-ScheduleToken $ServiceWindow
					$startTime = $ScheduleString.TokenData.starttime
					$startTime = Convert-NormalDateToConfigMgrDate -starttime $startTime
					WriteWordLine 0 3 "Maintenance window name: $($ServiceWindow.Name)"
					Switch ($ServiceWindow.ServiceWindowType)
					{
						0 {WriteWordLine 0 3 'This is a Task Sequence maintenance window'}
						1 {WriteWordLine 0 3 'This is a general maintenance window'}                        
					}   
					Switch ($ServiceWindow.RecurrenceType)
					{
						1 
							{
								WriteWordLine 0 3 "This maintenance window occurs only once on $($startTime) and lasts for $($ScheduleString.TokenData.HourDuration) hour(s) and $($ScheduleString.TokenData.MinuteDuration) minute(s)."
							}
						2 
							{
								If($ScheduleString.TokenData.DaySpan -eq '1')
								{
									$daily = 'daily'
								}
								Else
								{
									$daily = "every $($ScheduleString.TokenData.DaySpan) days"
								}

								WriteWordLine 0 3 "This maintenance window occurs $($daily)."
							}
						3 
							{                                              
								WriteWordLine 0 3 "This maintenance window occurs every $($ScheduleString.TokenData.ForNumberofWeeks) week(s) on $(Convert-WeekDay $ScheduleString.TokenData.Day) and lasts $($ScheduleString.TokenData.HourDuration) hour(s) and $($ScheduleString.TokenData.MinuteDuration) minute(s) starting on $($startTime)."
							}
						4 
							{
								Switch ($ScheduleString.TokenData.weekorder)
								{
									0 {$order = 'last'}
									1 {$order = 'first'}
									2 {$order = 'second'}
									3 {$order = 'third'}
									4 {$order = 'fourth'}
								}
								WriteWordLine 0 3 "This maintenance window occurs every $($ScheduleString.TokenData.ForNumberofMonths) month(s) on every $($order) $(Convert-WeekDay $ScheduleString.TokenData.Day)"
							}
						5 
							{
								If($ScheduleString.TokenData.MonthDay -eq '0')
								{ 
									$DayOfMonth = 'the last day of the month'
								}
								Else
								{
									$DayOfMonth = "day $($ScheduleString.TokenData.MonthDay)"
								}
								WriteWordLine 0 3 "This maintenance window occurs every $($ScheduleString.TokenData.ForNumberofMonths) month(s) on $($DayOfMonth)."
								WriteWordLine 0 3 "It lasts $($ScheduleString.TokenData.HourDuration) hours and $($ScheduleString.TokenData.MinuteDuration) minutes."
							}
					}
					Switch ($ServiceWindow.IsEnabled)
					{
						true {WriteWordLine 0 3 'The maintenance window is enabled'}
						false {WriteWordLine 0 3 'The maintenance window is disabled'}
					}
				}
			}
			Else
			{
				WriteWordLine 0 2 'No maintenance windows configured on this collection.'
			}
		}
		try 
		{
			$CollVars = Get-CMDeviceCollectionVariable -CollectionId $DeviceCollection.CollectionID -EA 0 4>$Null
			If($CollVars) 
			{
				$CollVarsHashArray = @();

				ForEach($CollVar in $CollVars)
				{
					$CollVarRow = @{'Variable Name'= $CollVar.Name; `
					'Value' = $CollVar.Value; `
					'Hidden Value' = $CollVar.IsMasked};
					$CollVarsHashArray += $CollVarRow;
				}

				$Table = AddWordTable -Hashtable $CollVarsHashArray `
				-Columns 'Variable Name', 'Value', 'Hidden Value' `
				-Headers 'Variable Name', 'Value', 'Hidden Value' `
				-Format -155 `
				-AutoFit $wdAutoFitContent

				## Set first column format
				SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

				FindWordDocumentEnd
				WriteWordLine 0 0 ""
				$Table = $Null
			}
			Else 
			{
				WriteWordLine 0 1 'No device collection variables configured!'
			}
		}
		catch [System.Management.Automation.PropertyNotFoundException] 
		{
			WriteWordLine 0 0 ''
		}
		### enumerating the Collection Membership Rules
		$QueryRules = $Null
		$DirectRules = $Null
		$IncludeRules = $Null
		$CollectionRules = $DeviceCollection.CollectionRules #just for Direct and Query

		$Collection = Get-WmiObject -Namespace root\sms\site_$SiteCode `
		-Query "SELECT * FROM SMS_Collection WHERE CollectionID = '$($DeviceCollection.CollectionID)'" `
		-ComputerName $SMSProvider 4>$Null
		
		[wmi]$Collection = $Collection.__PATH

		$OtherCollectionRules = $Collection.CollectionRules
		try 
		{
			$DirectRules = $CollectionRules | Where-Object {$_.ResourceID} -ErrorAction SilentlyContinue
		}
		catch [System.Management.Automation.PropertyNotFoundException] 
		{
			WriteWordLine 0 0 ''
		}
		try 
		{
			$QueryRules = $CollectionRules | Where-Object {$_.QueryExpression} -ErrorAction SilentlyContinue                            
		}
		catch [System.Management.Automation.PropertyNotFoundException] 
		{
			WriteWordLine 0 0 ''
		}
		try 
		{
			$IncludeRules = $OtherCollectionRules | Where-Object {$_.IncludeCollectionID} -ErrorAction SilentlyContinue
		}
		catch [System.Management.Automation.PropertyNotFoundException] 
		{
			WriteWordLine 0 0 ''
		}

		If($QueryRules) 
		{            
			$QueryRulesHashArray = @();

			ForEach($QueryRule in $QueryRules)
			{
				$QueryRuleRow = @{'Query Name'= $QueryRule.RuleName; `
				'Query Expression' = $QueryRule.QueryExpression; `
				'Query ID' = $QueryRule.QueryId};
				$QueryRulesHashArray += $QueryRuleRow;
			}

			$Table = AddWordTable -Hashtable $QueryRulesHashArray `
			-Columns 'Query Name', 'Query Expression', 'Query ID' `
			-Headers 'Query Name', 'Query Expression', 'Query ID' `
			-Format -155 `
			-AutoFit $wdAutoFitFixed;

			## Set first column format
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Columns.Item(1).Width = 100;
			$Table.Columns.Item(2).Width = 350;
			$Table.Columns.Item(3).Width = 50;

			FindWordDocumentEnd
			WriteWordLine 0 0 ""
			$Table = $Null
		}
		If($DirectRules) 
		{
			$DirectRulesHashArray = @();

			ForEach($DirectRule in $DirectRules)
			{
				$DirectRuleRow = @{'Resource Name'= $DirectRule.RuleName; `
				'Resource ID' = $DirectRule.ResourceId};
				$DirectRulesHashArray += $DirectRuleRow;
			}

			$Table = AddWordTable -Hashtable $DirectRulesHashArray `
			-Columns 'Resource Name', 'Resource ID' `
			-Headers 'Resource Name', 'Resource ID' `
			-Format -155 `
			-AutoFit $wdAutoFitContent;

			## Set first column format
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			FindWordDocumentEnd
			WriteWordLine 0 0 ""
			$Table = $Null           
		}
		Else 
		{
			WriteWordLine 0 1 'No device collection direct membership rules configured!'
		}
		If($IncludeRules) 
		{
			$IncludeRulesHashArray = @();

			ForEach($IncludeRule in $IncludeRules)
			{
				$IncludeRuleRow = @{'Collection Name'= $IncludeRule.RuleName; `
				'Collection ID' = $IncludeRule.IncludeCollectionId};
				$IncludeRulesHashArray += $IncludeRuleRow;
			}

			$Table = AddWordTable -Hashtable $IncludeRulesHashArray `
			-Columns 'Collection Name', 'Collection ID' `
			-Headers 'Collection Name', 'Collection ID' `
			-Format -155 `
			-AutoFit $wdAutoFitContent;

			## Set first column format
			SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

			$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)
			$Table.AutoFitBehavior($wdAutoFitFixed)

			FindWordDocumentEnd
			WriteWordLine 0 0 ""
			$Table = $Null  
		}
		Else 
		{
			WriteWordLine 0 1 'No device collection Include Collection membership rules configured!'
		}
		#move to the end of the current document
		Write-Verbose "$(Get-Date -Format G):   move to the end of the current document"
		$selection.EndKey($wdStory,$wdMove) | Out-Null
		WriteWordLine 0 0 ''
	}
}
Else 
{
	WriteWordLine 0 1 "There are $($DeviceCollections.count) Device collections."
}

Write-Verbose "$(Get-Date -Format G):   Working on Compliance Settings"
WriteWordLine 2 0 'Compliance Settings'
WriteWordLine 0 0 ''
WriteWordLine 3 0 'Configuration Items'

$CIs = Get-CMConfigurationItem -EA 0 4>$Null

$CIsHashArray = @();

ForEach($CI in $CIs)
{
	$CIRow = @{'Name' = $CI.LocalizedDisplayName; `
	'Last modified' = $CI.DateLastModified; `
	'Last modified by' = $CI.LastModifiedBy; `
	'CI ID' = $CI.CI_ID}
	$CIsHashArray += $CIRow
}
$Table = AddWordTable -Hashtable $CIsHashArray `
-Columns 'Name', 'Last modified', 'Last modified by', 'CI ID' `
-Headers 'Name', 'Last modified', 'Last modified by', 'CI ID' `
-Format -155 `
-AutoFit $wdAutoFitFixed;

## Set first column format
SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

$Table.Columns.Item(1).Width = 150;
$Table.Columns.Item(2).Width = 100;
$Table.Columns.Item(3).Width = 100;
$Table.Columns.Item(3).Width = 150;

FindWordDocumentEnd
WriteWordLine 0 0 ""
$Table = $Null

WriteWordLine 0 0 ''

WriteWordLine 3 0 'Configuration Baselines'
$CBs = Get-CMBaseline -EA 0 4>$Null

If($CBs) 
{

	$CBsHashArray = @();

	ForEach($CB in $CBs)
	{
		$CBRow = @{'Name' = $CB.LocalizedDisplayName; `
		'Last modified' = $CB.DateLastModified; `
		'Last modified by' = $CB.LastModifiedBy; `
		'CI ID' = $CB.CI_ID}
		$CBsHashArray += $CBRow
	}
	$Table = AddWordTable -Hashtable $CBsHashArray `
	-Columns 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Headers 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Format -155 `
	-AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	$Table.Columns.Item(1).Width = 150;
	$Table.Columns.Item(2).Width = 100;
	$Table.Columns.Item(3).Width = 100;
	$Table.Columns.Item(3).Width = 150;

	FindWordDocumentEnd
	WriteWordLine 0 0 ""
	$Table = $Null

	WriteWordLine 0 0 ''

}
Else 
{
	WriteWordLine 0 1 'There are no Configuration Baselines configured.'
}

### User Data and Profiles
Write-Verbose "$(Get-Date -Format G):   Working on User Data and Profiles"
WriteWordLine 3 0 'User Data and Profiles'
$UserDataProfiles = Get-CMUserDataAndProfileConfigurationItem -EA 0 4>$Null

If(-not [string]::IsNullOrEmpty($UserDataProfiles)) 
{
	$UserDataProfilesHashArray = @();

	ForEach($UDP in $UserDataProfiles)
	{
		$UDPRow = @{'Name' = $UDP.LocalizedDisplayName; `
		'Last modified' = $UDP.DateLastModified; `
		'Last modified by' = $UDP.LastModifiedBy; `
		'CI ID' = $UDP.CI_ID}
		$UserDataProfilesHashArray += $UDPRow
	}
	$Table = AddWordTable -Hashtable $UserDataProfilesHashArray `
	-Columns 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Headers 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Format -155 `
	-AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	$Table.Columns.Item(1).Width = 150;
	$Table.Columns.Item(2).Width = 100;
	$Table.Columns.Item(3).Width = 100;
	$Table.Columns.Item(3).Width = 150;

	FindWordDocumentEnd
	$Table = $Null
	WriteWordLine 0 0 ''
}
Else 
{
	WriteWordLine 0 1 'There are no User Data and Profile configurations configured.'
}

Write-Verbose "$(Get-Date -Format G):   Working on Endpoint Protection"
WriteWordLine 2 0 'Endpoint Protection'
If(-not ($(Get-CMEndpointProtectionPoint) -eq $Null))
{
	WriteWordLine 3 0 'Antimalware Policies'
	$AntiMalwarePolicies = Get-CMAntimalwarePolicy -EA 0 4>$Null
	If(-not [string]::IsNullOrEmpty($AntiMalwarePolicies))
	{
		ForEach($AntiMalwarePolicy in $AntiMalwarePolicies)
		{
			If($AntiMalwarePolicy.Name -eq 'Default Client Antimalware Policy')
			{
				$AgentConfig = $AntiMalwarePolicy.AgentConfiguration
				WriteWordLine 0 1 "$($AntiMalwarePolicy.Name)" -boldface $true
				WriteWordLine 0 1 "Description: $($AntiMalwarePolicy.Description)"
				WriteWordLine 0 2 'Scheduled Scans' -boldface $true
				WriteWordLine 0 3 "Run a scheduled scan on client computers: $($AgentConfig.EnableScheduledScan)"
				If($AgentConfig.EnableScheduledScan)
				{
					Switch ($AgentConfig.ScheduledScanType)
					{
						1 { $ScheduledScanType = 'Quick Scan' }
						2 { $ScheduledScanType = 'Full Scan' }
					}
					WriteWordLine 0 3 "Scan type: $($ScheduledScanType)"
					WriteWordLine 0 3 "Scan day: $(Convert-WeekDay $AgentConfig.ScheduledScanWeekDay)"
					WriteWordLine 0 3 "Scan time: $(Convert-Time -time $AgentConfig.ScheduledScanTime)"
					WriteWordLine 0 3 "Run a daily quick scan on client computers: $($AgentConfig.EnableQuickDailyScan)"
					WriteWordLine 0 3 "Daily quick scan schedule time: $(Convert-Time -time $AgentConfig.ScheduledScanQuickTime)"
					WriteWordLine 0 3 "Check for the latest definition updates before running a scan: $($AgentConfig.CheckLatestDefinition)"
					WriteWordLine 0 3 "Start a scheduled scan only when the computer is idle: $($AgentConfig.ScanWhenClientNotInUse)"
					WriteWordLine 0 3 "Force a scan of the selected scan type if client computer is offline during two or more scheduled scans: $($AgentConfig.EnableCatchupScan)"
					WriteWordLine 0 3 "Limit CPU usage during scans to (%): $($AgentConfig.LimitCPUUsage)"
				}
				WriteWordLine 0 0 ''
				WriteWordLine 0 2 'Scan settings' -boldface $true
				WriteWordLine 0 3 "Scan email and email attachments: $($AgentConfig.ScanEmail)"
				WriteWordLine 0 3 "Scan removable storage devices such as USB drives: $($AgentConfig.ScanRemovableStorage)"
				WriteWordLine 0 3 "Scan network drives when running a full scan: $($AgentConfig.ScanNetworkDrives)"
				WriteWordLine 0 3 "Scan archived files: $($AgentConfig.ScanArchivedFiles)"
				WriteWordLine 0 3 "Allow users to configure CPU usage during scans: $($AgentConfig.AllowClientUserConfigLimitCPUUsage)"
				WriteWordLine 0 3 'User control of scheduled scans: ' -nonewline
				Switch ($AgentConfig.ScheduledScanUserControl)
				{
					0 { WriteWordLine 0 0 'No control' }
					1 { WriteWordLine 0 0 'Scan time only' }
					2 { WriteWordLine 0 0 'Full control' }
				}
				WriteWordLine 0 2 'Default Actions' -boldface $true
				WriteWordLine 0 3 'Severe threats: ' -nonewline
				Switch ($AgentConfig.DefaultActionSevere)
				{
					0 { WriteWordLine 0 0 'Recommended' }
					2 { WriteWordLine 0 0 'Quarantine' }
					3 { WriteWordLine 0 0 'Remove' }
					6 { WriteWordLine 0 0 'Allow' }
				}
				WriteWordLine 0 3 'High threats: ' -nonewline
				Switch ($AgentConfig.DefaultActionSevere)
				{
					0 { WriteWordLine 0 0 'Recommended' }
					2 { WriteWordLine 0 0 'Quarantine' }
					3 { WriteWordLine 0 0 'Remove' }
					6 { WriteWordLine 0 0 'Allow' }
				}
				WriteWordLine 0 3 'Medium threats: ' -nonewline
				Switch ($AgentConfig.DefaultActionSevere)
				{
					0 { WriteWordLine 0 0 'Recommended' }
					2 { WriteWordLine 0 0 'Quarantine' }
					3 { WriteWordLine 0 0 'Remove' }
					6 { WriteWordLine 0 0 'Allow' }
				}
				WriteWordLine 0 3 'Low threats: ' -nonewline
				Switch ($AgentConfig.DefaultActionSevere)
				{
					0 { WriteWordLine 0 0 'Recommended' }
					2 { WriteWordLine 0 0 'Quarantine' }
					3 { WriteWordLine 0 0 'Remove' }
					6 { WriteWordLine 0 0 'Allow' }
				}
				WriteWordLine 0 2 'Real-time protection' -boldface $true
				WriteWordLine 0 3 "Enable real-time protection: $($AgentConfig.RealtimeProtectionOn)"
				WriteWordLine 0 3 "Monitor file and program activity on your computer: $($AgentConfig.MonitorFileProgramActivity)"
				WriteWordLine 0 3 'Scan system files: ' -nonewline
				Switch ($AgentConfig.RealtimeScanOption)
				{
					0 { WriteWordLine 0 0 'Scan incoming and outgoing files' }
					1 { WriteWordLine 0 0 'Scan incoming files only' }
					2 { WriteWordLine 0 0 'Scan outgoing files only' }
				}
				WriteWordLine 0 2 'Exclusion settings' -boldface $true
				WriteWordLine 0 3 'Excluded files and folders: '
				ForEach($ExcludedFileFolder in $AgentConfig.ExcludedFilePaths)
				{
					WriteWordLine 0 4 "$($ExcludedFileFolder)"
				}
				WriteWordLine 0 3 'Excluded file types: '
				ForEach($ExcludedFileType in $AgentConfig.ExcludedFileTypes)
				{
					WriteWordLine 0 4 "$($ExcludedFileType)"
				}
				WriteWordLine 0 3 'Excluded processes: '
				ForEach($ExcludedProcess in $AgentConfig.ExcludedProcesses)
				{
					WriteWordLine 0 4 "$($ExcludedProcess)"
				}
				WriteWordLine 0 2 'Advanced' -boldface $true
				WriteWordLine 0 3 "Create a system restore point before computers are cleaned: $($AgentConfig.CreateSystemRestorePointBeforeClean)"
				WriteWordLine 0 3 "Disable the client user interface: $($AgentConfig.DisableClientUI)"
				WriteWordLine 0 3 "Show notifications messages on the client computer when the user needs to run a full scan, update definitions, or run Windows Defender Offline: $($AgentConfig.ShowNotificationMessages)"
				WriteWordLine 0 3 "Delete quarantined files after (days): $($AgentConfig.DeleteQuarantinedFilesPeriod)"
				WriteWordLine 0 3 "Allow users to configure the setting for quarantined file deletion: $($AgentConfig.AllowUserConfigQuarantinedFileDeletionPeriod)"
				WriteWordLine 0 3 "Allow users to exclude file and folders, file types and processes: $($AgentConfig.AllowUserAddExcludes)"
				WriteWordLine 0 3 "Allow all users to view the full History results: $($AgentConfig.AllowUserViewHistory)"
				WriteWordLine 0 3 "Enable reparse point scanning: $($AgentConfig.EnableReparsePointScanning)"
				WriteWordLine 0 3 "Randomize scheduled scan and definition update start time (within 30 minutes): $($AgentConfig.RandomizeScheduledScanStartTime)"

				WriteWordLine 0 2 'Threat overrides' -boldface $true
				If(-not [string]::IsNullOrEmpty($AgentConfig.ThreatName))
				{
					WriteWordLine 0 3 'Threat name and override action: Threats specified.'
				}
				WriteWordLine 0 2 'Microsoft Active Protection Service' -boldface $true
				WriteWordLine 0 3 'Microsoft Active Protection Service membership type: ' -nonewline
				Switch ($AgentConfig.JoinSpyNet)
				{
					0 { WriteWordLine 0 0 'Do not join MAPS' }
					1 { WriteWordLine 0 0 'Basic membership' }
					2 { WriteWordLine 0 0 'Advanced membership' }
				}
				WriteWordLine 0 3 "Allow users to modify Microsoft Active Protection Service settings: $($AgentConfig.AllowUserChangeSpyNetSettings)"

				WriteWordLine 0 2 'Definition Updates' -boldface $true
				WriteWordLine 0 3 "Check for Endpoint Protection definitions at a specific interval (hours): (0 disable check on interval) $($AgentConfig.SignatureUpdateInterval)"
				WriteWordLine 0 3 "Check for Endpoint Protection definitions daily at: (Only configurable if interval-based check is disabled) $(Convert-Time -time $AgentConfig.SignatureUpdateTime)"
				WriteWordLine 0 3 "Force a definition update if the client computer is offline for more than two consecutive scheduled updates: $($AgentConfig.EnableSignatureUpdateCatchupInterval)"
				WriteWordLine 0 3 'Set sources and order for Endpoint Protection definition updates: ForEach($Fallback in $AgentConfig.FallbackOrder)'
				{
					WriteWordLine 0 3 "$($Fallback)"
				}
				WriteWordLine 0 3 "If Configuration Manager is used as a source for definition updates, clients will only update from alternative sources if definition is older than (hours): $($AgentConfig.AuGracePeriod / 60)"
				WriteWordLine 0 3 'If UNC file shares are selected as a definition update source, specify the UNC paths:' 
				ForEach($UNCShare in $AgentConfig.DefinitionUpdateFileSharesSources)
				{
					WriteWordLine 0 4 "$($UNCShare)"
				}
			}
			Else
			{
				$AgentConfig_custom = $AntiMalwarePolicy.AgentConfigurations
				WriteWordLine 0 1 "$($AntiMalwarePolicy.Name)" -boldface $true
				WriteWordLine 0 1 "Description: $($AntiMalwarePolicy.Description)"
				ForEach($Agentconfig in $AgentConfig_custom)
				{
					Switch ($AgentConfig.AgentID)
					{
						201 
							{
								WriteWordLine 0 2 'Scheduled Scans' -boldface $true
								WriteWordLine 0 2 "Run a scheduled scan on client computers: $($AgentConfig.EnableScheduledScan)"
								If($AgentConfig.EnableScheduledScan)
								{
									Switch ($AgentConfig.ScheduledScanType)
									{
										1 { $ScheduledScanType = 'Quick Scan' }
										2 { $ScheduledScanType = 'Full Scan' }
									}
									WriteWordLine 0 3 "Scan type: $($ScheduledScanType)"
									WriteWordLine 0 3 "Scan day: $(Convert-WeekDay $AgentConfig.ScheduledScanWeekDay)"
									WriteWordLine 0 3 "Scan time: $(Convert-Time -time $AgentConfig.ScheduledScanTime)"
									WriteWordLine 0 3 "Run a daily quick scan on client computers: $($AgentConfig.EnableQuickDailyScan)"
									WriteWordLine 0 3 "Daily quick scan schedule time: $(Convert-Time -time $AgentConfig.ScheduledScanQuickTime)"
									WriteWordLine 0 3 "Check for the latest definition updates before running a scan: $($AgentConfig.CheckLatestDefinition)"
									WriteWordLine 0 3 "Start a scheduled scan only when the computer is idle: $($AgentConfig.ScanWhenClientNotInUse)"
									WriteWordLine 0 3 "Force a scan of the selected scan type if client computer is offline during two or more scheduled scans: $($AgentConfig.EnableCatchupScan)"
									WriteWordLine 0 3 "Limit CPU usage during scans to (%): $($AgentConfig.LimitCPUUsage)"
								}
							}
						202
							{
								WriteWordLine 0 2 'Default Actions' -boldface $true
								WriteWordLine 0 3 'Severe threats: ' -nonewline
								Switch ($AgentConfig.DefaultActionSevere)
								{
									0 { WriteWordLine 0 0 'Recommended' }
									2 { WriteWordLine 0 0 'Quarantine' }
									3 { WriteWordLine 0 0 'Remove' }
									6 { WriteWordLine 0 0 'Allow' }
								}
								WriteWordLine 0 3 'High threats: ' -nonewline
								Switch ($AgentConfig.DefaultActionSevere)
								{
									0 { WriteWordLine 0 0 'Recommended' }
									2 { WriteWordLine 0 0 'Quarantine' }
									3 { WriteWordLine 0 0 'Remove' }
									6 { WriteWordLine 0 0 'Allow' }
								}
								WriteWordLine 0 3 'Medium threats: ' -nonewline
								Switch ($AgentConfig.DefaultActionSevere)
								{
									0 { WriteWordLine 0 0 'Recommended' }
									2 { WriteWordLine 0 0 'Quarantine' }
									3 { WriteWordLine 0 0 'Remove' }
									6 { WriteWordLine 0 0 'Allow' }
								}
								WriteWordLine 0 3 'Low threats: ' -nonewline
								Switch ($AgentConfig.DefaultActionSevere)
								{
									0 { WriteWordLine 0 0 'Recommended' }
									2 { WriteWordLine 0 0 'Quarantine' }
									3 { WriteWordLine 0 0 'Remove' }
									6 { WriteWordLine 0 0 'Allow' }
								}                                           
							}
						203
							{
								WriteWordLine 0 2 'Exclusion settings' -boldface $true
								WriteWordLine 0 3 'Excluded files and folders: '
								ForEach($ExcludedFileFolder in $AgentConfig.ExcludedFilePaths)
								{
									WriteWordLine 0 4 "$($ExcludedFileFolder)"
								}
								WriteWordLine 0 3 'Excluded file types: '
								ForEach($ExcludedFileType in $AgentConfig.ExcludedFileTypes)
								{
									WriteWordLine 0 4 "$($ExcludedFileType)"
								}
								WriteWordLine 0 3 'Excluded processes: '
								ForEach($ExcludedProcess in $AgentConfig.ExcludedProcesses)
								{
									WriteWordLine 0 4 "$($ExcludedProcess)"
								}                                            
							}
						204
							{
								WriteWordLine 0 2 'Real-time protection' -boldface $true
								WriteWordLine 0 3 "Enable real-time protection: $($AgentConfig.RealtimeProtectionOn)"
								WriteWordLine 0 3 "Monitor file and program activity on your computer: $($AgentConfig.MonitorFileProgramActivity)"
								WriteWordLine 0 3 'Scan system files: ' -nonewline
								Switch ($AgentConfig.RealtimeScanOption)
								{
									0 { WriteWordLine 0 0 'Scan incoming and outgoing files' }
									1 { WriteWordLine 0 0 'Scan incoming files only' }
									2 { WriteWordLine 0 0 'Scan outgoing files only' }
								}                                            
							}
						205
							{
								WriteWordLine 0 2 'Advanced' -boldface $true
								WriteWordLine 0 3 "Create a system restore point before computers are cleaned: $($AgentConfig.CreateSystemRestorePointBeforeClean)"
								WriteWordLine 0 3 "Disable the client user interface: $($AgentConfig.DisableClientUI)"
								WriteWordLine 0 3 "Show notifications messages on the client computer when the user needs to run a full scan, update definitions, or run Windows Defender Offline: $($AgentConfig.ShowNotificationMessages)"
								WriteWordLine 0 3 "Delete quarantined files after (days): $($AgentConfig.DeleteQuarantinedFilesPeriod)"
								WriteWordLine 0 3 "Allow users to configure the setting for quarantined file deletion: $($AgentConfig.AllowUserConfigQuarantinedFileDeletionPeriod)"
								WriteWordLine 0 3 "Allow users to exclude file and folders, file types and processes: $($AgentConfig.AllowUserAddExcludes)"
								WriteWordLine 0 3 "Allow all users to view the full History results: $($AgentConfig.AllowUserViewHistory)"
								WriteWordLine 0 3 "Enable reparse point scanning: $($AgentConfig.EnableReparsePointScanning)"
								WriteWordLine 0 3 "Randomize scheduled scan and definition update start time (within 30 minutes): $($AgentConfig.RandomizeScheduledScanStartTime)"                                            
							}
						206
							{

							}
						207
							{
								WriteWordLine 0 2 'Microsoft Active Protection Service' -boldface $true
								WriteWordLine 0 3 'Microsoft Active Protection Service membership type: ' -nonewline
								Switch ($AgentConfig.JoinSpyNet)
								{
									0 { WriteWordLine 0 0 'Do not join MAPS' }
									1 { WriteWordLine 0 0 'Basic membership' }
									2 { WriteWordLine 0 0 'Advanced membership' }
								}
								WriteWordLine 0 3 "Allow users to modify Microsoft Active Protection Service settings: $($AgentConfig.AllowUserChangeSpyNetSettings)"                                            
							}
						208
							{
								WriteWordLine 0 2 'Definition Updates' -boldface $true
								WriteWordLine 0 3 "Check for Endpoint Protection definitions at a specific interval (hours): (0 disable check on interval) $($AgentConfig.SignatureUpdateInterval)"
								WriteWordLine 0 3 "Check for Endpoint Protection definitions daily at: (Only configurable if interval-based check is disabled) $(Convert-Time -time $AgentConfig.SignatureUpdateTime)"
								WriteWordLine 0 3 "Force a definition update if the client computer is offline for more than two consecutive scheduled updates: $($AgentConfig.EnableSignatureUpdateCatchupInterval)"
								WriteWordLine 0 3 'Set sources and order for Endpoint Protection definition updates: '
								ForEach($Fallback in $AgentConfig.FallbackOrder)
								{
									WriteWordLine 0 4 "$($Fallback)"
								}
								WriteWordLine 0 3 "If Configuration Manager is used as a source for definition updates, clients will only update from alternative sources if definition is older than (hours): $($AgentConfig.AuGracePeriod / 60)"
								WriteWordLine 0 3 'If UNC file shares are selected as a definition update source, specify the UNC paths:' 
								ForEach($UNCShare in $AgentConfig.DefinitionUpdateFileSharesSources)
								{
									WriteWordLine 0 4 "$($UNCShare)"
								}
							}
						209
							{
								WriteWordLine 0 2 'Scan settings' -boldface $true
								WriteWordLine 0 3 "Scan email and email attachments: $($AgentConfig.ScanEmail)"
								WriteWordLine 0 3 "Scan removable storage devices such as USB drives: $($AgentConfig.ScanRemovableStorage)"
								WriteWordLine 0 3 "Scan network drives when running a full scan: $($AgentConfig.ScanNetworkDrives)"
								WriteWordLine 0 3 "Scan archived files: $($AgentConfig.ScanArchivedFiles)"
								WriteWordLine 0 3 "Allow users to configure CPU usage during scans: $($AgentConfig.AllowClientUserConfigLimitCPUUsage)"
								WriteWordLine 0 3 'User control of scheduled scans: ' -nonewline
								Switch ($AgentConfig.ScheduledScanUserControl)
								{
									0 { WriteWordLine 0 0 'No control' }
									1 { WriteWordLine 0 0 'Scan time only' }
									2 { WriteWordLine 0 0 'Full control' }
								}
							}
					}
				}
			}
		}	
	}
	Else
	{
		WriteWordLine 0 1 'There are no Anti Malware Policies configured.'
	}
}
Else
{
	WriteWordLine 0 1 'There is no Endpoint Protection Point enabled.'
}

WriteWordLine 0 0 ''

Write-Verbose "$(Get-Date -Format G):   Working on Windows Firewall Policies"
WriteWordLine 3 0 'Windows Firewall Policies'

$FirewallPolicies = Get-CMWindowsFirewallPolicy -EA 0 4>$Null
If(-not [string]::IsNullOrEmpty($FirewallPolicies)) 
{

	$FirewallPolsHashArray = @()

	ForEach($FWP in $FirewallPolicies)
	{
		$FWPRow = @{'Name' = $FWP.LocalizedDisplayName; `
		'Last modified' = $FWP.DateLastModified; `
		'Last modified by' = $FWP.LastModifiedBy; `
		'CI ID' = $FWP.CI_ID}
		$FirewallPolsHashArray += $FWPRow
	}
	$Table = AddWordTable -Hashtable $FirewallPolsHashArray `
	-Columns 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Headers 'Name', 'Last modified', 'Last modified by', 'CI ID' `
	-Format -155 `
	-AutoFit $wdAutoFitFixed;

	## Set first column format
	SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

	## IB - set column widths without recursion
	$Table.Columns.Item(1).Width = 150;
	$Table.Columns.Item(2).Width = 100;
	$Table.Columns.Item(3).Width = 100;
	$Table.Columns.Item(4).Width = 150;

	$Table.Rows.SetLeftIndent($Indent0TabStops,$wdAdjustProportional)

	FindWordDocumentEnd
	$Table = $Null
	WriteWordLine 0 0 ''           

}
Else 
{
	WriteWordLine 0 1 'There are no Windows Firewall policies configured.'
}

#####
##### finished with Assets and Compliance, moving on to Software Library
#####
Write-Verbose "$(Get-Date -Format G):   Finished with Assets and Compliance."

#endregion Assets and Compliance

If($Software)
{
	Write-Verbose "$(Get-Date -Format G):   moving on to Software Library"
	WriteWordLine 1 0 'Software Library'

	##### Applications

	WriteWordLine 2 0 'Applications'
	WriteWordLine 0 0 ''
	$Applications = Get-WmiObject -Class sms_applicationlatest -Namespace root\sms\site_$SiteCode -ComputerName $SMSProvider
	If($ListAllInformation)
	{
		If(-not [string]::IsNullOrEmpty($Applications)) 
		{
			WriteWordLine 0 1 'The following Applications are configured in this site:'

			ForEach($App in $Applications) {
				Write-Verbose 'Getting specific WMI instance for this App'
				[wmi]$App = $App.__PATH
				Write-Verbose "$(Get-Date -Format G):   Found App: $($App.LocalizedDisplayName)"
				WriteWordLine 0 2 "$($App.LocalizedDisplayName)" -boldface $true
				WriteWordLine 0 3 "Created by: $($App.CreatedBy)"
				WriteWordLine 0 3 "Date created: $($App.DateCreated)"
				$DTs = Get-CMDeploymentType -ApplicationName $App.LocalizedDisplayName -EA 0 4>$Null
				If(-not [string]::IsNullOrEmpty($DTs)) 
				{
					$DTsHashArray = @()

					ForEach($DT in $DTs) {
						$xmlDT = [xml]$DT.SDMPackageXML
						$DTRow = @{'Deployment Type Name' = $DT.LocalizedDisplayName; `
									'Technology' = $DT.Technology; `
									'Commandline' = If(-not ($DT.Technology -like 'AppV*'))`
									{ $xmlDT.AppMgmtDigest.DeploymentType.Installer.CustomData.InstallCommandLine } 
						}
						$DTsHashArray += $DTRow
					}
					$Table = AddWordTable -Hashtable $DTsHashArray `
					-Columns 'Deployment Type Name', 'Technology', 'Commandline' `
					-Headers 'Deployment Type Name', 'Technology', 'Commandline' `
					-Format -155 `
					-AutoFit $wdAutoFitFixed;

					## Set first column format
					SetWordCellFormat -Collection $Table.Rows.Item(1).Cells -Bold -BackgroundColor $wdColorGray15;

					$Table.Columns.Item(1).Width = 200;
					$Table.Columns.Item(2).Width = 100;
					$Table.Columns.Item(3).Width = 200;

					FindWordDocumentEnd
					$Table = $Null
					WriteWordLine 0 0 ''
				}
				Else 
				{
					WriteWordLine 0 3 'There are no Deployment Types configured for this Application.'
				}
			}
		}
		Else 
		{
			WriteWordLine 0 1 'There are no Applications configured in this site.'
		}
	}
	ElseIf($Applications) 
	{
		WriteWordLine 0 1 "There are $($Applications.count) applications configured."
	}
	Else 
	{
		WriteWordLine 0 1 'There are no Applications configured in this site.'
	}
	##### Packages
        
	WriteWordLine 2 0 'Packages'
	WriteWordLine 0 0 ''
	$Packages = Get-CMPackage -EA 0 4>$Null
	If($ListAllInformation)
	{
		If(-not [string]::IsNullOrEmpty($Packages))
		{
			WriteWordLine 0 1 'The following Packages are configured in this site:'
			ForEach($Package in $Packages) {
				WriteWordLine 0 0 ''
				WriteWordLine 0 2 "$($Package.Name)" -boldface $true
				WriteWordLine 0 3 "Description: $($Package.Description)"
				WriteWordLine 0 3 "PackageID: $($Package.PackageID)"
				$Programs = Get-WmiObject -Class SMS_Program -Namespace root\sms\site_$SiteCode `
				-ComputerName $SMSProvider -Filter "PackageID = '$($Package.PackageID)'" 4>$Null
				If(-not [string]::IsNullOrEmpty($Programs))
				{
					WriteWordLine 0 3 'The Package has the following Programs configured:'
					ForEach($Program in $Programs)
					{
						WriteWordLine 0 4 "Program Name: $($Program.ProgramName)" -boldface $true
						WriteWordLine 0 4 "Command Line: $($Program.CommandLine)"
						If($Program.ProgramFlags -band 0x00000001)
						{
							WriteWordLine 0 4 "`'Allow this program to be installed from the Install Package task sequence without being deployed`' enabled."
						}
						If($Program.ProgramFlags -band 0x00000002)
						{
							WriteWordLine 0 4 "`'The task sequence shows a custom progress user interface message.`' enabled."
						}
						If($Program.ProgramFlags -band 0x00000010)
						{
							WriteWordLine 0 4 'This is a default program.'
						}
						If($Program.ProgramFlags -band 0x00000020)
						{
							WriteWordLine 0 4 'Disables MOM alerts while the program runs.'
						}
						If($Program.ProgramFlags -band 0x00000040)
						{
							WriteWordLine 0 4 'Generates MOM alert if the program fails.'
						}
						If($Program.ProgramFlags -band 0x00000080)
						{
							WriteWordLine 0 4 "This program's immediate dependent should always be run."
						}
						If($Program.ProgramFlags -band 0x00000100)
						{
							WriteWordLine 0 4 'A device program. The program is not offered to desktop clients.'
						}
						If($Program.ProgramFlags -band 0x00000400)
						{
							WriteWordLine 0 4 'The countdown dialog is not displayed.'
						}
						If($Program.ProgramFlags -band 0x00001000)
						{
							WriteWordLine 0 4 'The program is disabled.'
						}
						If($Program.ProgramFlags -band 0x00002000)
						{
							WriteWordLine 0 4 'The program requires no user interaction.'
						}
						If($Program.ProgramFlags -band 0x00004000)
						{
							WriteWordLine 0 4 'The program can run only when a user is logged on.'
						}
						If($Program.ProgramFlags -band 0x00008000)
						{
							WriteWordLine 0 4 'The program must be run as the local Administrator account.'
						}
						If($Program.ProgramFlags -band 0x00010000)
						{
							WriteWordLine 0 4 'The program must be run by every user for whom it is valid. Valid only for mandatory jobs.'
						}
						If($Program.ProgramFlags -band 0x00020000)
						{
							WriteWordLine 0 4 'The program is run only when no user is logged on.'
						}
						If($Program.ProgramFlags -band 0x00040000)
						{
							WriteWordLine 0 4 'The program will restart the computer.'
						}
						If($Program.ProgramFlags -band 0x00080000)
						{
							WriteWordLine 0 4 'Configuration Manager restarts the computer when the program has finished running successfully.'
						}
						If($Program.ProgramFlags -band 0x00100000)
						{
							WriteWordLine 0 4 'Use a UNC path (no drive letter) to access the distribution point.'
						}
						If($Program.ProgramFlags -band 0x00200000)
						{
							WriteWordLine 0 4 'Persists the connection to the drive specified in the DriveLetter property. The USEUNCPATH bit flag must not be set.'
						}
						If($Program.ProgramFlags -band 0x00400000)
						{
							WriteWordLine 0 4 'Run the program as a minimized window.'
						}
						If($Program.ProgramFlags -band 0x00800000)
						{
							WriteWordLine 0 4 'Run the program as a maximized window.'
						}
						If($Program.ProgramFlags -band 0x01000000)
						{
							WriteWordLine 0 4 'Hide the program window.'
						}
						If($Program.ProgramFlags -band 0x02000000)
						{
							WriteWordLine 0 4 'Logoff user when program completes successfully.'
						}
						If($Program.ProgramFlags -band 0x08000000)
						{
							WriteWordLine 0 4 'Override check for platform support.'
						}
						If($Program.ProgramFlags -band 0x20000000)
						{
							WriteWordLine 0 4 'Run uninstall from the registry key when the advertisement expires.'   
						}   
					}                   	          
				}
				Else
				{
					WriteWordLine 0 4 'The Package has no Programs configured.'
				}                       
			}
		}
		Else
		{
			WriteWordLine 0 1 'There are no Packages configured in this site.'
		}
	}
	ElseIf($Packages)
	{
		WriteWordLine 0 1 "There are $($Packages.count) packages configured."
	}
	Else
	{
		WriteWordLine 0 1 'There are no packages configured.'
	}
	##### Driver Packages

    WriteWordLine 2 0 'Driver Packages'
    WriteWordLine 0 0 ''
    $DriverPackages = Get-CMDriverPackage -EA 0 4>$Null
	If($ListAllInformation)
	{
		If(-not [string]::IsNullOrEmpty($DriverPackages))
		{
			WriteWordLine 0 1 'The following Driver Packages are configured in your site:'
			ForEach($DriverPackage in $DriverPackages)
			{
				WriteWordLine 0 0 ''
				WriteWordLine 0 2 "Name: $($DriverPackage.Name)" -boldface $true
				If($DriverPackage.Description)
				{
					WriteWordLine 0 2 "Description: $($DriverPackage.Description)"
				}
				WriteWordLine 0 2 "PackageID: $($DriverPackage.PackageID)"
				WriteWordLine 0 2 "Source path: $($DriverPackage.PkgSourcePath)"
				WriteWordLine 0 2 'This package consists of the following Drivers:'
				$Drivers = Get-CMDriver -DriverPackageId "$($DriverPackage.PackageID)" -EA 0 4>$Null
				ForEach($Driver in $Drivers)
				{
					WriteWordLine 0 0 ''
					WriteWordLine 0 3 "Driver Name: $($Driver.LocalizedDisplayName)" -boldface $true
					WriteWordLine 0 3 "Manufacturer: $($Driver.DriverProvider)"
					WriteWordLine 0 3 "Source path: $($Driver.ContentSourcePath)"
					WriteWordLine 0 3 "INF File: $($Driver.DriverINFFile)"
				}
				WriteWordLine 0 3 ''
			}
		}
		Else
		{
			WriteWordLine 0 1 'There are no Driver Packages configured in this site.'
		}
	}
    Else
	{
		If(-not [string]::IsNullOrEmpty($DriverPackages))
		{
			WriteWordLine 0 1 "There are $($DriverPackages.count) Driver Packages configured."                    
		}
		Else
		{
			WriteWordLine 0 1 'There are no Driver Packages configured in this site.'
		}
	}
	##### Operating System Installers

    WriteWordLine 2 0 'Operating System Installers'
    WriteWordLine 0 0 ''
    $OSInstallers = Get-CMOperatingSystemInstaller -EA 0 4>$Null
	If(-not [string]::IsNullOrEmpty($OSInstallers))
	{
		WriteWordLine 0 1 'The following OS Installers are imported into this environment:'
		ForEach($OSInstaller in $OSInstallers)
		{
			WriteWordLine 0 2 "Name: $($OSInstaller.Name)" -boldface $true
			If($OSInstaller.Description)
			{
				WriteWordLine 0 2 "Description: $($OSInstaller.Description)"
			}
			WriteWordLine 0 2 "Package ID: $($OSInstaller.PackageID)"
			WriteWordLine 0 2 "Source Path: $($OSInstaller.PkgSourcePath)"
		}
	}
	Else
	{
		WriteWordLine 0 1 'There are no OS Installers imported into this environment.'
	}

	####
	####
	#### Boot Images
		
	WriteWordLine 2 0 'Boot Images'
	WriteWordLine 0 0 ''
	$BootImages = Get-CMBootImage -EA 0 4>$Null
	If(-not [string]::IsNullOrEmpty($BootImages))
	{
		WriteWordLine 0 1 'The following Boot Images are imported into this environment:'
		WriteWordLine 0 0 ''
		ForEach($BootImage in $BootImages)
		{
			WriteWordLine 0 2 "$($BootImage.Name)" -boldface $true
			If($BootImage.Description)
			{
				WriteWordLine 0 2 "Description: $($BootImage.Description)"
			}
			WriteWordLine 0 2 "Source Path: $($BootImage.PkgSourcePath)"
			WriteWordLine 0 2 "Package ID: $($BootImage.PackageID)"
			WriteWordLine 0 2 'Architecture: ' -nonewline
			Switch ($BootImage.Architecture)
			{
				0 { WriteWordLine 0 0 'x86' }
				9 { WriteWordLine 0 0 'x64' }
			}
			If($BootImage.BackgroundBitmapPath)
			{
				WriteWordLine 0 2 "Custom Background: $($BootImage.BackgroundBitmapPath)"
			}
			Switch ($BootImage.EnableLabShell)
			{
				True { WriteWordLine 0 2 'Command line support is enabled' }
				False { WriteWordLine 0 2 'Command line support is not enabled' }
			}
			WriteWordLine 0 2 'The following drivers are imported into this WinPE'
			If(-not [string]::IsNullOrEmpty($BootImage.ReferencedDrivers))
			{
				$ImportedDriverIDs = ($BootImage.ReferencedDrivers).ID | Out-Null
				ForEach($ImportedDriverID in $ImportedDriverIDs)
				{
					$ImportedDriver = Get-CMDriver -ID $ImportedDriverID -EA 0 4>$Null
					WriteWordLine 0 3 "Name: $($ImportedDriver.LocalizedDisplayName)" -boldface $true
					WriteWordLine 0 3 "Inf File: $($ImportedDriver.DriverINFFile)"
					WriteWordLine 0 3 "Driver Class: $($ImportedDriver.DriverClass)"
					WriteWordLine 0 0 ''
				}
			}
			Else
			{
				WriteWordLine 0 3 'There are no drivers imported into the Boot Image.'
			}
			If(-not [string]::IsNullOrEmpty($BootImage.OptionalComponents))
			{
				$Component = $Null
				WriteWordLine 0 3 'The following Optional Components are added to this Boot Image:'
				ForEach($Component in $BootImage.OptionalComponents)
				{
					Switch ($Component)
					{
						{($_ -eq '1') -or ($_ -eq '27')} { WriteWordLine 0 4 'WinPE-DismCmdlets' }						{($_ -eq '2') -or ($_ -eq '28')} { WriteWordLine 0 4 'WinPE-Dot3Svc' }						{($_ -eq '3') -or ($_ -eq '29')} { WriteWordLine 0 4 'WinPE-EnhancedStorage' }						{($_ -eq '4') -or ($_ -eq '30')} { WriteWordLine 0 4 'WinPE-FMAPI' }						{($_ -eq '5') -or ($_ -eq '31')} { WriteWordLine 0 4 'WinPE-FontSupport-JA-JP' }						{($_ -eq '6') -or ($_ -eq '32')} { WriteWordLine 0 4 'WinPE-FontSupport-KO-KR' }						{($_ -eq '7') -or ($_ -eq '33')} { WriteWordLine 0 4 'WinPE-FontSupport-ZH-CN' }						{($_ -eq '8') -or ($_ -eq '34')} { WriteWordLine 0 4 'WinPE-FontSupport-ZH-HK' }						{($_ -eq '9') -or ($_ -eq '35')} { WriteWordLine 0 4 'WinPE-FontSupport-ZH-TW' }						{($_ -eq '10') -or ($_ -eq '36')} { WriteWordLine 0 4 'WinPE-HTA' }						{($_ -eq '11') -or ($_ -eq '37')} { WriteWordLine 0 4 'WinPE-StorageWMI' }						{($_ -eq '12') -or ($_ -eq '38')} { WriteWordLine 0 4 'WinPE-LegacySetup' }						{($_ -eq '13') -or ($_ -eq '39')} { WriteWordLine 0 4 'WinPE-MDAC' }						{($_ -eq '14') -or ($_ -eq '40')} { WriteWordLine 0 4 'WinPE-NetFx4' }						{($_ -eq '15') -or ($_ -eq '41')} { WriteWordLine 0 4 'WinPE-PowerShell3' }						{($_ -eq '16') -or ($_ -eq '42')} { WriteWordLine 0 4 'WinPE-PPPoE' }						{($_ -eq '17') -or ($_ -eq '43')} { WriteWordLine 0 4 'WinPE-RNDIS' }						{($_ -eq '18') -or ($_ -eq '44')} { WriteWordLine 0 4 'WinPE-Scripting' }						{($_ -eq '19') -or ($_ -eq '45')} { WriteWordLine 0 4 'WinPE-SecureStartup' }						{($_ -eq '20') -or ($_ -eq '46')} { WriteWordLine 0 4 'WinPE-Setup' }						{($_ -eq '21') -or ($_ -eq '47')} { WriteWordLine 0 4 'WinPE-Setup-Client' }						{($_ -eq '22') -or ($_ -eq '48')} { WriteWordLine 0 4 'WinPE-Setup-Server' }						#{($_ -eq "23") -or ($_ -eq "49")} { WriteWordLine 0 4 "Not applicable" }						{($_ -eq '24') -or ($_ -eq '50')} { WriteWordLine 0 4 'WinPE-WDS-Tools' }						{($_ -eq '25') -or ($_ -eq '51')} { WriteWordLine 0 4 'WinPE-WinReCfg' }						{($_ -eq '26') -or ($_ -eq '52')} { WriteWordLine 0 4 'WinPE-WMI' }
					} 
					$Component = $Null    
				}
			}
			WriteWordLine 0 0 ''

		}
    }
	Else
    {
        WriteWordLine 0 1 'There are no Boot Images present in this environment.'
    }

	####
	####
	#### Task Sequences
	Write-Verbose "$(Get-Date -Format G):   Enumerating Task Sequences"
	WriteWordLine 2 0 'Task Sequences'
	WriteWordLine 0 0 ''

	$TaskSequences = Get-CMTaskSequence -EA 0 4>$Null
	Write-Verbose "$(Get-Date -Format G):   working on $($TaskSequences.count) Task Sequences"
	If($ListAllInformation)
	{
		If(-not [string]::IsNullOrEmpty($TaskSequences))
		{
			ForEach($TaskSequence in $TaskSequences)
			{
				WriteWordLine 0 1 "Task Sequence name: $($TaskSequence.Name)" -boldface $true
				WriteWordLine 0 1 "Package ID: $($TaskSequence.PackageID)"
				If($TaskSequence.BootImageID)
				{
					WriteWordLine 0 2 "Boot Image referenced in this Task Sequence: $((Get-CMBootImage -Id $TaskSequence.BootImageID -ErrorAction SilentlyContinue ).Name)"
				}

				$Sequence = $Null
				[xml]$Sequence = $TaskSequence.Sequence
				try
				{
					ForEach($Group in $Sequence.sequence.group)
					{
						WriteWordLine 0 1 "Group name: $($Group.Name)" -boldface $true
						If(-not [string]::IsNullOrEmpty($Group.Description))
						{
							WriteWordLine 0 1 "Description: $($Group.Description)"
						}
						WriteWordLine 0 1 'This Group has the following steps configured.'
						ForEach($Step in $Group.Step)
						{
							WriteWordLine 0 2 "$($Step.Name)" -boldface $true
							If(-not [string]::IsNullOrEmpty($Step.Description))
							{
								WriteWordLine 0 3 "$($Step.Description)"
							}
							WriteWordLine 0 3 "$($Step.Action)"
							try 
							{
								If(-not [string]::IsNullOrEmpty($Step.disable))
								{
									WriteWordLine 0 3 'This step is disabled.'
								}
							}   
							catch [System.Management.Automation.PropertyNotFoundException] 
							{
								WriteWordLine 0 3 'This step is enabled'
							}
							WriteWordLine 0 0 ''
						}

					}
				}
				catch [System.Management.Automation.PropertyNotFoundException]
				{
					WriteWordLine 0 0 ''
				}
				try 
				{
					ForEach($Step in $Sequence.sequence.step)
					{
						WriteWordLine 0 3 "$($Step.Name)" -boldface $true
						If(-not [string]::IsNullOrEmpty($Step.Description))
						{
							WriteWordLine 0 4 "$($Step.Description)"
						}
						WriteWordLine 0 4 "$($Step.Action)"
						try 
						{
							If(-not [string]::IsNullOrEmpty($Step.disable))
							{
								WriteWordLine 0 4 'This step is disabled.'
							}
						}   
						catch [System.Management.Automation.PropertyNotFoundException] 
						{
							WriteWordLine 0 4 'This step is enabled'
						}
						WriteWordLine 0 0 ''
					}
				}
				catch [System.Management.Automation.PropertyNotFoundException]
				{
					WriteWordLine 0 0 ''
				}
				WriteWordLine 0 0 ''
				WriteWordLine 0 0 '----------------------------------------------'
			}
		}
		Else
		{
			WriteWordLine 0 1 'There are no Task Sequences present in this environment.'
		}
	}
	Else
	{
		If(-not [string]::IsNullOrEmpty($TaskSequences))
		{
			WriteWordLine 0 1 'The following Task Sequences are configured:'
			ForEach($TaskSequence in $TaskSequences)
			{
				WriteWordLine 0 2 "$($TaskSequence.Name)"
			}
		}
		Else
		{
			WriteWordLine 0 1 'There are no Task Sequences present in this environment.'
		}
	}

} #End Software

#endregion Site Configuration report

#region end script
Function ProcessScriptEnd
{
	#http://poshtips.com/measuring-elapsed-time-in-powershell/
	Write-Verbose "$(Get-Date -Format G): Script started: $($Script:ScriptStartTime)"
	Write-Verbose "$(Get-Date -Format G): Script ended: $(Get-Date)"
	$runtime = $(Get-Date) - $Script:ScriptStartTime
	$Str = [string]::format("{0} days, {1} hours, {2} minutes, {3}.{4} seconds",
		$runtime.Days,
		$runtime.Hours,
		$runtime.Minutes,
		$runtime.Seconds,
		$runtime.Milliseconds)
	Write-Verbose "$(Get-Date -Format G): Elapsed time: $($Str)"

	If($Dev)
	{
		If($SmtpServer -eq "")
		{
			Out-File -FilePath $Script:DevErrorFile -InputObject $error 4>$Null
		}
		Else
		{
			Out-File -FilePath $Script:DevErrorFile -InputObject $error -Append 4>$Null
		}
	}
	
	If($ScriptInfo)
	{
		$SIFile = "$($Script:pwdpath)\ConfigMgrScriptInfo_$(Get-Date -f yyyy-MM-dd_HHmm).txt"
		Out-File -FilePath $SIFile -InputObject "" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Add DateTime       : $AddDateTime" 4>$Null
		If($MSWORD -or $PDF)
		{
			Out-File -FilePath $SIFile -Append -InputObject "Company Address    : $CompanyAddress" 4>$Null		
			Out-File -FilePath $SIFile -Append -InputObject "Company Email      : $CompanyEmail" 4>$Null		
			Out-File -FilePath $SIFile -Append -InputObject "Company Fax        : $CompanyFax" 4>$Null		
			Out-File -FilePath $SIFile -Append -InputObject "Company Name       : $Script:CoName" 4>$Null		
			Out-File -FilePath $SIFile -Append -InputObject "Company Phone      : $CompanyPhone" 4>$Null		
			Out-File -FilePath $SIFile -Append -InputObject "Cover Page         : $CoverPage" 4>$Null
		}
		Out-File -FilePath $SIFile -Append -InputObject "Dev                : $Dev" 4>$Null
		If($Dev)
		{
			Out-File -FilePath $SIFile -Append -InputObject "DevErrorFile       : $Script:DevErrorFile" 4>$Null
		}
		Out-File -FilePath $SIFile -Append -InputObject "Filename1          : $Script:FileName1" 4>$Null
		If($PDF)
		{
			Out-File -FilePath $SIFile -Append -InputObject "Filename2          : $Script:FileName2" 4>$Null
		}
		Out-File -FilePath $SIFile -Append -InputObject "Folder             : $Folder" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "From               : $From" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "ListAllInforamtion : $ListAllInformation" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Log                : $Log" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Report Footer      : $ReportFooter" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Save As PDF        : $PDF" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Save As WORD       : $MSWORD" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Script Info        : $ScriptInfo" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Smtp Port          : $SmtpPort" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Smtp Server        : $SmtpServer" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Software           : $Software" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "To                 : $To" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Use SSL            : $UseSSL" 4>$Null
		If($MSWORD -or $PDF)
		{
			Out-File -FilePath $SIFile -Append -InputObject "User Name          : $UserName" 4>$Null
		}
		Out-File -FilePath $SIFile -Append -InputObject "" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "OS Detected        : $RunningOS" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "PoSH version       : $($Host.Version)" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "PSUICulture        : $PSUICulture" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "PSCulture          : $PSCulture" 4>$Null
		If($MSWORD -or $PDF)
		{
			Out-File -FilePath $SIFile -Append -InputObject "Word version       : $Script:WordProduct" 4>$Null
			Out-File -FilePath $SIFile -Append -InputObject "Word language      : $Script:WordLanguageValue" 4>$Null
		}
		Out-File -FilePath $SIFile -Append -InputObject "" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Script start       : $Script:ScriptStartTime" 4>$Null
		Out-File -FilePath $SIFile -Append -InputObject "Elapsed time       : $Str" 4>$Null
	}
	
	#stop transcript logging
	If($Log -eq $True) 
	{
		If($Script:StartLog -eq $true) 
		{
			try 
			{
				Stop-Transcript | Out-Null
				Write-Verbose "$(Get-Date -Format G): $Script:LogPath is ready for use"
			} 
			catch 
			{
				Write-Verbose "$(Get-Date -Format G): Transcript/log stop failed"
			}
		}
	}

	$runtime = $Null
	$Str = $Null
	$ErrorActionPreference = $SaveEAPreference
}
#endregion

Set-Location -Path $LocationBeforeExecution
$Script:ScriptInformation = $Null

#region finish script
Write-Verbose "$(Get-Date -Format G): Finishing up document"
#end of document processing

###Change the two lines below for your script###
$AbstractTitle = "Configuration Manager Report"
$SubjectTitle = "System Center Configuration Manager Report"

UpdateDocumentProperties $AbstractTitle $SubjectTitle

If($ReportFooter)
{
	OutputReportFooter
}

ProcessDocumentOutput

ProcessScriptEnd
#endregion