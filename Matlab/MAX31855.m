function MAX31855(num_puerto,baudios )



    num = char(dec2hex(num_puerto,1));      
    COMx=strcat('COM',num);              
    delete(instrfind({'Port'},{COMx}));   
    s = serial({COMx},'BaudRate',baudios);
    fopen(s);                            
                                      

b=[];
for i = 1:1:4
a = fread(s,1,'uchar'); 
b = [b decimalToBinaryVector(a,8)];
end

b=sprintf('%d',b);
    fclose(s);                       

b=flip(b);
c=b;
b=b(2:15);
celsius=q2dec(b,11,2,'bin');
c=c(18:29);

interna=q2dec(c,7,4,'bin');

X=sprintf('Temperatura en Cº: %.4f',celsius);
Y=sprintf('Temperatura interna: %.4f',interna);

disp(X)
disp(Y)

end