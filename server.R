library(shiny)
library(shinyjs)
library(moments)
shinyServer(
  function(input, output) {
    xBallStart <- 6
    yBallStart <- 2
    ylimit <- 30 #Arena hight
    xlimit <- 12 #Arena width
    #Peg coordinates:
    xPegs <- list(seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5),
                  seq(0,11),seq(0.5,11.5))
    yPegs <- matrix(rep(seq(2,24,by=2),16),nrow=16,ncol=12)
    
    output$plot1 <- renderPlot({
      ballnumber <- input$balls
      plot(1:ballnumber,1:ballnumber,xlim=c(0,xlimit),
           ylim=c(0,ylimit),xaxt="n",yaxt="n",
           xlab = "",ylab="",pch=21,bg="white",col="white")
      for(i in 1:16){
        points(xPegs[[i]],yPegs[i,]+4,pch=24,bg="green",col="black")
      }
      segments(0.5,-1,0.5,4,col = "black",lwd = 6)
      segments(1.5,-1,1.5,4,col = "black",lwd = 6)
      segments(2.5,-1,2.5,4,col = "black",lwd = 6)
      segments(3.5,-1,3.5,4,col = "black",lwd = 6)
      segments(4.5,-1,4.5,4,col = "black",lwd = 6)
      segments(5.5,-1,5.5,4,col = "black",lwd = 6)
      segments(6.5,-1,6.5,4,col = "black",lwd = 6)
      segments(7.5,-1,7.5,4,col = "black",lwd = 6)
      segments(8.5,-1,8.5,4,col = "black",lwd = 6)
      segments(9.5,-1,9.5,4,col = "black",lwd = 6)
      segments(10.5,-1,10.5,4,col = "black",lwd = 6)
      segments(11.5,-1,11.5,4,col = "black",lwd = 6)
      balldistribution = matrix(1,nrow = ballnumber,ncol = 2)
      for(i in 1:nrow(balldistribution)){
        balldistribution[i,1] = sum(sample(c(-0.5,0.5),12,replace=T)) + xBallStart + rnorm(1,mean = 0,sd = 0.1)
        balldistribution[i,2] = yBallStart + rnorm(1,mean = 0,sd = 1)
        points(balldistribution[i,1],balldistribution[i,2],pch=21,bg="magenta")
      }
      output$text1 <- renderText(moments::kurtosis(balldistribution[,1]))
    })
  }
)