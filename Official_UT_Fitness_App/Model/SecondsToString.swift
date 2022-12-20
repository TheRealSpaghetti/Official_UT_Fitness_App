//
//  SecondsToString.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-18.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import Foundation

struct TimeStringGetter{
    
    func getString(timeData:Int) -> String{
        
        //time left is greater than a minute
        if(timeData >= 60){
            var minutes: Int
            minutes = timeData/60
            let seconds = timeData%60

        if(seconds >= 10){
                return "0\(minutes):\(seconds)"
            } else {
                return "0\(minutes):0\(seconds)"
            }
        }
        
        //double digit seconds
        if(timeData >= 10){
            return "00:\(timeData)"
        }
        //single digit seconds
        return "00:0\(timeData)"
    }
    
}
