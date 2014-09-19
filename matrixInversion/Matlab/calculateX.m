function [ invertedMatrix ] = calculateX( U, G, invertedMatrix , matrix, print)
%  Calculaion of X such that UX = G;

    for i=size(matrix,1):-1:1
        for k=1:size(matrix,1)
            sum = 0;
            for l=size(matrix,1):-1:i+1
				sum = sum + U(i,l)*invertedMatrix(l,k);
            end
			invertedMatrix(i,k) = (G(i,k)-sum)/U(i,i);
        end
    end
    
    %if(print == 1)
    %    disp( 'inverted Matrix:: ');
    %    invertedMatrix
    %end
end

