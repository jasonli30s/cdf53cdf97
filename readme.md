Generating Any Levels Le Gall 5/3 Cdf 5/3 and CDF 9/7 Wavelet Transform Matrix For 1D Signal With Whole Point Symmetric Padding By Matlab 

open matlab>=5.3 and run outputcdf53.m to get cdf 97 wavelet matrix
open matlab>=5.3 and run outputcdf97.m to get cdf 53 wavelet matrix

outputcdf53.m example results:
%% 2 point
legall53mtx_2_1 = [sqrt(1/2) sqrt(1/2)
-sqrt(1/2) sqrt(1/2)
];
 
 
ilegall53mtx_2_1 = [sqrt(1/2) -sqrt(1/2)
sqrt(1/2) sqrt(1/2)
];
 
%% 4 point
legall53mtx_4_2 = [5/8 3/4 3/8 1/4
-7/8 -1/4 7/8 1/4
-sqrt(1/8) sqrt(1/2) -sqrt(1/8) 0
0 0 -sqrt(1/2) sqrt(1/2)
];
 
 
ilegall53mtx_4_2 = [1/2 -1/2 -sqrt(1/2) 0
1/2 0 sqrt(25/32) -sqrt(1/32)
1/2 1/2 -sqrt(1/8) -sqrt(1/8)
1/2 1/2 -sqrt(1/8) sqrt(9/8)
];

outputcdf97.m example results:
%% 1-level 2 point CDF 9/7 matrix
 
cdf97mtx_2_1 = [0.707107 0.707107
-0.707107 0.707107
];
 
 
%% 1-level 2 point inverse CDF 9/7 matrix
 
icdf97mtx_2_1 = [0.707107 -0.707107
0.707107 0.707107
];
 
%% 2-level 4 point CDF 9/7 matrix
 
cdf97mtx_4_2 = [0.551475 0.766864 0.448525 0.233136
-0.654424 -0.300592 0.654424 0.300592
-0.418092 0.747796 -0.289015 -0.0406894
0.129078 -0.0813788 -0.836185 0.788486
];
 
 
%% 2-level 4 point inverse CDF 9/7 matrix
 
icdf97mtx_4_2 = [0.5 -0.615087 -0.754806 0.0476989
0.5 -0.0912718 0.779903 -0.0727959
0.5 0.557544 -0.329704 -0.377403
0.5 0.682544 -0.145592 0.852699
];
