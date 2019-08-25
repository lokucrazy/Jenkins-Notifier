//
//  JenkinsBuild.swift
//  JenkinsNotifier
//
//  Created by Ryan Lokugamage on 8/24/19.
//  Copyright © 2019 Ryan Lokugamage. All rights reserved.
//

import Foundation
import RealmSwift

class JenkinsBuild: Object {
    @objc dynamic var name: String?
    @objc dynamic var status: String?
}
