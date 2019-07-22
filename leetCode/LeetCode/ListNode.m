//
//  ListNode.m
//  LeetCode
//
//  Created by yuan on 2019/6/13.
//  Copyright © 2019年 xx. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (int)value {
    if (_content != nil && [_content isKindOfClass:NSClassFromString(@"NSNumber")]) {
        return [(NSNumber *)_content intValue];
    }
    return 0;
}

// 打印从当前节点开始之后所有的节点数据
- (void)printAllListNode {
    ListNode *curNode = self;
    while (curNode) {
        ListNode *preNode = curNode.previous;
        ListNode *nextNode = curNode.next;
        NSLog(@"curNode=%p, value=%d, preNode=%p, nextNode=%p",curNode, curNode.value, preNode, nextNode);
        curNode = curNode.next;
    }
}

@end
