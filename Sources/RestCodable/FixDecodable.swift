//
//  FixDecodable.swift
//  rest-codable
//
//  Created by Victor Chernykh on 21.11.2024.
//

import Foundation

///
public protocol FixDecodable {
	static var allKeyPaths: [PartialKeyPath<Self>] { get }
	static func decode(from data: Data) throws -> Self where Self: FixDecodable
	init()
}

public extension FixDecodable {

	static func decode(from data: Data) throws -> Self
	where Self: FixDecodable {
		var model: Self = .init()
		let stringData: String = String(decoding: data, as: UTF8.self)
		let rows: [String] = stringData.components(separatedBy: "\n")

		for row in rows {
			let components = row.split(separator: "|", maxSplits: 1, omittingEmptySubsequences: false)
			guard components.count > 0, let i: Int = .init(components[0]) else {
				throw "FixDecodable invalid row: \(row)"
			}
			// Get keyPath by index
			let keyPath: PartialKeyPath<Self> = Self.allKeyPaths[i]

			switch keyPath {
			case let keyPath as WritableKeyPath<Self, String>:
				if components.count > 1 {
					model[keyPath: keyPath] = String(components[1])
				} else {
					model[keyPath: keyPath] = ""
				}
				continue
			case let keyPath as WritableKeyPath<Self, String?>:
				if components.count > 1 {
					model[keyPath: keyPath] = String(components[1])
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, Int>:
				if components.count > 1, let value: Int = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = 0
				}
				continue
			case let keyPath as WritableKeyPath<Self, Int?>:
				if components.count > 1, let value: Int = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, UInt>:
				if components.count > 1, let value: UInt = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = 0
				}
				continue
			case let keyPath as WritableKeyPath<Self, UInt?>:
				if components.count > 1, let value: UInt = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, Double>:
				if components.count > 1, let value: Double = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = 0
				}
				continue
			case let keyPath as WritableKeyPath<Self, Double?>:
				if components.count > 1, let value: Double = .init(components[1]) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, UUID>:
				if components.count > 1, let value: UUID = UUID(uuidString: String(components[1])) {
					model[keyPath: keyPath] = value
				} else {
					throw "FixDecodable invalid row: \(row)"
				}
				continue
			case let keyPath as WritableKeyPath<Self, UUID?>:
				if components.count > 1, let value: UUID = UUID(uuidString: String(components[1])) {
					model[keyPath: keyPath] = value
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, Bool>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1] == "1"
				} else {
					model[keyPath: keyPath] = false
				}
				continue
			case let keyPath as WritableKeyPath<Self, Bool?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1] == "1"
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, Date>:
				if components.count > 1, let interval: Double = Double(components[1]) {
					model[keyPath: keyPath] = Date(timeIntervalSince1970: interval)
				} else {
					model[keyPath: keyPath] = Date(timeIntervalSince1970: 0)
				}
				continue
			case let keyPath as WritableKeyPath<Self, Date?>:
				if components.count > 1, let interval: Double = Double(components[1]) {
					model[keyPath: keyPath] = Date(timeIntervalSince1970: interval)
				} else {
					model[keyPath: keyPath] = nil
				}
				continue
			case let keyPath as WritableKeyPath<Self, [String]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t")
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [Int]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { Int($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [UInt]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { UInt($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [Double]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { Double($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [UUID]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = try components[1].components(separatedBy: "\t").map {
						if let id: UUID = UUID(uuidString: $0) {
							return id
						} else {
							throw "FixDecodable invalid UUID value: \($0)"
						}
					}
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [Bool]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { $0 == "1" }
				} else {
					model[keyPath: keyPath] = nil
				}
			case let keyPath as WritableKeyPath<Self, [Date]?>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1]
						.components(separatedBy: "\t")
						.map { Double($0) ?? 0 }
						.map { Date(timeIntervalSince1970: $0) }
				} else {
					model[keyPath: keyPath] = nil
				}

			case let keyPath as WritableKeyPath<Self, [String]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t")
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [Int]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { Int($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [UInt]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { UInt($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [Double]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { Double($0) ?? 0 }
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [UUID]>:
				if components.count > 1 {
					model[keyPath: keyPath] = try components[1].components(separatedBy: "\t").map {
						if let id: UUID = UUID(uuidString: $0) {
							return id
						} else {
							throw "FixDecodable invalid UUID value: \($0)"
						}
					}
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [Bool]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1].components(separatedBy: "\t").map { $0 == "1" }
				} else {
					model[keyPath: keyPath] = []
				}
			case let keyPath as WritableKeyPath<Self, [Date]>:
				if components.count > 1 {
					model[keyPath: keyPath] = components[1]
						.components(separatedBy: "\t")
						.map { Double($0) ?? 0 }
						.map { Date(timeIntervalSince1970: $0) }
				} else {
					model[keyPath: keyPath] = []
				}
			default:
				throw "Unsupported property type"
			}
		}
		return model
	}
}
