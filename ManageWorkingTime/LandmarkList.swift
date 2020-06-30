//
//  LandmarkList.swift
//  ManageWorkingTime
//
//  Created by tihimsm on 2020/06/30.
//  Copyright © 2020 tihimsm. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text(L10n.favoritesOnly)
            }
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text(L10n.landmarksNaviagationTitle))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList().environmentObject(UserData())
        }
    }
}
