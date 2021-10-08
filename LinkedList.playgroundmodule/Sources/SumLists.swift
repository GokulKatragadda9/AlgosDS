//  
//  Sum Lists: You have two numbers represented by a linked list, where each node contains a single digit.The digits are stored in reverse order, such that the 1 's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
//  EXAMPLE
//  Input:(7-> 1 -> 6) + (5 -> 9 -> 2).Thatis,617 + 295. Output:2 -> 1 -> 9.Thatis,912.


//BigO: time: O(n) space: O(n)
public func sumListsRecursive(first: LinkedList.Node?, second: LinkedList.Node?, carry: Int) -> LinkedList.Node? {
    var head1 = first
    var head2 = second
    if (head1 == nil && head2 == nil && carry == 0) {
        return nil
    }
    let sum = (head1?.value ?? 0) + (head2?.value ?? 0) + carry
    let node = sumListsRecursive(first: head1?.next, second: head2?.next, carry: sum/10)
    let newNode = LinkedList.Node(value: sum%10)
    newNode.next = node
    return newNode
}

//  FOLLOW UP
//  Suppose the digits are stored in forward order. Repeat the above problem. EXAMPLE
//  lnput:(6 -> 1 -> 7) + (2 -> 9 -> 5).That is,617 + 295. Output:9 -> 1 -> 2.Thatis,912.
//  

//BigO: time: O(n) space: O(n)
public func sumLists(first: LinkedList, second: LinkedList) -> LinkedList.Node? {
    //add padding to make them same length
    addPadding(first: first, second: second)
    
    let (node, carry) = sumHelper(node1: first.getHead(), node2: second.getHead())
    
    if carry == 0 { return node }
    
    let newNode = LinkedList.Node(value: 1)
    newNode.next = node
    return newNode
}

func addPadding(first: LinkedList, second: LinkedList) {
    let l1 = first.count()
    let l2 = second.count()
    var diff = abs(l1-l2)
    
    if l1 == l2 { return }
    
    if l1 > l2 {
        while diff > 0 {
            second.insert(value: 0, at: 0)
            diff -= 1
        }
    } else {
        while diff > 0 {
            first.insert(value: 0, at: 0)
            diff -= 1
        }
    }
}

func sumHelper(node1: LinkedList.Node?, node2: LinkedList.Node?) -> (LinkedList.Node?, Int) {
    if node1 == nil && node2 == nil {
        return (nil, 0)
    }
    let (node, carry) = sumHelper(node1: node1?.next, node2: node2?.next)
    
    let sum = (node1?.value ?? 0) + (node2?.value ?? 0) + carry
    let newNode = LinkedList.Node(value: sum%10)
    newNode.next = node
    return (newNode, sum/10)
}
