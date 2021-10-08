//  
//  Intersection: Given two (singly) linked lists, determine if the two lists intersect. Return the inter­ secting node. Note that the intersection is defined based on reference, not value.That is, if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.
//  
//   1 2 3 4 
//            7 8 9
//     5 6 8 

public func findIntersection(first: LinkedList, second: LinkedList) -> LinkedList.Node? {
    //see the tails and return if they are diff
    let t1 = first.getTail()
    let t2 = second.getTail()
    guard t1 != nil, t2 != nil, t1 === t2 else { return nil }
    
    // find the diff in lengths and the longer list
    let l1 = first.count()
    let l2 = second.count()
    let diff = abs(l1-l2)
    
    // iterate through the longer list diff times
    guard var p1: LinkedList.Node? = l1 > l2 ? first.getNode(at: diff) : second.getNode(at: diff) else { return nil }
    guard var p2: LinkedList.Node? = l1 > l2 ? second.getHead() : first.getHead() else { return nil }
    
    while(p1 != nil && p2 != nil) {
        if(p1 === p2) {
            return p1
        }
        p1 = p1?.next
        p2 = p2?.next
    }
    return nil
}



