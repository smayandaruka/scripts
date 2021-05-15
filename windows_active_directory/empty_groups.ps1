# Smayan Daruka
# This script is used to retrieve all empty groups in the specified domain.
# You will need Remote Server Administrator Tools installed on the machine.

import-module activedirectory
Get-ADGroup -Server "INSERT_DOMAIN_CONTROLLER" –Filter * -Properties Members | where {$_.Members.Count –eq 0 -and $_.MembersOf.Count -eq 0} | select groupcategory, samaccountname | Export-Csv "INSERT_PATH_FOR_EXPORT.csv" -NoTypeInformation
