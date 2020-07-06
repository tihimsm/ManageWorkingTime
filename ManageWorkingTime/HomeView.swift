//
//  HomeView.swift
//  ManageWorkingTime
//
//  Created by tihimsm on 2020/07/04.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("7月のデータ")
                .font(.largeTitle)

            HStack {
                Text("ここに円グラフ")
                List {
                    Text("項目１")
                    Text("項目２")
                    Text("合計")
                }
            }

            List {
                Text("詳細１に遷移")
                Text("詳細２に遷移")
            }
        }
        .padding(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
