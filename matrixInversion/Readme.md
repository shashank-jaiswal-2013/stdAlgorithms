matrix-Inversion
=============

Implementation of matrix Inversion in

1. <b>JAVA</b>
2. <b>C++</b>
3. <b>Python</b>
4. <b>Php</b>

<br>
<h4>Mathematical Description::</h4>
LU decomposition is really just another way to say Gaussian elimination.
If you're familiar with that, putting the pieces together is easy.<br>
Here is an example.<br>
Let<br>
      A=A(0)=[8,4,0;1,9,5;6,2,7]

Proceed by Gaussian elimination. 
The first multiplier is ℓ2,1=4/8=0.5 (this is the multiplier that allows us to cancel a2,1=4 using the first row) and the second is ℓ3,1=0/8=0. We arrive at
    A(1)=[8,0,0;1,8.5,5;6,−1,7]

To cancel out a(1)3,2=5, we use the multiplier ℓ3,2=5/8.5≈0.5882 to yield
    A(2)≈[8,0,0;1,8.5,0;6,−1,7.5882]
which yields the LU decomposition

A=LU≈[1,0.5,0;0,1,0.5882;0,0,1]*[8,0,0;1,8.5,0;6,−1,7.5882]

Note that L is just made up of the multipliers we used in Gaussian elimination with 1s on the diagonal, while U is just A(2).