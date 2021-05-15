# Smayan Daruka
# This script is used to retrieve all disabled accounts in the specified domain.
# Sorts in descending order based on disabled date.
# You will need Remote Server Administrator Tools installed on the machine.

import-module activedirectory
Get-ADUser -server "INSERT_DOMAIN_CONTROLLER" -Filter {Enabled -eq $False} -SearchBase "INSERT_OU_IF_APPLICABLE" -Properties Name, DisplayName, LastLogonDate, CanonicalName, mail, whenChanged, Modified | 
select Name, DisplayName, LastLogonDate, mail, CanonicalName, whenChanged, Modified | sort LastLogonDate -Descending | Export-Csv "INSERT_PATH_FOR_EXPORT.csv" -NoTypeInformation
