//
//  ProfileViewModel.swift
//  wspr
//
//  Created by Pinto Junior, William James on 21/01/22.
//

import Foundation

class ProfileViewModel {
    // MARK: - Constants
    let options: [Option] = [Option(title: "Preferences", subtitle: "Theme, Settings", iconName: "gearshape.fill"),
                             Option(title: "Notification", subtitle: "Ringtone, Message, Notification", iconName: "bell.badge.fill"),
                             Option(title: "Help", subtitle: "Contact Us", iconName: "ellipsis.bubble.fill"),
                             Option(title: "About", subtitle: "About the application", iconName: "info.circle.fill"),
                             Option(title: "Log Out", subtitle: "Exit from your account", iconName: "rectangle.portrait.and.arrow.right.fill")]
    // MARK: - Init
    init() {
    }
    
    // MARK: - Methods
    func getOptions() -> [Option] {
        return options
    }
}
