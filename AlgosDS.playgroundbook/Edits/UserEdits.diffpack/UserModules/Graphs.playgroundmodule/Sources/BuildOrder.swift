//  
//  Build Order: You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent on the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.
//  EXAMPLE
//  Input:
//  projects: a, b, c, d, e, f
//  dependencies: (a, d), (f, b), (b, d), (f, a), (d, c) Output: f, e, a, b, d, c
//  


//  var a = Project(name: "a")
//  var b = Project(name: "b")
//  var c = Project(name: "c")
//  var d = Project(name: "d")
//  var e = Project(name: "e")
//  var f = Project(name: "f")
//  
//  do {
//      let order = try findBuildOrder(projects: [a,b,c,d,e,f], dependencies: [[a,d], [f,b], [b,d], [f,a], [d,e]])
//      print(order)
//  } catch {
//      print(error)
//  }


// This is topological sort.  linearly ordering the vertices in a graph such that for every edge (a, b), a appears before b in the linear order.
//  ThissolutiontakesO(P + D)time,where Pisthe numberofprojects and D isthe numberofdependency pairs.

import LinkedList

public func findBuildOrder(projects: [Project], dependencies: [[Project]]) throws -> [Project] {
    buildGraph(from: projects, dependencies: dependencies)
    return try determineBuildOrderDFS(projects: projects)
}

enum ProjectState {
    case blank
    case partial
    case completed
}

public class Project: CustomStringConvertible {
    let name: String
    var children = Set<Project>()
    var dependencyCount = 0
    var state: ProjectState = .blank
    
    public init(name: String) {
        self.name = name
    }
    
    public var description: String {
        return name
    }
    
    func addChild(_ project: Project) {
        children.insert(project)
        project.incrementDependencies()
    }
    
    func removeChild(_ project: Project) {
        children.remove(project)
        project.decrementDependencies()
    }
    
    func incrementDependencies() {
        dependencyCount += 1
    }
    
    func decrementDependencies() {
        dependencyCount -= 1
    }
}

extension Project: Hashable, Equatable {
    public static func ==(lhs: Project, rhs: Project) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum BuildError: Error {
    case cyclicDependencies
}

private func determineBuildOrder(projects: [Project]) throws -> [Project] {
    guard projects.count > 0 else { return [] }
    var order = [Project]()
    let independentProjects = projects.filter { $0.dependencyCount == 0 }
    guard independentProjects.count > 0 else { throw BuildError.cyclicDependencies }
    order.append(contentsOf: independentProjects)
    
    var remainingProjects = projects
    remainingProjects.removeAll(where: {
        $0.dependencyCount == 0
    })
    
    for proj in independentProjects {
        for child in proj.children {
            child.decrementDependencies()
        }
    }
    
    if remainingProjects.count > 0 {
        order += try determineBuildOrder(projects: remainingProjects)
    }
    return order
}

private func buildGraph(from projects: [Project], dependencies: [[Project]]) {
    for dependency in dependencies {
        dependency[0].addChild(dependency[1])
    }
}


// we can even do this using dfs
private func determineBuildOrderDFS(projects: [Project]) throws -> [Project] {
    var order: [Project] = []
    for project in projects {
        if project.state == .blank {
            try doDFS(project: project, order: &order)
        }
    }
    return order.reversed()
}

private func doDFS(project: Project, order: inout [Project]) throws {
    project.state = .partial
    for child in project.children {
        if child.state == .blank {
            try doDFS(project: child, order: &order)
        } else if child.state == .partial {
            throw BuildError.cyclicDependencies
        } 
    }
    project.state = .completed
    order.append(project)
}
