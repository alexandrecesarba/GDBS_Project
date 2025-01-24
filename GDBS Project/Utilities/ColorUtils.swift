//
//  ColorUtils.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 24/01/25.
//


import UIKit

struct ColorUtils {
    static func calculateColor(for value: Double, minValue: Double, maxValue: Double) -> UIColor {
        let normalizedValue = CGFloat((value - minValue) / (maxValue - minValue))
        print(normalizedValue)
        let red = normalizedValue
        let blue = 1.0 - normalizedValue
        return UIColor(red: red, green: 0.0, blue: blue, alpha: 0.6)
    }
}
