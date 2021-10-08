//  
//  R�mov� Dups! Write code to remove duplicates from an unsorted linked list.
//  FOLLOW UP
//  How would you solve this problem if a temporary buffer is not allowed?
//  

public extension LinkedList {
    //BigO: time: O(n) space: O(n)
    func removeDups() {
        var set = Set<Int>()
        var node = getHead()
        var previous: LinkedList.Node? = nil
        
        while(node != nil) {
            if set.contains(node!.value) {
                previous?.next = node?.next
            } else {
                set.insert(node!.value)
                previous = node
            }
            node = node?.next
        }
    }
    
    func removeDupsWithOutExtraBuffer() {
        //BigO: time: O(n^2) space: O(1)
        var node = getHead()
        var previous: LinkedList.Node? = nil
        
        while(node != nil) {
            var runner = node?.next
            previous = node
            
            while(runner != nil) {
                if runner?.value == node?.value {
                    previous?.next = runner?.next
                } else {
                    previous = runner
                }
                runner = runner?.next
            }
            node = node?.next
        }
    }
}

