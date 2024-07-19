//
//  DashboardView.swift
//  novision
//
//  Created by Thabhelo Duve on 7/18/24.
//

import SwiftUI
import WebKit
import CoreData

struct DashboardView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
