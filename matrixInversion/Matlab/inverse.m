function [ invertedMatrix ] = inverse( matrix, print)
%inverse Finding the inverse of a matrix
    L = zeros(size(matrix,1));
	U = matrix;
    G = zeros(size(matrix,1));
    I = eye(size(matrix,1));
    invertedMatrix = zeros(size(matrix,1));
    
    %  
	%	L -> Lower Triangular Matrix
	%	U -> Upper Triangular Matrix
	%	matrix -> Original Matrix
    %
	%	LUx = b;
	%	Ux = G;
	%	LG = b;
	%
    [L,U,matrix] = getUpperTriangularMatrix(L, U, matrix, print);
    
	
	%
	%	G -> G matrix
	%
	G = calculateG(L,G,I,matrix, print);
	
	
	%
	%	X -> Inverted matrix
	%
	invertedMatrix = calculateX(U,G,invertedMatrix,matrix,print);
end

