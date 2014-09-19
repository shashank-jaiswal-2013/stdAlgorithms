function [ m ] = getMultiplier( matrix,i,j )
%
%		matrix = [
%					[a00,a01,a02],
%					[a10,a11,a12],
%					[a20,a21,a22]
%				 ];
%		mij = matrix[i][j]/matrix[j][j];
%
   if i>j
       m = -((matrix(i,j))/matrix(j,j));
   else
       if i==j
           m = 1;
       else
           m = 0.0;
       end
   end
end

