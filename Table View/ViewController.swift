//
//  ViewController.swift
//  Table View
//
//  Created by suryasoft konsultama on 5/29/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISplitViewControllerDelegate{


    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return false
    }
    
    @IBOutlet weak var _tableViewInformation: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Table View"
        
        
        //# wajib delegate, datasource
        //# rowHeight dan estimated untuk dynamic height, harus memiliki bottom constraint
        
        
        _tableViewInformation.delegate = self
        _tableViewInformation.dataSource = self
        _tableViewInformation.rowHeight = UITableViewAutomaticDimension
        _tableViewInformation.estimatedRowHeight = 80
        _tableViewInformation.separatorStyle = .none
        //# register nib
        let myNib = UINib(nibName: tableCellInformationTableViewCell.kNAME, bundle: nil)
        _tableViewInformation.register(myNib, forCellReuseIdentifier: tableCellInformationTableViewCell.kRECYCLE)
        self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.primaryOverlay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //# pake dequeueReusable biar hemat memory
        
        let cell: tableCellInformationTableViewCell = tableView.dequeueReusableCell(withIdentifier: tableCellInformationTableViewCell.kRECYCLE, for: indexPath) as! tableCellInformationTableViewCell

        //# tidak bisa langsung init seperti ini, karena akan nil
//        let cell: tableCellInformationTableViewCell = tableCellInformationTableViewCell(
        
        cell._labelDetail.text = "please do not diggy"
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: tableCellInformationTableViewCell = tableView.cellForRow(at: indexPath) as! tableCellInformationTableViewCell
        
        
        //# alertView
        let alert: UIAlertController = UIAlertController(title: "Alert", message: cell._labelDetail.text, preferredStyle: .alert)
        
        //# closure
        let alertHandler = {(alert:UIAlertAction) -> Void in
            print(alert.title ?? "no")
        }
        let addToBookAction: UIAlertAction = UIAlertAction(title: "addT", style: .default, handler: alertHandler)
        let addToContactAction: UIAlertAction = UIAlertAction(title: "addC", style: .default, handler: alertHandler)
        let anotherAction: UIAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: alertHandler)
        
        
        alert.addAction(addToContactAction)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive){ action in
            DispatchQueue.main.async {
                super.view.backgroundColor = UIColor.blue
            }
        })
        alert.addAction(addToBookAction)
        alert.addAction(anotherAction)
        
        //# closure
        super.present(alert, animated: true, completion: nil)
        handler(){state,when in
         print(state + when)
        }
       
    }
   
   
    //# use callback
    func handler(completionHandler: (String,String)->Void){
        completionHandler("puasa", "siang")
        completionHandler("tidur", "malam")
        let myCoba = tes(node: "rumah")
        myCoba("david", "di nginden")
    }
    typealias coba = (_ string: String,String)->Void
    
    //# return a callback
    func tes(node:String) -> coba{
        
        let coba:coba =  {(name:String, address:String) ->Void in
            print ("\(node) \(name) \(address)")
        }
        return coba
    }
    
   
}



