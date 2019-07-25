import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }

    router.post("events") { (req) -> Future<String> in
        let challenge: Future<String> = try req.content.decode(ChallengeToken.self).map(to: String.self) { challengeToken in
            return challengeToken.challenge
        }
        return challenge
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
