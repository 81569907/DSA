//
//  main.m
//  单链表
//
//  Created by yuan on 16/9/1.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int ElemType;

typedef struct CNode{
    
    ElemType data; //数据域
    struct CNode * next;//指针域
    
}CNode;

/**
 *  创建单链表
 *
 *  @return <#return value description#>
 */
CNode* ListInit()
{
    CNode * phead = (CNode *)malloc(sizeof(CNode));//头指针
    if (!phead)
    {
        printf("\n头结点动态内存分配错误\n");
        return NULL;
    }
    phead->next = NULL;
    return phead;
}

/**
 *  插入
 *
 *  @param phead  头结点
 *  @param index     位置
 *  @param value 元素值
 *
 *  @return YES 成功 NO 失败
 */
BOOL ListInsert(CNode * phead, int index, int value)
{
    return YES;
}

/**
 *  删除
 *
 *  @param phead  头结点
 *  @param index 位置
 *
 *  @return YES 成功 NO 失败
 */
BOOL ListDelete(CNode * phead, int index)
{
    return YES;

}

/**
 *  根据位置查找节点
 *
 *  @param phead  头结点
 *  @param index index description
 *
 *  @return <#return value description#>
 */
CNode* ListSearchByIndex(CNode* phead, int index)
{
    return NULL;
}


/**
 *  根据节点值去查找
 *
 *  @param phead  头结点
 *  @param value 值
 *
 *  @return <#return value description#>
 */
int ListSearchByValue(CNode * phead, int value)
{
    return 10;
}


/**
 *  显示链表元素
 *
 *  @param phead 头结点
 */
void ListDisplay(CNode * phead)
{
    
}

/**
 *  销毁链表
 *
 *  @param phead 头结点
 */
void ListDestroy(CNode * phead)
{
    
}

/**
 *  清空链表
 *
 *  @param phead 头结点
 */
void ListClear(CNode * phead)
{
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int i,x;
        char cmd;//cmd is what you choose
        
        do {
            
            printf("\n");
            printf("i,I...插入\n");
            printf("d,D...删除\n");
            printf("l...按位置查找\n");
            printf("L...按值查找\n");
            printf("A...查找所有位置\n");
            printf("q,Q...退出\n");
            do
            {
                fflush(stdin);  //清除键盘缓冲区
                scanf("%c", &cmd);
            } while ((cmd != 'd') && (cmd != 'D') && (cmd != 'i') && (cmd != 'I') && (cmd != 'q') && (cmd != 'Q') && (cmd != 'l') && (cmd != 'L') && (cmd != 'A')&&(cmd != 'a'));
            
            switch (cmd)
            {
                case 'a':
                case 'A':
                    printf("请输入要查找的元素序号:");
                    fflush(stdin);
                    scanf("%d", &i);
                    CNode* tmp =  ListSearchByIndex(NULL, i);
                    if (!tmp)
                    {
                        NSLog(@"输入不合法");
                    }
                    else
                    {
                        printf("查找元素为:%d", *tmp);
                    }
                    break;
                case 'i':
                case 'I':
                    printf("请输入要插入的元素:");
                    fflush(stdin);
                    scanf(" %d", &x);    //只能输入字符
                    printf("请输入要插入的位置:");
                    fflush(stdin);
                    scanf(" %d", &i);    //这里写数字
                    BOOL flag =  ListInsert(NULL, i, x);
                    if (!flag)
                    {
                        NSLog(@"插入失败");
                    }
                    else
                    {
                        ListDisplay(NULL);
                    }
                    break;
                case 'd':
                case 'D':printf("请输入要删除的元素id:");
                    fflush(stdin);
                    scanf("%d", &i);
                    ElemType e;
                    ListDelete(NULL, 0);
                    break;
                case 'l':
                    printf("请输入要查找的元素值:");
                    fflush(stdin);
                    scanf("%d", &i);
                    ListSearchByValue(NULL, i);
                    break;
                case 'L':
                    printf("请输入要查找的位置");
                    fflush(stdin);
                    scanf("%d",&x);
                    break;
            }
            
        } while ((cmd != 'q')&&(cmd != 'Q'));
    }
    return 0;
}

