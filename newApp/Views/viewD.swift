//
//  viewD.swift
//  newApp
//
//  Created by Sahana Krishnan on 3/3/23.
//

import SwiftUI

struct viewD: View {
    var body: some View {
        ZStack {
            Color.orange
            Image(systemName: "chart.bar.xaxis")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct viewD_Previews: PreviewProvider {
    static var previews: some View {
        viewD()
    }
}
