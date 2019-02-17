//
//  Tree.h
//  tree
//
//  Created by yuan on 2019/2/14.
//  Copyright © 2019年 sunEEE. All rights reserved.
//

#ifndef tree_h
#define tree_h

//节点定义

typedef int  TreeType;

typedef struct TreeNode{
    TreeType key;//// 关键字(键值)
    struct TreeNode * left;// 左孩子
    struct TreeNode * right;// 右孩子
    struct TreeNode * parent;// 父结点
}Node,*Tree;


// 前序遍历"二叉树"
void preorder_tree(Tree tree);
// 中序遍历"二叉树"
void midorder_tree(Tree tree);
// 后序遍历"二叉树"
void postorder_tree(Tree tree);

// (递归实现)查找"二叉树x"中键值为key的节点
Node* tree_search(Tree x, TreeType key);
// (非递归实现)查找"二叉树x"中键值为key的节点
Node* iterative_tree_search(Tree x, TreeType key);

// 查找最小结点：返回tree为根结点的二叉树的最小结点。
Node* tree_minimum(Tree tree);
// 查找最大结点：返回tree为根结点的二叉树的最大结点。
Node* tree_maximum(Tree tree);

// 找结点(x)的后继结点。即，查找"二叉树中数据值大于该结点"的"最小结点"。
Node* tree_successor(Node *x);
// 找结点(x)的前驱结点。即，查找"二叉树中数据值小于该结点"的"最大结点"。
Node* tree_predecessor(Node *x);

// 将结点插入到二叉树中，并返回根节点
void insert_tree(Tree *tree, TreeType key);

// 删除结点(key为节点的值)，并返回根节点
Node* delete_tree(Tree tree, TreeType key);

// 销毁二叉树
void destroy_tree(Tree tree);

// 打印二叉树
void print_tree(Tree tree, TreeType key, int direction);


#endif /* tree_h */
