function [ G ] = calculateG( L, G, I , matrix, print)
%  Calculaion of G such that LG = I;

    for i=1:size(matrix,1)
        for k=1:size(matrix,1)
            sum = 0;
            for l=1:i-1
				sum = sum + L(i,l)*G(l,k);
            end
			G(i,k) = (I(i,k)-sum)/L(i,i);
        end
    end
    
    if(print == 1)
        disp( 'G Matrix:: ');
        G
    end
end

