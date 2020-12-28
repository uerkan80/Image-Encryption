clc;clear all;close all;
A=imread("lena_512.tif");

D=[0	1	0	1	0	1	1	0	0	0	1	1	1	0	0	1	0	1	1	1	1	0	0	1	0	0	1	0	0	1	0	0	0	1	0	0	0	0	1	0	0	0	1	0	0	1	1	0	0	1	0	0	0	1	0	1	0	0	1	0	1	0	0	1	0	1	0	0	1	0	0	0	0	1	0	0	0	0	0	0	0	1	0	0	1	1	0	1	0	1	1	0	0	0	1	1	0	1	0	1	0	0	0	1	0	1	1	0	0	1	1	0	0	1	0	1	0	1	0	0	0	1	1	0	1	0	1	0	0	1	0	1	0	1	1	1	0	0	1	0	1	1	1	0	0	1	0	1	1	0	1	0	0	1	1	1	0	0	1	0	0	0	1	1	0	1	1	0	0	1	1	1	0	1	1	0	0	1	1	1	0	1	1	1	0	1	1	1	0	1	1	1	0	0	1	0	0	0	0	1	0	1	1	1	1	0	1	0	0	0	1	0	0	1	0	1	0	1	0	0	0	0	1	1	0	0	1	0	1	0	1	0	0	1	0	0	0	1	1	0	0	0	1	0	1	1	0	1	0	1	0	0	1	0	1	0	0	1	1	0	0	0	0	1	0	1	0	0	1	1	1	0	0	1	1	0	0	1	0	0	0	1	0	1	0	0	1	0	0	1	1	0	0	1	1	1	0	1	0	1	0	1	0	1	0	1	1	0	1	0	1	1	0	1	0	1	1	0	0	0	0	1	1	1	0	0	0	0	0	0	1	1	0	0	1	0	0	1	1	1	0	0	1	1	0	0	1	1	0	1	0	1	0	1	1	1	0	1	1	0	0	0	1	1	1	0	0	0	0	1	1	1	1	0	0	0	0	0	1	0	1	1	1	1	0	1	0	0	0	0	0	1	0	0	1	1	1	1	1	1	0	1	0	0	0	1	0	0	0	0	1	0	1	0	0	0	0	1	0	0	0	1	1	1	0	0	1	0	1	0	1	1	0	1	0	0	1	0	1	1	0	1	1	0	0	0	1	0	0	1	0	1	0	0	0	0	0	1	1	0	0	1	0	1	0	1	0	1	0	0	1	1	0	1	1	0	1	0	0	0	0	1	0	1	0	1	1	0	0	1	1	0	1	1	0	1	0	1	0	1	1	0	0	1	0	1	1	1	0	0	0	1];

[m n]=size(A);

tic
J = imresize(A, [224 224]);
imwrite(J, 'resized/deneme.tif');
system('C:\Users\User\.conda\envs\py35\pythonw Python3\run_512_GrayScale_v2.py');
B = importdata('hashCodes/hashCodes_512.txt')';
C=logical(B);

%Encryption
tic   
   [V,U]=start_point_calcalutor(C,D);   
   [Img_Prmt]=Image_Permutation(A,m,n,V(1),U(1),'Encryption');
   [DNA_Img]=DNA_Convert(Img_Prmt,m,n,V(2),U(2),'Encryption');   
   [Img_Diff]=Image_Diffusion(DNA_Img,m,n,V(3),U(3),'Encryption');
   Bit_Reversion_Img= Bit_Reversion(Img_Diff,m,n,V(4),U(4),'Encryption');
   Enc_Img=uint8(reshape(Bit_Reversion_Img,m,n));
Enc_Time = toc;
   
%Decryption
tic
    [V,U]=start_point_calcalutor(C,D);  
    De_Bit_Reversion_Img= Bit_Reversion(Enc_Img,m,n,V(4),U(4),'Decryption') ; 
    De_Img_Diffusion=Image_Diffusion(De_Bit_Reversion_Img,m,n,V(3),U(3),'Decryption');
    De_DNA_Img=DNA_Convert(De_Img_Diffusion,m,n,V(2),U(2),'Decryption');
    De_Img_Prmt=Image_Permutation(De_DNA_Img,m,n,V(1),U(1),'Decryption');
    De_Enc_Img=uint8(reshape(De_Img_Prmt,m,n));
 zaman_3 = toc;
 
 %Correlation
    Correlation_Corr=AdjancyCorrPixelRand(Enc_Img);     
  %Entropi
    H=entropy(Enc_Img);
  %npcr1, uaci calculate
    A1bit=A;
    r=randi([1 m],1,2);
    A1bit(r(1),r(2)) =mod(A(r(1),r(2))+1,255);
    J1Bit = imresize(A1bit, [224 224]);
    imwrite(J1Bit, 'resized/deneme.tif');
    system('C:\Users\User\.conda\envs\py35\pythonw Python3\run_512_GrayScale_v2.py');
    B1Bit = importdata('hashCodes/hashCodes_512.txt')';
    C1Bit=logical(B1Bit);    
    [V1Bit,U1Bit]=start_point_calcalutor(C1Bit,D); 
    [Image_Prmt_1Bit]=Image_Permutation(A1bit,m,n,V1Bit(1),U1Bit(1),'Encryption');
    [DNA_Img_1Bit]=DNA_Convert(Image_Prmt_1Bit,m,n,V1Bit(2),U1Bit(2),'Encryption');
    [Img_Diff_1Bit]=Image_Diffusion(DNA_Img_1Bit,m,n,V1Bit(3),U1Bit(3),'Encryption');
    Bit_Reversion_Img_1Bit= Bit_Reversion(Img_Diff_1Bit,m,n,V1Bit(4),U1Bit(4),'Encryption');    
    Enc_Img_1Bit=uint8(reshape(Bit_Reversion_Img_1Bit,m,n));   
    [npcr, uaci]= NPCR_UACI(uint8(Enc_Img),uint8(Enc_Img_1Bit)); 
    
     
 %croppimg attack   
    Crop_Ratio=16; 

   Enc_Img_Crop=Enc_Img;
    if Crop_Ratio==2 
        Enc_Img_Crop(1:512, 1:256)=0;
    elseif Crop_Ratio==4
        Enc_Img_Crop(1:256, 1:256)=0;
    elseif Crop_Ratio==16
        Enc_Img_Crop(1:128, 1:128)=0;
    elseif Crop_Ratio==32
        Enc_Img_Crop(1:64, 1:64)=0;
    end
    De_Bit_Reversion_Img_Crop= Bit_Reversion(Enc_Img_Crop,m,n,V(4),U(4),'Decryption') ; 
    De_Image_Diffusion_Crop=Image_Diffusion(De_Bit_Reversion_Img_Crop,m,n,V(3),U(3),'Decryption');  
    De_DNA_Image_Crop=DNA_Convert(De_Image_Diffusion_Crop,m,n,V(2),U(2),'Decryption'); 
    De_Image_Prmt_Crop=Image_Permutation(De_DNA_Image_Crop,m,n,V(1),U(1),'Decryption');
    DE_Enc_Img_Crop=uint8(reshape(De_Image_Prmt_Crop,m,n));   
    PSNR_Crop=psnr(A,DE_Enc_Img_Crop);    
    
    %noise attack
    NoiseLevel=0.001;   
    Enc_Img_Noise=double(imnoise(Enc_Img,'salt & pepper',NoiseLevel));
    De_Bit_Reversion_Noise= Bit_Reversion(Enc_Img_Noise,m,n,V(4),U(4),'Decryption') ; 
    De_Image_Diffusion_Noise=Image_Diffusion(De_Bit_Reversion_Noise,m,n,V(3),U(3),'Decryption');  
    De_DNA_Image_Noise=DNA_Convert(De_Image_Diffusion_Noise,m,n,V(2),U(2),'Decryption'); 
    De_Image_Prmt_Noise=Image_Permutation(De_DNA_Image_Noise,m,n,V(1),U(1),'Decryption');
    De_Enc_Img_Noise=uint8(reshape(De_Image_Prmt_Noise,m,n));    
    PSNR_Nosie=psnr(A,De_Enc_Img_Noise);

    %variance and chi_2
    [Plain_Variance Enc_Variance chi_2_Enc chi_2_plain]=var_chi(A,Enc_Img)
    z_Var1=Plain_Variance;
    z_Var2=Enc_Variance;
    z_chi_2_Encryption=chi_2_Enc;
    z_chi_2_plain=chi_2_plain;

