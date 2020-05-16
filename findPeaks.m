function [peakVal,freqVal]=findPeaks(activity)
fs=50;
peakVal=cell(1,12);
freqVal=cell(1,12);
media = zeros(1,3);
desvio = zeros(1,3);
passos=zeros(1,3);
for i=1:12
    peakRecenteValor=[];
    temp=activity{1,i};
    limiar=0.7;
    for j=1:length(temp)
        temp2=temp{1,j}(:,1);
        N = numel(temp2);
        if mod(N,2)==0
           f = -fs/2:fs/N:fs/2-fs/N;
        else
           f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
        end
        
        temp2=detrend(temp2); 
        X = fftshift(fft(temp2));
        X(find(abs(X)<0.001))=0;
        m_X = abs(X);
        max_x = max(m_X);
        ind = find((m_X == max_x));

        min_mag =limiar*max_x;
        [peaks,locs] = findpeaks(m_X,'MinPeakHeight',min_mag);
        
        f_relevant = f(locs);
        peaks=peaks(f_relevant>=0);
        
        f_relevant = f_relevant(f_relevant>=0);
        
       
        firstPeaks{1,j}=f_relevant(1)*60;
        %f_relevant = round(f_relevant);
        freqVal{1,i}(j)=f_relevant(1);
        peak = abs(m_X(locs)); 
        peakRecenteValor{1,j}=peak;
        
    end
    if(i<=3)
        media(1,i)= mean(cell2mat(firstPeaks));%passos por minuto
        desvio(1,i)= std(cell2mat(firstPeaks));
    end
    peakVal{1,i}=peakRecenteValor;
end
%media
%desvio
end

