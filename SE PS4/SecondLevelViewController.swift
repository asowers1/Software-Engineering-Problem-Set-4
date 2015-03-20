//
//  SecondLevelViewController.swift
//  SE PS4
//
//  Created by Andrew Sowers on 3/9/15.
//  Copyright (c) 2015 Andrew Sowers. All rights reserved.
//

import Foundation
import UIKit

class SecondLevelViewController : UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var compModels:[String]=[]
    var compModelDict:[String:[String]] = Dictionary()
    var keys:[String]=[]

    override func viewDidLoad(){
        buildDictFromList(compModels)
        keys = sorted(compModelDict.keys)
        println(compModelDict)
    }
    
    override func numberOfSectionsInTableView(tableView:UITableView)->Int{
        return keys.count
    }

    func buildDictFromList(model:[String]){
        for item in model{
            let currentIndex = String(item[advance(item.startIndex, 0)]).uppercaseString
            if compModelDict[currentIndex] != nil {
                compModelDict[currentIndex]?.append(item)
            }else{
                compModelDict[currentIndex] = [item]
            }
        }
    }
    
    override func tableView(tableView:UITableView, numberOfRowsInSection section: Int)->Int{
        let key = keys[section]
        let nameSection = compModelDict[key]!
        return nameSection.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        var ident:String = String()
        if indexPath.row == 0 && indexPath.section == 0 {
            ident = "compCell1"
        }else{
            ident = "compCell"
        }
        var cell = tableView.dequeueReusableCellWithIdentifier(ident, forIndexPath: indexPath) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ident)
        }
        let key = keys[indexPath.section]
        let nameSection = compModelDict[key]!
        cell!.textLabel?.text = nameSection[indexPath.row]
        return cell!
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return keys
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue,sender:AnyObject?){
        if segue.identifier == "showDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let key = keys[indexPath.section]
                let object = compModelDict[key]?[indexPath.row]
                (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }else if segue.identifier == "showDetailOther"{
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let key = keys[indexPath.section]
                let object = compModelDict[key]?[indexPath.row]
                (segue.destinationViewController as OtherDetailsViewController).detailItem = "0th index of 0th section"
            }
        }
    }
    
    
    
}
