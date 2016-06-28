//
//  ViewController.swift
//  pokimon
//
//  Created by akrayw on 6/19/16.
//  Copyright © 2016 akraywcom.com. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout ,UISearchBarDelegate{

    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    var pokemon = [poke]()
    var fpokemon = [poke]()
    var inSearchmode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.Done
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
           
            if inSearchmode {
                cell.confquerCell(fpokemon[indexPath.row])
            }else{
                cell.confquerCell(pokemon[indexPath.row])
 
            }
           return cell
            
        }else
        {
            return UICollectionViewCell()
        }
        
    }
  
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print("click \(indexPath.row)")
        
        let epoke: poke!
        
        if inSearchmode {
            
            epoke = fpokemon[indexPath.row]
            
        }else{
            epoke = pokemon[indexPath.row]
        }
        
        performSegueWithIdentifier("detail", sender: epoke)
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchmode{
            return fpokemon.count
        }
        return pokemon.count
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchbar.text == nil || searchbar.text == "" {
            inSearchmode = false
            view.endEditing(true)
            collection.reloadData()
            
        }else{
            inSearchmode = true
            
            let lower = searchbar.text!.lowercaseString
            fpokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil })
            collection.reloadData()
            
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail"
        {
           if let aa = segue.destinationViewController as? detail
           {
            if let pp = sender as? poke{
                aa.pokemon = pp
                
            }
           }
        }
    }
    
    
    
    
    
    
    
    
    
  


}

