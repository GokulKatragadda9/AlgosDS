
//  Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

//  A[0][0] -> A[N][0]
//  A[0][1] -> A[N-1][0]
//  A[0][2] -> A[N-2][0]
//  A[0][N] -> A[0][0]
//  A[0][I] -> A[N-I][0]
// BigO: time- O(n^2) space: O(n^2)

// 1 2 3
// 4 5 6
// 7 8 9

// 1 2 3 4   00 01 02 03
// 5 6 7 8   10 11 12 13
// 9 2 3 4   20 21 22 23
// 4 5 6 7   30 31 32 33

//  How do we perform this four-way edge swap? One option is to copy the top edge to an array, and then move the left to the top, the bottom to the left, and so on. This requires O(N) memory, which is actually unnecessary.
//  A better way to do this is to implement the swap index by index

public func rotateMatrix(image: [[Int]]) -> [[Int]] {
    print(image)
    let N = image.count
    var rotatedImage = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    for i in 0 ..< N {   //0,1,2
        for j in 0..<N {
            rotatedImage[i][j] = 0
        }
    }
    
    for i in 0 ..< N {   //0,1,2
        for j in (0...N-1).reversed() {
            rotatedImage[i][N-1-j] = image[j][i]
        }
    }
    return rotatedImage ?? [[]]
}

//BigO: time - O(N^2) space: O(1)
public func rotateMatrix1(image: [[Int]]) -> [[Int]] {
    print(image)
    let N = image.count
    guard N > 0 && N == image[0].count else { return [[]] }
    var rotatedImage = image
    var top = 0
    for layer in 0 ..< N/2 {
        let last = N-1-layer
        for i in 0..<last {
            let offset = N-1-i
            top = rotatedImage[layer][i]
            rotatedImage[layer][i] = rotatedImage[offset][layer]
            rotatedImage[offset][layer] = rotatedImage[last][offset]
            rotatedImage[last][offset] = rotatedImage[i][last]
            rotatedImage[i][last] = top
        }
    }
    return rotatedImage ?? [[]]
}
