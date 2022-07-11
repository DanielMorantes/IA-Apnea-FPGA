aleatoriza el or%% Carga de etiquetas de los datos
clear all 
close all
clc

Y_train = readmatrix('y_train.csv');
y_benchmark = readmatrix('y_benchmark.csv');

Y_train = Y_train(:,2:91);
y_benchmark = y_benchmark(:,2:91);

Y_train = Y_train.';
y_benchmark = y_benchmark.';

%% Carga de datos despues de wavelet

cd3_abd = readmatrix('cd3_abd.csv');
cd4_abd = readmatrix('cd4_abd.csv');

cd3_C4_A1 = readmatrix('cd3_C4_A1.csv');
cd4_C4_A1 = readmatrix('cd4_C4_A1.csv');

cd3_FLA = readmatrix('cd3_FLA.csv');
cd4_FLA = readmatrix('cd4_FLA.csv');

cd3_O3_A1 = readmatrix('cd3_O3_A1.csv');
cd4_O3_A1 = readmatrix('cd4_O3_A1.csv');

cd3_PPG = readmatrix('cd3_PPG.csv');
cd4_PPG = readmatrix('cd4_PPG.csv');

cd3_RONC = readmatrix('cd3_RONC.csv');
cd4_RONC = readmatrix('cd4_RONC.csv');

cd3_SPO2 = readmatrix('cd3_SPO2.csv');
cd4_SPO2 = readmatrix('cd4_SPO2.csv');

cd3_TORAC = readmatrix('cd3_TORAC.csv');
cd4_TORAC = readmatrix('cd4_TORAC.csv');

%% Union de niveles de wavelet en un vector

Wav_abd   = [cd3_abd; cd4_abd];
Wav_FLA   = [cd3_FLA; cd4_FLA];
Wav_PPG   = [cd3_PPG; cd4_PPG];
Wav_TORAC = [cd3_TORAC; cd4_TORAC];
Wav_RONC  = [cd3_RONC; cd4_RONC];
Wav_SPO2  = [cd3_SPO2; cd4_SPO2];
Wav_C4_A1 = [cd3_C4_A1; cd4_C4_A1];
Wav_O3_A1 = [cd3_O3_A1; cd4_O3_A1];

clear cd*

%% Re-dimensionar los datos en columnas

COL_abd   = reshape(Wav_abd,[],1);
COL_FLA   = reshape(Wav_FLA,[],1);
COL_PPG   = reshape(Wav_PPG,[],1);
COL_TORAC = reshape(Wav_TORAC,[],1);
COL_RONC  = reshape(Wav_RONC,[],1);
COL_SPO2  = reshape(Wav_SPO2,[],1);
COL_C4_A1 = reshape(Wav_C4_A1,[],1);
COL_O3_A1 = reshape(Wav_O3_A1,[],1);

ETI_y_train = reshape(Y_train,[],1);
ETI_y_benchmark = reshape(y_benchmark,[],1);

clear Wav*

%% Normalizar datos

NORM_abd   = normalize(COL_abd,'range');
NORM_FLA   = normalize(COL_FLA,'range');
NORM_PPG   = normalize(COL_PPG,'range');
NORM_TORAC = normalize(COL_TORAC,'range');
NORM_RONC  = normalize(COL_RONC,'range');
NORM_SPO2  = normalize(COL_SPO2,'range');
NORM_C4_A1 = normalize(COL_C4_A1,'range');
NORM_O3_A1 = normalize(COL_O3_A1,'range');

% Rangos de las señales normalizadas y sin normalizar
% a=min(N_Polisom);
% b=max(N_Polisom);
% c=mean(N_Polisom);
% 
% a1=min(Polisom);
% b1=max(Polisom);
% c1=mean(Polisom);

%% Unir los datos en una matriz unica

Polisom = [COL_abd COL_FLA COL_PPG COL_TORAC COL_RONC COL_SPO2 COL_C4_A1 COL_O3_A1];
N_Polisom = [NORM_abd NORM_FLA NORM_PPG NORM_TORAC NORM_RONC NORM_SPO2 NORM_C4_A1 NORM_O3_A1];

clear COL*
clear NORM*

%% Redimensionar el vector para entrada CNN 4 dimensiones

IMG_Polisom = reshape(Polisom,24,8,1,[]);
IMG_Polisom_N = reshape(N_Polisom,24,8,1,[]);
IMG_Polisom_Size = size(IMG_Polisom);

%% Balancear dataset

VEC_Apnea_benchmark = find(ETI_y_benchmark);
VEC_No_Apnea_benchmark = find(~ETI_y_benchmark);

Ev_ETI_y_benchmark = ETI_y_benchmark(VEC_Apnea_benchmark);
Ev_IMG_Polisom_N = IMG_Polisom_N(:,:,:,VEC_Apnea_benchmark);
Ev_IMG_Polisom_N_Size = size(Ev_IMG_Polisom_N);

EvN_ETI_y_benchmark = ETI_y_benchmark(VEC_No_Apnea_benchmark);
EvN_IMG_Polisom_N = IMG_Polisom_N(:,:,:,VEC_No_Apnea_benchmark);
EvN_IMG_Polisom_N_Size = size(EvN_IMG_Polisom_N);

% Extraer 36635 registros aleatorios con etiqueta "No apnea"
Ale_bench = randi(362635,36635,1); % Descomentar para cambiar imagenes
Balan_EvN_IMG_Polisom_N_bench = EvN_IMG_Polisom_N(:,:,:,Ale_bench);
Balan_EvN_IMG_Polisom_N_bench_Size = size(Balan_EvN_IMG_Polisom_N_bench);
Balan_EvN_ETI_y_benchmark = EvN_ETI_y_benchmark(Ale_bench);

% Juntar eventos y no eventos, (70000 en total)
Bal_IMG_Polisom = cat(4,Balan_EvN_IMG_Polisom_N_bench, Ev_IMG_Polisom_N);
Bal_IMG_Polisom_Size = size(Bal_IMG_Polisom);

Bal_ETI_y_benchmark = [Balan_EvN_ETI_y_benchmark; Ev_ETI_y_benchmark];

%% Aleatorizar orden

Ale_Order = randperm(70000).'; % Descomentar para cambiar orden
Bal_IMG_Polisom = Bal_IMG_Polisom(:,:,:,Ale_Order);
Bal_ETI_y_benchmark = Bal_ETI_y_benchmark(Ale_Order);

%% Separar datos en validacion y entrenamiento (Desbalanceados)

IMG_Polisom_Train = IMG_Polisom_N(:,:,:,1:277200);
IMG_Polisom_Train_Size = size(IMG_Polisom_Train);
IMG_Polisom_Valid = IMG_Polisom_N(:,:,:,277201:396000);
IMG_Polisom_Valid_Size = size(IMG_Polisom_Valid);

ETI_y_train_Train     = ETI_y_train(1:277200,:);
ETI_y_train_Valid     = ETI_y_train(277201:396000,:);

ETI_y_benchmark_Train = ETI_y_benchmark(1:277200,:);
ETI_y_benchmark_Valid = ETI_y_benchmark(277201:396000,:);

%% Guardar Parametros
save('Input.mat');
