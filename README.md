# Kalman Filter
Instance of Kalman filtering operation: Theoretical background of this implementation is the section 7.8 of the book D. Manolakis, V. Ingle, and S. Kogon, “Statistical and Adaptive Signal Processing”, Artech House, 2005(Available in this repo)


By default script run with parameters:

sequence length = 100, 

Y[k] is a random process defined as 

Y[k] = a1 Y[k − 1] + a2 Y[k − 2] + b U[k], k ≥ 0,

where U[k] is WGN( 0, variance of U=0.01 ) and Y[−1] = Y[−2] = 0. 

X[k] = h1 Y[k − 1] + h2 Y[k − 2] + V[k], k ≥ 0,

V[k] is WGN(0, variance of V=100 ) and uncorrelated to U[k].

a1 = 1.8, a2 = −0.8; b = 1; h1 = 1, h2 = 0


You can tune the parameters depending on your application.
