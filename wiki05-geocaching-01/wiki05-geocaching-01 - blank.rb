#
# This file forms part of a formal assessment for the course.
# It is advised that copies be made of this  and the database file in the event that they might become corrupted.
# The compressed ZIP file containing this file along with its associated database (wiki05-[..].db) should be extracted within a new folder on your University H: drive.
# Details about your University H: drive are avialable via the IT Services web pages.
# Instructions to run this file assume students are using the University's VDI resource. 
# Students must not change the contents of the database file. However, the database can be reviewed using free open source tools such as DB Browser installed on your own device.
# It is students responsibility to install and configure software systems where they choose to consider other methods of running the file.
# Warning, student marks will only be based on results produced when running submissions on the University's VDI resource.
# The command 'ruby wiki05-[...]-xx.rb' (where xx is the version number) should be used to run the SQL statements and check whether they produce the correct results.
# This can be performed as many times as one likes before submitting.
# Once submitted to Myaberdeen this will count for an attempt.
# Note. All SQL statements inserted into this file must not include double quotation characters ( " " ). Instead only single qutation ( '  ' ) marks must be used where required.
#
# sqlcaa 2020-21 (Copyright 2020)

require 'rubygems'
require 'sqlite3'
# the database is based on a blog where users log in and post questions and/or answers to questions.
# the database also stores ratings associated with post questions alongside replies.
DbName = 'wiki05-geocaching-01.db'
SQLQ = []
SQLA = []
correct = 0
# display all data for all users
SQLQ[0] = ""
SQLA[0] ='[["UID", "GID", "FNAME", "LNAME", "USERNAME", "PASSWORD", "EMAIL"], ["U001", "MadCacher", "Julie", "Smith", "juliesmith", nil, "j.smith@cache.com"], ["U002", "TheWanderer", "Anne", "Grey", "annegrey", nil, "a.grey@cache.com"], ["U003", "AlwaysLost", "David", "Willis", "davidwillis", nil, "d.willis@cache.com"], ["U004", "WellieWalker", "John", "Roberts", "johnroberts", nil, "j.roberts@cache.com"], ["U005", "GoneCaching", "Sally", "Davis", "sallydavis", nil, "s.davis@cache.com"]]'

# display  UID and USERNAME data for all users  
SQLQ[1] = ""
SQLA[1] ='[["UID", "USERNAME"], ["U001", "juliesmith"], ["U002", "annegrey"], ["U003", "davidwillis"], ["U004", "johnroberts"], ["U005", "sallydavis"]]'

# display  UID and USERNAME data for all users and rename colmns UID 'UserID' and 'USERNAME' UN 
SQLQ[2] = ""
SQLA[2] ='[["UserID", "UN"], ["U001", "juliesmith"], ["U002", "annegrey"], ["U003", "davidwillis"], ["U004", "johnroberts"], ["U005", "sallydavis"]]'

# display  UID and USERNAME data for user with UID 'U002'
SQLQ[3] = ""
SQLA[3] ='[["UID", "USERNAME"], ["U002", "annegrey"]]'

# display UID, USERNAME, OCACHEID, OCREATED data for cache owned by the user with the UID U002 using an inner join
SQLQ[4] = ""
SQLA[4] ='[["UID", "USERNAME", "OCACHEID", "OCREATED"], ["U002", "annegrey", "C002", "13/06/2021"]]'

# display UID, USERNAME, OCACHEID, OCREATED data for cache owned by the user with the UID U002  not using the JOIN keyword
SQLQ[5] = ""
SQLA[5] ='[["UID", "USERNAME", "OCACHEID", "OCREATED"], ["U002", "annegrey", "C002", "13/06/2021"]]'

# display UID, USERNAME, TID, TNAME data for trackables owned by the user with the UID U001 not using the JOIN keyword
SQLQ[6] = ""
SQLA[6] ='[["UID", "USERNAME", "TID", "TNAME"], ["U001", "juliesmith", "T001", "TagAlong"]]'

# display UID, USERNAME, CACHEID, CNAME data for all caches owned by the user with the UID U003 not using the JOIN keyword
SQLQ[7] = ""
SQLA[7] ='[["UID", "USERNAME", "CACHEID", "CNAME"], ["U003", "davidwillis", "C003", "WhereAmI"], ["U003", "davidwillis", "C004", "SpiderHole"], ["U003", "davidwillis", "C005", "ViewPoint"]]'

# display UID, USERNAME, CACHEID, CNAME data for all active caches owned by the user with the UID U003 not using the JOIN keyword and using the table alias u for users, o for owners and c for caches
SQLQ[8] = ""
SQLA[8] ='[["UID", "USERNAME", "CACHEID", "CNAME"], ["U003", "davidwillis", "C003", "WhereAmI"], ["U003", "davidwillis", "C004", "SpiderHole"]]'

# display  GID, UID and USERNAME data for all users in GID descending order 
SQLQ[9] = ""
SQLA[9] ='[["GID", "UID", "USERNAME"], ["WellieWalker", "U004", "johnroberts"], ["TheWanderer", "U002", "annegrey"], ["MadCacher", "U001", "juliesmith"], ["GoneCaching", "U005", "sallydavis"], ["AlwaysLost", "U003", "davidwillis"]]'

# display  GID, UID and USERNAME data for all users in GID ascendng order and rename colmns UID ID and username UN 
SQLQ[10] = ""
SQLA[10] ='[["ID", "UN"], ["U003", "davidwillis"], ["U005", "sallydavis"], ["U001", "juliesmith"], ["U002", "annegrey"], ["U004", "johnroberts"]]'

# display the number of caches owned by the user with the UID U003
SQLQ[11] = ""
SQLA[11] ='[["COUNT(ouid)"], [3]]'

# display the number of trackables owned by the user with the UID U001 and rename the column 'Number of posts'
SQLQ[12] = ""
SQLA[12] ='[["Number of trackables"], [1]]'

# display  each UID and the number of trackables for each user under the column name 'Number of trackables'
SQLQ[13] = ""
SQLA[13] ='[["UID", "Number of trackables"], ["U001", 1], ["U002", 1]]'

# display  UID and the number of trackables from the user with the uid 'U003' under the column name 'Number of trackables'
SQLQ[14] = ""
SQLA[14] ='[["UID", "Number of trackables"]]'

# display  UID, FNAME, LNAME and the number of caches each of the users own under the column name 'Number of caches owned'
SQLQ[15] = ""
SQLA[15] ='[["OUID", "FNAME", "LNAME", "Number of caches owned"], ["U001", "Julie", "Smith", 1], ["U002", "Anne", "Grey", 1], ["U003", "David", "Willis", 3]]'

# display cacheid, UID, fname, lname of each cache along with the name of the user who approved the cache uid, fname, lname
SQLQ[16] = ""
SQLA[16] ='[["OCACHEID", "OUID", "FNAME", "LNAME", "UID", "FNAME", "LNAME"], ["C001", "U001", "Julie", "Smith", "U002", "Anne", "Grey"], ["C002", "U002", "Anne", "Grey", "U003", "David", "Willis"], ["C003", "U003", "David", "Willis", "U002", "Anne", "Grey"], ["C004", "U003", "David", "Willis", "U002", "Anne", "Grey"], ["C005", "U003", "David", "Willis", "U002", "Anne", "Grey"]]'

# display only those cacheid where cachers have reported not finding  along with the number of times this has occurred.
SQLQ[17] = ""
SQLA[17] ='[["CACHEID", "Number of times not found"], ["C001", 1], ["C004", 1]]'

# display the number of caches that each trackable have visited.
SQLQ[18] = ""
SQLA[18] ='[["TID", "Number of caches visited"], ["T001", 3], ["T002", 1]]'

# display the UID, CACHEID, number of times cache found and date with which user acheived its 'first-time-found'.
SQLQ[19] = ""
SQLA[19] ='[["UID", "CACHEID", "COUNT(cacheid)", "MIN(date)"], ["U002", "C001", 2, "20/06/2021"], ["U002", "C002", 3, "20/06/2021"], ["U002", "C003", 2, "21/06/2021"]]'

# display the UID, FNAME, LNAME, CACHEID, number of times cache found and date with which user acheived its 'first-time-found'.
SQLQ[20] = ""
SQLA[20] ='[["UID", "FNAME", "LNAME", "CACHEID", "COUNT(cacheid)", "MIN(date)"], ["U002", "Anne", "Grey", "C001", 2, "20/06/2021"], ["U002", "Anne", "Grey", "C002", 3, "20/06/2021"], ["U002", "Anne", "Grey", "C003", 2, "21/06/2021"]]'

# display the caches where trackables have visited but not been left'.
SQLQ[21] = ""
SQLA[21] ='[["CID", "TID"], ["C002", "T001"]]'

#display the trackables which have been removed and visited a cache the same day
SQLQ[22] = ""
SQLA[22] ='[["TID"], ["T001"]]'

#display the caches in order of the most times been found
SQLQ[23] = ""
SQLA[23] ='[["CACHEID", "COUNT(cfound)"], ["C002", 3], ["C001", 2], ["C003", 2]]'

#display the caches in order of the most times been found 3 or more times
SQLQ[24] = ""
SQLA[24] ='[["CACHEID", "COUNT(cfound)"], ["C002", 3]]'

db = SQLite3::Database.new(DbName)
db.results_as_hash = false
sqlnum = 0
sqlnum = SQLQ.size 
puts "Checking #{sqlnum} SQL statements."

for i in 0..sqlnum-1 do
	if SQLQ[i] != "" then
		results = db.execute2(SQLQ[i])
		puts "#{i}) Actual:   " + results.inspect
	end
	puts "#{i}) Expected: " + SQLA[i]
	if results.inspect == SQLA[i]
		puts "Match exists between expected SQLData and actual database data."
		correct = correct + 1
	else
		puts "No match exists between expected SQLData and actual database data."
	end
end
puts "Result: #{correct} out of #{sqlnum} correct."
