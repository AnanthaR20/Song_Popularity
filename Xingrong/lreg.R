data<-read.csv(file='data.csv',colClasses = c(
  "numeric",#song_name
  "factor",#popularity
  "numeric",#duration
  "numeric",#acousticness
  "numeric",#danceability
  "numeric",#energy
  "numeric",#instru
  "factor",#key
  "numeric",#live
  "numeric",#loud
  "factor",#audio
  "numeric",#speech
  "numeric",#tempo
  "factor",#timesignature
  "numeric"
),head=TRUE)

summary(data)

newdata<-data[2:length(data)]

logitMod <- glm(song_popularity ~., data=newdata, family=binomial())

summary(logitMod)
