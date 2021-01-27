
useNIADic()
library(KoNLP)
text1 <- readLines("review2.txt")
text2 <- extractNoun(text1)
text3 <- unlist(text2)
text4 <- gsub("ㅅㄹㅅㅇ", "", text3)
text4 <- gsub("ㅅㄹㅅㅇ", "", text3)
text5 <- text4[nchar(text4)<5]
text5 <- text5[nchar(text5)>1]
text6 <- sort(table(text5),decreasing=TRUE)
text7 <- head(text6, 500)
text7

wordcloud2(text7)
