# German Asylum Statistics 01-2015 to 01-2017 

This data is based on the monthly asylum statistics (Asylgeschäftsstatistik) by the BAMF. The individual reports can be found here:

http://www.bamf.de/DE/Infothek/Statistiken/Asylzahlen/Asylgesch%C3%A4ftsstatistik/asylgeschaeftsstatistik-node.html

The data covers the period from January 2015 to January 2017. The data was collected using a mix of OCR techniques and manual copy-paste. Surprising data should therefore be double checked with the actual reports. 

The data contains information on asylum decisions for refugees from each month's top 10 sending countries, the aggregated top 10 and the aggregate numbers of all refugees. Values are running totals (percentages) per year. 

On some occasions the totals drop from one month to the other. I assume that this is due to data cleaning on the side of BAMF.

Dimensions of the raw data: 300 observations/ 15 variables

Variable names in the raw data:

* month (Contains month and year of the respective report. As reports are issued at the end of each month, the variable also contains the last day of the respective month)
* top (monthly rank in the top 10 sending countries)
* country (country name. "Summe Top 10" is the aggregate over all top 10 countries in a given month. "Herkunftsländer gesamt" is the aggregate over all sending countries)
* total (total number of asylum applications per country in the current year)
* total_first (total number of first time asylum applications per country in the current year; subset of total)
* total_follow (total number of follow up asylum applications per country in the current year; subset of total)
* decisions (total number of decided asylum applications per country in the current year)
* refugee (total number of asylum applications decided as refugee protection under the Geneva Convention in the current year; subset of decisions; if "sub.asylum" contains values, this variable also includes cases of asylum according to the German Grundgesetz. This is cleaned by clean_data.R)
* asyl (total number of asylum applications decided as asylum according to the German Grundgesetz in the current year; subset of decisions)
* sub.asylum (total number of asylum applications decided as asylum according to the German Grundgesetz in the current year; subset of decisions and refugee; this variable is cleaned and merged with asyl by clean_data.R)
* subsid (total number of asylum applications decided as subsidiary protection in the current year; subset of decisions)
* no.deport (total number of asylum applications decided as nonrefoulement in the current year; subset of decisions)
* protection (share of all decided cases that received some form of protection in Germany in the current year)
* reject (total number of rejected asylum applications in the current year; subset of decisions)
* other.end (total number of cases that were terminated in another way; subset of decisions)


Code:

* clean_data.R (cleans the data)
* monthly_values.R create (takes the differences between the running aggregates to create monthly counts)
* graphs (gives examples how to plot the data)
![image](https://www.dropbox.com/s/jp12bkgz938etrr/syria.png?dl=1)

IPL members can download the data here: 
https://www.dropbox.com/s/lyrm0dumbxhi6k2/asylum_stats_germany.csv?dl=0

Contact person for the data:

* Niklas Harder









