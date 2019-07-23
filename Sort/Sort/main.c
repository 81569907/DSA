//
//  main.c
//  Sort
//
//  Created by yuan on 2019/7/22.
//  Copyright © 2019年 xx. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


void printArr(int a[],int n){
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
}


/**
 直接插入排序的核心思想就是：将数组中的所有元素依次跟前面已经排好的元素相比较，如果选择的元素比已排序的元素小，则交换，直到全部元素都比较过。
 因此，从上面的描述中我们可以发现，直接插入排序可以用两个循环完成：
 
 第一层循环：遍历待比较的所有数组元素
 第二层循环：将本轮选择的元素(selected)与已经排好序的元素(ordered)相比较。
 如果：selected > ordered，那么将二者交换

 @param a <#a description#>
 @param n <#n description#>
 */
void insert_sort(int a[],int n){
    for (int i = 1; i < n; i ++) {
        for (int j = i; j >= 0; j --) {
            if (a[j] < a[j - 1]) {
                int tmp = a[j];
                a[j] = a[j - 1];
                a[j - 1] = tmp;
            }
        }
    }
}


/**
 希尔排序的算法思想：将待排序数组按照步长gap进行分组，然后将每组的元素利用直接插入排序的方法进行排序；每次将gap折半减小，循环上述操作；当gap=1时，利用直接插入，完成排序。
 同样的：从上面的描述中我们可以发现：希尔排序的总体实现应该由三个循环完成：
 
 第一层循环：将gap依次折半，对序列进行分组，直到gap=1
 第二、三层循环：也即直接插入排序所需要的两次循环。具体描述见上。

 @param a <#a description#>
 @param len <#len description#>
 */
void insert_shell(int a[], int len){
    int gap = len/2;
    while (gap >= 1) {
        for (int i = gap; i< len; i++) {
            for (int j = i - gap; j >= 0; j -= gap) {
                if (a[j] > a[j + gap]) {
                    int tmp = a[j];
                    a[j] = a[j+gap];
                    a[j+gap] = tmp;
                }
            }
        }
        gap = gap/2;
    }
}


/**
 简单选择排序的基本思想：比较+交换。
 
 从待排序序列中，找到关键字最小的元素；
 如果最小元素不是待排序序列的第一个元素，将其和第一个元素互换；
 从余下的 N - 1 个元素中，找出关键字最小的元素，重复(1)、(2)步，直到排序结束。
 因此我们可以发现，简单选择排序也是通过两层循环实现。
 第一层循环：依次遍历序列当中的每一个元素
 第二层循环：将遍历得到的当前元素依次与余下的元素进行比较，符合最小元素的条件，则交换。

 @param a <#a description#>
 @param len <#len description#>
 */
void select_sort(int a[], int len){
    for (int i = 0; i < len; i++) {
        int min = i;
        for (int j = i; j < len; j++) {
            if (a[j] < a[min]) {
                min = j;
            }
        }
        int tmp = a[min];
        a[min] = a[i];
        a[i] = tmp;
    }
}


/**
 冒泡排序思路比较简单：
 
 将序列当中的左右元素，依次比较，保证右边的元素始终大于左边的元素；
 （ 第一轮结束后，序列最后一个元素一定是当前序列的最大值；）
 对序列当中剩下的n-1个元素再次执行步骤1。
 对于长度为n的序列，一共需要执行n-1轮比较
 （利用while循环可以减少执行次数）

 @param a <#a description#>
 @param len <#len description#>
 */
void bubble_sort(int a[], int len){
    for (int i = 0; i < len; i ++) {
        for (int j = 0; j < len - i -1; j ++) {
            if (a[j] > a[j + 1]) {
                int tmp = a[j];
                a[j] = a[j + 1];
                a[j+ 1] = tmp;
            }
        }
    }
}



/**
 该方法的基本思想是：
 1．先从数列中取出一个数作为基准数。
 2．分区过程，将比这个数大的数全放到它的右边，小于或等于它的数全放到它的左边。
 3．再对左右区间重复第二步，直到各区间只有一个数。
 虽然快速排序称为分治法，但分治法这三个字显然无法很好的概括快速排序的全部步骤。因此我的对快速排序作了进一步的说明：挖坑填数+分治法：

 @param s <#s description#>
 @param l <#l description#>
 @param r <#r description#>
 */
void quick_sort(int s[], int l, int r)
{
    if (l < r)
    {
        //Swap(s[l], s[(l + r) / 2]); //将中间的这个数和第一个数交换 参见注1
        int i = l, j = r, x = s[l];
        while (i < j)
        {
            while(i < j && s[j] >= x) // 从右向左找第一个小于x的数
                j--;  
            if(i < j) 
                s[i++] = s[j];
            
            while(i < j && s[i] < x) // 从左向右找第一个大于等于x的数
                i++;  
            if(i < j) 
                s[j--] = s[i];
        }
        s[i] = x;
        quick_sort(s, l, i - 1); // 递归调用 
        quick_sort(s, i + 1, r);
    }
}

int min(int x, int y) {
    return x < y ? x : y;
}


/**
 归并排序
 从下到上，每一步都需要将两个已经有序的子数组合并成一个大的有序数组

 */
void merge(int arr[], int L, int mid, int R){
    int temp[R - L +1];//开辟一个新的数组，将原数组映射进去
    int i= 0;
    int p1 = L;
    int p2 = mid +1;
    
    //比较左右两部分的元素，哪个小，把那个元素填入temp中
    while (p1 <= mid && p2 <= R) {
        temp[i ++] = arr[p1]< arr[p2] ?arr[p1 ++] : arr[p2 ++];
    }
    // 上面的循环退出后，把剩余的元素依次填入到temp中
    // 以下两个while只有一个会执行
    while (p1 <= mid) {
        temp[i++] = arr[p1 ++];
    }
    
    while (p2 <= R) {
        temp[i++] = arr[p2++];
    }
    
    // 把最终的排序的结果复制给原数组
    for (i = 0; i < R - L + 1; i++) {
        arr[L +i] = temp[i];
    }
}

void sort(int arr[], int L, int R){
    
    if (L == R) {
        return;
    }
    int mid = L + (R -  L)/2;
    sort(arr, L, mid);
    sort(arr, mid + 1, R);
    merge(arr, L, mid, R);
}


void mergeSort(int arr[], int len){
    int L = 0;
    int R = len - 1;
    sort(arr, L, R);
}

/**
 求数组中元素最大数
 
 @param a a description
 @param len <#len description#>
 @return <#return value description#>
 */
int maxBit(int a[], int len){
    int max = a[0];
    for (int  i = 1; i < len; i++) {
        if (a[i] > max) {
            max = a[i];
        }
    }
    
    //数组中最大元素位数
    int bits_num = 1;
    while (max >= 10) {
        bits_num ++;
        max/=10;
    }
    return bits_num;
}


/**
取数xxx上的第bit位数字
 @param num <#num description#>
 @param bit <#bit description#>
 @return <#return value description#>
 */
int digit(int num, int bit){
    int pow = 1;
    while (--bit >  0) {
        pow *= 10;
    }
    return num/pow%10;
}


/**
 基数排序

 @param a <#a description#>
 @param len <#len description#>
 */
void radixSort(int a[], int len){
    int d = maxBit(a, len);
    int b[10][len + 1];
    for(int i=0;i<10;i++){
        for(int j=0;j<len+1;j++){
            b[i][j]=0;
        }
    }

    for (int i = 1; i <= d; i++) {
        //把数组a的第i位元素装到对应桶里
        for (int j = 0; j < len; j ++) {
            b[digit(a[j], i)][0]++;
            b[digit(a[j], i)][b[digit(a[j], i)][0]] = a[i];
        }
        
        //把所有桶倒出来
        for (int i = 0, j = 0; j < 10; j++) {
            //倒桶
            for (int k = 1; b[j][0] > 0 && k <= b[j][0]; k ++) {
                a[i ++] = b[j][k];
            }
            b[j][0] = 0;
        }
    }
}


/**
 计数排序(桶排序思想)
 根据待排序集合中最大元素和最小元素的差值范围，申请额外空间；
 遍历待排序集合，将每一个元素出现的次数记录到元素值对应的额外空间内；
 对额外空间内数据进行计算，得出每一个元素的正确位置；
 将待排序集合每一个元素移动到计算得出的正确位置上。

 @param a <#a description#>
 @param len <#len description#>
 */
void countingSort(int a[], int len){
    //找数组中的最大值和最小值，确定桶的个数
    int max = a[0];
    int min = a[0];
    
    for (int i = 0; i < len; i ++) {
        if (a[i] > max) {
            max = a[i];
        }
        if (a[i] < min) {
            min = a[i];
        }
    }
        
    //定义桶数组B并初始化
    int num = max - min + 1;
    int b[num];
    for (int i = 0; i < num; i ++) {
        b[i] = 0;
    }
    
    //把数组A的元素装到对应桶里
    for(int i = 0; i < len; i ++){
        int index = a[i] - min;
        b[index] ++;
    }
    //把所有桶倒出来
    for (int i = 0, j = 0; j < num; j++) {
        //倒桶j
        for (int k = b[j]; k > 0; k --) {
            a[i++] = j + min;
        }
    }
}





int main(int argc, const char * argv[]) {
    // insert code here...
    int a[]={6,2,3,1,19,4};
//    insert_sort(a, 5);
//    insert_shell(a, 6);
//    select_sort(a, 6);
//    quick_sort(a, 0, 5);
    radixSort(a, 6);
    printArr(a, 6);
    return 0;
}
