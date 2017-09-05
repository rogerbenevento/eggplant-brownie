//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Rogerio Benevento Junior on 30/07/17.
//  Copyright © 2017 Rogerio Benevento Junior. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    var delegate : AddAnItemDelegate?
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var caloriesField : UITextField?
    
    
    init(delegate: AddAnItemDelegate) {
        
        super.init(nibName: "NewItemViewController", bundle: nil)
        
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func addNewItem() {
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        
        if (name == nil || calories == nil || delegate == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        delegate!.add(item);
        
        print("add new Item")
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
