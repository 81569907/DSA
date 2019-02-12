//
//  main.c
//  double_link
//
//  Created by yuan on 2019/2/1.
//  Copyright © 2019年 sunEEE. All rights reserved.
//

#include <stdio.h>
#include "double_link.h"

/// 演示向双向链表操作“int数据”。
void int_test() {
    int iarr[4] = {10, 20, 30, 40};
    printf("\n----%s----\n", __func__);
    create_dlink();        // 创建双向链表
    dlink_insert(0, &iarr[0]);    // 向双向链表的表头插入数据
    dlink_insert(0, &iarr[1]);    // 向双向链表的表头插入数据
    dlink_insert(0, &iarr[2]);    // 向双向链表的表头插入数据
    
    printf("dlink_is_empty()=%d\n", dlink_is_empty());    // 双向链表是否为空
    printf("dlink_size()=%d\n", dlink_size());            // 双向链表的大小
    
    // 打印双向链表中的全部数据
    int *p;
    int size = dlink_size();
    for (int i = 0; i < size; i++) {
        p = (int *)dlink_get(i);
        printf("dlink_get(%d)=%d\n", i, *p);
    }
    
    destroy_dlink();
}

typedef struct tag_stu{
    int id;
    char name[20];
}stu;


static stu arr_stu[] = {
    {10, "sky"},
    {20, "jody"},
    {30, "vic"},
    {40, "dan"},
    {50, "wang"},
};

void object_test(){
    
    printf("\n----%s----\n", __func__);
    create_dlink();    // 创建双向链表
    dlink_insert(0, &arr_stu[0]);    // 向双向链表的表头插入数据
    dlink_insert(0, &arr_stu[1]);    // 向双向链表的表头插入数据
    dlink_insert(0, &arr_stu[2]);    // 向双向链表的表头插入数据
    
    printf("dlink_is_empty()=%d\n", dlink_is_empty());    // 双向链表是否为空
    printf("dlink_size()=%d\n", dlink_size());            // 双向链表的大小
    
    // 打印双向链表中的全部数据
    int i;
    int sz = dlink_size();
    stu *p;
    for (int i = 0; i < sz; i++) {
        p = (stu*)dlink_get(i);
        printf("dlink_get(%d)=[%d, %s]\n", i, p->id, p->name);
    }
    destroy_dlink();
}


int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int_test();        // 演示向双向链表操作“int数据”。
    object_test();// 演示向双向链表操作“对象”。
    return 0;
}
