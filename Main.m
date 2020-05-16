clc;
close all;
dataPath = '.\DataSets PL3\';
Datasets=cell(1,10); % celula de 3 dimensoes com os valores dos datasets
j=1;
for i=11:20
    if i>=19 && i<=20
        Datasets{1,j}=read_raw_data([dataPath,'acc_exp',num2str(i),'_user',num2str(floor((i+1)/2)),'.txt']);
        j=j+1;
    else
        Datasets{1,j}=read_raw_data([dataPath,'acc_exp',num2str(i),'_user0',num2str(floor((i+1)/2)),'.txt']);
        j=j+1;
    end
end

labels=importfileLabel([dataPath,'labels.txt'],208,404);%vai ficar com os valores da label
acoes=importfileActLabel([dataPath,'activity_labels.txt']);

atividades=cell(3,12);%coluna representa os eixos, X Y e Z, e linhas as atividades (que são 12)

counter=1;
for i=1:10
    x=Datasets{1,i}(:,1);%vai manter os valores de x do Dataset i 
    y=Datasets{1,i}(:,2);%vai manter os valores de y do Dataset i 
    z=Datasets{1,i}(:,3);%vai manter os valores de z do Dataset i
    eixoX=1:length(x);
    figure(i);
    subplot(311);
    plot(eixoX,x,'-k');
    xlabel('Time (min)');
    ylabel('ACC_X');
    subplot(312);
    plot(eixoX,y,'-k');
    xlabel('Time (min)');
    ylabel('ACC_Y');
    subplot(313);
    plot(eixoX,z,'-k');
    xlabel('Time (min)');
    ylabel('ACC_Z');
    linhaLabel=labels(counter,:);
    expAtual=linhaLabel(1);
    while expAtual==linhaLabel(1) && counter<197
         inicio=linhaLabel(4);
         fim=linhaLabel(5);
         atividade=linhaLabel(3);
         subplot(311);
         hold on;
         plot(inicio:fim,x(inicio:fim));
         texto=text(inicio,x(inicio),acoes(atividade,2),'VerticalAlignment','top','HorizontalAlignment','left');
         texto(1).FontSize = 5;
         subplot(312);
         hold on;
         plot(inicio:fim,y(inicio:fim));
         texto=text(inicio,x(inicio),acoes(atividade,2),'VerticalAlignment','top','HorizontalAlignment','left');
         texto(1).FontSize = 5;
         subplot(313);
         hold on;
         plot(inicio:fim,z(inicio:fim));
         texto=text(inicio,x(inicio),acoes(atividade,2),'VerticalAlignment','top','HorizontalAlignment','left');
         texto(1).FontSize = 5;
         counter=counter+1;
       
         atividades{1,atividade}{end+1}=x(inicio:fim);
         atividades{2,atividade}{end+1}=y(inicio:fim);
         atividades{3,atividade}{end+1}=z(inicio:fim);
         
         if(counter<197)
            linhaLabel=labels(counter,:);
         end
    end
end
%dftx=dft(atividades(1,:),"all");
%dfty=dft(atividades(2,:),"Gaussian");
%dftz=dft(atividades(3,:),"Gaussian");

%[peakValx,freqx]=findPeaks(atividades(1,:));
%[peakValy,freqy]=findPeaks(atividades(2,:));
%[peakValz,freqz]=findPeaks(atividades(3,:));

%graphActivity(peakValx,peakValy,peakValz);
%graphActivityFrequencia(freqx,freqy,freqz);
%graphActivityWalking(peakValx,peakValy,peakValz);
%graphActivityFreqWalking(peakValx,peakValy,peakValz);

STFT(Datasets{1,4},0.02);
% STFT(atividades(3,:),0.05);
% STFT(atividades(3,:),0.1);
% STFT(atividades(3,:),0.5);

%graphSignalDFT(atividades)