//
//  MyTableViewDataSource.swift
//  KVODemo
//
//  Created by cxria on 15/12/4.
//  Copyright © 2015年 cxria. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MyTableViewDataSource : NSObject {
   
    var jsonArray = [JSON]()
    var currentPage = 0
    var currentCount = 0
    var shouldReload = false
    func getInfoFromWeb() {
        let param = ["num" : "20"]
        let header = ["apikey" : "7a558db2864fcc30a5b23d4335145ad5"]
        Alamofire.request(.GET, "http://apis.baidu.com/txapi/mvtp/meinv", parameters: param, encoding: .URL, headers: header).responseJSON(){
            response in
            if(response.result.isSuccess){
                if let data = response.data{
                    let json = JSON(data: data)
                    print(json.object)
                    if(json["code"].intValue == 200 && json["msg"].string! == "ok" ){
                        let count = json.count - 2
                        if(count > 0){
                            self.willChangeValueForKey("shouldReload")
                            self.jsonArray.append(json)
                            self.currentPage += 1
                            self.currentCount = self.currentCount + count
                            self.didChangeValueForKey("shouldReload")
                        }
                    }
                }else{
                    print("=====data is  nil ====")
                }
            }else{
                print("======failed begin =====")
                print(response.request)
                print(response.response)
                print(response.result)
                print("======failed end =====")
            }
            
        
        }
        
      
      
    }
    
    
    
}