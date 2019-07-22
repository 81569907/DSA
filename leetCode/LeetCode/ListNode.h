//
//  ListNode.h
//  LeetCode
//
//  Created by yuan on 2019/6/13.
//  Copyright © 2019年 xx. All rights reserved.
//

#import <Foundation/Foundation.h>

//节点
NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

/** 上个节点 */
@property (strong , nonatomic) ListNode *previous;

/** 下个节点 */
@property (strong , nonatomic) ListNode *next;

/** 当前节点内容 */
@property (strong , nonatomic) id content;

/** int */
@property(nonatomic, assign) int value;

/** 打印从当前节点开始之后所有的节点数据 */
- (void)printAllListNode;



@end

NS_ASSUME_NONNULL_END
