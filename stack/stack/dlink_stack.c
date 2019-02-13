//
//  dlink_stack.c
//  stack
//
//  Created by yuan on 2019/2/13.
//  Copyright © 2019年 yuan. All rights reserved.
//

#include "dlink_stack.h"
#include "double_link.h"


//栈（stack），是一种线性存储结构，它有以下几个特点：
//(01) 栈中数据是按照"后进先出（LIFO, Last In First Out）"方式进出栈的。
//(02) 向栈中添加/删除数据时，只能从栈顶进行操作。
//
//栈通常包括的三种操作：push、peek、pop。
//push -- 向栈中添加元素。
//peek -- 返回栈顶元素。
//pop  -- 返回并删除栈顶元素的操作。


// 创建栈
int create_dlink_stack() {
    return create_dlink();
}

// 销毁栈
int destroy_dlink_stack() {
    return destroy_dlink();
}

//将val添加到栈中
int push(void *p) {
    return dlink_insert_first(p);
}

// 返回“栈顶元素值”
void * peek() {
    return dlink_get_first();
}

// 返回“栈顶元素值”，并删除“栈顶元素”

void * pop (){
    void * p = peek();
    dlink_delete_first();
    return p;
}

// 返回“栈”的大小
int size(){
    return dlink_size();
}

//返回“栈”是否为空
int is_empty() {
    return dlink_is_empty();
}
