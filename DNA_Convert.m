function [dna_image] = DNA_Convert(image,m,n,x2,u2,Type) 
    x(1) = x2;  
     switch Type
        case 'Encryption' 
        load('DNA_Encryption.mat')
        
        for i = 1:(m*n)
            if(i>1)
                x(i)=mod(((exp(1)+u2))*log(x(i-1)),1);
            end             
              Rule = ceil(7*x(i)) + 1;
              dna_image(i)=Encryption(image(i)+1,Rule);
        end       
        case 'Decryption'
        load('DNA_Dencryption.mat')
        for i = 1:(m*n)
            if(i>1)
             x(i)=mod(((exp(1)+u2))*log(x(i-1)),1);          
            end
             Rule = ceil(7*x(i)) + 1;
             dna_image(i)=Decryption(image(i)+1,Rule);
             
%              if(Rule==1)
%                  dna_image(i) = rule_1(image(i),'Decryption');
%              elseif(Rule==2)
%                   dna_image(i) = rule_2(image(i),'Decryption');   
%              elseif(Rule==3)
%                   dna_image(i) = rule_3(image(i),'Decryption');  
%              elseif(Rule==4)
%                   dna_image(i) = rule_4(image(i),'Decryption');
%              elseif(Rule==5)
%                   dna_image(i) = rule_5(image(i),'Decryption');
%              elseif(Rule==6)
%                   dna_image(i) = rule_6(image(i),'Decryption');
%              elseif(Rule==7)
%                   dna_image(i) = rule_7(image(i),'Decryption');
%              else
%                   dna_image(i) = rule_8(image(i),'Decryption');
%              end
%         switch Rule
%             case 1
%                 dna_image(i) = rule_1(image(i),'Decryption')
%             case 2
%                 dna_image(i) = rule_2(image(i),'Decryption')
%             case 3
%                 dna_image(i) = rule_3(image(i),'Decryption')
%             case 4
%                 dna_image(i) = rule_4(image(i),'Decryption')
%             case 5
%                 dna_image(i) = rule_5(image(i),'Decryption')
%             case 6
%                 dna_image(i) = rule_6(image(i),'Decryption')
%             case 7
%                 dna_image(i) = rule_7(image(i),'Decryption')
%             case 8
%                 dna_image(i) = rule_8(image(i),'Decryption')
%         end       
        end         
     end
end