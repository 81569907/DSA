//
//  LeetCode.m
//  LeetCode
//
//  Created by yuan on 2019/6/12.
//  Copyright © 2019年 xx. All rights reserved.
//

#import "LeetCode.h"

@implementation LeetCode
-(NSArray *)twoSum:(NSArray *)nums target:(NSInteger)target{

    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    for (int i= 0; i < nums.count; i ++) {
        [dic setObject:@(i) forKey:nums[i]];
    }

    for (int i= 0; i < nums.count; i ++) {
        NSNumber * number = nums[i];
        NSInteger value = target - number.integerValue;
        NSNumber * index = [NSNumber numberWithInteger:value];
        NSNumber * flag = dic[index];
        if (dic[index] && flag.integerValue != i) {
            return @[@(i), dic[index]];
        }
    }
    return nil;
}


-(ListNode *)addTwoList:(ListNode *)list1 with:(ListNode *)list2{
    
    ListNode * dummy = [ListNode new];
    ListNode * cur = dummy;
    
    int carry = 0;
    
    while (list1 || list2) {
        int val1 = list1 ? list1.value :0;
        int val2 = list2 ?list2.value:0;
        int sum = val1 + val2 + carry;
        carry = sum /10;
        cur.next = [ListNode new];
        cur.content = @(sum%10);
        cur = cur.next;
        if (list1) {
            list1 = list1.next;
        }
        if (list2) {
            list2 = list2.next;
        }
    }
//    if (carry) {
//        cur.next = [ListNode new];
//    }
    return dummy;
}


-(int)getLongestUnRepeatedSubStr:(NSString *)str{
    
    int hashTable[256]={0};
    int start=0;
    int mstart=0;
    int mlen=0;
    int idx=0;
    int len=0;
    while (idx != str.length) {
        if (hashTable[[str characterAtIndex:idx]] == 1) {
            if (len > mlen) {
                mstart = start;
                mlen = len;
            }
            while ([str characterAtIndex:start] != [str characterAtIndex:idx]) {
                hashTable[[str characterAtIndex:start]] = 0;
                start ++;
                len --;
            }
            start ++;
        }else{
            hashTable[[str characterAtIndex:idx]] = 1;
            len ++;
        }
        idx ++;
    }
    if (len > mlen) {
        mlen = len;
        mstart = start;
    }
    NSLog(@"%@", [str substringWithRange:NSMakeRange(mstart, mlen)]);
    return 0;
}
@end
