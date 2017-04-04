//
//  main.m
//  线性表的链式存储
//
//  Created by yuanf on 17/4/4.
//  Copyright © 2017年 yuanf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

#define maxsize 10010
#define OK 1
#define ERROR 0
#define _OVERFLOW -1

typedef int Status;

int e;
int n;

typedef int ElemType;

/**
 线性表单链表存储结构
 */
typedef struct LNode{
    ElemType data;
    struct LNode *next;
}LNode, *LinkList;



/**
 创建大小为n的线性表

 @param L <#L description#>
 @param n <#n description#>
 */
void InitList(LinkList L, int n) {
   //建立带表头结点的单链线性表L
    LinkList p;
    int i;
    L = (LinkList)malloc(sizeof(LNode));
    L->next = NULL;              // 先建立一个带头结点的单链表
    for (i=n; i>0; --i) {
        p = (LinkList)malloc(sizeof(LNode));  // 生成新结点
        p->data = 0;
        p->next = L->next;
        L->next = p;    // 插入到表头
    }
}



/**
 获取元素

 @param L <#L description#>
 @param i 位置
 @param e 返回值

 @return <#return value description#>
 */
Status GetElemList(LinkList L,int i, ElemType *e) {
    // L为带头结点的单链表的头指针。
    // 当第i个元素存在时，其值赋给e并返回OK，否则返回ERROR
    LinkList p;
    p = L->next;
    int j = 1;           // 初始化，p指向第一个结点，j为计数器
    while (p && j<i) {   // 顺指针向后查找，直到p指向第i个元素或p为空
        p = p->next;  ++j;
    }
    if ( !p || j>i ) return ERROR;  // 第i个元素不存在
    *e = p->data;   // 取第i个元素
    return OK;
}


/**
 在位置i处插入元素

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status InsertList(LinkList L, int i, ElemType *e) {  // 算法2.9
    // 在带头结点的单链线性表L的第i个元素之前插入元素e
    LinkList p,s;
    p = L;
    int j = 0;
    while (p && j < i-1) {  // 寻找第i-1个结点
        p = p->next;
        ++j;
    }
    if (!p || j > i-1) return ERROR;      // i小于1或者大于表长
    s = (LinkList)malloc(sizeof(LNode));  // 生成新结点
    s->data = *e;  s->next = p->next;      // 插入L中
    p->next = s;
    return OK;
}



/**
 删除位于i处的元素

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status DeleteList(LinkList L, int i, ElemType *e) {  // 算法2.10
    // 在带头结点的单链线性表L中，删除第i个元素，并由e返回其值
    LinkList p,q;
    p = L;
    int j = 0;
    while (p->next && j < i-1) {  // 寻找第i个结点，并令p指向其前趋
        p = p->next;
        ++j;
    }
    if (!(p->next) || j > i-1) return ERROR;  // 删除位置不合理
    q = p->next;
    p->next = q->next;           // 删除并释放结点
    *e = q->data;
    free(q);
    return OK;
}


/**
 合并两个链表

 @param La <#La description#>
 @param Lb <#Lb description#>
 @param Lc <#Lc description#>
 */
void MergeList_L(LinkList La, LinkList Lb, LinkList Lc) {
    // 算法2.12
    // 已知单链线性表La和Lb的元素按值非递减排列。
    // 归并La和Lb得到新的单链线性表Lc，Lc的元素也按值非递减排列。
    LinkList pa, pb, pc;
    pa = La->next;    pb = Lb->next;
    Lc = pc = La;             // 用La的头结点作为Lc的头结点
    while (pa && pb) {
        if (pa->data <= pb->data) {
            pc->next = pa;   pc = pa;   pa = pa->next;
        }
        else { pc->next = pb;   pc = pb;   pb = pb->next; }
    }
    pc->next = pa ? pa : pb;  // 插入剩余段
    free(Lb);                 // 释放Lb的头结点
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
