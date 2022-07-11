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

%% 1.FFT Cinturón Abdominal 
FFT_abd=[];                                                                                                                                                                                         

for i = 1:4400
    cd = dset_c_abd(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_abd=[FFT_abd M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_abd)
title('FFT Cinturón Abdominal')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 2. FFT Flujo de aire 
FFT_FLA=[];

for i = 1:4400
    cd = dset_Fl_Air(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_FLA=[FFT_FLA M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_FLA)
title('FFT Flujo de aire')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 3.FFT PPG 
FFT_PPG=[];

for i = 1:4400
    cd = dset_PPG(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_PPG=[FFT_PPG M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_PPG)
title('FFT PPG')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 4.FFT Cinturón Toracico 
FFT_Torac=[];

for i = 1:4400
    cd = dset_Torac(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_Torac=[FFT_Torac M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_Torac)
title('FFT Cinturón Toracico')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 5.FFT Indice de ronquidos
FFT_ronq=[];

for i = 1:4400
    cd = dset_Ronq(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_ronq=[FFT_ronq M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_ronq)
title('FFT Indice de ronquidos')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 6. FFT Saturacion de oxigeno SPO2
FFT_SPO2=[];

for i = 1:4400
    cd = dset_c_SPO2(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_SPO2=[FFT_SPO2 M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_SPO2)
title('FFT Saturacion de oxigeno SPO2')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 7.FFT EEG Canal C4_A1
FFT_C4_A1=[];

for i = 1:4400
    cd = dset_c_C4_A1(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_C4_A1=[FFT_C4_A1 M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia

plot(freq,FFT_C4_A1)
title('FFT EEG Canal C4_A1')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

%% 8.FFT EEG Canal O3_A1
FFT_O3_A1=[];

for i = 1:4400
    cd = dset_c_O3_A1(:,i);
    Transform = fft(cd);  
    M_Transform = abs(Transform);
    FFT_O3_A1=[FFT_O3_A1 M_Transform];
end

freq = (0:length(Transform)-1)*100/length(Transform);        % Vector de frecuencia
    
plot(freq,FFT_O3_A1)
title('FFT EEG Canal O3_A1')
ax = gca;
ax.XTick = [5 15 25 35 45 55 65 75 85 95];

