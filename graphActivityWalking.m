function graphActivityWalking(X,Y,Z)
color = [[0,0,0];[1,0,0];[0,1,0];[0,0,1];[1,1,0];[1,0,1];[0,1,1];[0.5,1,0];[1,0.5,0];[1,0,0.5];[0,0,0.5];[1,0.25,1]];
forma = ['o','o','o','+','+','+','*','*','*','*','*','*'];
for i=2:3

    tempX=X{1,i};
    tempY=Y{1,i};
    tempZ=Z{1,i};
    finalX=[];
    finalY=[];
    finalZ=[];
    for j=1:length(tempX)
        finalX(j)=tempX{1,j}(1,:);
        finalY(j)=tempY{1,j}(1,:);
        finalZ(j)=tempZ{1,j}(1,:);
    end
    figure(60);
    title("Grafico do WalkingUp w WalkingDown");
    c = color(i,:);
    hold on;
    plot3(finalX,finalY,finalZ,forma(i),'color',c);
    view(-45,-20);
    ylabel("Y");
    xlabel("X");
    zlabel("Z");
end
legend("W_UP","W_DO");
end