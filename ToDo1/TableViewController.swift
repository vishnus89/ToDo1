//
//  TableViewController.swift
//  ToDo1
//
//  Created by Vishnu Deep Samikeri on 4/6/18.
//  Copyright © 2018 vDeep. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.estimatedRowHeight = 19
        table.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.label.text = String(indexPath.row)
        cell.toggleCell(index: indexPath)
        cell.backgroundColor = UIColor.cyan

        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
        })
        closeAction.backgroundColor = .purple
        
        
        return UISwipeActionsConfiguration(actions: [closeAction])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let more = UIContextualAction(style: .normal, title:  "More", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
             success(true)
            print("More Button Pressed")
            view.backgroundColor = UIColor.blue
        })
        more.backgroundColor = .purple
        
        let favorite = UIContextualAction(style: .normal, title:  "Favorite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
            print("Fav Button Pressed")
            view.backgroundColor = UIColor.green
        })
        favorite.backgroundColor = .orange
        
        let share = UIContextualAction(style: .normal, title:  "Share", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
            print("Share Button Pressed")
            view.backgroundColor = UIColor.black
        })
    
        share.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [share, favorite, more])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        if cell.selectedCellIndexpath == nil {
            cell.selectedCellIndexpath = indexPath
        }else if cell.selectedCellIndexpath != indexPath {
            let index = cell.selectedCellIndexpath!
            cell.selectedCellIndexpath = nil
            tableView.reloadRows(at: [index], with: UITableViewRowAnimation.none)
            cell.selectedCellIndexpath = indexPath
        }else{
            cell.selectedCellIndexpath = nil
        }
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
}


