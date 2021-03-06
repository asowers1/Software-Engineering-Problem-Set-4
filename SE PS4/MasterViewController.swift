//
//  MasterViewController.swift
//  SE PS4
//
//  Created by Andrew Sowers on 3/9/15.
//  Copyright (c) 2015 Andrew Sowers. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    //var objects = NSMutableArray()
    let objects : [String] = ["Windows", "Apple", "Sun"]
    
    let objectsSub: [String] = ["Good","Better","Best"]
    
    let appleComp : [String] = ["MacBook","MacBook Pro","iMac","Mac Mini","Mac Pro","Apple Watch","iPad","iPod","Newton","Lisa","PowerBook","Performa","Prismo","QuickTake","iBook","NeXTSTEP Cube","MacBook Air","AppleTV","Quadra","eMac"]
    
    let winComp : [String] = ["Dell Inspiron 20 3000", "Dell Inspiron 23 5000", "HP Envy 810", "HP Pavillion 23 TouchSmart", "Lenovo M83", "Lenovo P500", "Microsoft Surface", "Compaq Persario", "Dell Precision Tower 5810", "HP Z840 Workstation", "Lenovo B50", "Lenovo Erazer X315", "Velocity Micro Edge Z55 (2014)", "Digital Storm Eclipse", "Asus Chromebox M004U", "Asus EEE PC", "Lenovo Yoga", "Nokia Lumia", "Sony VAIO", "Visio"]
    
    let sunComp : [String] = ["Oracle Solaris 10", "Oracle Solaris 11", "SPARC T4-1 Server", "Fujitsu M10-1 Server", "Oracle SuperCluster T5-8", "MySQL", "Java", "Sun Solaris", "Solaris Cluster", "HPC Cluster Tools", "JavaDB", "NetBeans", "Sun Role Manager", "OpenOffice.org", "Sun Studio", "Sun VirtualBox", "Sun iPlanet", "Netra SPARC T4-1 Server","Netra SPARC T5-1B Server Module","Netra SPARC T4-2 Server"]
    
    var compModels : [[String]] = []
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        compModels = [winComp, appleComp, sunComp]
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    func insertNewObject(sender: AnyObject) {
        objects.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    */
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToSecondLevel" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = compModels[indexPath.row]
                (segue.destinationViewController as SecondLevelViewController).compModels = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = objects[indexPath.row]
        cell.textLabel!.text = objects[indexPath.row]
        if let image: UIImage = UIImage(named: objects[indexPath.row]) as UIImage! {
            cell.imageView?.image = image
        }
        cell.detailTextLabel?.text = objectsSub[indexPath.row]
        return cell
    }

    /*
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    */

}

