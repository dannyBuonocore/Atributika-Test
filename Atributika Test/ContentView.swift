//
//  ContentView.swift
//  Atributika Test
//
//  Created by Danny Buonocore on 10/15/20.
//  Copyright © 2020 Live Coin Watch. All rights reserved.
//

import SwiftUI
import Atributika

struct ContentView: View {
  let html = "<p>test</p>\n<p>yeah</p>\n<p>test</p>\n<p>again</p>\n"
  var body: some View {
    VStack {
      List {
        HTMLViewUILabel(html: html)
      }
      List {
        HTMLViewAttributedLabel(html: html)
      }
    }
  }
}


struct HTMLViewUILabel: UIViewRepresentable {
  let html: String
  
  func makeUIView(context: Context) -> UILabel {
    let all = Style.font(.systemFont(ofSize: 16))
    let link = Style("a")
      .foregroundColor(.systemTeal, .normal)
      .foregroundColor(.systemTeal, .highlighted)
    
    let attributedText = html
      .style(tags: link)
      .styleLinks(link)
      .styleAll(all)
    
    let label = UILabel()
    label.attributedText = attributedText.attributedString
    label.numberOfLines = 0
    label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    let size = label.sizeThatFits(CGSize(width: 280, height: CGFloat.greatestFiniteMagnitude))
    label.frame = CGRect(origin: .zero, size: size)
    
    return label
  }
  
  func updateUIView(_ uiView: UILabel, context: Context) {
    
  }
}


struct HTMLViewAttributedLabel: UIViewRepresentable {
  let html: String
  
  func makeUIView(context: Context) -> AttributedLabel {
    let all = Style.font(.systemFont(ofSize: 16))
    let link = Style("a")
      .foregroundColor(.systemTeal, .normal)
      .foregroundColor(.systemTeal, .highlighted)
    
    let attributedText = html
      .style(tags: link)
      .styleLinks(link)
      .styleAll(all)
    
    let label = AttributedLabel()
    label.attributedText = attributedText
    label.numberOfLines = 0
    label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    let size = label.sizeThatFits(CGSize(width: 280, height: CGFloat.greatestFiniteMagnitude))
    label.frame = CGRect(origin: .zero, size: size)
    
    return label
  }
  
  func updateUIView(_ uiView: AttributedLabel, context: Context) {
    
  }
}

