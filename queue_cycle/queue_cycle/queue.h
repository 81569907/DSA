//
//  queue.h
//  queue_cycle
//
//  Created by yuan on 2019/6/24.
//  Copyright © 2019年 xx. All rights reserved.
//

#ifndef queue_h
#define queue_h
#include <stdbool.h>
#include <stdio.h>


#define MAXQSIZE 6
#define OK 1
#define ERROR 0
#define OVERFLOW -1

typedef int   Item;

typedef struct queue{
    Item * base;
    int front;
    int rear;
}Queue;



/*initialize the queue*/
void InitQueue(Queue *q);

/*return the length of the queue*/
 int QueueLength(Queue q);

/*Destroy the queue*/
void DestroyQueue(Queue *q);

/*determine if the queue is empty*/
bool IsEmpty(Queue q);

/*determine if the queue is full*/
bool IsFull(Queue q);

/*return the head elem of the queue*/
Item Top(Queue q);

/*return the back elem of the queue*/
Item Back(Queue q);

/*enqueue, insert the rear*/
bool EnQueue(Queue *q, Item e);

/*dequeue, pop the front*/
bool DeQueue(Queue *q);

/*print the queue*/
void PrintQueue(Queue q);


#endif /* queue_h */
