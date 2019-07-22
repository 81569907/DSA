//
//  LinkedList.h
//  单链表
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019年 xx. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h

#include <stdio.h>
//节点结构
typedef struct  ListNode{
    int data;
    struct ListNode * pNext;
} Node, *pNode;


/**
 创建链表

 @return <#return value description#>
 */
Node * createList(void);


/**
 遍历链表

 @param header <#header description#>
 */
void traverse(Node *header);



/**
 判断链表为空

 @param header <#header description#>
 @return 1 empty ,0 no
 */
int isEmpty(Node * header);



/**
 链表长度

 @param header <#header description#>
 @return <#return value description#>
 */
int length(Node *header);


/**
 插入节点

 @param header <#header description#>
 @param pos 插入位置
 @param val 节点值
 @return 1 成功  0 失败
 */
int insert(Node * header, int pos, int val);



/**
 删除节点

 @param header <#header description#>
 @param pos <#pos description#>
 @return <#return value description#>
 */
int delete(Node * header, int pos);


/**
 按元素值查找

 @param header <#header description#>
 @param val <#val description#>
 @return <#return value description#>
 */
Node * locate(Node * header, int val);



/**
 按序号查找

 @param header <#header description#>
 @param pos <#pos description#>
 @return <#return value description#>
 */
Node * get(Node * header, int pos);


/**
 翻转

 @param header <#header description#>
 */
Node * reverse(Node * header);
#endif /* LinkedList_h */
