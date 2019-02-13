//
//  dlink_queue.c
//  Queue
//
//  Created by yuan on 2019/2/13.
//  Copyright © 2019年 yuan. All rights reserved.
//

#include "dlink_queue.h"
#include "double_link.h"

//C 语言: 双向链表实现“队列”，能存储任意数据。
//队列（Queue），是一种线性存储结构。它有以下几个特点：
//(01) 队列中数据是按照"先进先出（FIFO, First-In-First-Out）"方式进出队列的。
//(02) 队列只允许在"队首"进行删除操作，而在"队尾"进行插入操作。
//队列通常包括的两种操作：入队列 和 出队列。


//创建队列
int create_dlink_queue(){
    return create_dlink();
}

//销毁队列
int destory_dlink_queue(){
    return destroy_dlink();
}

//将p添加到对列表的末尾
int add(void *p){
    return dlink_append_last(p);
}

//返回队列开头元素
void * front(){
    return dlink_get_first();
}

//// 返回“队列开头的元素”，并删除“该元素”
void * pop(){
    void *p = dlink_get_first();
    dlink_delete_first();
    return p;
}

//// 返回“队列”的大小
int size() {
    return dlink_size();
}
