//
//  main.m
//  LeetCode
//
//  Created by yuan on 2019/6/12.
//  Copyright © 2019年 xx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeetCode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here..
        LeetCode * obj = [LeetCode new];
        NSArray * sour = @[@(1),@(2),@(2),@(4),@(5),@(3)];
        NSArray * des = [obj twoSum:sour target:3];
        NSLog(@"%@", des);
        
        ListNode * one10 = [ListNode new];
        one10.content = @(1);
        ListNode * one11 = [ListNode new];
        one11.content = @(2);
        one10.next = one11;
        one11.previous = one10;
        ListNode * one12 = [ListNode new];
        one12.content = @(3);
        one11.next = one12;
        one12.previous = one11;
        
        
        ListNode * one20 = [ListNode new];
        one20.content = @(5);
        ListNode * one21 = [ListNode new];
        one21.content = @(10);
        one20.next = one21;
        one21.previous = one20;
        ListNode * one22 = [ListNode new];
        one22.content = @(20);
        one21.next = one22;
        one22.previous = one21;
        
        

        
        
        ListNode * one1 = [obj addTwoList:one10 with:one20];
        [one1 printAllListNode];
        
        NSString * str = @"asdhaksdkjjjjasdasdasdtyuilkj";
        [obj getLongestUnRepeatedSubStr:str];
    }
    return 0;
}
