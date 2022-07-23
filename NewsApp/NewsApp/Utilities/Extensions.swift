//
//  Extensions.swift
//  NewsApp
//
//  Created by Eslam Ali  on 22/07/2022.
//

import Foundation
import ProgressHUD

// String extension for Localization
extension String {
    func localized(forLanguageCode lanCode: String) -> String {
        guard
            let bundlePath = Bundle.main.path(forResource: lanCode, ofType: "lproj"),
            let bundle = Bundle(path: bundlePath)
        else { return "" }
        
        return NSLocalizedString(
            self,
            bundle: bundle,
            value: " ",
            comment: ""
        )
    }
}

// DateFormatter
func dateFormat(date: String) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MMM-dd"
    let myDate = dateFormatter.date(from: date) ?? Date()
    
    dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
    dateFormatter.locale = Locale(identifier: NSLocale.preferredLanguages[0])
    return dateFormatter.string(from: myDate)
}


//MARK:- Customize Loading Indicator
public func showProgress(){
    ProgressHUD.animationType = .circleStrokeSpin
    ProgressHUD.colorAnimation = .systemPink
    ProgressHUD.show()
}
