function [ L, U, matrix ] = getUpperTriangularMatrix( L, U, matrix, print)
	U_ = zeros(size(matrix));
	
	U_ = matrix;
	%disp( '__A__');
	%U_
	%disp( '____');
	
    for k=1:size(matrix,1)
        for i=1:size(matrix,1)
            for j=1:size(matrix,1)
				su = 0;
                for l=1:size(matrix,1)
					t = 0;
                    if ((k==l && l~=i) || ((i==j) && (j==k)))
                        t = getMultiplier(U_,i,l);
                    else
                        if(l==i)
                            t = 1.0;
                        else
                            t = 0.0;
                        end
                    end
					%disp(strcat( num2str(k),num2str(i),num2str(j),num2str(l),num2str(t)));
					su = su + t*(U_(l,j));
                end
				U(i,j) = su;
                if(i==j && U(i,j)==0)
					disp('Can not solve without Pivoting');
					[L,U,matrix] = pivotAndGetUpperTriangularMatrix(i,L,U,matrix,print);
					return;
                end
            end
			L(i,k) = 0;
            if(i>k)
                L(i,k) = -getMultiplier(U_,i,k);
            else
                if isequal(i,k)
                    L(i,k) = 1.0;
                else
                    L(i,k) = 0.0;
                end
            end
        end
		%disp(strcat('\n__U',num2str(k),'__'));
		%U;
		U_ = U;
    end
    if(print == 1)
        disp('Lower Triangular Matrix:: ');
        L
        disp('Upper Triangular Matrix:: ');
        U
    end
	
end

