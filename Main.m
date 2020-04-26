clc;
close all;
dataPath = '.\DataSets PL3\';
j=1;
Datasets=cell(1,10); % celula de 3 dimensoes com os valores dos datasets
sizes = zeros(1,10); %vai ficar com o tamanho dos datasets

for i=11:20
    if i>=19 && i<=20
        Datasets{1,j}=read_raw_data([dataPath,'acc_exp',num2str(i),'_user',num2str(floor((i+1)/2)),'.txt']);
        sizes(j) = numel(Datasets{1,j}(:,1));
        j=j+1;
    else
        Datasets{1,j}=read_raw_data([dataPath,'acc_exp',num2str(i),'_user0',num2str(floor((i+1)/2)),'.txt']);
        sizes(j) = numel(Datasets{1,j}(:,1));
        j=j+1;
    end
end

labels=importfileLabel([dataPath,'labels.txt'],208,404);%vai ficar com os valores da label
acoes=importfileActLabel([dataPath,'activity_labels.txt']);

atividades=cell(3,12);%coluna representa os eixos, X Y e Z, e linhas as atividades (que são 12)
for i=1:10
    x=Datasets{1,i}(:,1);%vai manter os valores de x do Dataset i 
    y=Datasets{1,i}(:,2);%vai manter os valores de y do Dataset i 
    z=Datasets{1,i}(:,3);%vai manter os valores de z do Dataset i 
end
    
