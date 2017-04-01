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

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

typedef int Status;
typedef int ElemType;


#define MAXSIZE 20 /*线性表的大小*/

typedef struct{
    ElemType data[MAXSIZE];
    int length;
}SqList;


/**
 打印某个元素

 @param c <#c description#>

 @return <#return value description#>
 */
Status visit(ElemType c)
{
    printf("%d ",c);
    return OK;
}

/**
 初始化线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status InitList(SqList * L){
    L->length = 0;
    return 0;
}


/**
 判断线性表是否为空

 @param L <#L description#>

 @return <#return value description#>
 */
Status ListEmpty(SqList *L){
    if(L->length == 0){
        return TRUE;
    }else{
        return FALSE;
    }
}


/**
 清空线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status ClearList(SqList *L)
{ 
    L->length=0;
    return OK;
}


/**
 获取线性表的长度

 @param L <#L description#>

 @return <#return value description#>
 */
int ListLength(SqList* L)
{
    return L->length;
}


/**
 根据位置，获取线性表的元素

 @param L L description
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status GetElem(SqList *L,int i,ElemType *e)
{
    if(L->length==0 || i<1 || i>L->length)
        return ERROR;
    *e=L->data[i-1];
    
    return OK;
}


/**
 定位元素

 @param L <#L description#>
 @param e <#e description#>

 @return <#return value description#>
 */
int LocateElem(SqList *L,ElemType e)
{
    int i;
    if (L->length==0)
        return 0;
    for(i=0;i<L->length;i++)
    {
        if (L->data[i]==e)
            break;
    }
    if(i>=L->length)
        return 0;
    
    return i+1;
}


/**
 插入元素

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status ListInsert(SqList *L,int i,ElemType e)
{ 
    int k;
    if (L->length==MAXSIZE)  
        return ERROR;
    if (i<1 || i>L->length+1)
        return ERROR;
    
    if (i<=L->length)       
    {
        for(k=L->length-1;k>=i-1;k--)  
            L->data[k+1]=L->data[k];
    }
    L->data[i-1]=e;         
    L->length++;
    
    return OK;
}


/**
 删除元素

 @param L <#L description#>
 @param i <#i description#>
 @param e <#e description#>

 @return <#return value description#>
 */
Status ListDelete(SqList *L,int i,ElemType *e) 
{ 
    int k;
    if (L->length==0)               /* œﬂ–‘±ÌŒ™ø’ */
        return ERROR;
    if (i<1 || i>L->length)         /* …æ≥˝Œª÷√≤ª’˝»∑ */
        return ERROR;
    *e=L->data[i-1];
    if (i<L->length)                /* »Áπ˚…æ≥˝≤ª «◊Ó∫ÛŒª÷√ */
    {
        for(k=i;k<L->length;k++)/* Ω´…æ≥˝Œª÷√∫ÛºÃ‘™Àÿ«∞“∆ */
            L->data[k-1]=L->data[k];
    }
    L->length--;
    return OK;
}


/**
 遍历线性表

 @param L <#L description#>

 @return <#return value description#>
 */
Status ListTraverse(SqList* L)
{
    int i;
    for(i=0;i<L->length;i++)
        visit(L->data[i]);
    printf("\n");
    return OK;
}


/**
 合并两个线性表

 @param La <#La description#>
 @param Lb <#Lb description#>
 */
void unionL(SqList *La,SqList *Lb)
{
    int La_len,Lb_len,i;
    ElemType e;
    La_len=ListLength(La);
    Lb_len=ListLength(Lb);
    for (i=1;i<=Lb_len;i++)
    {
        GetElem(Lb,i,&e);
        if (!LocateElem(La,e))
            ListInsert(La,++La_len,e);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        SqList *L;
        ElemType e;
        Status i;
        int j,k;
        i=InitList(L);
        printf("≥ı ºªØL∫Û£∫L.length=%d\n",L->length);
        for(j=1;j<=5;j++)
            i=ListInsert(L,1,j);
        printf("‘⁄Lµƒ±ÌÕ∑“¿¥Œ≤Â»Î1°´5∫Û£∫L.data=");
        ListTraverse(L); 
        
        printf("L.length=%d \n",L->length);
        i=ListEmpty(L);
        printf("L «∑Òø’£∫i=%d(1: « 0:∑Ò)\n",i);
        
        i=ClearList(L);
        printf("«Âø’L∫Û£∫L.length=%d\n",L->length);
        i=ListEmpty(L);
        printf("L «∑Òø’£∫i=%d(1: « 0:∑Ò)\n",i);
        
        for(j=1;j<=10;j++)
            ListInsert(L,j,j);
        printf("‘⁄Lµƒ±ÌŒ≤“¿¥Œ≤Â»Î1°´10∫Û£∫L.data=");
        ListTraverse(L); 
        
        printf("L.length=%d \n",L->length);
        
        ListInsert(L,1,0);
        printf("‘⁄Lµƒ±ÌÕ∑≤Â»Î0∫Û£∫L.data=");
        ListTraverse(L); 
        printf("L.length=%d \n",L->length);
        
        GetElem(L,5,&e);
        printf("µ⁄5∏ˆ‘™Àÿµƒ÷µŒ™£∫%d\n",e);
        for(j=3;j<=4;j++)
        {
            k=LocateElem(L,j);
            if(k)
                printf("µ⁄%d∏ˆ‘™Àÿµƒ÷µŒ™%d\n",k,j);
            else
                printf("√ª”–÷µŒ™%dµƒ‘™Àÿ\n",j);
        }
        
        
        k=ListLength(L); /* kŒ™±Ì≥§ */
        for(j=k+1;j>=k;j--)
        {
            i=ListDelete(L,j,&e); /* …æ≥˝µ⁄j∏ˆ ˝æ› */
            if(i==ERROR)
                printf("…æ≥˝µ⁄%d∏ˆ ˝æ› ß∞‹\n",j);
            else
                printf("…æ≥˝µ⁄%d∏ˆµƒ‘™Àÿ÷µŒ™£∫%d\n",j,e);
        }
        printf("“¿¥Œ ‰≥ˆLµƒ‘™Àÿ£∫");
        ListTraverse(L); 
        
        j=5;
        ListDelete(L,j,&e); /* …æ≥˝µ⁄5∏ˆ ˝æ› */
        printf("…æ≥˝µ⁄%d∏ˆµƒ‘™Àÿ÷µŒ™£∫%d\n",j,e);
        
        printf("“¿¥Œ ‰≥ˆLµƒ‘™Àÿ£∫");
        ListTraverse(L); 
        
        //ππ‘Ï“ª∏ˆ”–10∏ˆ ˝µƒLb
        SqList *Lb;
        i=InitList(Lb);
        for(j=6;j<=15;j++)
            i=ListInsert(Lb,1,j);
        
        unionL(L,Lb);
        
        printf("“¿¥Œ ‰≥ˆ∫œ≤¢¡ÀLbµƒLµƒ‘™Àÿ£∫");
        ListTraverse(L); 
        
    }
    return 0;
}
