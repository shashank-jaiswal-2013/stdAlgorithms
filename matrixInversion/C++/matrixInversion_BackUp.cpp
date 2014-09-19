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

#include <iostream>
#include <sstream>

using namespace std;

template <typename Type>
string num2str(Type num)
{
	std::stringstream out;
	out << num;
	return out.str();
}

float getMultiplier(float matrix[][3], int i, int j)
{
	return  i>j ? -(float(matrix[i][j])/matrix[j][j]) : (i==j ? 1.0 : 0.0);
}

void printFormatedMatrix(float invertedMatrix[][3])
{
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<3;j++)
		{
			cout << ( j==(2) ? num2str(invertedMatrix[i][j]) : num2str<float>(invertedMatrix[i][j])+", ");
		}
		cout << endl;
	}
}


float getUpperTriangularMatrix(float matrix[][3], float U[][3])
{
	float _U[3][3] = {
			{8,1,6},
			{4,9,2},
			{0,5,7}
		};

	float L[3][3] = {
				{0,0,0},
				{0,0,0},
				{0,0,0}
			};
	
	
	cout << "__A__" << endl;
	printFormatedMatrix(_U);
	cout << "____" << endl;
	
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
					t =  ((k==l && l!=i) || ((i==j) && (j==k))) ? float(getMultiplier(_U,i,l)) : (l==i ? 1.0:0.0);
					cout << k << i << j << l << t << endl;
					su += t*(_U[l][j]);
				}
				U[i][j] = su;
			}
			L[i][k] = (i>k) ? float(getMultiplier(_U,i,k)) : (i==k ? 1.0: 0.0);
		}
		cout << "\n__U" << k << "__" << endl;
		printFormatedMatrix(U);
		for(int m=0;m<3;m++)
		{
			for(int n=0;n<3;n++)
			{
				_U[m][n] = U[m][n];
			}
		}
	}	
	/*print("\nLower Triangular Matrix:: ");
	printFormatedMatrix(L);
	print("\nUpper Triangular Matrix:: ");
	printFormatedMatrix(U);*/
	//return U;
}

void inv(float matrix[][3])
{
	float U[3][3] = {
			{8,1,6},
			{4,9,2},
			{0,5,7}
		};
	
	getUpperTriangularMatrix(matrix, U);
}


int main()
{
	float matrix[3][3] = {
			{8,1,6},
			{4,9,2},
			{0,5,7}
		};

	cout << "Initial Matrix:: " << endl;
	printFormatedMatrix(matrix);
	inv(matrix); 
	return 0;
}
