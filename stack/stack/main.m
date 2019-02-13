//
//  main.m
//  stack
//
//  Created by yuan on 17/4/10.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dlink_stack.h"

typedef struct tag_stu{
    int _id;
    char name[20];
}stu;

static stu arr_stu[] = {
    {10, "sky"},
    {20, "s"},
    {30, "b"},
    {40, "a"},
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {

     stu *pval=NULL;
        // 创建“栈”
     create_dlink_stack();
        
        // 将10, 20, 30 依次推入栈中
    }
    return 0;
}
