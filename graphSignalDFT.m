function graphSignalDFT(actividade)
X=actividade(1,:);
Y=actividade(2,:);
Z=actividade(3,:);
Fs=50;
titulos=["Walking","WalkingUp","WalkingDown","Sitting","Standing","Laying","StandToSit","SitToStand","SitToLie","LieToSit","StandToLie","LieToStand"];
for i=1:12
    tempX=X{1,i};
    tempY=Y{1,i};
    tempZ=Z{1,i};
    figure('Name',sprintf("%s",titulos(i)));
    sgtitle(titulos(i));
    for j=1:length(tempX)
        if(j==3)
            N=length(tempX{1,j});
            if mod(N,2)==0
                f=-Fs/2:Fs/N:Fs/2-Fs/N;
            else
                f=-Fs/2+Fs/N/2:Fs/N:Fs/2-Fs/N/2;
            end
            
            tempX{1,j}=detrend(tempX{1,j});
            tempY{1,j}=detrend(tempY{1,j});
            tempZ{1,j}=detrend(tempZ{1,j});
            subplot(231)
            plot(tempX{1,j});
            title("signal X");
            subplot(232)
            plot(tempY{1,j});
            title("signal Y");
            subplot(233)
            plot(tempZ{1,j});
            title("signal Z");
            dftX = fftshift(fft(tempX{1,j})); %calcular a dft do array multiplicado pela janela
            dftX(find(abs(dftX)<0.001))=0;
            subplot(234);
            plot(f,abs(dftX));
            title("signal DFT X");
            dftY = fftshift(fft(tempY{1,j})); %calcular a dft do array multiplicado pela janela
            dftY(find(abs(dftY)<0.001))=0;
            subplot(235);
            plot(f,abs(dftY));
            title("signal DFT Y");
            dftZ = fftshift(fft(tempZ{1,j})); %calcular a dft do array multiplicado pela janela
            dftZ(find(abs(dftZ)<0.001))=0;
            subplot(236);
            plot(f,abs(dftZ));
            title("signal DFT Z");
            
        end
    end
end

end