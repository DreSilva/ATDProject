function graphActivity(X,Y,Z)
color = [[0,0,0];[1,0,0];[0,1,0];[0,0,1];[1,1,0];[1,0,1];[0,1,1];[0.5,1,0];[1,0.5,0];[1,0,0.5];[0,0,0.5];[1,0.25,1]];
forma = ['o','o','o','+','+','+','*','*','*','*','*','*'];
for i=1:12

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
    figure(30);
    title("Grafico da Magnitude");
    c = color(i,:);
    hold on;
    plot3(finalX,finalY,finalZ,forma(i),'color',c);
    view(45,-20);
    ylabel("Y");
    xlabel("X");
    zlabel("Z");
end
legend('W',"W_UP","W_DO","SIT","STAND","LAY","STA_SIT","SIT_STA","SIT_LIE","LIE_SIT","STA_LIE","LIE_STA");
end