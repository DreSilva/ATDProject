function resultadoDFT = dft(atividade,janela)
Fs=40;
resultadoDFT=cell(1,12);
for i=1:12
    temp=atividade{1,i};
    tempDFT=cell(1,length(temp));
    for j=1:length(temp)
        temp2=temp{1,j}(:,1);
        N=length(temp2);
        
        if mod(N,2)==0
            f=-Fs/2:Fs/N:Fs/2-Fs/N;
        else
            f=-Fs/2+Fs/N/2:Fs/N:Fs/2-Fs/N/2;
        end
        
        if(janela=="retangular")
            janelaRect=rectwin(length(temp2));
            X = fftshift(fft(temp2.*janelaRect)); %calcular a dft do array multiplicado pela janela
            X(find(abs(X)<0.001))=0;
            plot(f,abs(X));
        elseif(janela=="hamming")
            janelaHamm=hamming(length(temp2));
            X = fftshift(fft(temp2.*janelaHamm));
            X(find(abs(X)<0.001))=0;
            plot(f,abs(X));
        elseif(janela=="Gaussian")
            janelaGauss=gausswin(length(temp2));
            X=fftshift(fft(temp2.*janelaGauss));
            X(find(abs(X)<0.001))=0;
            plot(f,abs(X));
            tempDFT{1,j}=X;
        elseif(janela=="Blackman")
            janelaBlack= blackman(length(temp2));
            X = fftshift(fft(detrend(temp2).*janelaBlack));
            X(find(abs(X)<0.001))=0;
            plot(f,abs(X));
        else
            Xoriginal = fftshift(fft(temp2));
            detrendTemp2 = detrend(temp2);
            Xdetrend=fftshift(fft(detrendTemp2));
            
            janelaHamming = hamming(length(temp2));
            janelaBlackman = blackman(length(temp2));
            janelaRectangular = rectwin(length(temp2));
            janelaGaussian = gausswin(length(temp2));
           

            XRect = fftshift(fft(temp2.*janelaRectangular));
            XRect(find(abs(XRect)<0.001))=0;

            XHamming=fftshift(fft(temp2.*janelaHamming));
            XHamming(find(abs(XHamming)<0.001))=0;

            XBlackman= fftshift(fft(temp2.*janelaBlackman));
            XBlackman(find(abs(XBlackman)<0.001))=0;
            
            XGaussian =fftshift(fft(temp2.*janelaGaussian));
            XGaussian(find(abs(XGaussian)<0.001))=0;
            
            if(i==1 && j==3)
                if(i==1)
                    lims=[0 150];
                elseif(i==5)
                    lims = [0 100];
                else
                    lims= [0 40];
                end
                figure();
                subplot(231);
                plot(f,abs(XRect));
                ylim(lims);
                title("Rectangular")

                subplot(232);
                plot(f,abs(XHamming));
                ylim(lims);
                title("Hamming")

                subplot(233);
                plot(f,abs(XBlackman));
                ylim(lims);
                title("Blackman");

                subplot(234);
                plot(f,abs(XGaussian));
                ylim(lims);
                title("Gaussian");
                
                subplot(235);
                plot(f,abs(Xoriginal));
                ylim(lims);
                title("Original");
                
                subplot(236);
                plot(f,abs(Xdetrend));
                ylim(lims);
                title("Sem tendencia");
            end
            
        end
    end
    resultadoDFT{1,i}=tempDFT;
end


end