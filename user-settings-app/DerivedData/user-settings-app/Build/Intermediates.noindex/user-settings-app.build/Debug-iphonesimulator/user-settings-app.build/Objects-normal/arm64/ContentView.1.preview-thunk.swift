import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/kenshin/Desktop/user-settings-app/user-settings-app/user-settings-app/ContentView.swift", line: 1)
//
//  ContentView.swift
//  user-settings-app
//
//  Created by miyamotokenshin on R 7/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField(__designTimeString("#7361_0", fallback: "ユーザー名を入力してください"), text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    UserDefaults.standard.set(username, forKey: __designTimeString("#7361_1", fallback: "username"))
                } label: {
                    Text(__designTimeString("#7361_2", fallback: "保存"))
                }
            }
            Spacer()
                .navigationTitle(__designTimeString("#7361_3", fallback: "設定アプリ"))
                .toolbarTitleDisplayMode(.inline)
            // アプリ起動時の処理
                .onAppear {
                    username = UserDefaults.standard.string(forKey: __designTimeString("#7361_4", fallback: "username")) ?? __designTimeString("#7361_5", fallback: "")
                }
        }
    }
}

#Preview {
    ContentView(username: __designTimeString("#7361_6", fallback: ""))
}
