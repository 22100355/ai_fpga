//------------------------------------------------------------------------------
// Copyright (c) 2020 by Future Design Systems
// All right reserved.
//
// http://www.future-ds.com
//------------------------------------------------------------------------------
// VERSION = 2020.10.04.
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#if !defined(DTYPE)
#define DTYPE float
#endif
#include "dlr.h"
#include "lenet5_params.h" // come from LeNet-5.pytorch

//------------------------------------------------------------------------------
int lenet5(       DTYPE classes[10]
          , const DTYPE image[32][32]
          #if !defined(__SYNTHESIS__)
          , const int rigor
          , const int verbose
          #endif
          )
{
    int ret;

          DTYPE     c1_out_data[6][28][28];
    const DTYPE   (*c1_in_data)[32][32]=(DTYPE (*)[32][32])image; // [1][32][32]
    const DTYPE   (*c1_kernel)[1][5][5]=(DTYPE (*)[1][5][5])conv1_weight; // [6][1][5][5]
    const DTYPE   (*c1_bias)=conv1_bias; // [6]
    const uint16_t  c1_out_size=28;
    const uint16_t  c1_in_size=32;
    const uint8_t   c1_kernel_size=5;
    const uint16_t  c1_bias_size=6;
    const uint16_t  c1_in_channel=1;
    const uint16_t  c1_out_channel=6;
    const uint8_t   c1_stride=1;
    const uint8_t   c1_padding=0;

    Convolution2d (
            (DTYPE *)c1_out_data
          , (DTYPE *)c1_in_data
          , (DTYPE *)c1_kernel
          , (DTYPE *)c1_bias
          ,          c1_out_size
          ,          c1_in_size
          ,          c1_kernel_size
          ,          c1_bias_size
          ,          c1_in_channel
          ,          c1_out_channel
          ,          c1_stride
          ,          c1_padding
          ,          rigor
          ,          verbose
    );

#if defined(DEBUG)
    printf("image:\n");
    printf("[");
    for (int h=0; h<32; h++) { // rows
        printf("[");
        for (int w=0; w<32; w++) { // columns
            printf("%.4f", image[h][w]);
            if (w<27) printf(",");
        }
        if (h<27) printf("],\n");
        else      printf("]\n");
    }
    printf("]\n");
    printf("Conv2d bias:\n");
    printf("[");
    for (int oc=0; oc<6; oc++) {
        printf("%.4f", conv1_bias[oc]);
        if (oc<5) printf(",");
    }
    printf("]\n");
    printf("Conv2d c1_out_data:\n");
    for (int oc=0; oc<6; oc++) {
        printf("[");
        for (int h=0; h<28; h++) { // rows
            printf("[");
            for (int w=0; w<28; w++) { // columns
                printf("%.4f", c1_out_data[oc][h][w]);
                if (w<27) printf(",");
            }
            if (h<27) printf("],\n");
            else      printf("]\n");
        }
        if (oc<5) printf("],\n");
        else      printf("]\n");
    }
#endif

          DTYPE     p1_out_data[6][14][14];
    const DTYPE   (*p1_in_data)[28][28]=c1_out_data; // [6][28][28]
    const uint16_t  p1_out_size=14;
    const uint16_t  p1_in_size=28;
    const uint8_t   p1_kernel_size=2;
    const uint8_t   p1_channel=6;
    const uint8_t   p1_stride=2;
    const uint8_t   p1_padding=0;
    const int       p1_ceil_mode=0;

    Pooling2dMaxReLu (
            (DTYPE *)p1_out_data    // out_channel x out_size x out_size
          , (DTYPE *)p1_in_data     // in_channel x in_size x in_size
          ,          p1_out_size    // only for square matrix
          ,          p1_in_size     // only for square matrix
          ,          p1_kernel_size // only for square matrix
          ,          p1_channel
          ,          p1_stride
          ,          p1_padding
          ,          p1_ceil_mode
          ,          rigor
          ,          verbose
    );

          DTYPE     c2_out_data[16][10][10];
    const DTYPE   (*c2_in_data)[14][14]=p1_out_data; // [6][14][14]
    const DTYPE   (*c2_kernel)[6][5][5]=(DTYPE (*)[6][5][5])conv2_weight; // [16][6][5][5]
    const DTYPE   (*c2_bias)=conv2_bias; // [16]
    const uint16_t  c2_out_size=10;
    const uint16_t  c2_in_size=14;
    const uint8_t   c2_kernel_size=5;
    const uint16_t  c2_bias_size=16;
    const uint16_t  c2_in_channel=6;
    const uint16_t  c2_out_channel=16;
    const uint8_t   c2_stride=1;
    const uint8_t   c2_padding=0;

    Convolution2d (
            (DTYPE *)c2_out_data
          , (DTYPE *)c2_in_data
          , (DTYPE *)c2_kernel
          , (DTYPE *)c2_bias
          ,          c2_out_size
          ,          c2_in_size
          ,          c2_kernel_size
          ,          c2_bias_size
          ,          c2_in_channel
          ,          c2_out_channel
          ,          c2_stride
          ,          c2_padding
          ,          rigor
          ,          verbose
    );

          DTYPE     p2_out_data[16][5][5];
    const DTYPE   (*p2_in_data)[10][10]=c2_out_data; // [16][10][10]
    const uint16_t  p2_out_size=5;
    const uint16_t  p2_in_size=10;
    const uint8_t   p2_kernel_size=2;
    const uint8_t   p2_channel=16;
    const uint8_t   p2_stride=2;
    const uint8_t   p2_padding=0;
    const int       p2_ceil_mode=0;

    Pooling2dMaxReLu (
            (DTYPE *)p2_out_data
          , (DTYPE *)p2_in_data
          ,          p2_out_size
          ,          p2_in_size
          ,          p2_kernel_size
          ,          p2_channel
          ,          p2_stride
          ,          p2_padding
          ,          p2_ceil_mode
          ,          rigor
          ,          verbose
    );

          DTYPE     f1_out_data[120];
    const DTYPE   (*f1_in_data)[5][5]=p2_out_data; // [16][5][5]
    const DTYPE   (*f1_weight)[400]=(DTYPE (*)[400])fc1_weight; // [120][400]
    const DTYPE   (*f1_bias)=fc1_bias; // [120]
    const uint16_t  f1_out_size=120;
    const uint16_t  f1_in_size=16*5*5;
    const uint16_t  f1_bias_size=120;

    Linear1dReLu (
            (DTYPE *)f1_out_data
          , (DTYPE *)f1_in_data
          , (DTYPE *)f1_weight
          , (DTYPE *)f1_bias
          ,          f1_out_size
          ,          f1_in_size 
          ,          f1_bias_size
          ,          rigor
          ,          verbose
    );

          DTYPE     f2_out_data[84];
    const DTYPE   (*f2_in_data)=f1_out_data; // [120]
    const DTYPE   (*f2_weight)[120]=(DTYPE (*)[120])fc2_weight; // [84][120]
    const DTYPE   (*f2_bias)=fc2_bias; // [84]
    const uint16_t  f2_out_size=84;
    const uint16_t  f2_in_size=120;
    const uint16_t  f2_bias_size=84;

    Linear1dReLu (
            (DTYPE *)f2_out_data
          , (DTYPE *)f2_in_data
          , (DTYPE *)f2_weight
          , (DTYPE *)f2_bias
          ,          f2_out_size
          ,          f2_in_size 
          ,          f2_bias_size
          ,          rigor
          ,          verbose
    );

          DTYPE   (*f3_out_data)=classes; // [10]
    const DTYPE   (*f3_in_data)=f2_out_data; // [84]
    const DTYPE   (*f3_weight)[84]=(DTYPE (*)[84])fc3_weight; // [10][84]
    const DTYPE   (*f3_bias)=fc3_bias; // [10]
    const uint16_t  f3_out_size=10;
    const uint16_t  f3_in_size=84;
    const uint16_t  f3_bias_size=10;

    Linear1d ( // ReLu not embedded
            (DTYPE *)f3_out_data
          , (DTYPE *)f3_in_data
          , (DTYPE *)f3_weight
          , (DTYPE *)f3_bias
          ,          f3_out_size
          ,          f3_in_size 
          ,          f3_bias_size
          ,          rigor
          ,          verbose
    );

    return ret;
}
//------------------------------------------------------------------------------
// Revision History
//
// 2020.10.05: Start by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------