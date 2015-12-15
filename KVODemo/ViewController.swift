//
//  ViewController.swift
//  KVODemo
//
//  Created by cxria on 15/12/4.
//  Copyright © 2015年 cxria. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON
import MJRefresh
class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

  
    @IBOutlet weak var mytableview: UITableView!

    
    var datasource = MyTableViewDataSource()
    var aa = DemoDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mytableview.rowHeight = UIScreen.mainScreen().bounds.width * 9 / 16
        datasource.getInfoFromWeb()
        datasource.addObserver(self, forKeyPath: "shouldReload", options: .New, context: nil)
        
        
        self.mytableview.mj_header = MJRefreshNormalHeader(){
            self.datasource.currentCount = 0
            self.datasource.currentPage = 0
            self.datasource.jsonArray.removeAll()
            self.datasource.getInfoFromWeb()
            self.mytableview.mj_header.endRefreshing()
        }
        
        self.mytableview.mj_footer = MJRefreshAutoNormalFooter(){
            self.datasource.getInfoFromWeb()
            self.mytableview.mj_footer.endRefreshing()
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("===========\(keyPath)=========")
        if(keyPath == "shouldReload"){
            self.mytableview.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyTableViewCell
        if(self.datasource.currentCount == 0){
            return cell
        }
        let row = indexPath.row
        let page = row / 19
        let indexInPage = row % 19
        let jsonpage = self.datasource.jsonArray[page]
        if let cellimagepath = jsonpage["\(indexInPage)"]["picUrl"].string {
            let url = NSURL(string: cellimagepath)
            cell.myimage.sd_setImageWithURL(url!)
        }
        cell.countLbale.text = "===\(row)==="
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.currentCount
    }
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        datasource.removeObserver(self, forKeyPath: "jsonArray")
    }
    
    
}

