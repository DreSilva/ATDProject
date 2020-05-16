function STFT(atividadeZ,framePercent)
fs=50;
temp=atividadeZ(:,3);
N=size(temp,1);
Nframe=round(framePercent*N);
Noverlap=Nframe/framePercent-N+round(Nframe/2);

window=hamming(Nframe);

x=temp;
STFT=[];
if mod(Nframe, 2)==0
     f = -fs/2:fs/Nframe:fs/2-fs/Nframe;
else 
     f = -fs/2+fs/(2*Nframe):fs/Nframe:fs/2-fs/(2*Nframe);
end
f=f(ceil(end/2):end);

ncol=fix((N-Noverlap)/(Nframe-Noverlap));%numero de elementos step by step
coloffsets = (0:(ncol-1))*(Nframe-Noverlap);
ts = (coloffsets)/fs;
ts=ts./60;

for ii=1:Nframe-Noverlap:N-Nframe
    x_frame=x(ii:ii+Nframe-1).*window;
    m_X_frame = abs(fft(x_frame));
    m_X_frame=m_X_frame(1:floor(end/2)+1);%tirar oq não interessa
    STFT=[STFT m_X_frame];
end
figure;
STFT = 20*log10(STFT + 1e-6);%passar para db
surf(ts,f,STFT);
colorbar;
view(0,90);
shading interp
axis tight;
xlabel('t[min]');
ylabel('f[Hz]');
a=sprintf('Sequencia de freq por janelas %f',framePercent);
title(a);
end
