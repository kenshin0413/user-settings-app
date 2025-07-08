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
                TextField("ユーザー名を入力してください", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    UserDefaults.standard.set(username, forKey: "username")
                } label: {
                    Text("保存")
                }
            }
            Spacer()
                .navigationTitle("設定アプリ")
                .toolbarTitleDisplayMode(.inline)
        }
        // アプリ起動時の処理
        .onAppear {
            username = UserDefaults.standard.string(forKey: "username") ?? ""
        }
    }
}

#Preview {
    ContentView()
}
