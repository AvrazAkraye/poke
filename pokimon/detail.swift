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
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var attacklbl: UILabel!
    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var waight: UILabel!
    @IBOutlet weak var heightlbl: UILabel!
    
    @IBOutlet weak var desclbl: UILabel!
    
    var pokemon: poke!
    
   
    @IBAction func back(sender: AnyObject) {
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblname.text = pokemon.name
        imagep.image = UIImage(named: "\(pokemon.id)")
        pokemon.download {
          self.ustate()
        }
    }
    
    func ustate(){
        desclbl.text = pokemon.description
        attacklbl.text = pokemon.attack
        typelbl.text = pokemon.type
        waight.text = pokemon.wight
        heightlbl.text = pokemon.height
    
    }
    
    

   
    
 
   

}
