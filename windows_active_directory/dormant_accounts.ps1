# Smayan Daruka
# This script is used to retrieve dormant accounts in the specified domain.
# Dormant accounts meaning accounts that are enabled and have not been logged into for over 30 days as an example.
# Sorts in descending order based on last logon date.
# You will need Remote Server Administrator Tools installed on the machine.

import-module activedirectory
#Simply change the number of days below to match your requirements
$time = (Get-Date).AddDays(-30)

Get-ADUser -server "INSERT_DOMAIN_CONTROLLER" -Filter {LastLogonDate -lt $time -and Enabled -eq $True} -SearchBase "INSERT_OU_IF_APPLICABLE" -Properties Name, DisplayName, LastLogonDate, CanonicalName | 
select Name, DisplayName, LastLogonDate, CanonicalName | sort LastLogonDate -Descending | Export-Csv "INSERT_PATH_FOR_EXPORT.csv" -NoTypeInformation
