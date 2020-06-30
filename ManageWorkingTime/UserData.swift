//
//  UserData.swift
//  ManageWorkingTime
//
//  Created by tihimsm on 2020/06/30.
//  Copyright © 2020 tihimsm. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
