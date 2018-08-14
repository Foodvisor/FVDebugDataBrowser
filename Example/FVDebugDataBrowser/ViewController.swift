//
//  ViewController.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 08/06/2018.
//  Copyright (c) 2018 Fong Zhou. All rights reserved.
//

import UIKit
import FVDebugDataBrowser
import CoreData

extension UIWindow {
    open override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        FVDebugDataBrowser.display()
    }
}

class ViewController: UIViewController {

    var coreDataLoaded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "coreDataLoaded")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "coreDataLoaded")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCoreData()
        FVDebugDataBrowser.setup()
        FVDebugDataBrowser.logEvent("viewDidLoad", value: "event")
        FVDebugDataBrowser.addPersistenceContainer("FVDebugDataBrowser")
    }

    // fast quick & dirty
    func loadCoreData() {
        let container = NSPersistentContainer(name: "FVDebugDataBrowser")
        container.loadPersistentStores { (_, _) in }
        let context = container.viewContext

        if coreDataLoaded == true {
            return
        }

        for food in foodList {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "Food", into: context) as! Food
            entity.name = food["name"]!
            entity.calories = Float(food["calories"]!)!
            entity.proteins = Float(food["proteins"]!)!
            entity.carbs = Float(food["carbs"]!)!
            entity.fibers = Float(food["fibers"]!)!
        }
        do { try context.save() }
        catch { }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let foodList = [
        ["name": "Stuffed tomatoes", "calories": "122.0", "fibers": "3.0", "proteins": "27.6", "carbs": "6.72"],
        ["name": "Flaked crab", "calories": "128.0", "fibers": "0.0", "proteins": "77.2", "carbs": "2.0"],
        ["name": "Merguez baguette sandwich", "calories": "0.0", "fibers": "0.0", "proteins": "0.0", "carbs": "0.0"],
        ["name": "Ricotta and spinach ravioli", "calories": "209.0", "fibers": "5.4", "proteins": "34.4", "carbs": "110.8"],
        ["name": "Brique", "calories": "282.0", "fibers": "0.0", "proteins": "71.6", "carbs": "4.68"],
        ["name": "Ricotta and spinach lasagna", "calories": "158.0", "fibers": "1.6", "proteins": "28.4", "carbs": "49.6"],
        ["name": "Tomato soup", "calories": "47.0", "fibers": "2.0", "proteins": "6.76", "carbs": "30.0"],
        ["name": "Celery salad", "calories": "16.0", "fibers": "4.56", "proteins": "4.8", "carbs": "4.64"],
        ["name": "Fish and chips", "calories": "257.0", "fibers": "3.6", "proteins": "40.12", "carbs": "86.84"],
        ["name": "Toulouse sausage", "calories": "311.0", "fibers": "0.0", "proteins": "75.2", "carbs": "4.4"],
        ["name": "Peanuts", "calories": "622.0", "fibers": "12.4", "proteins": "103.6", "carbs": "59.2"],
        ["name": "Bass", "calories": "154.0", "fibers": "0.0", "proteins": "94.4", "carbs": "0.0"],
        ["name": "Canned tuna in oil", "calories": "231.0", "fibers": "0.0", "proteins": "103.2", "carbs": "0.0"],
        ["name": "Almond milk", "calories": "45.0", "fibers": "0.0", "proteins": "13.2", "carbs": "18.24"],
        ["name": "Ranch dressing", "calories": "492.0", "fibers": "1.4", "proteins": "4.0", "carbs": "28.0"],
        ["name": "Beef carpaccio", "calories": "278.0", "fibers": "0.728", "proteins": "60.8", "carbs": "9.52"],
        ["name": "Bacon omelette", "calories": "264.0", "fibers": "0.0", "proteins": "50.0", "carbs": "2.712"],
        ["name": "Nougat", "calories": "450.0", "fibers": "2.94", "proteins": "24.48", "carbs": "285.2"],
        ["name": "Prawn crackers", "calories": "529.0", "fibers": "4.2", "proteins": "8.0", "carbs": "236.0"],
        ["name": "Cuba libre", "calories": "242.0", "fibers": "0.0", "proteins": "0.0", "carbs": "0.0"],
        ["name": "Octopus", "calories": "86.0", "fibers": "0.0", "proteins": "71.6", "carbs": "5.8"]
    ]

}
