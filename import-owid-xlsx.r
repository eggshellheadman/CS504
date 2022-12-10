#library(curl)

owid=curl::curl_download("https://github.com/owid/covid-19-data/raw/master/public/data/owid-covid-data.csv","owid.csv")


#utils::write.table(owid,"owid.csv",sep="|",row.names=FALSE,quote=FALSE)
