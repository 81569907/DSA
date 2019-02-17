//
//  main.c
//  tree
//
//  Created by yuan on 2019/2/14.
//  Copyright © 2019年 sunEEE. All rights reserved.
//

#include <stdio.h>
#include "tree.h"

static int arr[]= {4,8,9,1,2,10,12,5};
#define TBL_SIZE(a) ( (sizeof(a)) / (sizeof(a[0])) )


int main(int argc, const char * argv[]) {
    // insert code here...
    int i, ilen;
    Tree root=NULL;
    
    printf("== 依次添加: ");
    ilen = TBL_SIZE(arr);
    for(i=0; i<ilen; i++)
    {
        printf("%d ", arr[i]);
        insert_tree(&root, arr[i]);
    }
    
    printf("\n== 前序遍历: ");
    preorder_tree(root);
    printf("\n== 中序遍历: ");
    midorder_tree(root);
//
    printf("\n== 后序遍历: ");
    postorder_tree(root);
//    printf("\n");
//    
//    printf("== 最小值: %d\n", tree_minimum(root)->key);
//    printf("== 最大值: %d\n", tree_maximum(root)->key);
//    printf("== 树的详细信息: \n");
//    print_bstree(root, root->key, 0);
//    
//    printf("\n== 删除根节点: %d", arr[3]);
//    root = delete_tree(root, arr[3]);
//    
//    printf("\n== 中序遍历: ");
//    inorder_tree(root);
//    printf("\n");
//    
//    // 销毁二叉树
//    destroy_tree(root);
    return 0;
}
