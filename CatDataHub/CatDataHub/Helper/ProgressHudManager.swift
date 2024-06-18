//
//  ProgressHudManager.swift
//  CatDataHub
//
//  Created by Payal Porwal on 16/06/24.
//

import Foundation
import SVProgressHUD

class ProgressHudManager {
    
    // MARK: - addProgressHUD
    /**
     - description: - addProgressHUD will add the progress bar on top of the controller.
     */
    static func addProgressHUD() {
        SVProgressHUD.setBackgroundColor(UIColor.systemGray6)
        SVProgressHUD.setForegroundColor(UIColor.black)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    // MARK: - hideProgressHUD
    /**
     - description: - addProgressHUD will hide the progress bar .
     */
    static func hideProgressHUD() {
        SVProgressHUD.dismiss()
    }
}
