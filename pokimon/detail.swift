//
//  detail.swift
//  pokimon
//
//  Created by akrayw on 6/25/16.
//  Copyright © 2016 akraywcom.com. All rights reserved.
//

import UIKit
import Alamofire

class detail: UIViewController {

    @IBOutlet weak var imagep: UIImageView!
    var pokemon: poke!
    
    @IBAction func back(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblname.text = pokemon.name
        imagep.image = UIImage(named: "\(pokemon.id)")
        
        print(pokemon.id)
        Alamofire.request(.GET, "https://pokeapi.co/api/v2/pokemon/\(pokemon.id)/")
            .responseJSON { response in
            
                if let JSON = response.result.value {
                    
                    print(JSON["move"])
                }
        }
        
        
        
        
        
    }

    @IBOutlet weak var lblname: UILabel!
    
 
   

}
