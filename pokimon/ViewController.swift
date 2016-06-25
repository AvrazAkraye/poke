//
//  ViewController.swift
//  pokimon
//
//  Created by akrayw on 6/19/16.
//  Copyright © 2016 akraywcom.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [poke]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        parsePokeCsv()
    }
    
    func parsePokeCsv() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
               let pid = Int(row["id"]!)!
               let pname = row["identifier"]!
               let npoke = poke(name: pname, id: pid)
               pokemon.append(npoke)
            }
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
       
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokeid", forIndexPath: indexPath) as? pokeCell
        {
           
            cell.confquerCell(pokemon[indexPath.row])
            
            return cell
            
        }else
        {
            return UICollectionViewCell()
        }
        
    }
  
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print("click \(indexPath.row)")
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
        
    }
    
    
  


}

