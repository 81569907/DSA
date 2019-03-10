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


int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    int a[num] = {100, 50, 200, 189};
    select_sort(a);
    for (int i = 0; i < num; i ++) {
        printf("%d ", a[i]);
    }
    return 0;
}
