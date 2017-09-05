//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rogerio Benevento Junior on 01/04/17.
//  Copyright © 2017 Rogerio Benevento Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var delegate : AddAMealDelegate?
    var selected = Array<Item>()
    
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Arroz", calories: 30)
    ]
    
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        
        if let table = tableView {
            table.reloadData()
        } else {
            let alert = UIAlertController(title: "Sorry", message: "Unable to update the table.", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        
        let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = items[row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType  == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
                let item = items[indexPath.row]
                selected.append(item)
                
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                
                let item = items[indexPath.row]
                if let position = selected.index(of: item) {
                    selected.remove(at: position)
                }
            }
        }
    }
    
    @IBAction func add() {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name:String = nameField!.text!
        
        if let happiness = Int(happinessField!.text!) {
            
            let meal = Meal(name: name, happiness: happiness, items: selected)
            
            print("eaten \(meal.name) with happiness \(meal.happiness) with items \(meal.items)")
            
            if (delegate == nil) {
                return
            }
            delegate!.add(meal)
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
    }
    
}

