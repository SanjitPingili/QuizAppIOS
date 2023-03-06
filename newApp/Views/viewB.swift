//
//  viewB.swift
//  newApp
//
//  Created by Sahana Krishnan on 3/3/23.
//

import SwiftUI

struct viewB: View {
    var body: some View {
        ZStack {
            Color.orange
            Image(systemName: "chart.bar.doc.horizontal.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 0.0))
        } 
    }
}

struct viewB_Previews: PreviewProvider {
    static var previews: some View {
        viewB()
    }
}
