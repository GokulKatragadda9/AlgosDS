//  
//  Loop Detection: Given a circular linked list, implement an algorithm that returns the node at the
//  beginning of the loop.
//  DEFINITION
//  Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.
//  EXAMPLE
//  Input: A -> B -> C -> D -> E -> C[thesameCasearlier]
//  Output: C
//  
// 8 5 6 6 5 8

//BigO: time: O(n) space: O(1)
public extension LinkedList {
    func loopDetection() -> LinkedList.Node? {
        var slowRunner = getHead()
        var fastRunner = getHead()
        
        while(slowRunner != nil && fastRunner != nil) {
            slowRunner = slowRunner?.next
            fastRunner = fastRunner?.next?.next
            if(slowRunner === fastRunner) { break }
        }
        
        if slowRunner == nil || fastRunner == nil { return nil }
        
        //there is a start node for loop at the distance where head and slowrunner meets when progressing one step at a time
        var p1 = getHead()
        
        while(p1 !== slowRunner) {
            p1 = p1?.next
            slowRunner = slowRunner?.next
        }
        
        return p1
    }
}

