//
//  ViewController.swift
//  SwiftyPlist
//
//  Created by Sugam Kalra on 23/10/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var dataArray:NSMutableArray!
    var plistPath:String!
    var tableData=[String]()
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var tblSurveyData: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist")
        {
            if let arrayOfDictionaries = NSArray(contentsOfFile: path){
                for dict in arrayOfDictionaries {
                    tableData.append(dict.objectForKey("title") as! String)
                }
            }
        }
        
        
        print(tableData)
        
        tblSurveyData.reloadData()
    }

    
    func numberOfSectionsInTableView(SurveyTable: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(SurveyTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(SurveyTable: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            let cell:UITableViewCell = SurveyTable.dequeueReusableCellWithIdentifier("cell")!
            cell.textLabel!.text = tableData[indexPath.row]
            return cell
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

