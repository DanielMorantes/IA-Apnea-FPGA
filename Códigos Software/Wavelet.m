%% División datos
clear all 
close all
clc

file=hdf5info('X_train.h5')
file1=hdf5info('X_test.h5')

dset=hdf5read(file.GroupHierarchy.Datasets(1));
dset1=hdf5read(file1.GroupHierarchy.Datasets(1));

dset_c_abd   = normalize(dset(3:9002,:));
dset_Fl_Air  = normalize(dset(9003:18002,:));
dset_PPG     = normalize(dset(18003:27002,:));
dset_Torac   = normalize(dset(27003:36002,:)); 
dset_Ronq    = normalize(dset(36003:45002,:));
dset_c_SPO2  = normalize(dset(45003:54002,:));
dset_c_C4_A1 = normalize(dset(54003:63002,:));
dset_c_O3_A1 = normalize(dset(63003:72002,:));

%% Redistribuir datos caracteristicas vs muestras

COL_dset_c_abd   = reshape(dset_c_abd,[],1);
COL_dset_Fl_Air  = reshape(dset_Fl_Air,[],1);
COL_dset_PPG     = reshape(dset_PPG,[],1);
COL_dset_Torac   = reshape(dset_Torac,[],1);
COL_dset_Ronq    = reshape(dset_Ronq,[],1);
COL_dset_c_SPO2  = reshape(dset_c_SPO2,[],1);
COL_dset_c_C4_A1 = reshape(dset_c_C4_A1,[],1);
COL_dset_c_O3_A1 = reshape(dset_c_O3_A1,[],1);

%% 1.Componentes Wavelet Cinturón Abdominal 
cd1_abd=[];
cd2_abd=[];
cd3_abd=[];
cd4_abd=[];

%TP_COL_dset_c_abd = COL_dset_c_abd.';

for i = 1:100:39600001
    f = COL_dset_c_abd(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_abd=[cd1_abd cd1];
    cd2_abd=[cd2_abd cd2];
    cd3_abd=[cd3_abd cd3];
    cd4_abd=[cd4_abd cd4];
end

%%
subplot(4,1,1)
plot(cd4_abd)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_abd)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_abd)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_abd)
title('Coeficientes en el nivel 1')

%% 1.Re-estructura para Cinturón Abdominal

Wav_abd = [cd1_abd; cd2_abd; cd3_abd; cd4_abd];

%% 2.Componentes Wavelet Flujo de Aire
cd1_FlA=[];
cd2_FlA=[];
cd3_FlA=[];
cd4_FlA=[];

%TP_COL_dset_Fl_Air = COL_dset_Fl_Air.';

for i = 1:100:39600001
    f = COL_dset_Fl_Air(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_FlA=[cd1_FlA cd1];
    cd2_FlA=[cd2_FlA cd2];
    cd3_FlA=[cd3_FlA cd3];
    cd4_FlA=[cd4_FlA cd4];
end

%%
subplot(4,1,1)
plot(cd4_FlA)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_FlA)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_FlA)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_FlA)
title('Coeficientes en el nivel 1')

%% 2.Re-estructura para flujo de aire

Wav_FLA = [cd1_FlA; cd2_FlA; cd3_FlA; cd4_FlA];

%% 3. Componentes PPG (Fotopletismograma)
cd1_PPG=[];
cd2_PPG=[];
cd3_PPG=[];
cd4_PPG=[];

%TP_COL_dset_PPG = COL_dset_PPG.';

for i = 1:100:39600001
    f = COL_dset_PPG(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_PPG=[cd1_PPG cd1];
    cd2_PPG=[cd2_PPG cd2];
    cd3_PPG=[cd3_PPG cd3];
    cd4_PPG=[cd4_PPG cd4];
end

%%
subplot(4,1,1)
plot(cd4_PPG)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_PPG)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_PPG)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_PPG)
title('Coeficientes en el nivel 1')

%% 3. Re-estructura para PPG (Fotopletismograma)

Wav_PPG = [cd1_PPG; cd2_PPG; cd3_PPG; cd4_PPG];

%% 4. Componentes Wavelet CINTURON TORACICO
cd1_TORAC=[];
cd2_TORAC=[];
cd3_TORAC=[];
cd4_TORAC=[];

%TP_COL_dset_Torac = COL_dset_Torac.';

for i = 1:100:39600001
    f = COL_dset_Torac(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_TORAC=[cd1_TORAC cd1];
    cd2_TORAC=[cd2_TORAC cd2];
    cd3_TORAC=[cd3_TORAC cd3];
    cd4_TORAC=[cd4_TORAC cd4];
end

%%
subplot(4,1,1)
plot(cd4_TORAC)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_TORAC)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_TORAC)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_TORAC)
title('Coeficientes en el nivel 1')

%% 4. Re-estructura para CINTURON TORACICO

Wav_TORAC = [cd1_TORAC; cd2_TORAC; cd3_TORAC; cd4_TORAC];

%% 5. Componentes Wavelet Flujo de Indice de Ronquidos
cd1_RONC=[];
cd2_RONC=[];
cd3_RONC=[];
cd4_RONC=[];

%TP_COL_dset_Ronq = COL_dset_Ronq.';

for i = 1:100:39600001
    f = COL_dset_Ronc(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_RONC=[cd1_RONC cd1];
    cd2_RONC=[cd2_RONC cd2];
    cd3_RONC=[cd3_RONC cd3];
    cd4_RONC=[cd4_RONC cd4];
end

%%
subplot(4,1,1)
plot(cd4_RONC)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_RONC)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_RONC)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_RONC)
title('Coeficientes en el nivel 1')

%% 5. Re-estructura para indice de ronquidos

Wav_RONC = [cd1_RONC; cd2_RONC; cd3_RONC; cd4_RONC];

%% 6. Componentes Wavelet Saturación de Oxigeno
cd1_SPO2=[];
cd2_SPO2=[];
cd3_SPO2=[];
cd4_SPO2=[];

%TP_COL_dset_c_SPO2 = COL_dset_c_SPO2.';

for i = 1:100:39600001
    f = COL_dset_c_SPO2(:,i);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_SPO2=[cd1_SPO2 cd1];
    cd2_SPO2=[cd2_SPO2 cd2];
    cd3_SPO2=[cd3_SPO2 cd3];
    cd4_SPO2=[cd4_SPO2 cd4];
end

%%
subplot(4,1,1)
plot(cd4_SPO2)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_SPO2)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_SPO2)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_SPO2)
title('Coeficientes en el nivel 1')


%% 6. Re-estructura para Saturación de Oxigeno

Wav_SPO2 = [cd1_SPO2; cd2_SPO2; cd3_SPO2; cd4_SPO2];

%% 7. Componentes Wavelet derivación C4-A1
cd1_C4_A1=[];
cd2_C4_A1=[];
cd3_C4_A1=[];
cd4_C4_A1=[];

%TP_COL_dset_c_C4_A1 = COL_dset_c_C4_A1.';

for i = 1:100:39600001
    f = COL_dset_c_C4_A1(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_C4_A1=[cd1_C4_A1 cd1];
    cd2_C4_A1=[cd2_C4_A1 cd2];
    cd3_C4_A1=[cd3_C4_A1 cd3];
    cd4_C4_A1=[cd4_C4_A1 cd4];
end

%%
subplot(4,1,1)
plot(cd4_C4_A1)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_C4_A1)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_C4_A1)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_C4_A1)
title('Coeficientes en el nivel 1')


%% 7. Re-estructura para derivación C4-A1

Wav_C4_A1 = [cd1_C4_A1; cd2_C4_A1; cd3_C4_A1; cd4_C4_A1];

%% 8. Componentes Wavelet derivación O3_A1
cd1_O3_A1=[];
cd2_O3_A1=[];
cd3_O3_A1=[];
cd4_O3_A1=[];

%TP_COL_dset_c_O3_A1 = COL_dset_c_O3_A1.';

for i = 1:100:39600001
    f = COL_dset_c_O3_A1(0+i:99+i,1);
    [c,l] = wavedec(f,4,'db2'); % Descomposición de la señal en 4 niveles
    approx = appcoef(c,l,'db2'); % Coeficientes de aproximación (F.B.)
    [cd1,cd2,cd3,cd4] = detcoef(c,l,[1,2,3,4]); % Coeficientes de detalle (F.A.)
    cd1_O3_A1=[cd1_O3_A1 cd1];
    cd2_O3_A1=[cd2_O3_A1 cd2];
    cd3_O3_A1=[cd3_O3_A1 cd3];
    cd4_O3_A1=[cd4_O3_A1 cd4];
end

%%
subplot(4,1,1)
plot(cd4_O3_A1)
title('Coeficientes de aproximación')
subplot(4,1,2)
plot(cd3_O3_A1)
title('Coeficientes en el nivel 3')
subplot(4,1,3)
plot(cd2_O3_A1)
title('Coeficientes en el nivel 2')
subplot(4,1,4)
plot(cd1_O3_A1)
title('Coeficientes en el nivel 1')


%% 8. Re-estructura para derivación O3_A1

Wav_O3_A1 = [cd1_O3_A1; cd2_O3_A1; cd3_O3_A1; cd4_O3_A1];
