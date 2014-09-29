matrix-Inversion
=============

Implementation of matrix Inversion in

1. <b>JAVA</b>
2. <b>C++</b>
3. <b>Python</b>
4. <b><s>Php</s> Matlab</b>

<br>
<h4>Mathematical Description::</h4>
<br>A : matrix to be inverted
<br>B : identity matrix
<br>X : inverted matrix
<br>L : lower triangular matrix
<br>U : upper triangular matrix

<br> AX = B  .......................(1)
<br> A = LU  .......................(2)
<br> UX = G  .......................(3)
<br> LG = B  .......................(4)

<br>
<h5>LU DECOMPOSITION</h5>
Here we attempt to obtain <b>L</b> and <b>U</b> given <b>A</b> as per the equation (2)
<br>LU decomposition is really just another way to say Gaussian elimination.
If you're familiar with that, putting the pieces together is easy.<br>
Example:
Let<br>
<b>      A=A(0)=[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8,1,6;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4,9,2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0,5,7;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];</b><br>

Proceed by Gaussian elimination.<br>
The first multiplier is ℓ2,1=4/8=0.5 (this is the multiplier that allows us to cancel a2,1=4 using the first row) and the second is ℓ3,1=0/8=0. We arrive at<br>
<b>    A(1)=[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8,1,6;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0,8.5,-1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0,5,7;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];</b><br>

To cancel out a(1)3,2=5, we use the multiplier ℓ3,2=5/8.5≈0.5882 to yield<br>
<b>    A(2)=[<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8,1,6;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0,8.5,-1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0,0,7.5882;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;];</b><br>
which yields the LU decomposition

A= LU ≈ [1,0.5,0;0,1,0.5882;0,0,1]*[8,0,0;1,8.5,0;6,−1,7.5882]
<br>Note that L is just made up of the multipliers we used in Gaussian elimination with 1s on the diagonal, while U is just A(2).


<br>
<h5>FARWARD ELIMINATION</h5>
Here we attempt to obtain <b>G</b> given <b>L</b> and <b>B</b> as per the equation (4)

<br>
<h5>BACKWARD SUBSTITUTION</h5>
Here we attempt to obtain <b>X</b> given <b>U</b> and <b>G</b> as per the equation (3)
