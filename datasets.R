data_frame(noiseLevel=sort(rep(seq(10,50,10),5)),
           temperature=factor(rep(seq(50,90,10),5)),
           testScore=c(30,75,20,50,70,
                       40,60,45,20,50,
                       30,20,30,40,30,
                       60,30,60,20,50,
                       30,50,20,40,60)) -> dt
#4 task x-y
xy <- c("This is the 1 question xy",
        "This is the 2 question xy",
        "This is the 3 question xy",
        "This is the 4 question xy")


#4 task y-z
yz <- c("This is the 1 question yz",
        "This is the 2 question yz",
        "This is the 3 question yz",
        "This is the 4 question yz")
