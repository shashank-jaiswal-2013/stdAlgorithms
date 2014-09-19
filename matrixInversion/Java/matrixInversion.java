/*
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
*/

import java.io.*;

class matrixInversion
{
	static float getMultiplier(float matrix[][], int i, int j)
	{
		return  (float) (i>j ? -((float)(matrix[i][j])/matrix[j][j]) : (i==j ? 1.0 : 0.0));
	}

	static void printFormatedMatrix(float invertedMatrix[][])
	{
		for(int i=0;i<3;i++)
		{
			for(int j=0;j<3;j++)
			{
				System.out.print( j==2 ? Float.toString(invertedMatrix[i][j]) : Float.toString(invertedMatrix[i][j])+", ");
			}
			System.out.println("");
		}
	}

	static void calculateG(float L[][], float G[][], float I[][])
	{
		for(int i=0;i<3;i++)
		{
			for(int k=0;k<3;k++)
			{
				float sum = 0;
				for(int l=0;l<i;l++)
				{
					sum += L[i][l]*G[l][k];
				}
				G[i][k] = (I[i][k]-sum)/L[i][i];
			}
		}
		System.out.println("\nG Matrix:: ");
		printFormatedMatrix(G);
	}

	static void calculateX(float U[][], float X[][], float G[][])
	{
		for(int i=3-1;i>=0;i--)
		{
			for(int k=0;k<3;k++)
			{
				float sum = 0;
				for(int l=3-1;l>i;l--)
				{
					sum += U[i][l]*X[l][k];
				}
				X[i][k] = (G[i][k]-sum)/U[i][i];
			}
		}
		System.out.println("\nX Matrix:: ");
		printFormatedMatrix(X);
	}

	
	static boolean calculateTriangularMatrices(float matrix[][], float L[][], float U[][])
	{
		float _U[][] = new float[3][3];
		for(int i=0;i<3;i++)
		{
			for(int j=0;j<3;j++)
			{
				_U[i][j] = matrix[i][j];
			}
		}
		
		/*System.out.println( "__A__");
		printFormatedMatrix(_U);
		System.out.println( "____");*/
		
		for(int k=0;k<3;k++)
		{
			for(int i=0;i<3;i++)
			{
				for(int j=0;j<3;j++)
				{
					float su = 0;
					float t=0;
					for(int l=0;l<3;l++)
					{
						t =  (float) (((k==l && l!=i) || ((i==j) && (j==k))) ? (float) (getMultiplier(_U,i,l)) : (l==i ? 1.0:0.0));
						//System.out.println( k + i + j + l + t );
						su += t*(_U[l][j]);
					}
					U[i][j] = su;
					if(i==j && U[i][j]==0)
					{
						System.out.println( "Can't solve without Pivoting");
						pivotAndGetUpperTriangularMatrix(i,L,U,matrix);
						return false;
					}
				}
				L[i][k] = (float) ((i>k) ? -(float)(getMultiplier(_U,i,k)) : (i==k ? 1.0: 0.0));
			}
			for(int m=0;m<3;m++)
			{
				for(int n=0;n<3;n++)
				{
					_U[m][n] = U[m][n];
				}
			}
		}	
		System.out.println("\nLower Triangular Matrix:: ");
		printFormatedMatrix(L);
		System.out.println("\nUpper Triangular Matrix:: ");
		printFormatedMatrix(U);
		return false;
	}

	static void pivotAndGetUpperTriangularMatrix(int iRow, float L[][], float U[][], float matrix[][])
	{
		/**If  A  is a nonsingular matrix, 
		   then there exists a permutation matrix
		   P  so that  PA  has an LU-factorization
		   Let us interchange row i with row i+1
		*/
		for(int i=0;i<3;i++)
		{
			float rowI0 = matrix[iRow][i];
			matrix[iRow][i] = matrix[iRow+1][i];
			matrix[iRow+1][i] = rowI0;
		}
		System.out.println("Hello");
		calculateTriangularMatrices(matrix, L, U);
	}


	static void inv(float matrix[][])
	{
		float L[][] = {
					{0,0,0},
					{0,0,0},
					{0,0,0}
				};
		
		float U[][] = {
				{1,2,6},
				{4,8,-1},
				{-2,3,5}
			};
		
		float G[][] = {
					{0,0,0},
					{0,0,0},
					{0,0,0}
				};

		float I[][] = {
					{1,0,0},
					{0,1,0},
					{0,0,1}
				};

		float X[][] = {
					{0,0,0},
					{0,0,0},
					{0,0,0}
				};

		/*  
			L -> Lower Triangular Matrix
			U -> Upper Triangular Matrix
			matrix -> Original Matrix

			LUx = b;
			Ux = G;
			LG = b;
		*/
		calculateTriangularMatrices(matrix, L, U);

		/*
			G -> G matrix
		*/
		calculateG(L,G,I);
		
		
		/*
			X -> Inverted matrix
		*/
		calculateX(U,X,G);
		
		
	}


	public static void main(String args[])
	{
		float matrix[][] = {
				{1,2,6},
				{4,8,-1},
				{-2,3,5}
			};

		System.out.println( "Initial Matrix:: ");
		printFormatedMatrix(matrix);
		inv(matrix); 
	}

}