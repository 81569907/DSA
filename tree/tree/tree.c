//
//  bstree.c
//  tree
//
//  Created by yuan on 2019/2/14.
//  Copyright © 2019年 sunEEE. All rights reserved.
//

#include "tree.h"
#include <stdlib.h>

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
(02) 遍历左子树；
(03) 遍历右子树。
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
 (01) 遍历左子树；
 (02) 根结点；
 (03) 遍历右子树。
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
 (01) 遍历左子树；
 (02) 遍历右子树；
 (03) 根结点。
 */
void postorder_tree(Tree tree){
    if (tree != NULL) {
        printf("%d ", tree->key);
        postorder_tree(tree->left);
        postorder_tree(tree->right);
    }
}
/*
(递归实现)查找"二叉树x"中键值为key的节点
*/
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
/*
(非递归实现)查找"二叉树x"中键值为key的节点
 */
Node * iterative_tree_search(Tree x, TreeType key){
    while ((x != NULL) && (x->key != key)) {
        if (key < x->key) {
            x = x->left;
        }else{
            x = x ->right;
        }
    }
    return x;
}


/*
查找最大结点：返回tree为根结点的二叉树的最大结点。
*/

Node * tree_maxinum(Tree tree){
    if (tree == NULL) {
        return NULL;
    }
    while (tree->right != NULL) {
        tree = tree ->right;
    }
    return tree;
}

/*
查找最小结点：返回tree为根结点的二叉树的最小结点。
 */
Node* tree_minimum(Tree tree)
{
    if (tree == NULL)
        return NULL;
    
    while(tree->left != NULL)
        tree = tree->left;
    return tree;
}

/*
前驱和后继
节点的前驱：是该节点的左子树中的最大节点。
节点的后继：是该节点的右子树中的最小节点。
*/


//前驱节点：二叉树中序遍历完成后和这个节点相邻的前面的节点为该节点的前驱节点
//查找前驱节点的代码
Node * tree_predecessor(Node * x){
    //如果当前节点的左子树不为空，那么该点的前驱节点为该点左子树中最右的节点    
    if (x->left != NULL) {
        return tree_maxinum(x->left);
    }
    // 如果x没有左孩子。则x有以下两种可能：
    // (01) x是"一个右孩子"，则"x的前驱结点"为 "它的父结点"。
    // (01) x是"一个左孩子"，则查找"x的最低的父结点，并且该父结点要具有右孩子"，找到的这个"最低的父结点"就是"x的前驱结点"。
    Node *y = x->parent;
    while ((y != NULL) &&(x == y->left)) {
        x = y;
        y = y->parent;
    }
    return y;
}

//后继节点：二叉树中序遍历完成后和这个节点相邻的后面的节点为该节点的后继节点
//查找后继节点
Node* tree_successor(Node *x)
{
    // 如果x存在右孩子，则"x的后继结点"为 "以其右孩子为根的子树的最小结点"。
    if (x->right != NULL)
        return tree_minimum(x->right);
    
    // 如果x没有右孩子。则x有以下两种可能：
    // (01) x是"一个左孩子"，则"x的后继结点"为 "它的父结点"。
    // (02) x是"一个右孩子"，则查找"x的最低的父结点，并且该父结点要具有左孩子"，找到的这个"最低的父结点"就是"x的后继结点"。
    Node* y = x->parent;
    while ((y!=NULL) && (x==y->right))
    {
        x = y;
        y = y->parent;
    }
    
    return y;
}

/* 
* 将结点插入到二叉树中
*
* 参数说明：
*     tree 二叉树的根结点
*     z 插入的结点
* 返回值：
*     根节点
*/
static Node *tree_insert(Tree tree, Node * z){
    Node * y = NULL;
    Node * x = tree;
    //查找z的插入位置
    while (x != NULL) {
        y = x;
        if (z->key < x->key) {
            x = x->left;
        }else{
            x = x->right;
        }
    }
    z->parent = y;
    if (y == NULL) {
        tree = z;
    }else if(z->key < y->key){
        y->left = z;
    }else{
        y->right = z;
    }
    return tree;
}

 /* 
 * 新建结点(key)，并将其插入到二叉树中
 *
  * 参数说明：
 *     tree 二叉树的根结点
  *     key 插入结点的键值
 * 返回值：
 *     根节点
  */

Node * insert_tree(Tree tree, TreeType key){
    Node *z;//新建结点
    if ((z = create_tree_node(key, NULL, NULL, NULL)) == NULL) {
        return tree;
    }
    return tree_insert(tree, z);
}


/* 
 * 删除结点(z)，并返回根节点
 *
 * 参数说明：
 *     tree 二叉树的根结点
 *     z 删除的结点
 * 返回值：
 *     根节点
 */
static Node* tree_delete(Tree tree, Node *z)
{
    Node *x=NULL;
    Node *y=NULL;
    
    if ((z->left == NULL) || (z->right == NULL) )
        y = z;
    else
        y = tree_successor(z);
    
    if (y->left != NULL)
        x = y->left;
    else
        x = y->right;
    
    if (x != NULL)
        x->parent = y->parent;
    
    if (y->parent == NULL)
        tree = x;
    else if (y == y->parent->left)
        y->parent->left = x;
    else
        y->parent->right = x;
    
    if (y != z) 
        z->key = y->key;
    
    if (y!=NULL)
        free(y);
    
    return tree;
}

/* 
 * 删除结点(key为节点的键值)，并返回根节点
 *
 * 参数说明：
 *     tree 二叉树的根结点
 *     z 删除的结点
 * 返回值：
 *     根节点
 */
Node* delete_bstree(Tree tree, TreeType key)
{
    Node *z, *node; 
    
    if ((z = tree_search(tree, key)) != NULL)
        tree =tree_delete(tree, z);
    
    return tree;
}

/*
 * 销毁二叉树
 */
void destroy_bstree(Tree tree)
{
    if (tree==NULL)
        return ;
    
    if (tree->left != NULL)
        destroy_bstree(tree->left);
    if (tree->right != NULL)
        destroy_bstree(tree->right);
    
    free(tree);
}

/*
 * 打印"二叉树"
 *
 * tree       -- 二叉树的节点
 * key        -- 节点的键值 
 * direction  --  0，表示该节点是根节点;
 *               -1，表示该节点是它的父结点的左孩子;
 *                1，表示该节点是它的父结点的右孩子。
 */
void print_tree(Tree tree, TreeType key, int direction)
{
    if(tree != NULL)
    {
        if(direction==0)    // tree是根节点
            printf("%2d is root\n", tree->key);
        else                // tree是分支节点
            printf("%2d is %2d's %6s child\n", tree->key, key, direction==1?"right" : "left");
        
        print_tree(tree->left, tree->key, -1);
        print_tree(tree->right,tree->key,  1);
    }
}

