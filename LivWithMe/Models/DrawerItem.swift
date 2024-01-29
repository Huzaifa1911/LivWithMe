//
//  MenuItem.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 27/01/2024.
//

import UIKit

enum DrawerItem: String, CaseIterable {
    case home
    case profile
    case nearby
    case bookmark
    case notification
    case message
    case setting
    case help
    case logout
    
    var title: String {
        rawValue.capitalized
    }
    
    var image: UIImage? {
        var icon: UIImage?
        
        switch self {
        case .home:
            icon =  .icons.homeIcon
            break
        case .profile:
            icon =  .icons.profileIcon
            break
        case .nearby:
            icon =  .icons.nearbyIcon
            break
        case .bookmark:
            icon =  .icons.bookmarkIcon
            break
        case .notification:
            icon =  .icons.notificationIcon
            break
        case .message:
            icon =  .icons.messageIcon
            break
        case .setting:
            icon =  .icons.settingIcon
            break
        case .help:
            icon =  .icons.helpIcon
            break
        case .logout:
            icon =  .icons.logoutIcon
            break
        }
        return icon
    }
    
    var shouldAddDivider: Bool {
        var hasDivider: Bool = false
        
        switch self {
        case .home:
            hasDivider = false
            break
        case .profile:
            hasDivider = false
            break
        case .nearby:
            hasDivider = true
            break
        case .bookmark:
            hasDivider = false
            break
        case .notification:
            hasDivider = false
            break
        case .message:
            hasDivider = true
            break
        case .setting:
            hasDivider = false
            break
        case .help:
            hasDivider = false
            break
        case .logout:
            hasDivider = false
            break
        }
        return hasDivider
    }
}
