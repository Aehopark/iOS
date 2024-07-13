//
//  Fonts+.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import Foundation
import SwiftUI

extension Font {
    static func Roboto(size fontSize: CGFloat, font: String) -> Font{
        var fontName: String
        switch font {
        case "medium":
            fontName = "Roboto-Medium"
        case "regular":
            fontName = "Roboto-Regular"
        case "semibold":
            fontName = "Roboto-Bold"
        default:
            fontName = "Roboto-Regular"
        }
        
        return Font.custom(fontName, size: fontSize)
    }
    
    enum roboto {
        case medium
        case regular
        case semibold
        
        var name: String {
            switch self {
            case .medium:
                return "Roboto-Medium"
            case .regular:
                return "Roboto-Regular"
            case .semibold:
                return "Roboto-Bold"
            }
        }
    }

    
    /// custom Font.
    // .font(.Roboto(.medium, size: 12))
    static func Roboto(_ weight: roboto = .medium, size: CGFloat) -> Font {
        
        return custom(weight.name, size: size)
    }
    
    static func RobotoMono(size fontSize: CGFloat, font: String) -> Font{
        var fontName: String
        switch font {
        case "regular":
            fontName = "RobotoMono-Regular"
        default:
            fontName = "RobotoMono-Regular"
        }
        
        return Font.custom(fontName, size: fontSize)
    }
    
    enum roboto_mono {
        case regular
        
        var name: String {
            switch self {
            case .regular:
                return "RobotoMono-Regular"
            }
        }
    }

    
    /// custom Font.
    // .font(.RobotoMono(.regular, size: 12))
    static func RobotoMono(_ weight: roboto_mono = .regular, size: CGFloat) -> Font {
        
        return custom(weight.name, size: size)
    }
    
    
    static func Inter(size fontSize: CGFloat, font: String) -> Font{
        var fontName: String
        switch font {
        case "medium":
            fontName = "Inter-Medium"
        case "regular":
            fontName = "Inter-Regular"
        case "semibold":
            fontName = "Inter-SemiBold"
        default:
            fontName = "Inter-Medium"
        }
        
        return Font.custom(fontName, size: fontSize)
    }
    
    enum inter {
        case medium
        case regular
        case semibold
        
        var name: String {
            switch self {
            case .medium:
                return "Inter-Medium"
            case .regular:
                return "Inter-Regular"
            case .semibold:
                return "Inter-SemiBold"
            }
        }
    }

    
    /// custom Font.
    // .font(.Inter(.medium, size: 12))
    static func Inter(_ weight: inter = .medium, size: CGFloat) -> Font {
        
        return custom(weight.name, size: size)
    }
    
    
    static func SansitaOne(size fontSize: CGFloat, font: String) -> Font{
        var fontName: String
        switch font {
        case "regular":
            fontName = "SansitaOne"
        default:
            fontName = "SansitaOne"
        }
        
        return Font.custom(fontName, size: fontSize)
    }
    
    enum sansitaone {
        case regular
        
        var name: String {
            switch self {
            case .regular:
                return "SansitaOne"
            }
        }
    }

    
    /// custom Font.
    // .font(.SansitaOne(.SansitaOne, size: 12))
    static func SansitaOne(_ weight: sansitaone = .regular, size: CGFloat) -> Font {
        
        return custom(weight.name, size: size)
    }
}
