//
//  pokeCell.swift
//  pokimon
//
//  Created by akrayw on 6/24/16.
//  Copyright © 2016 akraywcom.com. All rights reserved.
//

import UIKit

class pokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cimage: UIImageView!
    
    var pokemon: poke!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func confquerCell(pokemon: poke){
        
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalizedString
        cimage.image = UIImage(named: "\(self.pokemon.id)")
  
    }
    
    
    
}
