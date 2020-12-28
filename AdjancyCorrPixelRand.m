function CC=AdjancyCorrPixelRand(Encrypted) 
    Encrypted=double(Encrypted);
    k = 50;
    [m,n] = size(Encrypted); 
    m=m-1;
    n=n-1;
    s = randsample(m*n, k);
    [X, Y] = ind2sub([m, n], s);  
    %% horizontal   
    hxE = Encrypted(X,Y); 
    hyE = Encrypted(X,Y+1); 
    He_xy = corrcoef(hxE,hyE);
    CC(1,1)=He_xy(1,2);    
    
    %% vertical    
    vxE = Encrypted(X,Y); 
    vyE = Encrypted(X+1,Y); 
    Ve_xy = corrcoef(vxE,vyE);
    CC(2,1)=Ve_xy(1,2);    
    %% diagonal     
    dxE = Encrypted(X,Y); 
    dyE = Encrypted(X+1,Y+1); 
    De_xy = corrcoef(dxE,dyE); 
    CC(3,1)=De_xy(1,2);    
end