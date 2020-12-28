function [I] = Bit_Reversion(I_D,m,n,x4,u4,Type)  
    x(1) = x4;
    x1 = (0:255)';
    v = bitrevorder(x1);
    for i = 2:m*n
        x(i)=mod(((exp(1)+u4))*log(x(i-1)),1);

    end
    x=floor(x*256);  
    
    switch Type
        case 'Encryption'          
               for i=1:m*n
                 I(i)=v(x(i)+1);
               end    
                I=bitxor(I_D,I);
        case 'Decryption'
                for i=1:m*n
                    I(i)=v(x(i)+1);
                end
               I=bitxor(double(reshape(I_D,1,m*n)),I);  
    end
end