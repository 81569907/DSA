//
//  LeetCode.h
//  LeetCode
//
//  Created by yuan on 2019/6/12.
//  Copyright © 2019年 xx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeetCode : NSObject

/*
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 这道题给了我们一个数组，还有一个目标数target，让我们找到两个数字，使其和为 target，乍一看就感觉可以用暴力搜索，但是猜到 OJ 肯定不会允许用暴力搜索这么简单的方法，于是去试了一下，果然是 Time Limit Exceeded，这个算法的时间复杂度是 O(n^2)。那么只能想个 O(n) 的算法来实现，由于暴力搜索的方法是遍历所有的两个数字的组合，然后算其和，这样虽然节省了空间，但是时间复杂度高。一般来说，我们为了提高时间的复杂度，需要用空间来换，这算是一个 trade off 吧，我们只想用线性的时间复杂度来解决问题，那么就是说只能遍历一个数字，那么另一个数字呢，我们可以事先将其存储起来，使用一个 HashMap，来建立数字和其坐标位置之间的映射，我们都知道 HashMap 是常数级的查找效率，这样，我们在遍历数组的时候，用 target 减去遍历到的数字，就是另一个需要的数字了，直接在 HashMap 中查找其是否存在即可，注意要判断查找到的数字不是第一个数字，比如 target 是4，遍历到了一个2，那么另外一个2不能是之前那个2，整个实现步骤为：先遍历一遍数组，建立 HashMap 映射，然后再遍历一遍，开始查找，找到则记录 index。 
 */
-(NSArray *)twoSum:(NSArray *)nums target:(NSInteger)target;

/*
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.


这道并不是什么难题，算法很简单，链表的数据类型也不难，就是建立一个新链表，然后把输入的两个链表从头往后撸，每两个相加，添加一个新节点到新链表后面。为了避免两个输入链表同时为空，我们建立一个dummy结点，将两个结点相加生成的新结点按顺序加到dummy结点之后，由于dummy结点本身不能变，所以我们用一个指针cur来指向新链表的最后一个结点。好，可以开始让两个链表相加了，这道题好就好在最低位在链表的开头，所以我们可以在遍历链表的同时按从低到高的顺序直接相加。while循环的条件两个链表中只要有一个不为空行，由于链表可能为空，所以我们在取当前结点值的时候，先判断一下，若为空则取0，否则取结点值。然后把两个结点值相加，同时还要加上进位carry。然后更新carry，直接 sum/10 即可，然后以 sum%10 为值建立一个新结点，连到cur后面，然后cur移动到下一个结点。之后再更新两个结点，若存在，则指向下一个位置。while循环退出之后，最高位的进位问题要最后特殊处理一下，若carry为1，则再建一个值为1的结点，代码如下：
 */
-(ListNode *)addTwoList:(ListNode *)list1 with:(ListNode *)list2;

/*
 从一个字符串中找到一个连续子串，该子串中任何两个字符不能相同，求子串的最大长度并输出一条最长不重复子串。
 
 利用hash表hashTable[256]来保存出现过的字符，然后从头开始遍历字符串，
 
 1、如果当前字符ch已经出现过（hashTable[ch]==1），则表示一个局部最长不重复子串已经出现：
 
 此时判断该子串长度len是否大于mlen，如果是，则更新mlen，以及最长子串的起始位置mstart。
 
 同时将start到重复字符ch之间的hash表重置为0（表示没有出现过），相应的长度len也减小，然后从ch的下个字符作为新的子串的开始；
 
 2、如果当前字符ch没有出现过：
 
 则设置hashTable为1（表示出现过），并len++。
 
 时间复杂度：
 
 O(n)
 */
-(int)getLongestUnRepeatedSubStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
