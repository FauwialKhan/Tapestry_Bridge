install.packages("RPostgreSQL")
library(DBI)
library(RPostgreSQL)
# Set up the connection details
host <- "db.nkn.uidaho.edu"
port <- 5434
dbname <- "qcew_2002" #enter database name e.g. :qcew_2002
user <- "fauwial"     #enter your username for PGAdmin4 
password <- "nknpassword" 

# Create the connection object
con <- dbConnect(drv = PostgreSQL(),
                 dbname = dbname,
                 host = host,
                 port = port,
                 user = user,
                 password = password)


# Test the connection by running query: QCEW by owner by county at NAICS6 level

schema <- "qcew" #enter specific schema under the dbname
view <- "fact_qcew_byowner_bycnty_naics6"  #enter view name

#Define Query

query <- paste0("SELECT * FROM ", schema, ".", view)
print('please wait while dataframe is being created')
rs <- dbSendQuery(con, query) 
print('please wait while dataframe is being created')
df <- fetch(rs, n = -1)         #df generates the dataframe in R 


##head(df) # Will return first few values from dataframe

# Close the connection
##dbDisconnect(con)



  