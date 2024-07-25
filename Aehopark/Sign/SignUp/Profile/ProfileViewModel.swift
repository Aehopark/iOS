//
//  ProfileViewModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/24/24.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    @Published var showImagePicker: Bool = false

    init(profile: Profile = Profile()) {
        self.profile = profile
    }

    func resizeImage(_ image: UIImage, to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }

    func updateProfileImage(_ image: UIImage) {
        if let resizedImage = resizeImage(image, to: CGSize(width: 200, height: 200)) {
            profile.image = resizedImage
        }
    }
}
