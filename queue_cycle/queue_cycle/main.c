//
//  main.c
//  queue_cycle
//
//  Created by yuan on 2019/6/24.
//  Copyright © 2019年 xx. All rights reserved.
//

#include <stdio.h>
#include "queue.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    Queue q;
    InitQueue(&q);
    EnQueue(&q, 1);
    EnQueue(&q, 2);
    EnQueue(&q, 3);
    EnQueue(&q, 4);
    EnQueue(&q, 5);
    if (IsFull(q))
        printf("hihi\n");
    DeQueue(&q);
    printf("%d\n%d\n", q.front, q.rear);
    EnQueue(&q, 6);
    printf("%d\n", Top(q));
    //printf("%d\n", q.base[0]);
    printf("%d\n", Back(q));
    PrintQueue(q);
    DestroyQueue(&q);   
    return 0;
}
