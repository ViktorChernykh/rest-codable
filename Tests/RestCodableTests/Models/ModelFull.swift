@testable import RestCodable
import Foundation

struct ModelFull: FixCodable {
	static var allKeyPaths: [PartialKeyPath<Self>] {
		[
			\.id, \.idO, \.string, \.stringO, \.bool, \.boolO,
			 \.int, \.intO, \.uInt, \.uIntO, \.double, \.doubleO, \.date, \.dateO,
			 \.ids, \.idsO, \.strings, \.stringsO, \.bools, \.boolsO,
			 \.ints, \.intsO, \.uInts, \.uIntsO, \.doubles, \.doublesO, \.dates, \.datesO
		]
	}

	var id: UUID = UUID()			// 0
	var idO: UUID? = nil			// 1

	var string: String = ""			// 2
	var stringO: String? = nil		// 3

	var bool: Bool = false			// 4
	var boolO: Bool? = nil			// 5

	var int: Int = 0				// 6
	var intO: Int? = nil			// 7

	var uInt: UInt = 0				// 8
	var uIntO: UInt? = nil			// 9

	var double: Double = 0			// 10
	var doubleO: Double? = nil		// 11

	var date: Date = Date(timeIntervalSince1970: 0)	// 12
	var dateO: Date? = nil			// 13

	var ids: [UUID] = []			// 14
	var idsO: [UUID]? = nil			// 15

	var strings: [String] = []		// 16
	var stringsO: [String]? = nil	// 17

	var bools: [Bool] = []			// 18
	var boolsO: [Bool]? = nil		// 19

	var ints: [Int] = []			// 20
	var intsO: [Int]? = nil			// 21

	var uInts: [UInt] = []			// 22
	var uIntsO: [UInt]? = nil		// 23

	var doubles: [Double] = []		// 24
	var doublesO: [Double]? = nil	// 25

	var dates: [Date] = []			// 26
	var datesO: [Date]? = nil		// 27

	init() { }

	static func == (lhs: ModelFull, rhs: ModelFull) -> Bool {
		if lhs.id != rhs.id {
			print("id: \(lhs.id) != \(rhs.id)")
			return false
		}
		if lhs.string != rhs.string {
			print("string: \(lhs.string) != \(rhs.string)")
			return false
		}
		if lhs.bool != rhs.bool {
			print("bool: \(lhs.bool) != \(rhs.bool)")
			return false
		}
		if lhs.int != rhs.int {
			print("int: \(lhs.int) != \(rhs.int)")
			return false
		}
		if lhs.uInt != rhs.uInt {
			print("uInt: \(lhs.uInt) != \(rhs.uInt)")
			return false
		}
		if lhs.double != rhs.double {
			print("double: \(lhs.double) != \(rhs.double)")
			return false
		}
		let lhsDate = Date(timeIntervalSince1970: lhs.date.timeIntervalSince1970.rounded(.toNearestOrAwayFromZero))
		let rhsDate = Date(timeIntervalSince1970: rhs.date.timeIntervalSince1970.rounded(.toNearestOrAwayFromZero))
		if lhsDate != rhsDate {
			print("date: \(lhs.date) != \(rhs.date)")
			return false
		}

		if lhs.idO != rhs.idO {
			print("idO: \(String(describing: lhs.idO)) != \(String(describing: rhs.idO))")
			return false
		}
		if lhs.stringO != rhs.stringO {
			print("stringO: \(String(describing: lhs.stringO)) != \(String(describing: rhs.stringO))")
			return false
		}
		if lhs.boolO != rhs.boolO {
			print("boolO: \(String(describing: lhs.boolO)) != \(String(describing: rhs.boolO))")
			return false
		}
		if lhs.intO != rhs.intO {
			print("intO: \(String(describing: lhs.intO)) != \(String(describing: rhs.intO))")
			return false
		}
		if lhs.uIntO != rhs.uIntO {
			print("uIntO: \(String(describing: lhs.uIntO)) != \(String(describing: rhs.uIntO))")
			return false
		}
		if lhs.doubleO != rhs.doubleO {
			print("doubleO: \(String(describing: lhs.doubleO)) != \(String(describing: rhs.doubleO))")
			return false
		}
		if let lhsDateO = lhs.dateO, let rhsDateO = rhs.dateO {
			let lhs_DateO: Date = Date(timeIntervalSince1970: lhsDateO.timeIntervalSince1970.rounded(.toNearestOrAwayFromZero))
			let rhs_DateO: Date = Date(timeIntervalSince1970: rhsDateO.timeIntervalSince1970.rounded(.toNearestOrAwayFromZero))

			if lhs_DateO != rhs_DateO {
				print("date: \(String(describing: lhs.dateO)) != \(String(describing: rhs.dateO))")
				return false
			}
		} else if lhs.dateO == nil && rhs.dateO != nil || lhs.dateO != nil && rhs.dateO == nil {
			print("date: \(String(describing: lhs.dateO)) != \(String(describing: rhs.dateO))")
			return false
		}

		if lhs.ids != rhs.ids {
			print("ids: \(lhs.ids) != \(rhs.ids)")
			return false
		}
		if lhs.strings != rhs.strings {
			print("strings: \(lhs.strings) != \(rhs.strings)")
			return false
		}
		if lhs.bools != rhs.bools {
			print("bools: \(lhs.bools) != \(rhs.bools)")
			return false
		}
		if lhs.ints != rhs.ints {
			print("ints: \(lhs.ints) != \(rhs.ints)")
			return false
		}
		if lhs.uInts != rhs.uInts {
			print("uInts: \(lhs.uInts) != \(rhs.uInts)")
			return false
		}
		if lhs.doubles != rhs.doubles {
			print("doubles: \(lhs.doubles) != \(rhs.doubles)")
			return false
		}

		if lhs.idsO != rhs.idsO {
			print("idsO: \(String(describing: lhs.idsO)) != \(String(describing: rhs.idsO))")
			return false
		}
		if lhs.stringsO != rhs.stringsO {
			print("stringsO: \(String(describing: lhs.stringsO)) != \(String(describing: rhs.stringsO))")
			return false
		}
		if lhs.boolsO != rhs.boolsO {
			print("boolsO: \(String(describing: lhs.boolsO)) != \(String(describing: rhs.boolsO))")
			return false
		}
		if lhs.intsO != rhs.intsO {
			print("intsO: \(String(describing: lhs.intsO)) != \(String(describing: rhs.intsO))")
			return false
		}
		if lhs.uIntsO != rhs.uIntsO {
			print("uIntsO: \(String(describing: lhs.uIntsO)) != \(String(describing: rhs.uIntsO))")
			return false
		}
		if lhs.doublesO != rhs.doublesO {
			print("doublesO: \(String(describing: lhs.doublesO)) != \(String(describing: rhs.doublesO))")
			return false
		}

		return true

//		return lhs.id == rhs.id &&
//		lhs.string == rhs.string &&
//		lhs.bool == rhs.bool &&
//		lhs.int == rhs.int &&
//		lhs.uInt == rhs.uInt &&
//		lhs.double == rhs.double &&
////		lhs.date == rhs.date &&
//
//		lhs.ids == rhs.ids &&
//		lhs.strings == rhs.strings &&
//		lhs.bools == rhs.bools &&
//		lhs.ints == rhs.ints &&
//		lhs.uInts == rhs.uInts &&
//		lhs.doubles == rhs.doubles &&
//
//		lhs.ids.count == rhs.ids.count &&
//		lhs.strings.count == rhs.strings.count &&
//		lhs.bools.count == rhs.bools.count &&
//		lhs.ints.count == rhs.ints.count &&
//		lhs.uInts.count == rhs.uInts.count &&
//		lhs.doubles.count == rhs.doubles.count &&
//
//		lhs.idsO == rhs.idsO &&
//		lhs.stringsO == rhs.stringsO &&
//		lhs.boolsO == rhs.boolsO &&
//		lhs.intsO == rhs.intsO &&
//		lhs.uIntsO == rhs.uIntsO &&
//		lhs.doublesO == rhs.doublesO &&
//
//		lhs.idsO?.count == rhs.idsO?.count &&
//		lhs.stringsO?.count == rhs.stringsO?.count &&
//		lhs.boolsO?.count == rhs.boolsO?.count &&
//		lhs.intsO?.count == rhs.intsO?.count &&
//		lhs.uIntsO?.count == rhs.uIntsO?.count &&
//		lhs.doublesO?.count == rhs.doublesO?.count &&
//
//		lhs.idO == rhs.idO &&
//		lhs.stringO == rhs.stringO &&
//		lhs.boolO == rhs.boolO &&
//		lhs.intO == rhs.intO &&
//		lhs.uIntO == rhs.uIntO &&
//		lhs.doubleO == rhs.doubleO/* &&
//		lhs.dateO == rhs.dateO*/
	}
}
