library('ballgown')

# paths for tablemaker output folders
samplePaths <-c("./sample01","./sample02")  

bg = ballgown(samples=samplePaths)

# default mode is fpkm
df <-data.frame(texpr(bg))
write.csv(df,"fpkm_output.csv")
sprintf("output fpkm csv file is present at: %s%s",toString(getwd()),"/fpkm_output.csv")
