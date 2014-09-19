%
%	@author Shashank Jaiswal
%	@since 01-09-2014
%	@version 0.0.0.1
%	@description 
%				Mathematics:: Matrix inversion using LU decomposition scheme
%				Author: Shashank Jaiswal <shashank_jaiswal@live.com>
%				Copyright (c): 2014 Shashank Jaiswal, all rights reserved
%				Version: 0.0.0.1
%
%					 * This library is free software; you can redistribute it and/or
%					 * modify it under the terms of the GNU Lesser General Public
%					 * License as published by the Free Software Foundation; either
%					 * version 2.1 of the License, or (at your option) any later version.
%					 *
%					 * This library is distributed in the hope that it will be useful,
%					 * but WITHOUT ANY WARRANTY; without even the implied warranty of
%					 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%					 * Lesser General Public License for more details.
%					 *
%					 * You should have received a copy of the GNU Lesser General Public
%					 * License along with this library; if not, write to the Free Software
%					 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
%					You may contact the author at: shashank_jaiswal@live.com
%

  
	%matrix = [
    %            8,1,6;
    %            4,9,2;
    %            0,5,7;
    %         ];
    matrix = [
                1,2,6;
                4,8,-1;
                -2,3,5;
             ];
    print = 1;
    %matrix = rand(100,100);
	if(print == 1)
        disp('Initial Matrix:: ');
        matrix
    end
    tic
        inverse(matrix,print)
    toc