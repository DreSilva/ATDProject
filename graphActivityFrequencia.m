function graphActivityFrequencia(freqX,freqY,freqZ)

color = [[0,0,0];[1,0,0];[0,1,0];[0,0,1];[1,1,0];[1,0,1];[0,1,1];[0.5,1,0];[1,0.5,0];[1,0,0.5];[0,0,0.5];[1,0.25,1]];
forma = ['o','o','o','+','+','+','*','*','*','*','*','*'];
figure(50);
title("Grafico da Frequencia");
for i=1:12

    tempX=freqX{1,i};
    tempY=freqY{1,i};
    tempZ=freqZ{1,i};
    c = color(i,:);
    hold on;
    plot3(tempX,tempY,tempZ,forma(i),'color',c);
    view(45,-20);
    ylabel("Y");
    xlabel("X");
    zlabel("Z");
end
legend('W',"W_UP","W_DO","SIT","STAND","LAY","STA_SIT","SIT_STA","SIT_LIE","LIE_SIT","STA_LIE","LIE_STA");
end