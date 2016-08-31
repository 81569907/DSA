//
//  main.m
//  顺序表
//
//  Created by yuan on 16/8/30.
//  Copyright © 2016年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LIST_INIT_SIZE 1

#define LISTINCREMENT 1

typedef int ElemType;
typedef int Status;


/**
 *  采用结构体构造一个顺序表，定义顺序表的地址、长度、存储容量的表示
 */
typedef struct {
    
    ElemType * elem;//定义了顺序表中元素类型的数组指针，指向顺序表存储空间的基址
    int length;//顺序表的长度(也即元素个数)
    int listsize;//当前分配给顺序表的存储容量
}Sqlist;

/**
 *  构造一个空表
 *
 *  @param L 表
 *
 *  @return YES 成功 NO失败
 */
Status InitList(Sqlist *L)
{
    L->elem = (ElemType *)malloc(LIST_INIT_SIZE*sizeof(ElemType));
    if (L->elem == NULL)
    {
        return NO;
    }
    L->length = 0;
    L->listsize = LIST_INIT_SIZE;
    return YES;
}

/**
 *  销毁一个表
 *
 *  @param L <#L description#>
 *
 *  @return <#return value description#>
 */
Status DestroyList(Sqlist *L)
{
    if (!L->elem)
    {
        return NO;
    }
    free(L->elem);
    L->elem = NULL;
    return YES;
}

/**
 *  顺序表是否为空
 *
 *  @param L <#L description#>
 *
 *  @return YES 空  NO 非空
 */
Status ListEmpty(Sqlist * L)
{
    if (L->elem == NULL)
    {
        return YES;
    }
    return NO;
}


/**
 *  顺序表长度
 *
 *  @param L <#L description#>
 *
 *  @return <#return value description#>
 */
int ListLength(Sqlist * L)
{
    if (!L->elem )
    {
        return 0;
    }
    else
    {
        return L->length;
    }
}

/**
 *  返回指定位置的元素
 *
 *  @param L <#L description#>
 *  @param i <#i description#>
 *  @param e <#e description#>
 *
 *  @return <#return value description#>
 */
ElemType GetElem(Sqlist *L, int i, ElemType * e)
{
    if (!L->elem || i > L->length || i < 1)
    {
        return 0;
    }
    e = L->elem + i - 1;
    return *e;
}


/**
 *  清空表将表中元素去掉，设置长度为0
 *
 *  @param L <#L description#>
 *
 *  @return <#return value description#>
 */
Status ClearList(Sqlist * L)
{
    if (!L->elem)
    {
        return NO;
    }
    free(L->elem);
    L->length = 0;
    return 0;
}

/**
 *  在指定位置插入元素
 *
 *  @param L <#L description#>
 *  @param i <#i description#>
 *  @param e <#e description#>
 *
 *  @return <#return value description#>
 */
Status ListInsert(Sqlist * L, int i, ElemType e)
{
    ElemType * p, *q, *newbase;
    if (i < 0 || i > L->length)
    {
        return NO;
    }
    
    //元素个数必须表的长度小
    if (L->length >= L->listsize)
    {
        newbase = (ElemType *)realloc(L->elem, L->listsize + LISTINCREMENT);
        if (!newbase)
        {
            return NO;
        }
        L->elem = newbase;
        L->listsize += LISTINCREMENT;
    }
    
    q = &(L->elem[i]);//获取i位置的元素
    
    for (p = &(L->elem[L->length - 1]); p >= q; --p)//表里面的所有元素全部后移一位
    {
        *(p+1) = *p;
    }
    *q = e;
    L->length ++;
    return YES;
}

/**
 *  根据位置获取元素值
 *
 *  @param L     <#L description#>
 *  @param index <#index description#>
 *
 *  @return <#return value description#>
 */
ElemType * ListGetElemByIndex(Sqlist *L, int index)
{
    ElemType *e;
    
    if (index < 0 || index > L->length)
    {
        printf("输入的位置非法\n");
        return NULL;
    }
    e = L->elem +index;
    return e;
}

/**
 *  删除指定位置的元素
 *
 *  @param L <#L description#>
 *  @param i <#i description#>
 *  @param e <#e description#>
 *
 *  @return return value description
 */
Status ListDelete(Sqlist *L, int i, ElemType *e){
    ElemType *p,*q;
    if(i <0 || i > L->length)return NO;
    p = &(L->elem[i]);
    *e = *p;
    q = L->elem + L->length -1;
    for(++p;p <= q;++p) *(p-1) = *p;
    --L->length;
    return YES;
}

/**
 *  显示列表中的元素
 *
 *  @param L <#L description#>
 */
void ListShow(Sqlist * L)
{
    if (!L->elem)
    {
        NSLog(@"%s %@", __func__, @"表为空");
    }
    printf("表元素:");

    for (int i = 0; i < L->length; i ++)
    {
        printf("%d ",*(L->elem+i));

    }
}

/**
 *  根据元素查找位置
 *
 *  @param L <#L description#>
 *  @param e <#e description#>
 */
void ListSearchByElem(Sqlist * L, ElemType e)
{
    int i = 0;
    if (!L->elem)
    {
        printf("顺序表为空\n");
    }

    while (i < L->length && *(L->elem+i) != e)
    {
        i++;
    }
    if (*L->elem == e)
    {
        printf("元素序号:%d",i);

    }
    else
    {
        printf("\n not found!");
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int i,x;
        char cmd;//cmd is what you choose
        Sqlist L;
//        ElemType *e;
        if(!InitList(&L)){
            printf("E001\n");
        }

        
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
                    ElemType * tmp =  ListGetElemByIndex(&L, i);
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
                    Status flag =  ListInsert(&L, i, x);
                    if (!flag)
                    {
                        NSLog(@"插入失败");
                    }
                    else
                    {
                        ListShow(&L);
                    }
                    break;
                case 'd':
                case 'D':printf("请输入要删除的元素id:");
                    fflush(stdin);
                    scanf("%d", &i);
                    ElemType e;
                    ListDelete(&L, i, &e);
                    break;
                case 'l':
                    printf("请输入要查找的元素值:");
                    fflush(stdin);
                    scanf("%d", &i);
                    ListSearchByElem(&L, i);
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
