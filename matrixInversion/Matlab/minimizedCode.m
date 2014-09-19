    matrix = rand(3,3);
	tic
        L = zeros(size(matrix,1));
        U = matrix;
        G = zeros(size(matrix,1));
        I = eye(size(matrix,1));
        invertedMatrix = zeros(size(matrix,1));
        
        getMultiplier = inline('-((mat(m,n))/mat(n,n))*gt(m,n) + isequal(m,n)*1 + 0*gt(n,m)','mat','m','n');
        
        U_ = matrix;
        
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
                        rowI0 = matrix(iRow,:);
                        matrix(iRow,:) = matrix(iRow+1,:);
                        matrix(iRow+1,:) = rowI0;
                        [L,U,matrix] = getUpperTriangularMatrix(L, U, matrix, print);
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
        
        
            %G = calculateG(L,G,I,matrix, print);
            
            for i=1:size(matrix,1)
                for k=1:size(matrix,1)
                    sum = 0;
                    for l=1:i-1
                        sum = sum + L(i,l)*G(l,k);
                    end
                    G(i,k) = (I(i,k)-sum)/L(i,i);
                end
            end
            
            %invertedMatrix = calculateX(U,G,invertedMatrix,matrix,print);
            for i=size(matrix,1):-1:1
                for k=1:size(matrix,1)
                    sum = 0;
                    for l=size(matrix,1):-1:i+1
                        sum = sum + U(i,l)*invertedMatrix(l,k);
                    end
                    invertedMatrix(i,k) = (G(i,k)-sum)/U(i,i);
                end
            end
    toc
    
    tic
        inv(matrix)
    toc