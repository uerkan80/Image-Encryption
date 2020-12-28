function [DNA_image_encoded,key] = Image_Diffusion(DNA_image_permutasyon,m,n,x3,u3,Type)    
    x(1) = x3;
    key(1)=floor(256*x(1));
    for i = 2:m*n
        x(i)=mod(((exp(1)+u3))*log(x(i-1)),1);
        key(i)=floor(256*x(i));
    end
     switch Type
        case 'Encryption'          
            DNA_image_encoded=bitxor(DNA_image_permutasyon,key);
        case 'Decryption'
            DNA_image_encoded=bitxor(double(reshape(DNA_image_permutasyon,1,m*n)),key);
    end
end