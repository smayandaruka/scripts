# Smayan Daruka
# This script removes "Rollover Scans" from Tenable Security Center.
# You will need Python 3 and the pyTenable module to run this script.
# To install pyTenable - pip install pytenable

from tenable.sc import TenableSC
# Replace the IP ADDRESS below with the IP of the appliance - keep the single quotes.
sc = TenableSC('IP ADDRESS')
# Replace username and password for authentication - keep the single quotes.
sc.login('USERNAME', 'PASSWORD')
for scan in sc.get('scan', params={'fields': 'status,name,type,schedule'}).json()['response']['usable']:
    if scan['schedule']['type'] == 'rollover':
        sc.delete('scan/{}'.format(scan['id']))
# The line below is used for verbose output as it prints the name of the scan being deleted.
# It can be safely removed without impacting functionality.
        print('Removed {}'.format(scan['name']))
