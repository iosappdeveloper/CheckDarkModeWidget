//
//  TodayViewController.swift
//  CheckDarkMode
//
//  Created by Matoria, Ashok on 10/10/19.
//  Copyright © 2019 Matoria, Ashok. All rights reserved.
//

import UIKit
import NotificationCenter

// Seems current APIs to disable dark mode in app target does not work in Todays Extension.
// Futher, to make things worse the userInterfaceStyle values of traitCollection within the extension UI are based on main app.
class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let label = view.subviews.first as? UILabel {
            let text: String
            switch self.traitCollection.userInterfaceStyle {
            case .dark:
                text = "Dark"
            case .light:
                text = "Light"
            case .unspecified:
                text = "unspecified"
            @unknown default:
                text = "unknown"
            }
            label.text = text
            
            label.textColor = UIColor.label
            view.backgroundColor = UIColor.systemBackground
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
