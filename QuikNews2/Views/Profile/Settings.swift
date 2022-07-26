//
//  Settings.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/2/22.
//

import SwiftUI
import FirebaseAuthUI
import FirebaseAuth

struct Settings: View {
    
    @Binding var loggedIn: Bool
    var body: some View {
       
        exper(loggedIn: $loggedIn)
    }
}


