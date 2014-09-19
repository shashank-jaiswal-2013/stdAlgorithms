function [ L, U, matrix ] = pivotAndGetUpperTriangularMatrix( iRow,L, U, matrix, print)
    %    
    % If  A  is a nonsingular matrix, 
	% then there exists a permutation matrix
	% P  so that  PA  has an LU-factorization
	% Let us interchange row i with row i+1
	%
	rowI0 = matrix(iRow,:);
	matrix(iRow,:) = matrix(iRow+1,:);
	matrix(iRow+1,:) = rowI0;
	[L,U,matrix] = getUpperTriangularMatrix(L, U, matrix, print);

end

