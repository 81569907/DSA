//
//  main.m
//  Interpolation Search
//
//  Created by yuan on 17/4/13.
//  Copyright © 2017年 yuan. All rights reserved.
//

/*
A → Array list
N → Size of A
X → Target Value

Procedure Interpolation_Search()

Set Lo  →  0
Set Mid → -1
Set Hi  →  N-1

While X does not match

if Lo equals to Hi OR A[Lo] equals to A[Hi]
EXIT: Failure, Target not found
end if

Set Mid = Lo + ((Hi - Lo) / (A[Hi] - A[Lo])) * (X - A[Lo]) 

if A[Mid] = X
EXIT: Success, Target found at Mid
else 
if A[Mid] < X
Set Lo to Mid+1
else if A[Mid] > X
Set Hi to Mid-1
end if
end if

End While

End Procedure
*/

#import <Foundation/Foundation.h>
#import<stdio.h>

#define YMAX 10

// array of items on which linear search will be conducted. 
int list[YMAX] = { 10, 14, 19, 26, 27, 31, 33, 35, 42, 44 };

int find(int data ){
    
    int lo = 0;
    int hi  = YMAX - 1;
    int mid = -1;
    int comparisons = 1;
    int index = -1;
    
    while (lo <= hi) {
        
        printf("\nComparison %d  \n" , comparisons ) ;
        printf("lo : %d, list[%d] = %d\n", lo, lo, list[lo]);
        printf("hi : %d, list[%d] = %d\n", hi, hi, list[hi]);
        
        comparisons++;
        
        // probe the mid point 
        mid = lo + (((double)(hi - lo) / (list[hi] - list[lo])) * (data - list[lo]));
        printf("mid = %d\n",mid);
        
        // data found 
        if (list[mid] == data) {
            index = mid;
            break;
        }else{
            if (list[mid] < data) {
                // if data is larger, data is in upper half 
                lo = mid + 1;
            }else{
                hi = mid - 1;
            }
        }
    }
    printf("\nTotal comparisons made: %d", --comparisons);
    return index;
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //find location of 33
        int location = find(33);
        
        // if element was found 
        if(location != -1)
            printf("\nElement found at location: %d\n" ,(location+1));
        else
            printf("Element not found.");
        
    }
    return 0;
}
