//  
//  BST Sequences: A binary search tree was created by traversing through an array from left to right and inserting each element. Given a binary search tree with distinct elements, print all possible arrays that could have led to this tree.
//  EXAMPLE
//  Input:
//  Output: {2, 1, 3}, {2, 3, 1}
//  

import LinkedList

func printAllSequences(root: BinaryTreeNode?) {
    if root == nil { return }
    let arrayOfLists = findAllSequences(root: root)
    for list in arrayOfLists {
        print(list.description)
    }
}

func findAllSequences(root: BinaryTreeNode?) -> [LinkedList] {
    if root == nil {
        return []
    }
    
    let leftSequences = findAllSequences(root: root?.left)
    let rightSequences = findAllSequences(root: root?.right)
    
    var allSequences = [LinkedList]()
    for left in leftSequences {
        for right in rightSequences {
            let prefixList = LinkedList()
            prefixList.insert(value: root!.value)
            allSequences.append(contentsOf: weaveElements(first: left, second: right, prefix: prefixList))
        }
    }
    return allSequences
}

// [3,2,4]        [8,7,9]          [6,3,2,]

func weaveElements(first: LinkedList, second: LinkedList, prefix: LinkedList) -> [LinkedList] {
    let firstElement = first.getHead()
    prefix.insert(value: firstElement!.value)
    weaveElements(first: first, second: second, prefix: prefix)
    return []
}
