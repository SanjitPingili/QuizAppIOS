//
//  viewE.swift
//  newApp
//
//  Created by Sahana Krishnan on 3/3/23.
//

import SwiftUI

struct viewE: View {
    var body: some View {
        ZStack {
            Color.orange
            Image(systemName: "gearshape.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct viewE_Previews: PreviewProvider {
    static var previews: some View {
        viewE()
    }
}
