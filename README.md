# Telplex
Generate targeted virtual contact files for marketing, telecommunications, trends, or general metadata extraction.

Contact.sh v2.0
Generate Bulk, Targeted VCF & CSV files

Default output is zipped file containing;

1x *.VCF @ 10k#'s ordered NPA-NXX-xxxx
4x Globed & Ordered *.CSV's @ 2.5k per
1x plain text (*.tmp) ordered list @10k
Default VCARD v2.1 {for compatibility}
Default output directory is /fin/

Depends on Crunch
Should work on any Linux distribution and many Unix distributions. 

INSTALLATION & USAGE 

apt-get install crunch
git clone or download zip

This script can be modified to generate any supported VCF format. 
Below are some examples of data that you can include and the basic structure of the VCF.

BEGIN:VCARD
VERSION:2.1
N:Doe;John;;;
FN:John Doe
ORG:Example.com Inc.;
TITLE:Imaginary test person
EMAIL;type=INTERNET;type=WORK;type=pref:johnDoe@example.org
TEL;type=WORK;type=pref:+1 617 555 1212
TEL;type=CELL:+1 781 555 1212
TEL;type=HOME:+1 202 555 1212
TEL;type=WORK:+1 (617) 555-1234
item1.ADR;type=WORK:;;2 Example Avenue;Anytown;NY;01111;USA
item1.X-ABADR:us
item2.ADR;type=HOME;type=pref:;;3 Acacia Avenue;Newtown;MA;02222;USA
item2.X-ABADR:us
NOTE: Some text about something\, some other text on a new line
item3.URL;type=pref:http\://www.example/com/doe
item3.X-ABLabel:_$!<HomePage>!$_
item4.URL:http\://www.example.com/Joe/foaf.df
item4.X-ABLabel:FOAF
item5.X-ABRELATEDNAMES;type=pref:Jane Doe
item5.X-ABLabel:_$!<Friend>!$_
CATEGORIES:Work,Test group
X-ABUID:5AD380FD-B2DE-4261-BA99-DE1D1DB52FBE\:ABPerson
END:VCARD

The sh file may be modified directly under
#/---> VCF SECTION <---\
Within the script. Please be sure that you have an understand of bash scripting before modifying.

Sort.sh

generates a single .txt file containing
all NPA-NXX #'s belonging to a valid TelCo
all valid U.S. TelCos are listed in the telco.db 
results use same output structure as search.sh

Search.sh

Search the NANPA NPA-NXX Databases Locally
Prints NANPA TelCo information to screen
Lists TelCo Name, Location, & Contact from NPA-NXX Codes

machine.sh

database architect script
refer to list.sh
powered by list.txt

list.sh

extracts numbers for input to build database
input files should be grepped from original NANPA database, placed in root folder under the name db.txt

single.sh

Generate Bulk, Targeted VCF & CSV Files
Default output is zipped file containing;
 1x *.VCF @ 10k#'s ordered NPA-NXX-xxxx
 4x Globed & Ordered *.CSV's @2.5k per
 1x plain text (*.TMP) ordered list @10k
Default VCARD v2.1 {for compatibility}
Default output directory is /fin/zips
