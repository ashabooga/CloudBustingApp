//
//  ExpandableTextView.swift
//  CloudBusting
//
//  Created by Ben Cuello-Wolffe on 7/5/24.
//

import SwiftUI

struct ExpandableTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    ExpandableTextView(text: CloudModel.Cumulus.aboutInfo)
}
