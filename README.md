# Multiplex-Transformed-Tensor-Decomposition-for-Multidimensional-Image-Recovery

The codes are for the paper:  Lanlan Feng, Ce Zhu, Zhen long, Jiani Liu, Yipeng Liu, "Multiplex Transformed Tensor Decomposition for Multidimensional Image Recovery," IEEE Transactions on Image Processing, 2023. DOI: 10.1109/TIP.2023.3284673.




Abstract: Low-rank tensor completion aims to recover the missing entries of multi-way data, which has become popular and vital in many fields such as signal processing and computer vision. It varies with different tensor decomposition frameworks. Compared with matrix SVD, recently emerging transform t-SVD can better characterize the low-rank structure of order-3 data. However, it suffers from rotation sensitivity, and dimensional limitation (i.e., only effective for order-3 tensors). To alleviate these deficiencies, we develop a novel multiplex transformed tensor decomposition (MTTD) framework, which can characterize the global low-rank structure along all modes for any order-$N$ tensor. Based on MTTD, we propose a related multi-dimensional square model for low-rank tensor completion. Besides, a total variation term is also introduced to utilize the local piecewise smoothness of the tensor data. The classic alternating direction method of multipliers is used to solve the convex optimization problems. For performance testing, we choose three linear invertible transforms including FFT, DCT, and a group of unitary transform matrices for our proposed methods. 
The simulated and real-data experiments demonstrate the superior recovery accuracy and computational efficiency of our method compared with state-of-the-art ones.
