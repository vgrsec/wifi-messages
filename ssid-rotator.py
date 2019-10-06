__author__ = "vgrsec@"
__copyright__ = "(╯°□°）╯︵ ┻━┻"
__credits__ = ["(╯°□°）╯︵ ┻━┻"]
__license__ = "GNU GPLv3"
__version__ = "0.0"
__maintainer__ = "void"
__email__ = "wifi-messages@vgrsec.net"
__status__ = "(╯°□°）╯︵ ┻━┻"


# For DateTime Work
import datetime
# For File Manipulation
import sys
import os
from pathlib import Path
import timedelta

# Get mo time
now = datetime.datetime.now()
nowhour = now.strftime('%H')
nowdate = now.strftime('%Y%m%d')
nexthour = datetime.datetime.now() + datetime.timedelta(hours=1)
nexthour = nexthour.strftime('%H')


# Find Input File for Today
todayssidfile = Path('/boot/wifi-messages/input/' + nowdate + '.txt')
if todayssidfile.is_file():
# Delete the old file
    os.remove('/usr/local/bin/wifi-messages/output/ssid.txt')
# Find the next two hours worth of events and writes it to ssid file
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:00:00 ' + line for line in open(str(todayssidfile)) if (nowhour + '00') in line)
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:00:30 ' + line for line in open(str(todayssidfile)) if (nowhour + '30') in line)
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:01:00 ' + line for line in open(str(todayssidfile)) if (nexthour + '00') in line)
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:01:30 ' + line for line in open(str(todayssidfile)) if (nexthour + '30') in line)
# Attribution
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:99:99 z_github:vgrsec:wifi-messages')
else :
    todayssidfile = Path('/boot/wifi-messages/input/_default.txt')
    # Delete the old file
    os.remove('/usr/local/bin/wifi-messages/output/ssid.txt')
    # Write Defaults to SSID
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('DE:AD:BE:EF:01:30 ' + line for line in open(str(todayssidfile)))
    # Attribution
    open('/usr/local/bin/wifi-messages/output/ssid.txt','a+').writelines('\nDE:AD:BE:EF:99:99 z_github:vgrsec:wifi-messages')



