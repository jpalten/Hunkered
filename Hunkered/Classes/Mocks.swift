import Foundation

public enum MockDirection: String {
    case get = "GET", put = "PUT", post = "POST"
    
    private func isToken(_ item: String) -> Bool {
        let num = Int(item)
        return num != nil
    }
    
    fileprivate func kind(_ tokens: [String] = []) ->  [String] {
        guard
            let lastToken = tokens.last,
            let firstToken = tokens.first,
            let lastAction = output.last,
            let firstAction = output.first
            else { return [] }
        
        //Process Index Action
        if(!isToken(lastToken) && self == .get) {
            return [lastToken, lastAction]
        }
        
        //Process Show Action
        if(isToken(lastToken) && self == .get) {
            return [firstToken, firstAction]
        }
        
        //Process Create Action
        if(!isToken(lastToken) && self == .post) {
            return [lastToken, firstAction]
        }
        
        return [firstToken, lastAction]
    }
    
    private var output: [String] {
        switch self {
        case .get: return ["SHOW", "INDEX"]
        case .put: return ["UPDATE"]
        case .post: return ["CREATE"]
        }
    }
    
}

public struct Hunkered {
    
    static let mocks:[[String: AnyObject]] = {
        do {
            return try HunkeredIO().loadJSON()
        } catch {
            print("problems...")
            return []
        }
    }()
   
    private static func index(_ resource: String, action: String) -> String? {
        return "foo"
        
//        guard let book = mocks[resource] else {
//            print("FAILED TO FIND KEY")
//            return nil
//        }
//        
//        guard let action = book[action] else {
//            print("FAILED TO FIND RESOURCE ACTION, PLEASE INCLUDE MOCK")
//            return nil
//        }
//        
//        return action
    }
    
//    public func find(_ request: URLRequest ) -> Data? {
//        
//        guard let parts = (request.url?.pathComponents),
//            let method = request.httpMethod,
//            let direction = MockDirection(rawValue: method)
//            else { return nil }
//        
//        let suffix = parts.suffix(2).map{ i in return i}
//        let actions = direction.kind(suffix)
//        
//        guard let loadJSON = index(actions[0], action: actions[1]) else { return nil }
//        
//        return loadJSON.data(using: String.Encoding.utf8)
//    }
    
}
