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
    let userDefaults = UserDefaults.standard
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Label("ユーザー情報", systemImage: "person.circle")) {
                    Label {
                        TextField("ユーザー名を入力してください", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } icon: {
                        Image(systemName: "person.fill")
                    }
                    Stepper(value: $ageCount, in: 0...100, step: 1) {
                        Label {
                            Text("年齢:\(ageCount)歳")
                        } icon: {
                            Image(systemName: "calendar")
                                .foregroundStyle(Color.orange)
                        }
                    }
                }
                
                Section(header: Label("現在の設定", systemImage: "eye")) {
                    LabeledContent {
                        Text(username)
                    } label: {
                        Label {
                            Text("ユーザー名")
                        } icon: {
                            Image(systemName: "person.text.rectangle")
                                .foregroundStyle(Color.green)
                        }
                    }
                    LabeledContent {
                        Text("\(ageCount)歳")
                    } label: {
                        Label {
                            Text("年齢")
                        } icon: {
                            Image(systemName: "number")
                                .foregroundStyle(Color.orange)
                        }
                    }
                }
                
                Section(header: Label("現在の設定", systemImage: "lock")) {
                    Button {
                        userDefaults.removeObject(forKey: "username")
                        userDefaults.removeObject(forKey: "ageCount")
                        username = ""
                        ageCount = 0
                    } label: {
                        Label("設定をリセット", systemImage: "arrow.trianglehead.counterclockwise")
                            .foregroundStyle(Color.red)
                    }
                }
            }
            .navigationTitle("設定")
            .onChange(of: username, initial: false) {
                userDefaults.set(username, forKey: "username")
            }
            
            .onChange(of: ageCount, initial: false) {
                userDefaults.set(ageCount, forKey: "ageCount")
            }
            Spacer()
        }
        // アプリ起動時の処理
        .onAppear {
            username = userDefaults.string(forKey: "username") ?? ""
            ageCount = userDefaults.integer(forKey: "ageCount")
        }
    }
}

#Preview {
    ContentView()
}
