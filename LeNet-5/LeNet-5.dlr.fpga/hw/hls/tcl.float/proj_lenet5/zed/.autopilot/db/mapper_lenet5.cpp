#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void lenet5(int*, int, int);
extern "C" void apatb_lenet5_hw(volatile void * __xlx_apatb_param_classes, volatile void * __xlx_apatb_param_image_r) {
  // Collect __xlx_classes_image_r__tmp_vec
  vector<sc_bv<32> >__xlx_classes_image_r__tmp_vec;
  for (int j = 0, e = 10; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_classes)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_classes)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_classes)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_classes)[j*4+3];
    __xlx_classes_image_r__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_classes = 10;
  int __xlx_offset_param_classes = 0;
  int __xlx_offset_byte_param_classes = 0*4;
  for (int j = 0, e = 1024; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_image_r)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_image_r)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_image_r)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_image_r)[j*4+3];
    __xlx_classes_image_r__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_image_r = 1024;
  int __xlx_offset_param_image_r = 10;
  int __xlx_offset_byte_param_image_r = 10*4;
  int* __xlx_classes_image_r__input_buffer= new int[__xlx_classes_image_r__tmp_vec.size()];
  for (int i = 0; i < __xlx_classes_image_r__tmp_vec.size(); ++i) {
    __xlx_classes_image_r__input_buffer[i] = __xlx_classes_image_r__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  lenet5(__xlx_classes_image_r__input_buffer, __xlx_offset_byte_param_classes, __xlx_offset_byte_param_image_r);
// print __xlx_apatb_param_classes
  sc_bv<32>*__xlx_classes_output_buffer = new sc_bv<32>[__xlx_size_param_classes];
  for (int i = 0; i < __xlx_size_param_classes; ++i) {
    __xlx_classes_output_buffer[i] = __xlx_classes_image_r__input_buffer[i+__xlx_offset_param_classes];
  }
  for (int i = 0; i < __xlx_size_param_classes; ++i) {
    ((char*)__xlx_apatb_param_classes)[i*4+0] = __xlx_classes_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_classes)[i*4+1] = __xlx_classes_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_classes)[i*4+2] = __xlx_classes_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_classes)[i*4+3] = __xlx_classes_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_image_r
  sc_bv<32>*__xlx_image_r_output_buffer = new sc_bv<32>[__xlx_size_param_image_r];
  for (int i = 0; i < __xlx_size_param_image_r; ++i) {
    __xlx_image_r_output_buffer[i] = __xlx_classes_image_r__input_buffer[i+__xlx_offset_param_image_r];
  }
  for (int i = 0; i < __xlx_size_param_image_r; ++i) {
    ((char*)__xlx_apatb_param_image_r)[i*4+0] = __xlx_image_r_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_image_r)[i*4+1] = __xlx_image_r_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_image_r)[i*4+2] = __xlx_image_r_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_image_r)[i*4+3] = __xlx_image_r_output_buffer[i].range(31, 24).to_uint();
  }
}
