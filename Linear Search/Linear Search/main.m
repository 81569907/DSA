//
//  main.m
//  Linear Search
//
//  Created by yuan on 17/4/11.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

//Linear search is a very simple search algorithm. In this type of search, a sequential search is made over all items one by one. Every item is checked and if a match is found then that particular item is returned, otherwise the search continues till the end of the data collection.
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

// this method makes a linear search. 
int find(int data) {
    
    int comparisons = 0;
    int index = -1;
    int i;
    
    // navigate through all items 
    for(i = 0;i<YMAX;i++) {
        
        // count the comparisons made 
        comparisons++;
        
        // if data found, break the loop
        if(data == intArray[i]) {
            index = i;
            break;
        }
    }   
    
    printf("Total comparisons made: %d", comparisons);
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
            printf("Element not found.");
    }
    return 0;
}
