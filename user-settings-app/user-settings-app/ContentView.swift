//
//  ContentView.swift
//  user-settings-app
//
//  Created by miyamotokenshin on R 7/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var ageCount: Int = 20
    var body: some View {
        NavigationStack {
            VStack(spacing: -10) {
                TextField("ユーザー名を入力してください", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Stepper(value: $ageCount, in: 0...100, step: 1) {
                    Text("年齢:\(ageCount)歳")
                }
                .padding()
                
                Button {
                    UserDefaults.standard.set(username, forKey: "username")
                    UserDefaults.standard.set(ageCount, forKey: "ageCount")
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
            ageCount = UserDefaults.standard.integer(forKey: "ageCount")
        }
    }
}

#Preview {
    ContentView()
}
