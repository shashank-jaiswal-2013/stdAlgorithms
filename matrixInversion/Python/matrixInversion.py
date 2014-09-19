'''
	@author Shashank Jaiswal
	@since 01-09-2014
	@version 0.0.0.1
	@description 
				Mathematics:: Matrix inversion using LU decomposition scheme
				Author: Shashank Jaiswal <shashank_jaiswal@live.com>
				Copyright (c): 2014 Shashank Jaiswal, all rights reserved
				Version: 0.0.0.1

					 * This library is free software; you can redistribute it and/or
					 * modify it under the terms of the GNU Lesser General Public
					 * License as published by the Free Software Foundation; either
					 * version 2.1 of the License, or (at your option) any later version.
					 *
					 * This library is distributed in the hope that it will be useful,
					 * but WITHOUT ANY WARRANTY; without even the implied warranty of
					 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					 * Lesser General Public License for more details.
					 *
					 * You should have received a copy of the GNU Lesser General Public
					 * License along with this library; if not, write to the Free Software
					 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

					You may contact the author at: shashank_jaiswal@live.com
'''


import sys;
import os;

matrix = [];
U = [];
G = [];
X = [];
L = [];
I = [];

def getMultiplier(matrix,i,j):
	'''
		matrix = [
					[a00,a01,a02],
					[a10,a11,a12],
					[a20,a21,a22]
				 ];
		mij = matrix[i][j]/matrix[j][j];
	'''
	return  (-float(matrix[i][j])/matrix[j][j]) if i>j else (1.0 if i==j else 0.0);

def pivotAndGetUpperTriangularMatrix(iRow,L, U, matrix):
	'''If  A  is a nonsingular matrix, 
	   then there exists a permutation matrix
	   P  so that  PA  has an LU-factorization
	   Let us interchange row i with row i+1
	   '''
	rowI0 = matrix[iRow];
	matrix[iRow] = matrix[iRow+1];
	matrix[iRow+1] = rowI0;
	getUpperTriangularMatrix(L, U, matrix);


def getUpperTriangularMatrix(L, U, matrix):
	_U = [];
	
	for i in range(len(matrix)):
		_U.append(list());
		for j in range(len(matrix[0])):
			_U[i].append(matrix[i][j]);
		
	#print "__A__";
	#printFormatedMatrix(_U);
	#print "____";
	
	for k in range(len(matrix)):
		for i in range(len(matrix)):
			for j in range(len(matrix)):
				su = float(0);
				t = float(0);
				for l in range(len(matrix)):
					t = float(getMultiplier(_U,i,l)) if ((k==l and l!=i) or ((i==j) and (j==k))) else (1.0 if(l==i) else 0.0);
					#print k,i,j,l,t;
					su = su + t*(_U[l][j]);
				U[i][j] = su;
				if(i==j and U[i][j]==0):
					print("Can't solve without Pivoting");
					pivotAndGetUpperTriangularMatrix(i,L,U,matrix);
					#k = i = j = len(matrix);
					return;
			L[i][k] = -float(getMultiplier(_U,i,k)) if(i>k) else (1.0 if i==k else 0.0);
		print "\n__U"+str(k)+"__";
		printFormatedMatrix(U);
		for m in range(len(matrix)):
			for n in range(len(matrix)):
				_U[m][n] = U[m][n];
		#_U = U;
		

def calculateG(L, G, I, matrix):
	for i in range(len(matrix)):
		for k in range(len(matrix)):
			sum = 0;
			for l in range(i):
				sum += L[i][l]*G[l][k];
			G[i][k] = (I[i][k]-sum)/L[i][i];

def calculateX(U, X, G, matrix):
	for i in range(len(matrix)-1, -1, -1):
		for k in range(len(matrix)):
			sum = float(0);
			for l in range(len(matrix)-1, i, -1):
				sum += U[i][l]*X[l][k];
			X[i][k] = (G[i][k]-sum)/U[i][i];

def det(L,U,matrix):
	product = 1;
	for i in range(len(matrix)):
		product = product*L[i][i]*U[i][i];
	return product;

def inv(matrix, L, U, G, I, X):
	getUpperTriangularMatrix(L, U, matrix);
	if(det(L,U,matrix)==0):
		print("Singular matrix...Exiting !");
		sys.exit(0);
	calculateG(L, G, I, matrix);
	calculateX(U, X, G, matrix);

def printFormatedMatrix(invertedMatrix):
	for i in invertedMatrix:
		for j in range(len(i)):
			sys.stdout.write( str(i[j] if j==(len(i)-1) else str(i[j])+", "));
		sys.stdout.write("\n");

def zeros(m,n):
	zeroMatrix = [];
	for i in range(m):
		zeroMatrix.append(list());
		for j in range(n):
			zeroMatrix[i].append(0);
	return zeroMatrix;

def eye(m,n):
	if m!=n:
		raise Exception("m=n in identity matrix");
	eyeMatrix = [];
	for i in range(m):
		eyeMatrix.append(list());
		for j in range(n):
			eyeMatrix[i].append(1 if i==j else 0);
	return eyeMatrix;



if __name__ == '__main__':
	'''matrix = [
			[8.000,1.000,6.000],
			[4.000,9.000,2.000],
			[0.000,5.000,7.000]
		];'''
	matrix = [
				[1,2,6],
				[4,8,-1],
				[-2,3,5],
			 ];	

	# Use of the functions might be costly...
	#  U = zeros(len(matrix), len(matrix));
	#  L = zeros(len(matrix), len(matrix));
	#  X = zeros(len(matrix), len(matrix));
	#  G = zeros(len(matrix), len(matrix));
	#  I = eye(len(matrix), len(matrix));

	for i in range(len(matrix)):
		U.append(list());
		L.append(list());
		X.append(list());
		G.append(list());
		I.append(list());
		for j in range(len(matrix)):
			U[i].append(0);
			L[i].append(0);
			X[i].append(0);
			G[i].append(0);
			I[i].append(1 if i==j else 0);
	
	
	# Printing can be costly....But let us do it
	print("Initial Matrix:: ");
	printFormatedMatrix(matrix);
	inv(matrix, L, U, G, I, X); 
	print("\nLower Triangular Matrix:: ");
	printFormatedMatrix(L);
	print("\nUpper Triangular Matrix:: ");
	printFormatedMatrix(U);
	print("\nG Matrix:: ");
	printFormatedMatrix(G);
	print("\nInverted Matrix:: ");
	printFormatedMatrix(X);
