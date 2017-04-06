//
//  main.m
//  Doubly Linked List
//
//  Created by yuan on 17/4/6.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <stdio.h>
#import <string.h>
#import <stdlib.h>
#import <stdbool.h>

struct node {
    int data;
    int key;
    
    struct node *next;
    struct node *prev;
};


//this link always point to first Link
struct node *head = NULL;

//this link always point to last Link 
struct node *last = NULL;

struct node *current = NULL;


/**
 is list empty

 @return <#return value description#>
 */
bool isEmpty() {
    return head == NULL;
}

int length(){
    int length = 0;
    struct node *current;
    for(current=head; current != NULL; current = current->next){
        length ++;
    }
    return length;
}


/**
 display the list in from first to last
 */
void displayForward() {
    //start from the beginning
    struct node *ptr = head;
    
    //navigate till the end of the list
    printf("\n[ ");
    
    while(ptr != NULL) {        
        printf("(%d,%d) ",ptr->key,ptr->data);
        ptr = ptr->next;
    }
    printf(" ]");
}


/**
 display the list from last to first
 */
void displayBackward() {
    //start from the last
    struct node *ptr = last;
    
    //navigate till the start of the list
     printf("\n[ ");
    
    while(ptr != NULL) {    
        
        //print data
        printf("(%d,%d) ",ptr->key,ptr->data);
        
        //move to next item
        ptr = ptr ->prev;
        printf(" ");
    }
       printf(" ]");
}


/**
 insert link at the first location

 @param key  <#key description#>
 @param data <#data description#>
 */
void insertFirst(int key, int data) {
    //create a link
    struct node *link = (struct node*) malloc(sizeof(struct node));
    link->key = key;
    link->data = data;
    
    if (isEmpty()) {
        //make it the last link
        last = link;
    }else{
        //update first prev link
        head->prev = link;
    }
    
    //point it to old first link
    link->next = head;
    
    //point first to new first link
    head = link;
}

void insertLast(int key, int data) {
    //create a link
    struct node *link = (struct node*) malloc(sizeof(struct node));
    link->key = key;
    link->data = data;
    
    if(isEmpty()) {
        //make it the last link
        last = link;
    }else{
        //make link a new last link
        last->next = link; 
        
        //mark old last node as prev of new link
        link->prev = last;
    }
    
    //point last to new last node
    last = link;
    
}


/**
 delete first item

 @return <#return value description#>
 */
struct node* deleteFirst(){
    //save reference to first link
    struct node *tempLink = head;
     //if only one link
    if (head ->next == NULL) {
        last = NULL;
    }else{
        head->next->prev = NULL;
    }
    
    head = head->next;
    //return the deleted link
    return tempLink;
}


/**
 delete link at the last location

 @return <#return value description#>
 */
struct node* deleteLast() {
    //save reference to last link
    struct node *tempLink = last;
    
    //if only one link
    if(head->next == NULL) {
        head = NULL;
    } else {
        last->prev->next = NULL;
    }
    
    last = last->prev;
    //return the deleted link
    return tempLink;
}


/**
 delete a link with given key

 @param key <#key description#>

 @return <#return value description#>
 */
struct node* delete(int key) {
    //start from the first link
    struct node* current = head;
    struct node* previous = NULL;
    
    //if list is empty
    if(head == NULL) {
        return NULL;
    }
    
    //navigate through list
    while (current->key != key) {
        //if it is last node
        if (current->next == NULL) {
            return NULL;
        }else{
            //store reference to current link
            previous = current;
            //move to next link
            current = current->next; 
        }
    }
    //found a match, update the link
    if (current == head) {
        //change first to point to next link
        head=head->next;
    }else{
        current->prev->next = current->next;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
