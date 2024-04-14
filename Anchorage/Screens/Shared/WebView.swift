//
//  WebView.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 11/04/2024.
//

import SwiftUI
import SafariServices
import WebKit

struct WebView: UIViewControllerRepresentable {
    
    var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

private final class WebViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
