//
//  queue.c
//  queue_cycle
//
//  Created by yuan on 2019/6/24.
//  Copyright © 2019年 xx. All rights reserved.
//

#include "queue.h"
#include <stdlib.h>


void InitQueue(Queue *q){
    q->base = (Item *)malloc(sizeof(Item) * MAXQSIZE);
    if (q->base == NULL) {
        exit(OVERFLOW);
    }
    
    q->front = 0;
    q->rear = 0;
}

void DestroyQueue(Queue *q){
    q->base = NULL;
    q->front = 0;
    q->rear = 0;
    free(q->base);
}

int QueueLength(Queue q){
    return (q.rear - q.front + MAXQSIZE)%MAXQSIZE;
}

bool IsEmpty(Queue q){
    return q.rear == q.front;
}

bool IsFull(Queue q){
    return (q.rear +1)%MAXQSIZE == q.front;
}

Item Top(Queue q){
    return q.base[q.front];
}

Item Back(Queue q){
    return q.base[(q.rear - 1 +MAXQSIZE) %MAXQSIZE];
}

bool EnQueue(Queue *q, Item e){
    if (IsFull(*q)) {
        return ERROR;
    }
    q->base[q->rear] = e;
    q->rear = (q->rear +1)%MAXQSIZE;
    
    return OK;
}


bool DeQueue(Queue *q){
    if (IsFull(*q)) {
        return ERROR;
    }
    q->front = (q->front + 1) %MAXQSIZE;
    return OK;
}

void PrintQueue(Queue q){
    int i, j;
    for (i = 0, j = q.front; i < QueueLength(q); i++, j = (j +1)%MAXQSIZE) {
        printf("%d\n",q.base[j]);
    }
}
