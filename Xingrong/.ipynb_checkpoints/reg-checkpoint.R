dat<-read.csv(file='data/song_data.csv',colClasses = c(
  "character",#song_name
  "numeric",#popularity
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
))

model<-lm(formula = song_popularity~song_duration_ms+acousticness+danceability+energy+instrumentalness+key+liveness+loudness+audio_mode+speechiness+tempo+time_signature+audio_valence,data=dat)

summary(model)
