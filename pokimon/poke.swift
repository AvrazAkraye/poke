
import Foundation

class poke{
    
    private var _name: String!
    private var _id: Int!
    
    var name:String {
    return _name
    }
    
    var id: Int{
        return _id  
    }
    
    init(name: String, id: Int)
    {
        self._name = name
        self._id = id
      
    }

}