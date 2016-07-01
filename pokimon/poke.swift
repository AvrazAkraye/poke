
import Foundation
import Alamofire


class poke{
    
    private var _name: String!
    private var _id: Int!
    private var _description: String!
    private var _height: String!
    private var _wight: String!
    private var _type: String!
    private var _attack: String!
    private var _defense: String!
    private var _pokemonUrl: String!
   
    
    var pokemonUrl:String{
        get{
            if _pokemonUrl != nil{
              return _pokemonUrl
            }
            return ""
        }
      
        
    }
    
    var description:String{
        get{
            if _description != nil{
                return _description
            }
            return ""
        }
    }
    
    var height: String{
        get{
            if _height != nil{
               return _height
            }
            return ""
        }
        
    }
    
    var wight: String{
        get{
            if _wight != nil{
                return _wight
            }
            return ""
        }
    }
    
    var type: String{
        get{
            if _type != nil{
                return _type
            }
            return ""
        }

       
    }
    
    var attack: String{
            get{
               if (_attack != nil){
                return _attack
                
               }else{
                    return ""
                }
            }
        }
    
    var defense: String{
        get{
            if _defense != nil{
                return _defense
            }
            return ""
        }
    }
    
    
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
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKIMON)\(id)"
    }
    
    func download(complate: downloadcloser){
        let nurl = NSURL(string:  _pokemonUrl)!
        
        Alamofire.request(.GET, nurl)
            .responseJSON { response in
                
                if let JSON = response.result.value as? Dictionary<String, AnyObject>{
                    
                    
                    if let ndesc = JSON["descriptions"] as? [Dictionary<String, String>]{
                        
                        if let str = ndesc[0]["resource_uri"]{
                            
                            let uunsurl = NSURL(string: "\(URL_BASE)\(str)")!
                            
                            Alamofire.request(.GET, uunsurl).responseJSON
                                { response in
                                    if let aap = response.result.value as? Dictionary<String, AnyObject>
                                    {
                                        if let desc = aap["description"] as? String{
                                            self._description = desc
                                            
                                        }else{
                                            self._description  = ""
                                            
                                        }
                                        
                                    }
                                    complate()
                            }
                            
                        }
                    }else{
                        self._description  = ""
                    }
                    
                    if let attack = JSON["attack"] as? Int{
                        self._attack  = "\(attack)"
                    }else
                    {
                        self._attack = ""
                    }
                    
                    if let waigh = JSON["weight"] as? String{
                        self._wight = "\(waigh)"
                    }else
                    {
                        self._wight = ""
                    }
                    
                    if let height = JSON["height"] as? String{
                        self._height = "\(height)"
                    }else
                    {
                        self._height = ""
                    }
                    
                    if let type = JSON["types"] as? [Dictionary<String, String>]{
                        
                        if let new = type[0]["name"]{
                            self._type = new
                        }else{
                           self._type = ""
                        }
                        
                    }
                }
                
        }
        
    }

    
    
}