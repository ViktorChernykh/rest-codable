//
//  FixEncodable.swift
//  rest-codable
//
//  Created by Victor Chernykh on 21.11.2024.
//

import Foundation

///
public protocol FixEncodable {
	func toData(includeDefault: Bool) -> Data
}

public extension FixEncodable {

	func toData(includeDefault: Bool = false) -> Data {
		let mirror = Mirror(reflecting: self)
		var rows: [String] = .init()

		var i: UInt8 = 0
		for child in mirror.children {

			if Mirror(reflecting: child.value).displayStyle == .optional {
				if let value = child.value as? Optional<String> {
					if let value {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<Int> {
					if let value {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<UInt> {
					if let value {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<Double> {
					if let value {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<UUID> {
					if let value {
						rows.append("\(i)|\(value.uuidString)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<Bool> {
					if let value {
						let bool: String = value ? "1" : ""
						rows.append("\(i)|\(bool)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Optional<Date> {
					if let value {
						rows.append("\(i)|\(value.timeIntervalSince1970)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [String]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0.replacingOccurrences(of: "\t", with: "  ") }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [Int]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [UInt]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [Double]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [UUID]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0.uuidString }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [Bool]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { $0 ? "1" : "" }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				} else if let values = child.value as? [Date]? {
					if values != nil || includeDefault {
						rows.append("\(i)")
					}
					if let values, values.count > 0 {
						let rowData: String = values.map { "\($0.timeIntervalSince1970)" }.joined(separator: "\t")
						rows.append("|\(rowData)")
					}
				}
			} else {
				// Processing of standard types
				if let value = child.value as? String {
					if !value.isEmpty {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Int {
					if value != 0 {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? UInt {
					if value != 0 {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Double {
					if value != 0 {
						rows.append("\(i)|\(value)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? UUID {
					rows.append("\(i)|\(value.uuidString)")
				} else if let value = child.value as? Bool {
					if value {
						rows.append("\(i)|1")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let value = child.value as? Date {
					if value > Date(timeIntervalSince1970: 0) {
						rows.append("\(i)|\(value.timeIntervalSince1970)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [String] {
					if values.count > 0 {
						let rowData: String = values.map { $0.replacingOccurrences(of: "\t", with: "  ") }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [Int] {
					if values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [UInt] {
					if values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [Double] {
					if values.count > 0 {
						let rowData: String = values.map { $0 != 0 ? String($0) : "" }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [UUID] {
					if values.count > 0 {
						let rowData: String = values.map { $0.uuidString }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [Bool] {
					if values.count > 0 {
						let rowData: String = values.map { $0 ? "1" : "" }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				} else if let values = child.value as? [Date] {
					if values.count > 0 {
						let rowData: String = values.map { "\($0.timeIntervalSince1970)" }.joined(separator: "\t")
						rows.append("\(i)|\(rowData)")
					} else if includeDefault {
						rows.append("\(i)")
					}
				}
			}
			i += 1
		}
		return Data(rows.joined(separator: "\n").utf8)
	}
}
