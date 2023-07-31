//
//  Constant.swift
//  MyResumeApp
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "王啓豪(Aleng)"
    let title    = "iOS 開發初心者"
    let location = "位置：台灣-台南"
    let bio      = "努力學習 Swift 開發中，朝夢想前進～\n目標成為全能工程師！！！\n學習之餘會下棋與閱讀小說，放假時喜歡去戶外露營、釣魚這是我最近培養的興趣。"
    let skills   = ["swift", "csharp", "css", "html", "javascript"]
    let interest = ["圍棋", "露營", "路亞"]
    let experiences: [Experience] = [("設計工程師",
                                      "景欣股份有限公司",
                                      "2021 年 3 月",
                                      "現在"),
                                     ("研發助理工程師",
                                      "亞獵士航太科技",
                                      "2019 年 10 月",
                                      "2021 年 2 月")]
    let phoneUrl = "tel://0983298941"
    let socialMedia: [(name: String, url: String)] = [("twitter","https://twitter.com/Aleng199"),
                                                      ("Line","https://line.me/ti/p/MmPDgSgpLd"),
                                                      ("instagran","https://instagram.com/deathless9227?igshid=OGQ5ZDc2ODk2ZA==")]
}

