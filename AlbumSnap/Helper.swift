//
//  Helper.swift
//  AlbumSnap
//
//  Created by Aaron Monick on 2/26/17.
//  Copyright © 2017 AlbumSnap. All rights reserved.
//

import UIKit

let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
let docDir = URL(fileURLWithPath: documentsDirectoryPath)
let tempDir = URL(fileURLWithPath: NSTemporaryDirectory())

extension UIImage {
    var data: Data? {
        return UIImageJPEGRepresentation(self, 1.0)
    }
}

extension URL {
    var canOpen: Bool {
        return UIApplication.shared.canOpenURL(self)
    }

    func open() {
        if self.canOpen {
            UIApplication.shared.open(self, options: [:], completionHandler: nil)
        }
    }
}

extension RawRepresentable where RawValue == Int {

    static var itemsCount: Int {
        var index = 0
        while Self(rawValue: index) != nil { index += 1 }
        return index
    }

    static var items: [Self] {
        var items: [Self] = []
        var index = 0
        while let item = Self(rawValue: index) {
            items.append(item)
            index += 1
        }
        return items
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    open override var prefersStatusBarHidden: Bool {
        return topViewController?.prefersStatusBarHidden ?? false
    }
}
