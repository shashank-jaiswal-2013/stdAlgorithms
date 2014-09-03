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

def inv(matrix):
    return matrix;


def printFormatedMatrix(invertedMatrix):
    for i in invertedMatrix:
        for j in range(len(i)):
            sys.stdout.write( str(i[j] if j==(len(i)-1) else str(i[j])+", "));
        sys.stdout.write("\n");


if __name__ == '__main__':
    matrix = [
            (1,4,8),
            (2,3,5),
            (7,8,9)
        ];
    print("Initial Matrix:: ");
    printFormatedMatrix(inv(matrix));
    print("Inverted Matrix:: ");
    printFormatedMatrix(inv(matrix)); 
