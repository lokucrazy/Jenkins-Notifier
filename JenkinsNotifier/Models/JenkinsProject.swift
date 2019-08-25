//
//  JenkinsProject.swift
//  JenkinsNotifier
//
//  Created by Ryan Lokugamage on 8/24/19.
//  Copyright © 2019 Ryan Lokugamage. All rights reserved.
//

import Foundation
import RealmSwift

class JenkinsProject: Object {
    @objc dynamic var name: String?
    @objc dynamic var location: String?
    
    var url: URL? {
        get {
            return URL(string: location ?? "")
        }
        set(url) {
            location = url?.absoluteString
        }
    }
    
    convenience init(_ name: String, _ url: URL) {
        self.init()
        self.name = name
        self.url = url
    }
    
    func retrieveRecentBuilds() -> [JenkinsBuild] {
        return [JenkinsBuild("Build 1", "SUCCEEDED")]
    }
}
