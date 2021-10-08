//  Stack of Boxes: You have a stack of n boxes, with widths wi, heights hi, and depths di. The boxes cannot be rotated and can only be stacked on top of one another if each box in the stack is strictly larger than the box above it in width, height, and depth. Implement a method to compute the height of the tallest possible stack. The height of a stack is the sum of the heights of each box.
//  


public struct Box {
    let width: Int
    let height: Int
    let depth: Int
    
    public init(width: Int, height: Int, depth: Int) {
        self.width = width
        self.height = height
        self.depth = depth
    }
}

var maxHeight = 0

public func stackHeight(boxes: [Box], topBox: Box?, height: Int) {
    if boxes.count == 0 {
        maxHeight = height > maxHeight ? height : maxHeight
        print(maxHeight)
        return
    }
    for i in 0..<boxes.count {
        var mboxes = boxes
        let box = mboxes.remove(at: i)
        if checkValid(box: box, above: topBox) {
            stackHeight(boxes: mboxes, topBox: box, height: height + box.height)
        }
    }
    print(height)
}


private func checkValid(box: Box, above topBox: Box?) -> Bool {
    guard let topBox = topBox else { return true }
    return topBox.width > box.width && topBox.height > box.height && topBox.depth > box.depth
}
