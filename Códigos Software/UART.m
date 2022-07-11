%% Configuracion Uart   
device = serialport("COM6",9600)

%% Convertir datos a punto fijo
IMG_Polisom_N_UINT = cast(IMG_Polisom_N*255,'uint8');

a1=min(IMG_Polisom_N_UINT,[],'all');
a2=max(IMG_Polisom_N_UINT,[],'all');

%% Redimensionar imagenes a una dimensión
Img_Polisom_OUT = reshape(IMG_Polisom_N_UINT,1,192,1,396000);

%%
clc;
In_Uart=[];

for i = 1:396000
    IDK=[];
    for j = 1:24
        NOSE = IMG_Polisom_N_UINT(j,1:8,1,i);
        IDK=[IDK NOSE];
    end 
    In_Uart=[In_Uart; IDK];
    % j=1;
end 

%% Envio de datos
write(device,A,"uint8")



%% Pruebas UART
%% Datos a enviar
P_dec = randi(255,48,1);
P_bin = dec2bin(P_dec,8);
P_hex = dec2hex(P_dec);

%% Envio de datos prueba
    write(device,P_dec,"uint8")

%% Datos a enviar prueba filtro
P_dec = (ones(192,1)+1);
P_bin = dec2bin(P_dec,8);
P_hex = dec2hex(P_dec);

%% Envio de datos prueba
    write(device,P_dec,"uint8")
