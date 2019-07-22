//
//  LinkedList.c
//  单链表
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019年 xx. All rights reserved.
//

#include "LinkedList.h"
#include <stdlib.h>
Node * createList(void){
    int len, value;
    Node *  pHead = (Node *)(malloc(sizeof(Node)));
    Node * tail = pHead;
    tail->pNext = NULL;
    printf("请输入你要的节点个数：");
    scanf("%d", &len);
    
    for (int  i =0; i< len; i++) {
        printf("请输入第%d个节点的值：", i);
        scanf("%d", &value);
        
        Node * new = (Node *)(malloc(sizeof(Node)));
        new->data = value;
        tail->pNext = new;
        tail = new;
        tail->pNext = NULL;
    }
    return pHead;
}


void traverse(Node *header){
    
    Node * tail = header;
    while (tail->pNext != NULL) {
        printf("节点:%d\n", tail->pNext->data);
        tail = tail->pNext;
    }
    printf("\n");
}

int isEmpty(Node * header){
    if (header->pNext == NULL) {
        return 1;
    }else{
        return 0;
    }
}

int length(Node *header){
    int len = 0;
    Node * tail = header;
    while (tail->pNext != NULL) {
        len ++;
        tail = tail->pNext;
    }
    return len;
}

int insert(Node * header, int pos, int val){
    if (pos < 0 || pos > length(header)) {
        return 0;
    }else{
        Node * tail = header;
        for (int i = 1; i <= pos; i ++) {
            tail = tail->pNext;
        }
        
        Node * new = (Node *)(malloc(sizeof(Node)));
        new->data = val;
        new->pNext = tail->pNext;
        tail->pNext = new;
        return 1;
    }
    return 0;
}

int delete(Node * header, int pos){
    if (pos < 1 || pos > length(header)) {
        return 0;
    }else{
        Node * tail = header;
        for (int i = 1; i <= pos - 1; i ++) {
            tail = tail->pNext;
        }
        if (tail->pNext->pNext == NULL) {
            free(tail->pNext);
            tail->pNext = NULL;
        }else{
            Node * tmp = tail->pNext;
            tail->pNext = tail->pNext->pNext;
            free(tmp);
        }
        return 1;
    }
    return 0;
}

Node * locate(Node * header, int val){
    Node * tail = header->pNext;
    while (tail && tail->data != val) {
        tail = tail->pNext;
    }
    return tail;
}

Node * get(Node * header, int pos){
    Node * tail = header->pNext;
    for (int i = 1; i < pos ; i++) {
        tail = tail->pNext;
    }
    return tail;
}

Node * reverse(Node * header) {
    Node * tail = header;
    Node *pre = NULL;//上一个节点
    Node * cur = tail->pNext;//当前节点
    Node * tmp = NULL;//临时节点，存储下一个节点
    
    while (cur != NULL) {// 当前结点为null，说明位于尾结点
        tmp = cur->pNext;
        cur->pNext = pre;
        pre = cur;
        cur = tmp;
    }
    header->pNext = pre;
    return header;
}
