//
//  bstree.c
//  tree
//
//  Created by yuan on 2019/2/14.
//  Copyright © 2019年 sunEEE. All rights reserved.
//

#include "bstree.h"
#include <stdlib.h>
//节点定义

typedef int  TreeType;

typedef struct TreeNode{
    TreeType key;//// 关键字(键值)
    struct TreeNode * left;// 左孩子
    struct TreeNode * right;// 右孩子
    struct TreeNode * parent;// 父结点
}Node,*Tree;


/*
二叉查找树的节点包含的基本信息：
(01) key       -- 它是关键字，是用来对二叉查找树的节点进行排序的。
(02) left       -- 它指向当前节点的左孩子。
(03) right    -- 它指向当前节点的右孩子。
(04) parent -- 它指向当前节点的父结点。
 */

//创建节点

static Node* create_tree_node(TreeType key,Node *left, Node* right, Node *parent){
    Node * p;
    if ((p = (Node *)malloc(sizeof(Node))) == NULL) {
        return NULL;
    }
    p->key = key;
    p->left = left;
    p->right = right;
    p->parent = parent;
    
    return p;
}

/*
 遍历: 前序遍历、中序遍历、后序遍历
 */

/*
前序遍历
若二叉树非空，则执行以下操作：
(01) 访问根结点；
(02) 先序遍历左子树；
(03) 先序遍历右子树。
 */
void preorder_tree(Tree tree){
    if (tree != NULL) {
        printf("%d ", tree->key);
        preorder_tree(tree->left);
        preorder_tree(tree->right);
    }
}

/*
 中序遍历
 若二叉树非空，则执行以下操作：
 (01) 中序遍历左子树；
 (02) 访问根结点；
 (03) 中序遍历右子树。
 */
void midorder_tree(Tree tree){
    if (tree != NULL) {
        printf("%d ", tree->key);
        midorder_tree(tree->left);
        midorder_tree(tree->right);
    }
}

/*
 后序遍历
 若二叉树非空，则执行以下操作：
 (01) 后序遍历左子树；
 (02) 后序遍历右子树；
 (03) 访问根结点。
 */
void postorder_tree(Tree tree){
    if (tree != NULL) {
        printf("%d ", tree->key);
        postorder_tree(tree->left);
        postorder_tree(tree->right);
    }
}

Node * tree_search(Tree x, TreeType key){
    if (x == NULL || x->key == key) {
        return x;
    }
    
    if (key< x->key) {
        return tree_search(x->left, key);
    }else{
        return tree_search(x->right, key);
    }
    return NULL;
}

