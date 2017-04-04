//
//  main.m
//  线性表顺序存储
//
//  Created by yuan on 17/4/1.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <math.h>
#include  <time.h>

/*数据类型和常量定义*/
#define TRUE           1
#define FALSE          0
#define OK             1
#define ERROR          0
#define SQOVERFLOW      -2


typedef int  Status;
typedef int ElemType;

/*数据结构声明*/
/*线性表的动态分配顺序存储结构*/
#define LIST_INIT_SIZE 2   /* 线性存储空间的初始分配量 */
#define LISTINCREMENT  1   /* 线性存储空间的分配增量 */

typedef struct {
    ElemType *elem;        /* 存储空间基址 */
    int length;            /* 当前长度 */
    int listsize;          /* 当前分配的存储容量(以sizeof(ElemType)为单位) */
} SqList;



/**
 构造一个空的线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status  InitSqList(SqList * L){
    L->elem = (ElemType *)malloc(LIST_INIT_SIZE * sizeof(ElemType));
    if (!L->elem) {
        exit(0);
    }
    L->length = 0;//空表长度为0
    L->listsize = LIST_INIT_SIZE;//初始存储容量
    return OK;
}


/**
 在线性表中插入元素
 在顺序线性表L中第i个位置插入新的元素e, i的合法值为 0<= i <= ListLength_Sq(L)

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status SqListInsert(SqList *L, int i, ElemType e) {
    ElemType * newbase = NULL;
    ElemType * p = NULL;
    ElemType * q = NULL;
    
    if (i < 0 || i > L->length) {
        return ERROR;
    }
    if (L->length >= L->listsize) {//重新分配大小为LISTINCREMENT空间
        newbase = (ElemType *)realloc(L->elem, (L->listsize + LISTINCREMENT) * sizeof(ElemType));
        if (!newbase) {
            exit(SQOVERFLOW);
        }
        L->elem = newbase;
        L->listsize += LISTINCREMENT;
    }
    q = &(L->elem[i]);//取出第i-1个位置元素地址，临时保存
    for (p = &(L->elem[L->length - 1]); p >= q; --p) {//被插入元素全部后移一位
        *(p + 1) = *p;
    }
    *q = e;
    ++L->length;
    return OK;
}



/**
 删除线性表中的元素
 在顺序线性表L中删除第i个元素, 并用e返回其值, i的合法值为 0<= i < ListLength_Sq(L)

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status SqListDelete(SqList *L, int i, ElemType *e) {
    ElemType * p = NULL;
    ElemType * q = NULL;
    
    if (i < 0 || i > L->length) {
        return ERROR;
    }
    
    p = &(L->elem[i]);
    *e = *p;
    q = &(L->elem[L->length - 1]);//表尾元素位置
    for (++p; p <= q; ++p) {
        *(p - 1) = *p;//被删除元素之后的元素左移
    }
    
    --L->length;
    return OK;
}



/**
 遍历线性表

 @param L     <#L description#>
 @param Visit <#Visit description#>

 @return <#return value description#>
 */
Status SqListTraverse(SqList *L, Status (*Visit)(ElemType)) {
    
    ElemType *p = NULL;
    ElemType *q = NULL;
    if (L->length == 0) return ERROR;
    p = &(L->elem[0]);
    q = L->elem + L->length - 1;    //表尾元素位置
    for (; p <= q; ++p) Visit(*p);
    return OK;
}


/**
 访问线性表中的元素

 @param e <#e description#>

 @return <#return value description#>
 */
Status Visit(ElemType e)
{
    printf("%d ", e);
    return OK;
}



/**
 获取第i个位置上的元素

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status SqListGetElem(SqList *L, int i, ElemType *e){
    //1<=i<=ListLength(L)。
    //操作结果：用e返回L中第i个数据元素的值。
    
    if(i < 0  ||  i>L->length) return ERROR;
    e = &L->elem[i];
    return OK;
}


/**
 销毁线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status DestroySqList(SqList *L){
    //操作结果：销毁线性表L。
    
    free(L);

    return OK;
}



/**
 清空线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status ClearSqList(SqList *L) {
    //操作结果：将L重置为空表。
    L->length = 0;
    return OK;
}



/**
 获取长度

 @param L <#L description#>

 @return <#return value description#>
 */
int SqListLength(SqList *L){
    //操作结果：返回L中数据元素的个数。
    
    return L->length;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        SqList L;
        InitSqList(&L);
        ElemType e;
        
        //遍历空表
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");
        
        //插入元素
        if (OK == SqListInsert(&L, 0, 10)) printf("insert succeed!\n");
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListInsert(&L, 0, 20)) printf("insert succeed!\n");
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListInsert(&L, 1, 30)) printf("insert succeed!\n");
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListInsert(&L, 2, 40)) printf("insert succeed!\n");
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListInsert(&L, 1, 50)) printf("insert succeed!\n");
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        
        //遍历非空表
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");
        
        
        //删除元素
        if (OK == SqListDelete(&L, 1, &e)) printf("delete %d succeed!\n", e);
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListDelete(&L, 3, &e)) printf("delete %d succeed!\n", e);
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");

        if (OK == SqListDelete(&L, 2, &e)) printf("delete %d succeed!\n", e);
        if (OK == SqListTraverse(&L, Visit)) printf("visit succeed!\n");


        
    }
    return 0;
}
