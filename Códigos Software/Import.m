%%

Y_train = readmatrix('y_train.csv');
COL_y_train = reshape(Y_train,[],2);

y_benchmark = readmatrix('y_benchmark.csv');
COL_y_benchmark = reshape(y_benchmark,[],2);

%%

Wav_abd   = readmatrix('Wav_abd.csv');
Wav_C4_A1 = readmatrix('Wav_C4_A1.csv');
Wav_FLA   = readmatrix('Wav_FLA.csv');
Wav_O3_A1 = readmatrix('Wav_O3_A1.csv');
Wav_PPG   = readmatrix('Wav_PPG.csv');
Wav_RONC  = readmatrix('Wav_RONC.csv');
Wav_SPO2  = readmatrix('Wav_SPO2.csv');
Wav_TORAC = readmatrix('Wav_TORAC.csv');

%%

cd1_abd = readmatrix('cd1_abd.csv');
cd2_abd = readmatrix('cd2_abd.csv');
cd3_abd = readmatrix('cd3_abd.csv');
cd4_abd = readmatrix('cd4_abd.csv');

cd1_C4_A1 = readmatrix('cd1_C4_A1.csv');
cd2_C4_A1 = readmatrix('cd2_C4_A1.csv');
cd3_C4_A1 = readmatrix('cd3_C4_A1.csv');
cd4_C4_A1 = readmatrix('cd4_C4_A1.csv');

cd1_FLA = readmatrix('cd1_FLA.csv');
cd2_FLA = readmatrix('cd2_FLA.csv');
cd3_FLA = readmatrix('cd3_FLA.csv');
cd4_FLA = readmatrix('cd4_FLA.csv');

cd1_O3_A1 = readmatrix('cd1_O3_A1.csv');
cd2_O3_A1 = readmatrix('cd2_O3_A1.csv');
cd3_O3_A1 = readmatrix('cd3_O3_A1.csv');
cd4_O3_A1 = readmatrix('cd4_O3_A1.csv');

cd1_PPG = readmatrix('cd1_PPG.csv');
cd2_PPG = readmatrix('cd2_PPG.csv');
cd3_PPG = readmatrix('cd3_PPG.csv');
cd4_PPG = readmatrix('cd4_PPG.csv');

cd1_RONC = readmatrix('cd1_RONC.csv');
cd2_RONC = readmatrix('cd2_RONC.csv');
cd3_RONC = readmatrix('cd3_RONC.csv');
cd4_RONC = readmatrix('cd4_RONC.csv');

cd1_SPO2 = readmatrix('cd1_SPO2.csv');
cd2_SPO2 = readmatrix('cd2_SPO2.csv');
cd3_SPO2 = readmatrix('cd3_SPO2.csv');
cd4_SPO2 = readmatrix('cd4_SPO2.csv');

cd1_TORAC = readmatrix('cd1_TORAC.csv');
cd2_TORAC = readmatrix('cd2_TORAC.csv');
cd3_TORAC = readmatrix('cd3_TORAC.csv');
cd4_TORAC = readmatrix('cd4_TORAC.csv');
