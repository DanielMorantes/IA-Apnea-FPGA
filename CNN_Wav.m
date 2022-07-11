%% Categorizar las etiquetas 

ETI_y_train = categorical(ETI_y_train);
ETI_y_benchmark = categorical(ETI_y_benchmark);
Bal_ETI_y_benchmark = categorical(Bal_ETI_y_benchmark);

%% Separar datos en validacion y entrenamiento (Balanceados bench)

Bal_IMG_Polisom_Train = Bal_IMG_Polisom(:,:,:,1:49000);
Bal_IMG_Polisom_Train_Size = size(Bal_IMG_Polisom_Train);
Bal_IMG_Polisom_Valid = Bal_IMG_Polisom(:,:,:,49001:70000);
Bal_IMG_Polisom_Valid_Size = size(Bal_IMG_Polisom_Valid);

Bal_ETI_y_benchmark_Train = Bal_ETI_y_benchmark(1:49000,:);
Bal_ETI_y_benchmark_Valid = Bal_ETI_y_benchmark(49001:70000,:);

%Bal_ETI_y_train_Train     = ETI_y_train(1:49000,:);
%Bal_ETI_y_train_Valid     = ETI_y_train(49001:70000,:);

%% Arquitectura de la red 1 conv 1 pool
layers = [
    imageInputLayer([24 8 1])
       
    convolution2dLayer([7 5],3)
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)

    fullyConnectedLayer(14)
    reluLayer

    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

%% Entrenamiento de la red
options = trainingOptions('adam', ...
    'InitialLearnRate',0.2, ...
    'MaxEpochs',30, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',100, ...
    'Verbose',false, ...
    'Plots','training-progress');

%%
options = trainingOptions("sgdm", ...
    LearnRateSchedule="piecewise", ...
    LearnRateDropFactor=0.3, ...
    LearnRateDropPeriod=5, ...
    MaxEpochs=30, ...
    MiniBatchSize=100, ...
    Plots="training-progress")

%%
net = trainNetwork(Bal_IMG_Polisom_Train, Bal_ETI_y_benchmark_Train,layers,options);

%% Validacion de la red

YPred = classify(net,Bal_IMG_Polisom_Valid);
YValidation = Bal_ETI_y_benchmark_Valid;

accuracy = sum(YPred == YValidation)/numel(YValidation)

%%

plotconfusion(YPred, YValidation)

%% Extraer pesos de la red entrenada

pesos_F1= net.Layers(2,1).Weights(:,:,1,1);
pesos_F2= net.Layers(2,1).Weights(:,:,1,2);
pesos_F3= net.Layers(2,1).Weights(:,:,1,3);
bias_F1= net.Layers(2,1).Bias(:,:,1);
bias_F2= net.Layers(2,1).Bias(:,:,2);
bias_F3= net.Layers(2,1).Bias(:,:,3);

pesos_Fully1= net.Layers(5,1).Weights;
bias_Fully1= net.Layers(5,1).Bias;

pesos_Fully2= net.Layers(7,1).Weights;
bias_Fully2= net.Layers(7,1).Bias;

%% Convertir Pesos a punto fijo

normalize(COL_PPG,'range');

pesos_F1_UINT = cast(pesos_F1*255,'uint8');
pesos_F2 = cast(pesos_F2*255,'uint16');
pesos_F3 = cast(pesos_F3*255,'uint8');
bias_F1 = cast(bias_F1*255,'uint8');
bias_F2 = cast(bias_F2*255,'uint8');
bias_F3 = cast(bias_F3*255,'uint8');
pesos_Fully1 = cast(pesos_Fully1*255,'uint8');
bias_Fully1 = cast(bias_Fully1*255,'uint8');
pesos_Fully2 = cast(pesos_Fully2*255,'uint8');
bias_Fully2 = cast(bias_Fully2*255,'uint8');

a1=min(IMG_Polisom_N_UINT,[],'all');
a2=max(IMG_Polisom_N_UINT,[],'all');

%% Guardar Parametros

save('CNN_Para_eXPORTAR.mat');
