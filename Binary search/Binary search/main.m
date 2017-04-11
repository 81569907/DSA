//
//  main.m
//  Binary search
//
//  Created by yuan on 17/4/11.
//  Copyright © 2017年 yuan. All rights reserved.
//
//Binary search is a fast search algorithm with run-time complexity of Ο(log n). This search algorithm works on the principle of divide and conquer. For this algorithm to work properly, the data collection should be in a sorted form.
#import <Foundation/Foundation.h>
#import <stdio.h>
#define YMAX 20
// array of items on which linear search will be conducted. 
int intArray[YMAX] = {1,2,3,4,6,7,9,11,12,14,15,16,17,19,33,34,43,45,55,66};

void printline(int count) {
    int i;
    
    for(i = 0;i <count-1;i++) {
        printf("=");
    }
    
    printf("=\n");
}

int find(int data){
    int lowerBound = 0;
    int upperBound = YMAX - 1;
    int midPoint = -1;
    int comparisons = 0;
    int index  = -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
