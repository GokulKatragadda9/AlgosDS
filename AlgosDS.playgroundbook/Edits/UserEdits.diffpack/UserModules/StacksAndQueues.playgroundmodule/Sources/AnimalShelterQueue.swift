//  
//  Animal Shelter: An animal shelter, which holds only dogs and cats, operates on a strictly"first in, first out" basis. People must adopt either the"oldest" (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use the built-in Linked list data structure.
//  

import Foundation

public enum Animal {
    case cat(entryDate: Date)
    case dog(entryDate: Date)
}

public class AnimalShelter {
    let catQueue = Queue<Animal>()
    let dogQueue = Queue<Animal>()
    
    public init() {}
    
    public func enqueue(_ animal: Animal) {
        switch animal {
        case .cat:
            catQueue.push(animal)
        case .dog:
            dogQueue.push(animal)
        }
    }
    
    public func dequeueAny() -> Animal? {
        let nextDog = dogQueue.peek()
        let nextCat = catQueue.peek()
        
        guard case let .dog(dogEntryDate) = nextDog else {
            return catQueue.next()
        }
        guard case let .cat(catEntryDate) = nextCat else {
            return dogQueue.next()
        }
        return dogEntryDate > catEntryDate ? catQueue.next() : dogQueue.next()
    }
    
    public func dequeueCat() -> Animal? {
        return catQueue.next()
    }
    
    public func dequeueDog() -> Animal? {
        return dogQueue.next()
    }
}
