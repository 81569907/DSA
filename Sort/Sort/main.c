//
//  main.c
//  Sort
//
//  Created by yuanf on 2019/3/10.
//  Copyright © 2019 yuanf. All rights reserved.
//

#include <stdio.h>
#define num 4


/**
 选择排序
 1.找出数组中最小的元素与数组第一个元素交换位置
 2.找出数组中剩下元素中最小的一个，与数组第二个元素交换位置
 3.重复这样的逻辑

 @param arr <#arr description#>
 */
void select_sort(int *arr){
    for (int i = 0; i < num ; i ++) {
        int min = i;
        //查找最小元素
        for (int j = i + 1; j < num; j++) {
            printf("\n%d %d", arr[i], arr[j]);
            if (arr[min] > arr[j]) {
                min = j;
            }
        }
        //交换
        int value = arr[i];
        arr[i] = arr[min];
        arr[min] = value;
    }
}

/**
 插入排序
直接插入排序就是从待排序列中选出一个元素，插入到已经有序的元素之中，直到所有的元素都插入到有序序列中所有的元素就全部 有序了。
 
通常的做法就是将第一个元素看做是有序的元素（即待排序列的第一个元素看做是有序序列），然后我们将第二个元素和有序序列（即
 9 第一个元素）作比较，按正确的序列插入到序列中去。然后在将第三个元素和前面有序序列（即整个待排序列的前两个元素）作比较，将第
 10 三个插入到前两个元素中去，使得前三个元素有序。以此类推，直到所有的元素都有序。 
 
 @param arr <#arr description#>
 */
void insert_sort(int * arr){
    for (int i = 1; i < num; i++) {
        for (int j = 0; j < i; j++) {
            if (arr[j] > arr[i]) {
                int value = arr[i];
                arr[i] = arr[j];
                arr[j] = value;
            }
        }
    }
}


int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    int a[num] = {100, 50, 200, 189};
    select_sort(a);
    for (int i = 0; i < num; i ++) {
        printf("%d ", a[i]);
    }
    int b[num] = {20, 1, 7, 5};
    insert_sort(b);
    for (int i = 0; i < num; i ++) {
        printf("%d ", b[i]);
    }
    return 0;
}
