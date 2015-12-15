//
//  DemoDataSource.swift
//  KVODemo
//
//  Created by cxria on 15/12/4.
//  Copyright © 2015年 cxria. All rights reserved.
//

import Foundation

class DemoDataSource : NSObject{
    
    var isShowing = false
    var mydata = 100
    var _NAME :String = ""
    var NAME :String {
        get {
            return _NAME
        }
        
        set(newValue) {
            self._NAME = newValue
        }
    }
    var array = [1,2,3,4,5,6,7,8,9,10]
    func getdata(){
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "timefired", userInfo: nil, repeats: false)
    }
    
    func getMydata()->Int{
        return mydata
    }

    var i = 0
    func myarray(){
        print("get array")
        //NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "timefired2", userInfo: nil, repeats: false)
        self.willChangeValueForKey("array")
        array[4] = 200
        self.didChangeValueForKey("array")
    }
    
    func timefired2(){
        let set = NSIndexSet(index: 4)
        self.willChange(.Replacement, valuesAtIndexes: set, forKey: "array")
        array[4] = 200
        self.didChange(.Replacement, valuesAtIndexes: set, forKey: "array")
    }
    
    func countOfArray()->Int{
        return array.count
    }
    
    
    func objectInArrayAtIndex(index:Int)->Int{
        return self.array[index]
    }
}