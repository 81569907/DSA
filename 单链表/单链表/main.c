//
//  main.c
//  单链表
//
//  Created by yuan on 2019/6/20.
//  Copyright © 2019年 xx. All rights reserved.
//

#include <stdio.h>
#include "LinkedList.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    Node * header =  createList();
//    delete(header, 1);
//    insert(header, 3, 100);
    Node * v = reverse(header);
    traverse(v);
    return 0;
}
