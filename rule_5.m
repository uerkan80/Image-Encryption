function [encoded_pixel_decimal] = rule_5(pixel_value,Type)
encoded_pixel=[];
pixel_value_bin=dec2bin(pixel_value,8);

 switch Type
        case 'Encryption'             
            for i=1:2:8
                a=pixel_value_bin(i:i+1);
                switch a
                    case '00'
                        encoded_pixel = [encoded_pixel '10']; 
                    case '01'
                        encoded_pixel = [encoded_pixel '01'];   
                    case '10'
                        encoded_pixel = [encoded_pixel '00'];  
                    case '11'
                        encoded_pixel = [encoded_pixel '11'];          
                end
            end            

        case 'Decryption'
            for i=1:2:8
                a=pixel_value_bin(i:i+1);
                switch a
                    case '10'
                        encoded_pixel = [encoded_pixel '00']; 
                    case '01'
                        encoded_pixel = [encoded_pixel '01'];   
                    case '00'
                        encoded_pixel = [encoded_pixel '10'];  
                    case '11'
                        encoded_pixel = [encoded_pixel '11'];          
                end
            end
 end
 encoded_pixel_decimal=bin2dec(encoded_pixel);
end