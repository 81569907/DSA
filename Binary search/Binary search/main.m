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


/*
Procedure binary_search
A ← sorted array
n ← size of array
x ← value to be searched

Set lowerBound = 1
Set upperBound = n 

while x not found
if upperBound < lowerBound 
EXIT: x does not exists.

set midPoint = lowerBound + ( upperBound - lowerBound ) / 2

if A[midPoint] < x
set lowerBound = midPoint + 1

if A[midPoint] > x
set upperBound = midPoint - 1 

if A[midPoint] = x 
EXIT: x found at location midPoint

end while

end procedure*/


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
    
    while (lowerBound <= upperBound) {
        printf("Comparison %d\n" , (comparisons +1) );
        printf("lowerBound : %d, intArray[%d] = %d\n",lowerBound,lowerBound,
               intArray[lowerBound]);
        printf("upperBound : %d, intArray[%d] = %d\n",upperBound,upperBound,
               intArray[upperBound]);
        comparisons++;
        
        // compute the mid point
        // midPoint = (lowerBound + upperBound) / 2;
        midPoint = lowerBound + (upperBound - lowerBound)/2;
        
        // data found
        if (intArray[midPoint] == data) {
            index = midPoint;
            break;
        }else{
            //if data is larger
            if (intArray[midPoint] < data) {
                // data is in upper half
                lowerBound = midPoint + 1;
            }else{
                //data is in lower half
                upperBound = midPoint - 1;
            }
        }
    }
    printf("Total comparisons made: %d" , comparisons);
    return index;
}

void display() {
    int i;
    printf("[");
    
    // navigate through all items 
    for(i = 0;i<YMAX;i++) {
        printf("%d ",intArray[i]);
    }
    
    printf("]\n");
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        printf("Input Array: ");
        display();
        printline(50);
        
        //find location of 1
        int location = find(55);
        
        // if element was found 
        if(location != -1)
            printf("\nElement found at location: %d" ,(location+1));
        else
            printf("\nElement not found.");
    }
    return 0;
}
