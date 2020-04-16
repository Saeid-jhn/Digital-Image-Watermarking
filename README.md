# Digital-Image-Watermarking
Digital Image Watermarking method based on hybrid DWT-HD-SVD Technique: Attacks, PSNR, SSIM, NC

# About
Watermarking is identified as a major means to achieve copyright protection. It is technology of information hiding which is used to hide dedicated data in digital media like images, musics, videos etc. The main goal of this project is to provide basic watermark toolbox for researches to evaluate watermarking methods under varoius attacks.

The simulation is based on the IEEE Access journal, [An Optimized Image Watermarking Method Based on HD and SVD in DWT Domain](https://ieeexplore.ieee.org/document/8709684). The following methods are used:
* Discrete Wavelet Transformation (DWT)
* Hessenberg Decomposition (HD)
* Singular Value decomposition (SVD)

First, in the embedding process, the host image is modified to embed watermark image. Different attacks are applied to evaluate the robustness and invisibility of the proposed method by considering *peak signal-to-noise ratio (PSNR)*, and **structural similarity (SSIM)**. Finally, the watermark image is extracted, and the robustness is evaluated considering **normalized correlation (NC)**.
