#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length) {
   size_t left = 0;
   size_t right = length;

   while (left < right) {
      size_t mid = (left + right) / 2;
      int mid_value = arr[mid];

      if (mid_value < value) {
         left = mid + 1;
      } else if (mid_value > value) {
         right = mid;
      } else {
         return &arr[mid];
      }
   }
   return NULL;
}
