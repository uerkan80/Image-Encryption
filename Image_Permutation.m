function [image_per] = Image_Permutation(image,m,n,x1,u1,Type) 
    x(1) = x1;
    for i = 2:(m*n)
        x(i)=mod(((exp(1)+u1))*log(x(i-1)),1); 
    end
    [~,Pos]=sort(x);
    Pos=Pos';
 switch Type
        case 'Encryption'          
            image_per=image(Pos);
        case 'Decryption'
            image_per(Pos)=image(:);         
 end
end