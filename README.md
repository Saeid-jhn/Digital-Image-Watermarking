# Digital-Image-Watermarking
Digital Image Watermarking method based on hybrid DWT-HD-SVD Technique: Attacks, PSNR, SSIM, NC

[![View Digital-Image-Watermarking on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/75084-digital-image-watermarking)
## About ##
Watermarking is identified as a major means to achieve copyright protection. It is technology of information hiding which is used to hide dedicated data in digital media like images, musics, videos etc. The main goal of this project is to provide basic watermark toolbox for researchers to evaluate watermarking methods under various attacks.

The simulation is based on the IEEE Access journal, [An Optimized Image Watermarking Method Based on HD and SVD in DWT Domain](https://ieeexplore.ieee.org/document/8709684). The following methods are used:
* Discrete Wavelet Transformation (DWT)
* Hessenberg Decomposition (HD)
* Singular Value decomposition (SVD)

First, in the embedding process, the host image is modified to embed watermark image. Different attacks are applied to evaluate the robustness and invisibility of the proposed method by considering **peak signal-to-noise ratio (PSNR)**, and **structural similarity (SSIM)**. Finally, the watermark image is extracted, and the robustness is evaluated considering **normalized correlation (NC)**.
### Attacks ###
The following attacks are considred:

|                     Attack | Specification
|--------------------------: | :-------------------------------
|              Filter attack | Median filter (3 × 3)
|                            | Gaussian Low-pass filter (3 × 3)
|                            | Average filter (3 × 3)
|               Noise attack | Gaussian noise ( var = 0.001)
|                            | Salt & peppers noise (0.001)
|                            | Speckle noise (0.001)
|         Compression attack | JPEG compression (QF=50)
|                            | JPEG2000 compression (CR=12)
|Histogram equalization (HE) | HE attack
|         Motion Blur attack | Motion blur (theta = 4, Len = 7)
|          Sharpening attack | Sharpening (strength = 0.8)
|            Rotation attack | Rotation (2 degree)
## Getting started
* In order to make the copy of the repo, please **fork** it; otherwise simply **Clone** or **Download** it to your local device.
* Run [**main.m**](https://github.com/Saeid-jhn/Digital-Image-Watermarking/blob/master/Source/main.m) file in MATLAB. It is recommended to run it section by section; otherwise you would need to wait whole code to run.
* The initial sections merely, run code to illustrate the proposed watermarking method.
* The mid sections, plots NC, PSNR, SSIM values for each alpha (Fig. 5, 6 and 7 [paper](https://ieeexplore.ieee.org/document/8709684)).
* Last sections, evaluates the invisibility and robustness of the watermarked image and extracted watermark logo, for different watermark image size under various attacks (fig. 8, [9](https://github.com/Saeid-jhn/Digital-Image-Watermarking/blob/master/Figures/Fig09.png), and [10](https://github.com/Saeid-jhn/Digital-Image-Watermarking/blob/master/Figures/Fig10.png) [paper](https://ieeexplore.ieee.org/document/8709684)).
* Finally, the NC value of different attack parameters are evaluated for each attack (fig. [11](https://github.com/Saeid-jhn/Digital-Image-Watermarking/blob/master/Figures/Fig11.png) [paper](https://ieeexplore.ieee.org/document/8709684)).

## Support ##
If you find this repository helpful, please star and fork it to support me.
## Contribution ##
Contributions are always welcome!
1. Fork the repository.
2. Apply your edits on your fork.
3. If you are going to add a new method, please use same syntax and structure.
4. Commit the changes to your forked repository.
5. Submit a pull request adding details about your modification.

Thanks for your suggestions!
## Contact ##
For questions, please open a new issue in the [issues list](https://github.com/Saeid-jhn/Digital-Image-Watermarking/issues).
## Authors ##
* Saeid Jahandar [LinkedIn](https://www.linkedin.com/in/saeid-jahandar/)
## License ##
This project is distributed under [Apache License 2.0](https://github.com/Saeid-jhn/Digital-Image-Watermarking/blob/master/LICENSE)
