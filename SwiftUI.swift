import AppKit
import Combine
import CoreData
import CoreFoundation
import CoreGraphics
import CoreText
import Darwin
import Foundation
import SwiftUI
import os.log
import os
import os.signpost

/// The kind of an Accessibility action. Includes name information for custom
/// actions
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityActionKind : Equatable {

    public static let `default`: AccessibilityActionKind

    public static let escape: AccessibilityActionKind

    @available(OSX 10.15, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let delete: AccessibilityActionKind

    @available(OSX 10.15, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let showMenu: AccessibilityActionKind

    public init(named name: Text)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityActionKind, b: AccessibilityActionKind) -> Bool
}

/// Specifies which way an adjustment should be made.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum AccessibilityAdjustmentDirection {

    case increment

    case decrement

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityAdjustmentDirection, b: AccessibilityAdjustmentDirection) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAdjustmentDirection : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityAttachmentModifier {

    /// The type of view representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityAttachmentModifier : ViewModifier {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityChildBehavior : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: AccessibilityChildBehavior, rhs: AccessibilityChildBehavior) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AccessibilityChildBehavior {

    /// Child accessibility elements are ignored
    public static let ignore: AccessibilityChildBehavior

    /// Any child accessibility elements become children of the new
    /// accessibility element
    public static let contain: AccessibilityChildBehavior

    /// Combine any child accessibility element's properties for the
    /// new accessibility element
    public static let combine: AccessibilityChildBehavior
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AccessibilityTraits : SetAlgebra {

    public static let isButton: AccessibilityTraits

    public static let isHeader: AccessibilityTraits

    public static let isSelected: AccessibilityTraits

    public static let isLink: AccessibilityTraits

    public static let isSearchField: AccessibilityTraits

    public static let isImage: AccessibilityTraits

    public static let playsSound: AccessibilityTraits

    public static let isKeyboardKey: AccessibilityTraits

    public static let isStaticText: AccessibilityTraits

    public static let isSummaryElement: AccessibilityTraits

    public static let updatesFrequently: AccessibilityTraits

    public static let startsMediaSession: AccessibilityTraits

    public static let allowsDirectInteraction: AccessibilityTraits

    public static let causesPageTurn: AccessibilityTraits

    public static let isModal: AccessibilityTraits

    /// Creates an empty set.
    ///
    /// This initializer is equivalent to initializing with an empty array
    /// literal. For example, you create an empty `Set` instance with either
    /// this initializer or with an empty array literal.
    ///
    ///     var emptySet = Set<Int>()
    ///     print(emptySet.isEmpty)
    ///     // Prints "true"
    ///
    ///     emptySet = []
    ///     print(emptySet.isEmpty)
    ///     // Prints "true"
    public init()

    /// Adds the elements of the given set to the set.
    ///
    /// In the following example, the elements of the `visitors` set are added to
    /// the `attendees` set:
    ///
    ///     var attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors: Set = ["Diana", "Marcia", "Nathaniel"]
    ///     attendees.formUnion(visitors)
    ///     print(attendees)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     var initialIndices = Set(0..<5)
    ///     initialIndices.formUnion([2, 3, 6, 7])
    ///     print(initialIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formUnion(_ other: AccessibilityTraits)

    /// Returns a new set with the elements that are common to both this set and
    /// the given set.
    ///
    /// In the following example, the `bothNeighborsAndEmployees` set is made up
    /// of the elements that are in *both* the `employees` and `neighbors` sets.
    /// Elements that are in only one or the other are left out of the result of
    /// the intersection.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     let bothNeighborsAndEmployees = employees.intersection(neighbors)
    ///     print(bothNeighborsAndEmployees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func intersection(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the elements of this set that aren't also in the given set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// not also members of the `neighbors` set are removed. In particular, the
    /// names `"Alicia"`, `"Chris"`, and `"Diana"` are removed.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     employees.formIntersection(neighbors)
    ///     print(employees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formIntersection(_ other: AccessibilityTraits)

    /// Returns a new set with the elements that are either in this set or in the
    /// given set, but not in both.
    ///
    /// In the following example, the `eitherNeighborsOrEmployees` set is made up
    /// of the elements of the `employees` and `neighbors` sets that are not in
    /// both `employees` *and* `neighbors`. In particular, the names `"Bethany"`
    /// and `"Eric"` do not appear in `eitherNeighborsOrEmployees`.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     let eitherNeighborsOrEmployees = employees.symmetricDifference(neighbors)
    ///     print(eitherNeighborsOrEmployees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    public func symmetricDifference(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the elements of the set that are also in the given set and adds
    /// the members of the given set that are not already in the set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// also members of `neighbors` are removed from `employees`, while the
    /// elements of `neighbors` that are not members of `employees` are added to
    /// `employees`. In particular, the names `"Bethany"` and `"Eric"` are
    /// removed from `employees` while the name `"Forlani"` is added.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     employees.formSymmetricDifference(neighbors)
    ///     print(employees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type.
    public mutating func formSymmetricDifference(_ other: AccessibilityTraits)

    /// Returns a Boolean value that indicates whether the given element exists
    /// in the set.
    ///
    /// This example uses the `contains(_:)` method to test whether an integer is
    /// a member of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    ///     let x = 5
    ///     if primes.contains(x) {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameter member: An element to look for in the set.
    /// - Returns: `true` if `member` exists in the set; otherwise, `false`.
    public func contains(_ member: AccessibilityTraits) -> Bool

    /// Returns a new set with the elements of both this and the given set.
    ///
    /// In the following example, the `attendeesAndVisitors` set is made up
    /// of the elements of the `attendees` and `visitors` sets:
    ///
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors = ["Marcia", "Nathaniel"]
    ///     let attendeesAndVisitors = attendees.union(visitors)
    ///     print(attendeesAndVisitors)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     let initialIndices = Set(0..<5)
    ///     let expandedIndices = initialIndices.union([2, 3, 6, 7])
    ///     print(expandedIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set with the unique elements of this set and `other`.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func union(_ other: AccessibilityTraits) -> AccessibilityTraits

    /// Removes the given element and any elements subsumed by the given element.
    ///
    /// - Parameter member: The element of the set to remove.
    /// - Returns: For ordinary sets, an element equal to `member` if `member` is
    ///   contained in the set; otherwise, `nil`. In some cases, a returned
    ///   element may be distinguishable from `newMember` by identity comparison
    ///   or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the set
    ///   and `[member]`, or `nil` if the intersection is empty.
    public mutating func remove(_ member: AccessibilityTraits) -> AccessibilityTraits?

    /// Inserts the given element in the set if it is not already present.
    ///
    /// If an element equal to `newMember` is already contained in the set, this
    /// method has no effect. In this example, a new element is inserted into
    /// `classDays`, a set of days of the week. When an existing element is
    /// inserted, the `classDays` set does not change.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.wednesday, .friday]
    ///     print(classDays.insert(.monday))
    ///     // Prints "(true, .monday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    ///     print(classDays.insert(.friday))
    ///     // Prints "(false, .friday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: `(true, newMember)` if `newMember` was not contained in the
    ///   set. If an element equal to `newMember` was already contained in the
    ///   set, the method returns `(false, oldMember)`, where `oldMember` is the
    ///   element that was equal to `newMember`. In some cases, `oldMember` may
    ///   be distinguishable from `newMember` by identity comparison or some
    ///   other means.
    public mutating func insert(_ newMember: AccessibilityTraits) -> (inserted: Bool, memberAfterInsert: AccessibilityTraits)

    /// Inserts the given element into the set unconditionally.
    ///
    /// If an element equal to `newMember` is already contained in the set,
    /// `newMember` replaces the existing element. In this example, an existing
    /// element is inserted into `classDays`, a set of days of the week.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.monday, .wednesday, .friday]
    ///     print(classDays.update(with: .monday))
    ///     // Prints "Optional(.monday)"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: For ordinary sets, an element equal to `newMember` if the set
    ///   already contained such a member; otherwise, `nil`. In some cases, the
    ///   returned element may be distinguishable from `newMember` by identity
    ///   comparison or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the 
    ///   set and `[newMember]`, or `nil` if the intersection is empty.
    public mutating func update(with newMember: AccessibilityTraits) -> AccessibilityTraits?

    /// A type for which the conforming type provides a containment test.
    public typealias Element = AccessibilityTraits

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = AccessibilityTraits

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AccessibilityTraits, b: AccessibilityTraits) -> Bool
}

/// A storage type for an alert presentation.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Alert {

    /// Creates an alert with one button.
    public init(title: Text, message: Text? = nil, dismissButton: Alert.Button? = nil)

    /// Creates an alert with two buttons.
    ///
    /// - Note: the system determines the visual ordering of the buttons.
    public init(title: Text, message: Text? = nil, primaryButton: Alert.Button, secondaryButton: Alert.Button)

    /// A button representing an operation of an alert presentation.
    public struct Button {

        /// Creates an `Alert.Button` with the default style.
        public static func `default`(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button

        /// Creates an `Alert.Button` that indicates cancellation of some
        /// operation.
        public static func cancel(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button

        /// Creates an `Alert.Button` that indicates cancellation of some
        /// operation.
        ///
        /// - Note: the label of the button is automatically chosen by the
        /// system for the appropriate locale.
        public static func cancel(_ action: (() -> Void)? = {}) -> Alert.Button

        /// Creates an `Alert.Button` with a style indicating destruction of
        /// some data.
        public static func destructive(_ label: Text, action: (() -> Void)? = {}) -> Alert.Button
    }
}

/// An alignment in both axes.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Alignment : Equatable {

    public var horizontal: HorizontalAlignment

    public var vertical: VerticalAlignment

    @inlinable public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment)

    public static let center: Alignment

    public static let leading: Alignment

    public static let trailing: Alignment

    public static let top: Alignment

    public static let bottom: Alignment

    public static let topLeading: Alignment

    public static let topTrailing: Alignment

    public static let bottomLeading: Alignment

    public static let bottomTrailing: Alignment

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Alignment, b: Alignment) -> Bool
}

/// Types used to identify alignment guides.
///
/// Every type conforming to `AlignmentID` has a corresponding alignment guide
/// value, usually declared as a static constant property of
/// `HorizontalAlignment` or `VerticalAlignment`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AlignmentID {

    /// Returns the value of the corresponding guide, in `context`, when not
    /// otherwise set in `context`.
    static func defaultValue(in context: ViewDimensions) -> CGFloat
}

/// An opaque value derived from an `Anchor<Value>.Source` and a
/// particular view. It may be converted to a `Value` in the coordinate
/// space of a target view, using a `GeometryProxy` value to specify
/// the target view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Anchor<Value> {

    /// A type-erased geometry value that produces an anchored value of
    /// type `Value`. Anchored geometry values are passed around the
    /// view tree via preference keys, and then converted back into the
    /// local coordinate space via a `GeometryProxy` value.
    public struct Source {
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    public init<T>(_ array: [Anchor<T>.Source]) where Value == [T]
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    public init<T>(_ anchor: Anchor<T>.Source?) where Value == T?
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGPoint {

    public static func point(_ p: CGPoint) -> Anchor<Value>.Source

    public static func unitPoint(_ p: UnitPoint) -> Anchor<Value>.Source

    public static var topLeading: Anchor<CGPoint>.Source { get }

    public static var top: Anchor<CGPoint>.Source { get }

    public static var topTrailing: Anchor<CGPoint>.Source { get }

    public static var leading: Anchor<CGPoint>.Source { get }

    public static var center: Anchor<CGPoint>.Source { get }

    public static var trailing: Anchor<CGPoint>.Source { get }

    public static var bottomLeading: Anchor<CGPoint>.Source { get }

    public static var bottom: Anchor<CGPoint>.Source { get }

    public static var bottomTrailing: Anchor<CGPoint>.Source { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGRect {

    /// Returns an anchor source rect defined by `r` in the current view.
    public static func rect(_ r: CGRect) -> Anchor<Value>.Source

    /// An anchor source rect defined as the entire bounding rect of the
    /// current view.
    public static var bounds: Anchor<CGRect>.Source { get }
}

/// A geometric angle whose value can be accessed either in radians or degrees.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Angle {

    public var radians: Double

    @inlinable public var degrees: Double

    @inlinable public init()

    @inlinable public init(radians: Double)

    @inlinable public init(degrees: Double)

    @inlinable public static func radians(_ radians: Double) -> Angle

    @inlinable public static func degrees(_ degrees: Double) -> Angle
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Angle : Hashable, Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func < (lhs: Angle, rhs: Angle) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Angle, b: Angle) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Angle : Animatable {

    /// The data to be animated.
    public var animatableData: Double

    @inlinable public static var zero: Angle { get }

    /// The type defining the data to be animated.
    public typealias AnimatableData = Double
}

/// An angular gradient (sometimes also known as a conic gradient). The
/// gradient's color function is applied as the angle changes, relative
/// to a center point and defined start and end angles. If `endAngle -
/// startAngle` > 2pi only the last complete turn is drawn. If
/// `endAngle - startAngle < 2pi` the missing area is filled with the
/// colors defined by gradient locations one and zero, transitioning
/// between the two halfway across the missing area. The unit-space
/// center point is mapped into the bounding rectangle of each shape
/// filled with the gradient.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AngularGradient : ShapeStyle, View {

    public init(gradient: Gradient, center: UnitPoint, startAngle: Angle = .zero, endAngle: Angle = .zero)

    public init(gradient: Gradient, center: UnitPoint, angle: Angle = .zero)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A type that can be animated
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Animatable {

    /// The type defining the data to be animated.
    associatedtype AnimatableData : VectorArithmetic

    /// The data to be animated.
    var animatableData: Self.AnimatableData { get set }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self : VectorArithmetic {

    /// The data to be animated.
    public var animatableData: Self
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animatable where Self.AnimatableData == EmptyAnimatableData {

    /// The data to be animated.
    public var animatableData: EmptyAnimatableData
}

/// A modifier that can animatedly create another modifier.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol AnimatableModifier : Animatable, ViewModifier {
}

/// A pair of animatable values, which is itself animatable.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AnimatablePair<First, Second> : VectorArithmetic where First : VectorArithmetic, Second : VectorArithmetic {

    /// The first value.
    public var first: First

    /// The second value.
    public var second: Second

    /// Initializes with `first` and `second`.
    @inlinable public init(_ first: First, _ second: Second)

    /// The zero value.
    ///
    /// Zero is the identity element for addition. For any value,
    /// `x + .zero == x` and `.zero + x == x`.
    public static var zero: AnimatablePair<First, Second> { get }

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func += (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>)

    /// Subtracts the second value from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -= (lhs: inout AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>)

    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// You cannot use `+` with arguments of different types. To add values of
    /// different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) + y              // 1000021
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func + (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second>

    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// You cannot use `-` with arguments of different types. To subtract values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: UInt8 = 21
    ///     let y: UInt = 1000000
    ///     y - UInt(x)             // 999979
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func - (lhs: AnimatablePair<First, Second>, rhs: AnimatablePair<First, Second>) -> AnimatablePair<First, Second>

    /// Multiplies each component of `self` by the scalar `rhs`.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    public var magnitudeSquared: Double { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: AnimatablePair<First, Second>, b: AnimatablePair<First, Second>) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Animation {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Animation, rhs: Animation) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public static let `default`: Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// A persistent spring animation. When mixed with other `spring()`
    /// or `interactiveSpring()` animations on the same property, each
    /// animation will be replaced by their successor, preserving
    /// velocity from one animation to the next. Optionally blends the
    /// response values between springs over a time period.
    ///
    /// - Parameters:
    ///   - response: The stiffness of the spring, defined as an
    ///     approximate duration in seconds. A value of zero requests
    ///     an infinitely-stiff spring, suitable for driving
    ///     interactive animations.
    ///   - dampingFraction: The amount of drag applied to the value
    ///     being animated, as a fraction of an estimate of amount
    ///     needed to produce critical damping.
    ///   - blendDuration: The duration in seconds over which to
    ///     interpolate changes to the response value of the spring.
    /// - Returns: a spring animation.
    public static func spring(response: Double = 0.55, dampingFraction: Double = 0.825, blendDuration: Double = 0) -> Animation

    /// A convenience for a `spring()` animation with a lower
    /// `response` value, intended for driving interactive animations.
    public static func interactiveSpring(response: Double = 0.15, dampingFraction: Double = 0.86, blendDuration: Double = 0.25) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public func repeatCount(_ repeatCount: Int, autoreverses: Bool = true) -> Animation

    public func repeatForever(autoreverses: Bool = true) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public static func easeInOut(duration: Double) -> Animation

    public static var easeInOut: Animation { get }

    public static func easeIn(duration: Double) -> Animation

    public static var easeIn: Animation { get }

    public static func easeOut(duration: Double) -> Animation

    public static var easeOut: Animation { get }

    public static func linear(duration: Double) -> Animation

    public static var linear: Animation { get }

    public static func timingCurve(_ c0x: Double, _ c0y: Double, _ c1x: Double, _ c1y: Double, duration: Double = 0.35) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// An interpolating spring animation that uses a damped spring
    /// model to produce values in the range [0, 1] that are then used
    /// to interpolate within the [from, to] range of the animated
    /// property. Preserves velocity across overlapping animations by
    /// adding the effects of each animation.
    ///
    /// - Parameters:
    ///   - mass: The mass of the object attached to the spring.
    ///   - stiffness: The stiffness of the spring.
    ///   - damping: The spring damping value.
    ///   - initialVelocity: the initial velocity of the spring, as
    ///     a value in the range [0, 1] representing the magnitude of
    ///     the value being animated.
    /// - Returns: a spring animation.
    public static func interpolatingSpring(mass: Double = 1.0, stiffness: Double, damping: Double, initialVelocity: Double = 0.0) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    public func delay(_ delay: Double) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation {

    /// Returns an animation that has its speed multiplied by `speed`. For
    /// example, if you had `oneSecondAnimation.speed(0.25)`, it would be at
    /// 25% of its normal speed, so you would have an animation that would last
    /// 4 seconds.
    public func speed(_ speed: Double) -> Animation
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation : CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(reflecting:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `debugDescription` property for types that conform to
    /// `CustomDebugStringConvertible`:
    ///
    ///     struct Point: CustomDebugStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var debugDescription: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(reflecting: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `debugDescription` property.
    public var debugDescription: String { get }

    /// The custom mirror for this instance.
    ///
    /// If this type has value semantics, the mirror should be unaffected by
    /// subsequent mutations of the instance.
    public var customMirror: Mirror { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Animation : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AnyGesture<Value> {

    public init<T>(_ gesture: T) where Value == T.Value, T : Gesture

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyGesture : Gesture {
}

/// A type-erased `Transition`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AnyTransition {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that inserts by moving in from the leading edge, and
    /// removes by moving out towards the trailing edge.
    ///
    /// - SeeAlso: `AnyTransition.move(edge:)`
    public static var slide: AnyTransition { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    public static func offset(_ offset: CGSize) -> AnyTransition

    public static func offset(x: CGFloat = 0, y: CGFloat = 0) -> AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A composite `Transition` that gives the result of two transitions both
    /// applied.
    public func combined(with other: AnyTransition) -> AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    public static var scale: AnyTransition { get }

    public static func scale(scale: CGFloat, anchor: UnitPoint = .center) -> AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition from transparent to opaque on insertion and opaque to
    /// transparent on removal.
    public static let opacity: AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition defined between an active modifier and an identity
    /// modifier.
    public static func modifier<E>(active: E, identity: E) -> AnyTransition where E : ViewModifier
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A composite `Transition` that uses a different transition for
    /// insertion versus removal.
    public static func asymmetric(insertion: AnyTransition, removal: AnyTransition) -> AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that returns the input view, unmodified, as the output
    /// view.
    public static let identity: AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// A transition that moves the view away towards the specified `edge` by
    /// the size of the view.
    public static func move(edge: Edge) -> AnyTransition
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension AnyTransition {

    /// Attach an animation to this transition.
    public func animation(_ animation: Animation?) -> AnyTransition
}

/// A type-erased `View`.
///
/// An `AnyView` allows changing the type of view used in a given view
/// hierarchy. Whenever the type of view used with an `AnyView`
/// changes, the old hierarchy is destroyed and a new hierarchy is
/// created for the new type.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct AnyView : View {

    /// Create an instance that type-erases `view`.
    public init<V>(_ view: V) where V : View

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A value indicating either the horizontal or vertical dimension in a
/// 2D coordinate system
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum Axis : Int8, CaseIterable {

    /// The horizontal dimension.
    case horizontal

    /// The vertical dimension.
    case vertical

    /// An efficient set of axes.
    public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Axis.Set

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public let rawValue: Int8

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int8)

        public static let horizontal: Axis.Set

        public static let vertical: Axis.Set

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Axis.Set.Element

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = Int8
    }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int8

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public var rawValue: Int8 { get }

    /// Creates a new instance with the specified raw value.
    ///
    /// If there is no value of the type that corresponds with the specified raw
    /// value, this initializer returns `nil`. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     print(PaperSize(rawValue: "Legal"))
    ///     // Prints "Optional("PaperSize.Legal")"
    ///
    ///     print(PaperSize(rawValue: "Tabloid"))
    ///     // Prints "nil"
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    public init?(rawValue: Int8)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Axis]

    /// A collection of all values of this type.
    public static var allCases: [Axis] { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : CustomStringConvertible {

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Axis : RawRepresentable {
}

/// A value and a means to mutate it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper @dynamicMemberLookup public struct Binding<Value> {

    /// The transaction used for any changes to the binding's value.
    public var transaction: Transaction

    /// Initializes from functions to read and write the value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void)

    /// Initializes from functions to read and write the value.
    public init(get: @escaping () -> Value, set: @escaping (Value, Transaction) -> Void)

    /// Creates a binding with an immutable `value`.
    public static func constant(_ value: Value) -> Binding<Value>

    /// The value referenced by the binding. Assignments to the value
    /// will be immediately visible on reading (assuming the binding
    /// represents a mutable location), but the view changes they cause
    /// may be processed asynchronously to the assignment.
    public var wrappedValue: Value { get nonmutating set }

    /// The binding value, as "unwrapped" by accessing `$foo` on a `@Binding` property.
    public var projectedValue: Binding<Value> { get }

    /// Creates a new `Binding` focused on `Subject` using a key path.
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Create a new Binding that will apply `transaction` to any changes.
    public func transaction(_ transaction: Transaction) -> Binding<Value>

    /// Create a new Binding that will apply `animation` to any changes.
    public func animation(_ animation: Animation? = .default) -> Binding<Value>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding : DynamicProperty {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Binding {

    /// Creates an instance by projecting the base value to an optional value.
    public init<V>(_ base: Binding<V>) where Value == V?

    /// Creates an instance by projecting the base optional value to its
    /// unwrapped value, or returns `nil` if the base value is `nil`.
    public init?(_ base: Binding<Value?>)

    /// Creates an instance by projecting the base `Hashable` value to an
    /// `AnyHashable` value.
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum BlendMode {

    case normal

    case multiply

    case screen

    case overlay

    case darken

    case lighten

    case colorDodge

    case colorBurn

    case softLight

    case hardLight

    case difference

    case exclusion

    case hue

    case saturation

    case color

    case luminosity

    case sourceAtop

    case destinationOver

    case destinationOut

    case plusDarker

    case plusLighter

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: BlendMode, b: BlendMode) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension BlendMode : Hashable {
}

/// A `Button` style that applies standard border artwork to its content.
///
/// The specific style of border artwork is chosen automatically based on
/// the context of the button.
@available(OSX 10.15, tvOS 13.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
public struct BorderedButtonStyle : PrimitiveButtonStyle {

    public init()

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    public func makeBody(configuration: BorderedButtonStyle.Configuration) -> some View


    /// A `View` representing the body of a `Button`.
    public typealias Body = some View
}

/// An `MenuButtonStyle` which manifests as a borderless button with no
/// visual embelishments.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonMenuButtonStyle : MenuButtonStyle {

    public init()
}

/// A standard `Button` style that does not apply a border to its content.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessButtonStyle : PrimitiveButtonStyle {

    public init()

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    public func makeBody(configuration: BorderlessButtonStyle.Configuration) -> some View


    /// A `View` representing the body of a `Button`.
    public typealias Body = some View
}

/// An `MenuButtonStyle` which manifests as a borderless pull-down button.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct BorderlessPullDownMenuButtonStyle : MenuButtonStyle {

    public init()
}

/// A control that performs an action when triggered.
///
/// The method of "triggering" the button may vary. For example, on iOS a button
/// is triggered by tapping it onscreen, whereas on tvOS it's triggered by
/// pressing "select" on an external remote while the button is focused.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Button<Label> : View where Label : View {

    /// Creates an instance for triggering `action`.
    ///
    /// - Parameters:
    ///     - action: The action to perform when `self` is triggered.
    ///     - label: A view that describes the effect of calling `action`.
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == PrimitiveButtonStyleConfiguration.Label {

    /// Creates an instance representing the configuration of a
    /// `PrimitiveButtonStyle`.
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: PrimitiveButtonStyleConfiguration)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == Text {

    /// Creates an instance with a `Text` label generated from a localized title
    /// string.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///     - action: The action to perform when `self` is triggered.
    public init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void)

    /// Creates an instance with a `Text` label generated from a title string.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - action: The action to perform when `self` is triggered.
    public init<S>(_ title: S, action: @escaping () -> Void) where S : StringProtocol
}

/// Defines the implementation of all `Button` instances within a view
/// hierarchy.
///
/// To configure the current `ButtonStyle` for a view hiearchy, use the
/// `.buttonStyle()` modifier.
///
/// `Button` instances built using a `ButtonStyle` will use the standard button
/// interaction behavior (defined per-platform). To create a button with custom
/// interaction behavior, use `PrimitiveButtonStyle` instead.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ButtonStyle {

    /// A `View` representing the body of a `Button`.
    associatedtype Body : View

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a `Button` instance being created.
    typealias Configuration = ButtonStyleConfiguration
}

/// The properties of a `Button` instance being created.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ButtonStyleConfiguration {

    /// A type-erased label of a `Button`.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of toggling `isOn`.
    public let label: ButtonStyleConfiguration.Label

    /// Whether or not the button is currently being pressed down by the user.
    public let isPressed: Bool
}

/// A capsule shape aligned inside the frame of the view containing it.
/// Equivalent to a rounded rectangle where the corner radius is chosen
/// as half the length of the rectangle's smallest edge.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Capsule : Shape {

    public var style: RoundedCornerStyle

    @inlinable public init(style: RoundedCornerStyle = .circular)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in r: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Capsule : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A `ToggleStyle` represented by a leading checkbox.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CheckboxToggleStyle : ToggleStyle {

    public init()

    /// Creates a `View` representing the body of a `Toggle`.
    ///
    /// - Parameter configuration: The properties of the toggle instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Toggle` created within
    /// a view hierarchy where this style is the current `ToggleStyle`.
    public func makeBody(configuration: CheckboxToggleStyle.Configuration) -> some View


    /// A `View` representing the body of a `Toggle`.
    public typealias Body = some View
}

/// A circle centered on the frame of the view containing it. The
/// radius is chosen as half the length of the rectangle's smallest
/// edge.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Circle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to be animated.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Circle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// An environment-dependent color.
///
/// A `Color` is a late-binding token - its actual value is only resolved
/// when it is about to be used in a given environment. At that time it is
/// resolved to a concrete value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Color : Hashable, CustomStringConvertible {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Color, rhs: Color) -> Bool

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Color {

    /// Creates a color from an instance of `NSColor`.
    public init(_ color: NSColor)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    public enum RGBColorSpace {

        case sRGB

        case sRGBLinear

        case displayP3

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Color.RGBColorSpace, b: Color.RGBColorSpace) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }

    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1)

    public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1)

    public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : ShapeStyle {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A set of colors that are used by system elements and applications.
    public static let clear: Color

    public static let black: Color

    public static let white: Color

    public static let gray: Color

    public static let red: Color

    public static let green: Color

    public static let blue: Color

    public static let orange: Color

    public static let yellow: Color

    public static let pink: Color

    public static let purple: Color

    public static let primary: Color

    public static let secondary: Color
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// A color that represents the accent color in the environment it is
    /// evaluated.
    ///
    /// If an explicit value hasn't been set, the default system accent color
    /// will be used.
    public static var accentColor: Color { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    /// Creates a named color.
    ///
    /// - Parameters:
    ///   - name: the name of the color resource to lookup.
    ///   - bundle: the bundle to search for the color resource in.
    public init(_ name: String, bundle: Bundle? = nil)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {

    public func opacity(_ opacity: Double) -> Color
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color : View {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color.RGBColorSpace : Hashable {
}

/// Describes the working color space for color-compositing operations
/// and the range of color values that are guaranteed to be preserved.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorRenderingMode {

    /// The non-linear sRGB (i.e. gamma corrected) working color space.
    /// Color component values outside the range [0, 1] have undefined
    /// results.
    case nonLinear

    /// The linear sRGB (i.e. not gamma corrected) working color space.
    /// Color component values outside the range [0, 1] have undefined
    /// results.
    case linear

    /// The linear sRGB (i.e. not gamma corrected) working color space.
    /// Color component values outside the range [0, 1] are preserved.
    case extendedLinear

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorRenderingMode, b: ColorRenderingMode) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorRenderingMode : Hashable {
}

/// The ColorScheme enumerates the user setting options for Light or Dark Mode
/// and also the light/dark setting for any particular view when the app
/// wants to override the user setting.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorScheme : CaseIterable {

    case light

    case dark

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorScheme, b: ColorScheme) -> Bool

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorScheme]

    /// A collection of all values of this type.
    public static var allCases: [ColorScheme] { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorScheme : Hashable {
}

/// The ColorSchemeContrast enumerates the Increase Contrast user setting
/// options. The user's choice cannot be overridden by the app.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ColorSchemeContrast : CaseIterable {

    case standard

    case increased

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ColorSchemeContrast, b: ColorSchemeContrast) -> Bool

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ColorSchemeContrast]

    /// A collection of all values of this type.
    public static var allCases: [ColorSchemeContrast] { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorSchemeContrast : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ColorSchemeContrast : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ContentMode : Hashable, CaseIterable {

    case fit

    case fill

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentMode, b: ContentMode) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ContentMode]

    /// A collection of all values of this type.
    public static var allCases: [ContentMode] { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ContentSizeCategory : Hashable, CaseIterable {

    case extraSmall

    case small

    case medium

    case large

    case extraLarge

    case extraExtraLarge

    case extraExtraExtraLarge

    case accessibilityMedium

    case accessibilityLarge

    case accessibilityExtraLarge

    case accessibilityExtraExtraLarge

    case accessibilityExtraExtraExtraLarge

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ContentSizeCategory, b: ContentSizeCategory) -> Bool

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ContentSizeCategory]

    /// A collection of all values of this type.
    public static var allCases: [ContentSizeCategory] { get }
}

/// A container whose view content children will be presented as a menu items
/// in a contextual menu after completion of the standard system gesture.
///
/// The controls contained in a `ContextMenu` should be related to the context
/// they are being shown from.
///
/// - SeeAlso: `View.contextMenu`, which attaches a `ContextMenu` to a `View`.
@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct ContextMenu<MenuItems> where MenuItems : View {

    public init(@ViewBuilder menuItems: () -> MenuItems)
}

@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum ControlActiveState : Equatable, CaseIterable {

    case key

    case active

    case inactive

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ControlActiveState, b: ControlActiveState) -> Bool

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ControlActiveState]

    /// A collection of all values of this type.
    public static var allCases: [ControlActiveState] { get }
}

@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlActiveState : Hashable {
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum ControlSize : CaseIterable {

    case regular

    case small

    case mini

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ControlSize, b: ControlSize) -> Bool

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [ControlSize]

    /// A collection of all values of this type.
    public static var allCases: [ControlSize] { get }
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlSize : Equatable {
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ControlSize : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum CoordinateSpace {

    case global

    case local

    case named(AnyHashable)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace {

    public var isGlobal: Bool { get }

    public var isLocal: Bool { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CoordinateSpace : Equatable, Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CoordinateSpace, rhs: CoordinateSpace) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

/// A control for selecting an absolute `Date`.
///
/// It can be configured to only display specific components of the date, but
/// still results in picking a complete `Date` instance.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePicker<Label> : View where Label : View {

    public typealias Components = DatePickerComponents

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker {

    /// Creates an instance that selects a `Date` with an unbounded range.
    ///
    /// - Parameters:
    ///     - selection: The date value being displayed and selected.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///     - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///     - selection: The date value being displayed and selected.
    ///     - range: The inclusive range of selectable dates.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///     - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range from some selectable start date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///     - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range before some selectable end date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    ///     - label: A view that describes the use of the date.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date], @ViewBuilder label: () -> Label)
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DatePicker where Label == Text {

    /// Creates an instance that selects a `Date` with an unbounded range.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///         its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///         its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The inclusive range of selectable dates.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///         its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range from some selectable start date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///         its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range before some selectable end date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date])

    /// Creates an instance that selects a `Date` within the given range.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` in a closed range.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The inclusive range of selectable dates.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: ClosedRange<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` on or after some start date.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range from some selectable start date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeFrom<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol

    /// Creates an instance that selects a `Date` on or before some end date.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - selection: The date value being displayed and selected.
    ///     - range: The open range before some selectable end date.
    ///     - displayedComponents: The date components that user is able to
    ///         view and edit. Defaults to `[.hourAndMinute, .date]`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, selection: Binding<Date>, in range: PartialRangeThrough<Date>, displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]) where S : StringProtocol
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DatePickerComponents : OptionSet {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: UInt

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt)

    /// Displays hour and minute components based on the locale
    public static let hourAndMinute: DatePickerComponents

    /// Displays day, month, and year based on the locale
    public static let date: DatePickerComponents

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = DatePickerComponents

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = DatePickerComponents

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt
}

/// A specification for the appearance and interaction of a `DatePicker`.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DatePickerStyle {
}

/// The default button style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultButtonStyle : PrimitiveButtonStyle {

    public init()

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    public func makeBody(configuration: DefaultButtonStyle.Configuration) -> some View


    /// A `View` representing the body of a `Button`.
    public typealias Body = some View
}

/// The default `DatePicker` style.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultDatePickerStyle : DatePickerStyle {

    public init()
}

/// The default `List` style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultListStyle : ListStyle {

    public init()
}

/// The default `MenuButton` style.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultMenuButtonStyle : MenuButtonStyle {

    public init()
}

/// The default `NavigationViewStyle`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct DefaultNavigationViewStyle : NavigationViewStyle {

    public init()
}

/// The default `Picker` style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultPickerStyle : PickerStyle {

    public init()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultTextFieldStyle : TextFieldStyle {

    public init()
}

/// The default `ToggleStyle`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultToggleStyle : ToggleStyle {

    public init()

    /// Creates a `View` representing the body of a `Toggle`.
    ///
    /// - Parameter configuration: The properties of the toggle instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Toggle` created within
    /// a view hierarchy where this style is the current `ToggleStyle`.
    public func makeBody(configuration: DefaultToggleStyle.Configuration) -> some View


    /// A `View` representing the body of a `Toggle`.
    public typealias Body = some View
}

/// A visual element that can be used to separate other content.
///
/// When contained in a stack, the divider extends across the minor axis
/// of the stack, or horizontally when not in a stack.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Divider : View {

    public init()

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A `NavigationViewStyle` represented by a "master" view stack that
/// navigates to a "detail" view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct DoubleColumnNavigationViewStyle : NavigationViewStyle {

    public init()
}

/// A gesture that invokes an action as a drag event sequence changes.
@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct DragGesture {

    /// The current state of the event sequence.
    public struct Value : Equatable {

        /// The time associated with the current event.
        public var time: Date

        /// The location of the current event.
        public var location: CGPoint

        /// The location of the first event.
        public var startLocation: CGPoint

        /// The total translation from the first event to the current
        /// event. Equivalent to `location.{x,y} -
        /// startLocation.{x,y}`.
        public var translation: CGSize { get }

        /// A prediction of where the final location would be if
        /// dragging stopped now, based on the current drag velocity.
        public var predictedEndLocation: CGPoint { get }

        /// A prediction of what the final translation would be if
        /// dragging stopped now, based on the current drag velocity.
        public var predictedEndTranslation: CGSize { get }

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: DragGesture.Value, b: DragGesture.Value) -> Bool
    }

    /// The distance that must be dragged before the gesture starts.
    public var minimumDistance: CGFloat

    /// The coordinate space to receive location values in.
    public var coordinateSpace: CoordinateSpace

    public init(minimumDistance: CGFloat = 10, coordinateSpace: CoordinateSpace = .local)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension DragGesture : Gesture {
}

/// A collection of functions that allow you to interact with a drop currently
/// occurring inside an onDrop modified view.
///
/// This collection is the most comprehensive and flexible way to interact
/// with a drop operation. For simple drop cases, see the `onDrop()` variants
/// that take a drop action instead of a `DropDelegate`.
///
/// - SeeAlso: `ViewModifier.onDrop(...)`
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol DropDelegate {

    /// Called when a drop, which has items conforming to any of the types
    /// passed to the onDrop() modifier, enters an onDrop target.
    ///
    /// The default implementation returns true.
    func validateDrop(info: DropInfo) -> Bool

    /// Tells the delegate it can request the item provider data from the
    /// DropInfo incorporating it into the application's data model as
    /// appropriate. This function is required.
    ///
    /// Return `true` if the drop was successful, `false` otherwise.
    func performDrop(info: DropInfo) -> Bool

    /// Tells the delegate a validated drop has entered the onDrop modified
    /// view. The default behavior does nothing.
    func dropEntered(info: DropInfo)

    /// Called as a validated drop moves inside the onDrop modified view.
    ///
    /// Return a drop proposal that contains the operation the delegate intends
    /// to perform at the DropInfo.location, The default implementation returns
    /// nil, which tells the drop to use that last valid returned value or else
    /// .copy.
    func dropUpdated(info: DropInfo) -> DropProposal?

    /// Tells the delegate a validated drop operation has exited the onDrop
    /// modified view. The default behavior does nothing.
    func dropExited(info: DropInfo)
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropDelegate {

    /// Called when a drop, which has items conforming to any of the types
    /// passed to the onDrop() modifier, enters an onDrop target.
    ///
    /// The default implementation returns true.
    public func validateDrop(info: DropInfo) -> Bool

    /// Tells the delegate a validated drop has entered the onDrop modified
    /// view. The default behavior does nothing.
    public func dropEntered(info: DropInfo)

    /// Called as a validated drop moves inside the onDrop modified view.
    ///
    /// Return a drop proposal that contains the operation the delegate intends
    /// to perform at the DropInfo.location, The default implementation returns
    /// nil, which tells the drop to use that last valid returned value or else
    /// .copy.
    public func dropUpdated(info: DropInfo) -> DropProposal?

    /// Tells the delegate a validated drop operation has exited the onDrop
    /// modified view. The default behavior does nothing.
    public func dropExited(info: DropInfo)
}

/// The description of the current state of a drop.
///
/// - SeeAlso `DropDelegate`
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropInfo {

    /// The location of the drag in the coordinate space of the drop view.
    public var location: CGPoint { get }

    /// Returns whether at least one item conforms to at least one of the
    /// specified uniform type identifiers.
    public func hasItemsConforming(to types: [String]) -> Bool

    /// Returns an Array of items that each conform to at least one of the
    /// specified uniform type identifiers.
    ///
    /// This function is only valid during the performDrop() action.
    public func itemProviders(for types: [String]) -> [NSItemProvider]
}

/// Operation types that determine how a drag and drop session resolves when
/// the user drops a drag item.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum DropOperation {

    /// No data should be transferred, thereby canceling the drag.
    case cancel

    /// Although a move or copy operation is typically legitimate in this
    /// scenario, the drop activity is not allowed at this time or location.
    case forbidden

    /// The data represented by the drag items should be copied to the onDrop
    /// modified view.
    case copy

    /// The data represented by the drag items should be moved, not copied.
    case move

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: DropOperation, b: DropOperation) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropOperation : Equatable {
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension DropOperation : Hashable {
}

/// A configuration for the behavior of a drop.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DropProposal {

    /// The drop operation that the drop proposes to perform.
    public let operation: DropOperation

    public init(operation: DropOperation)
}

/// Represents a stored variable in a `View` type that is dynamically
/// updated from some external property of the view. These variables
/// will be given valid values immediately before `body()` is called.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicProperty {

    /// Called immediately before the view's body() function is
    /// executed, after updating the values of any dynamic properties
    /// stored in `self`.
    mutating func update()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicProperty {

    /// Called immediately before the view's body() function is
    /// executed, after updating the values of any dynamic properties
    /// stored in `self`.
    public mutating func update()
}

/// A type of `ViewContent2` that generates views from an underlying
/// collection of data.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol DynamicViewContent : View {

    /// The type of the underlying collection of data.
    associatedtype Data : Collection

    /// The collection of underlying data.
    var data: Self.Data { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the deletion action to be used for `self`.
    ///
    /// - Parameter action: the action to be invoked when elements of the
    ///     receiver are deleted. The closure receives a set of indices
    ///     relative to the `Collection` driving the view content.
    ///     Passing `nil` means the delete is disabled.
    @inlinable public func onDelete(perform action: ((IndexSet) -> Void)?) -> some DynamicViewContent

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the insert action to be used for `self`.
    ///
    /// - Parameters:
    ///     - acceptedTypeIdentifiers: an array of UTI types that the receiver
    ///         is able to accept.
    ///     - action: a closure to be invoked when elements are insert in the receiver.
    ///         The closure takes two argument: the first the offset relative to the `Collection` driving
    ///         the view content, the second an array of `NSItemProvider` to retrieve data from.
    public func onInsert(of acceptedTypeIdentifiers: [String], perform action: @escaping (Int, [NSItemProvider]) -> Void) -> some DynamicViewContent

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension DynamicViewContent {

    /// Sets the move action to be used for `self`.
    ///
    /// - Parameter action: the closure to be invoked when elements of the
    ///     receiver are moved.
    ///     The closure receives two arguments that are offsets
    ///     relative to the `Collection` driving the view content.
    ///     Passing `nil` means that move is disabled.
    @inlinable public func onMove(perform action: ((IndexSet, Int) -> Void)?) -> some DynamicViewContent

}

/// Specifies one edge of a rectangle.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum Edge : Int8, CaseIterable {

    case top

    case leading

    case bottom

    case trailing

    /// An efficient set of `Edge`s.
    public struct Set : OptionSet {

        /// The element type of the option set.
        ///
        /// To inherit all the default implementations from the `OptionSet` protocol,
        /// the `Element` type must be `Self`, the default.
        public typealias Element = Edge.Set

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public let rawValue: Int8

        /// Creates a new option set from the given raw value.
        ///
        /// This initializer always succeeds, even if the value passed as `rawValue`
        /// exceeds the static properties declared as part of the option set. This
        /// example creates an instance of `ShippingOptions` with a raw value beyond
        /// the highest element, with a bit mask that effectively contains all the
        /// declared static members.
        ///
        ///     let extraOptions = ShippingOptions(rawValue: 255)
        ///     print(extraOptions.isStrictSuperset(of: .all))
        ///     // Prints "true"
        ///
        /// - Parameter rawValue: The raw value of the option set to create. Each bit
        ///   of `rawValue` potentially represents an element of the option set,
        ///   though raw values may include bits that are not defined as distinct
        ///   values of the `OptionSet` type.
        public init(rawValue: Int8)

        public static let top: Edge.Set

        public static let leading: Edge.Set

        public static let bottom: Edge.Set

        public static let trailing: Edge.Set

        public static let all: Edge.Set

        public static let horizontal: Edge.Set

        public static let vertical: Edge.Set

        /// Creates an instance containing just `e`
        public init(_ e: Edge)

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = Int8

        /// The type of the elements of an array literal.
        public typealias ArrayLiteralElement = Edge.Set.Element
    }

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int8

    /// Creates a new instance with the specified raw value.
    ///
    /// If there is no value of the type that corresponds with the specified raw
    /// value, this initializer returns `nil`. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     print(PaperSize(rawValue: "Legal"))
    ///     // Prints "Optional("PaperSize.Legal")"
    ///
    ///     print(PaperSize(rawValue: "Tabloid"))
    ///     // Prints "nil"
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    public init?(rawValue: Int8)

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public var rawValue: Int8 { get }

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [Edge]

    /// A collection of all values of this type.
    public static var allCases: [Edge] { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Edge : RawRepresentable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EdgeInsets : Equatable {

    public var top: CGFloat

    public var leading: CGFloat

    public var bottom: CGFloat

    public var trailing: CGFloat

    @inlinable public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)

    @inlinable public init()

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EdgeInsets, b: EdgeInsets) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EdgeInsets : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>

    /// The data to be animated.
    public var animatableData: EdgeInsets.AnimatableData
}

/// An ellipse aligned inside the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Ellipse : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to be animated.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Ellipse : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A type suitable for use as the `animatableData` property of types
/// that do not have any animatable properties.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EmptyAnimatableData : VectorArithmetic {

    @inlinable public init()

    /// The zero value.
    ///
    /// Zero is the identity element for addition. For any value,
    /// `x + .zero == x` and `.zero + x == x`.
    @inlinable public static var zero: EmptyAnimatableData { get }

    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    @inlinable public static func += (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData)

    /// Subtracts the second value from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    @inlinable public static func -= (lhs: inout EmptyAnimatableData, rhs: EmptyAnimatableData)

    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// You cannot use `+` with arguments of different types. To add values of
    /// different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) + y              // 1000021
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    @inlinable public static func + (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData

    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// You cannot use `-` with arguments of different types. To subtract values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: UInt8 = 21
    ///     let y: UInt = 1000000
    ///     y - UInt(x)             // 999979
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    @inlinable public static func - (lhs: EmptyAnimatableData, rhs: EmptyAnimatableData) -> EmptyAnimatableData

    /// Multiplies each component of `self` by the scalar `rhs`.
    @inlinable public mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    @inlinable public var magnitudeSquared: Double { get }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: EmptyAnimatableData, b: EmptyAnimatableData) -> Bool
}

/// The empty, or identity, modifier.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EmptyModifier {

    public static let identity: EmptyModifier

    @inlinable public init()

    /// Returns the current body of `self`. `content` is a proxy for
    /// the view that will have the modifier represented by `Self`
    /// applied to it.
    public func body(content: EmptyModifier.Content) -> Never

    /// The type of view representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EmptyModifier : ViewModifier {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EmptyView {

    @inlinable public init()

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EmptyView : View {
}

/// A linked View property that reads a value from the view's
/// environment.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct Environment<Value> : DynamicProperty {

    /// Initializes to read the environment property `keyPath`.
    @inlinable public init(_ keyPath: KeyPath<EnvironmentValues, Value>)

    /// The current value of the environment property.
    @inlinable public var wrappedValue: Value { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol EnvironmentKey {

    associatedtype Value

    static var defaultValue: Self.Value { get }
}

/// A linked View property that reads a `ObservableObject` supplied by an
/// ancestor view that will automatically invalidate its view when the object
/// changes.
///
/// - Precondition: A model must be provided on an ancestor view by calling
///     `environmentObject(_:)`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying `ObservableObject` that can create
    /// `Binding`s to its properties using dynamic member lookup.
    @dynamicMemberLookup public struct Wrapper {

        /// Creates a `Binding` to a value semantic property of a
        /// reference type.
        ///
        /// If `Value` is not value semantic, the updating behavior for
        /// any views that make use of the resulting `Binding` is
        /// unspecified.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    /// The current model supplied by an ancestor view.
    @inlinable public var wrappedValue: ObjectType { get }

    public var projectedValue: EnvironmentObject<ObjectType>.Wrapper { get }

    public init()
}

/// A collection of environment values.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EnvironmentValues : CustomStringConvertible {

    public init()

    public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey

    /// A textual representation of this instance.
    ///
    /// Calling this property directly is discouraged. Instead, convert an
    /// instance of any type to a string by using the `String(describing:)`
    /// initializer. This initializer works with any type, and uses the custom
    /// `description` property for types that conform to
    /// `CustomStringConvertible`:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    public var sizeCategory: ContentSizeCategory
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    public var layoutDirection: LayoutDirection
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The current undo manager that views should use to register undo
    /// operations.
    ///
    /// The `UndoManager` is `nil`, the environemnt represents a context
    /// where undo/redo is not supported, and registrations can be skipped.
    public var undoManager: UndoManager? { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// Whether the view with this environment can be interacted with.
    ///
    /// The default value is true.
    public var isEnabled: Bool
}

extension EnvironmentValues {

    /// Whether auto-correction is enabled for the view hierarchy contained
    /// in `self`.
    ///
    /// The default is `nil`, which means the system default will be applied.
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public var disableAutocorrection: Bool?
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default font of this environment.
    public var font: Font?

    /// The display scale of this environment.
    public var displayScale: CGFloat

    /// The size of a pixel on the screen. Equal to 1 / displayScale.
    public var pixelLength: CGFloat { get }

    /// The accessibility bold text setting.
    public var legibilityWeight: LegibilityWeight?

    /// The current locale that views should use.
    public var locale: Locale

    /// The current calendar that views should use when handling dates.
    public var calendar: Calendar

    /// The current time zone that views should use when handling dates.
    public var timeZone: TimeZone

    /// The color scheme of this environment.
    ///
    /// If you're writing custom drawing code that depends on the current color
    /// scheme, you should also consider the `colorSchemeContrast` property.
    /// You can specify images and colors in asset catalogs
    /// according to either the `light` or `dark` color scheme, as well as
    /// standard or increased contrast. The correct image or color displays
    /// automatically for the current environment.
    ///
    /// You only need to check `colorScheme` and `colorSchemeContrast` for
    /// custom drawing if the differences go beyond images and colors.
    public var colorScheme: ColorScheme

    /// The contrast associated with the color scheme of this environment.
    public var colorSchemeContrast: ColorSchemeContrast { get }
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var controlActiveState: ControlActiveState
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// A `Binding` to the current `PresentationMode` of this view.
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
    public var presentationMode: Binding<PresentationMode> { get }
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {

    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var controlSize: ControlSize
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// Whether the system preference for Differentiate without Color is enabled.
    /// If this is true, UI should not convey information using color alone
    /// and instead should use shapes or glyphs to convey information.
    public var accessibilityDifferentiateWithoutColor: Bool { get }

    /// Whether the system preference for reduce transparency is enabled.
    /// If this property's value is true, UI (mainly window) backgrounds should
    /// not be semi-transparent; they should be opaque.
    public var accessibilityReduceTransparency: Bool { get }

    /// Whether the system preference for reduce motion is enabled.
    /// If this property's value is true, UI should avoid large animations,
    /// especially those that simulate the third dimension.
    public var accessibilityReduceMotion: Bool { get }

    /// Whether the system preference for invert colors is enabled.
    /// If this property's value is true then the display will be inverted.
    /// In these cases it may be needed for UI drawing to be adjusted to in
    /// order to display optimally when inverted.
    public var accessibilityInvertColors: Bool { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// How `Text` will align its lines with respect to one another when the
    /// content wraps, or contains newlines.
    ///
    /// - Note: because the horizontal bounds of `Text` never exceed its
    ///   graphical extent, this property has almost no effect on single-line
    ///   `Text`.  Use alignment parameters on a parent view to align `Text`
    ///   with respect to its parent.
    public var multilineTextAlignment: TextAlignment

    /// How the last line of text is truncated to fit into the available space.
    ///
    /// The default is `.tail`.
    public var truncationMode: Text.TruncationMode

    public var lineSpacing: CGFloat

    /// Whether inter-character spacing should tighten, in order to fit the text
    /// into the available space.
    ///
    /// The default is `false`.
    public var allowsTightening: Bool

    /// A limit on the number of lines used to render text in the available
    /// space.
    ///
    /// If `nil`, the text uses as many lines as required.
    ///
    /// The default is `nil`.
    ///
    /// - Note: a non-nil `number` less than 1 will be treated as 1.
    public var lineLimit: Int?

    /// The minimum permissible proportion to shrink the font size, in order to
    /// fit the text into the available space.
    ///
    /// For example, a label with a `minimumScaleFactor` of `0.5` will draw its
    /// text in a font size as small as half of the actual font if needed.
    ///
    /// The default is `1.0`.
    ///
    /// - Precondition: 0.0 < `minimumScaleFactor` <= 1.0
    public var minimumScaleFactor: CGFloat
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// If an assistive technology is enabled
    public var accessibilityEnabled: Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    public var managedObjectContext: NSManagedObjectContext
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {

    /// The default minimum height of a row in a `List`.
    public var defaultMinListRowHeight: CGFloat

    /// The minimum height of a header in a `List`.
    ///
    /// The default value is `nil`, which means the system will choose the
    /// appropriate value automatically.
    public var defaultMinListHeaderHeight: CGFloat?
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension EnvironmentValues {
}

/// A modifier that needs to be resolved in an environment before it can be used.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {

    /// The type of modifier to use after being resolved.
    associatedtype ResolvedModifier : ViewModifier

    /// Resolve to a concrete modifier in the given `environment`.
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
}

/// A view type that compares itself against its previous value and
/// prevents its child updating if its new value is the same as its old
/// value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EquatableView<Content> : View where Content : Equatable, Content : View {

    public var content: Content

    @inlinable public init(content: Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct EventModifiers : OptionSet {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: Int

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: Int)

    public static let capsLock: EventModifiers

    public static let shift: EventModifiers

    public static let control: EventModifiers

    public static let option: EventModifiers

    public static let command: EventModifiers

    public static let numericPad: EventModifiers

    public static let function: EventModifiers

    public static let all: EventModifiers

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = EventModifiers

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = EventModifiers
}

/// A pair of gestures where only can succeed, giving precedence to
/// the first of the pair.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ExclusiveGesture<First, Second> where First : Gesture, Second : Gesture {

    /// The type of value produced by this gesture.
    public enum Value {

        /// The first gesture's value.
        case first(First.Value)

        /// The second gesture's value.
        case second(Second.Value)
    }

    public var first: First

    public var second: Second

    /// Creates an instance from two child gestures.
    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ExclusiveGesture : Gesture {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ExclusiveGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ExclusiveGesture<First, Second>.Value, b: ExclusiveGesture<First, Second>.Value) -> Bool
}

/// Property wrapper to help Core Data clients drive views from the results of
/// a fetch request. The managed object context used by the fetch request and
/// its results is provided by @Environment(\.managedObjectContext).
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct FetchRequest<Result> : DynamicProperty where Result : NSFetchRequestResult {

    /// The current collection of fetched results.
    public var wrappedValue: FetchedResults<Result> { get }

    /// Creates an instance by defining a fetch request based on the parameters.
    /// - Parameters:
    ///   - entity: The kind of modeled object to fetch.
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(entity: NSEntityDescription, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil)

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, animation: Animation? = nil)

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - transaction: The transaction used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, transaction: Transaction)

    /// Called immediately before the view's body() function is
    /// executed, after updating the values of any dynamic properties
    /// stored in `self`.
    public mutating func update()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest where Result : NSManagedObject {

    /// Creates an instance by defining a fetch request based on the parameters.
    /// The fetch request will automatically infer the entity using Result.entity().
    /// - Parameters:
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil)
}

/// The FetchedResults collection type represents the results of performing a
/// fetch request. Internally, it may use strategies such as batching and
/// transparent futures to minimize memory use and I/O.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FetchedResults<Result> : RandomAccessCollection where Result : NSFetchRequestResult {

    /// The position of the first element in a nonempty collection.
    ///
    /// If the collection is empty, `startIndex` is equal to `endIndex`.
    public var startIndex: Int { get }

    /// The collection's "past the end" position---that is, the position one
    /// greater than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of a collection, use
    /// the half-open range operator (`..<`) with `endIndex`. The `..<` operator
    /// creates a range that doesn't include the upper bound, so it's always
    /// safe to use with `endIndex`. For example:
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let index = numbers.firstIndex(of: 30) {
    ///         print(numbers[index ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the collection is empty, `endIndex` is equal to `startIndex`.
    public var endIndex: Int { get }

    /// Accesses the element at the specified position.
    ///
    /// The following example accesses an element of an array through its
    /// subscript to print its value:
    ///
    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     print(streets[1])
    ///     // Prints "Bryant"
    ///
    /// You can subscript a collection with any valid index other than the
    /// collection's end index. The end index refers to the position one past
    /// the last element of a collection, so it doesn't correspond with an
    /// element.
    ///
    /// - Parameter position: The position of the element to access. `position`
    ///   must be a valid index of the collection that is not equal to the
    ///   `endIndex` property.
    ///
    /// - Complexity: O(1)
    public subscript(position: Int) -> Result { get }

    /// A type representing the sequence's elements.
    public typealias Element = Result

    /// A type that represents a position in the collection.
    ///
    /// Valid indices consist of the position of every element and a
    /// "past the end" position that's not valid for use as a subscript
    /// argument.
    public typealias Index = Int

    /// A sequence that represents a contiguous subrange of the collection's
    /// elements.
    ///
    /// This associated type appears as a requirement in the `Sequence`
    /// protocol, but it is restated here with stricter constraints. In a
    /// collection, the subsequence should also conform to `Collection`.
    public typealias SubSequence = Slice<FetchedResults<Result>>

    /// A type that represents the indices that are valid for subscripting the
    /// collection, in ascending order.
    public typealias Indices = Range<Int>

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    public typealias Iterator = IndexingIterator<FetchedResults<Result>>
}

/// A system style that displays the components in an editable field.
///
/// This style is useful when space is constrained and users expect to
/// make specific date and time selections. `stepperField` should be
/// preferred over this style unless the use case requires hiding the
/// stepper.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FieldDatePickerStyle : DatePickerStyle {

    public init()
}

/// A style for rasterizing vector shapes.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FillStyle : Equatable {

    /// A Boolean value that indicates whether to use the even-odd rule when
    /// rendering a shape.
    ///
    /// When `isOEFilled` is `false`, the style uses the non-zero winding
    /// number rule.
    public var isEOFilled: Bool

    /// A Boolean value that indicates whether to apply antialiasing the edges
    /// of a shape.
    public var isAntialiased: Bool

    /// Creates a new style with the specified settings.
    ///
    /// - Parameters:
    ///   - eoFill: A Boolean value that indicates whether to use the even-od
    ///     rule for rendering a shape. Pass `false` to use the non-zero
    ///     winding number rule instead.
    ///   - antialiased: A Boolean value that indicates whether to use
    ///     antialiasing when rendering the edges of a shape.
    public init(eoFill: Bool = false, antialiased: Bool = true)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: FillStyle, b: FillStyle) -> Bool
}

/// An environment-dependent font.
///
/// A `Font` is a late-binding token - its actual value is only resolved
/// when it is about to be used in a given environment. At that time it is
/// resolved to a concrete value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Font : Hashable {

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Font, rhs: Font) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Create a font with the large title text style.
    public static let largeTitle: Font

    /// Create a font with the title text style.
    public static let title: Font

    /// Create a font with the headline text style.
    public static var headline: Font

    /// Create a font with the subheadline text style.
    public static var subheadline: Font

    /// Create a font with the body text style.
    public static var body: Font

    /// Create a font with the callout text style.
    public static var callout: Font

    /// Create a font with the footnote text style.
    public static var footnote: Font

    /// Create a font with the caption text style.
    public static var caption: Font

    /// Create a system font with the given `style`.
    public static func system(_ style: Font.TextStyle, design: Font.Design = .default) -> Font

    /// Create a system font with the given `size`, `weight` and `design`.
    public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font

    /// Create a custom font with the given `name` and `size`.
    public static func custom(_ name: String, size: CGFloat) -> Font

    /// Create a custom font with the given CTFont.
    public init(_ font: CTFont)

    /// A dynamic text style to use for fonts.
    public enum TextStyle : CaseIterable {

        case largeTitle

        case title

        case headline

        case subheadline

        case body

        case callout

        case footnote

        case caption

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.TextStyle, b: Font.TextStyle) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)

        /// A type that can represent a collection of all values of this type.
        public typealias AllCases = [Font.TextStyle]

        /// A collection of all values of this type.
        public static var allCases: [Font.TextStyle] { get }
    }

    /// A design to use for fonts.
    public enum Design : Hashable {

        case `default`

        @available(watchOS, unavailable)
        case serif

        case rounded

        @available(watchOS, unavailable)
        case monospaced

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.Design, b: Font.Design) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {

    /// Create a version of `self` that is italic.
    public func italic() -> Font

    /// Create a version of `self` that uses both lowercase and uppercase small
    /// capitals.
    ///
    /// - See Also: `Font.lowercaseSmallCaps()` and `Font.uppercaseSmallCaps()`
    ///   for more details.
    public func smallCaps() -> Font

    /// Create a version of `self` that uses lowercase small capitals.
    /// This feature turns lowercase characters into small capitals with
    /// OpenType or AAT feature. It is generally used for display lines set in
    /// large & small caps, such as titles. Glyphs related to small capitals,
    /// such as oldstyle figures, may be included.
    public func lowercaseSmallCaps() -> Font

    /// Create a version of `self` that uses uppercase small capitals.
    /// This feature turns capital characters into small capitals. It is
    /// generally used for words which would otherwise be set in all caps, such
    /// as acronyms, but which are desired in small-cap shape to avoid
    /// disrupting the flow of text.
    public func uppercaseSmallCaps() -> Font

    /// Create a version of `self` that uses monospace digits.
    public func monospacedDigit() -> Font

    /// Create a version of `self` that has the specified `weight`.
    public func weight(_ weight: Font.Weight) -> Font

    /// Create a version of `self` that is bold.
    public func bold() -> Font

    /// A weight to use for fonts.
    public struct Weight : Hashable {

        public static let ultraLight: Font.Weight

        public static let thin: Font.Weight

        public static let light: Font.Weight

        public static let regular: Font.Weight

        public static let medium: Font.Weight

        public static let semibold: Font.Weight

        public static let bold: Font.Weight

        public static let heavy: Font.Weight

        public static let black: Font.Weight

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Font.Weight, b: Font.Weight) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font.TextStyle : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font.TextStyle : Hashable {
}

/// A structure that computes views on demand from an underlying collection of
/// of identified data.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable {

    /// The collection of underlying identified data.
    public var data: Data

    /// A function that can be used to generate content on demand given
    /// underlying data.
    public var content: (Data.Element) -> Content
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach : View where Content : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where ID == Data.Element.ID, Content : View, Data.Element : Identifiable {

    /// Creates an instance that uniquely identifies views across updates based
    /// on the identity of the underlying data element.
    ///
    /// It's important that the ID of a data element does not change unless the
    /// data element is considered to have been replaced with a new data
    /// element with a new identity. If the ID of a data element changes, then
    /// the content view generated from that data element will lose any current
    /// state and animations.
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Content : View {

    /// Creates an instance that uniquely identifies views across updates based
    /// on the `id` key path to a property on an underlying data element.
    ///
    /// It's important that the ID of a data element does not change unless the
    /// data element is considered to have been replaced with a new data
    /// element with a new identity. If the ID of a data element changes, then
    /// the content view generated from that data element will lose any current
    /// state and animations.
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach where Data == Range<Int>, ID == Int, Content : View {

    /// Creates an instance that computes views on demand over a *constant*
    /// range.
    ///
    /// This instance only reads the initial value of `data` and so it does not
    /// need to identify views across updates.
    ///
    /// To compute views on demand over a dynamic range use
    /// `ForEach(_:id:content:)`.
    public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach : DynamicViewContent where Content : View {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ForegroundStyle {

    @inlinable public init()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForegroundStyle : ShapeStyle {
}

/// A container for grouping controls used for data entry, such as in settings
/// or inspectors.
///
/// - SeeAlso: `Section`, which can be used to add sections between groups of
///     content.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Form<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// Changes the visual appearance of a view without changing its
/// ancestors or descendents, other than changing the coordinate
/// transform to and from them.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol GeometryEffect : Animatable, ViewModifier where Self.Body == Never {

    /// The current value of the effect.
    func effectValue(size: CGSize) -> ProjectionTransform
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension GeometryEffect {

    /// Returns an effect producing the same geometry transform as
    /// `self` but that will only be applied while rendering its view,
    /// not while the view is performing its layout calculations. This
    /// is often used to disable layout changes during transitions.
    @inlinable public func ignoredByLayout() -> _IgnoredByLayoutEffect<Self>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension GeometryEffect {
}

/// Acts as a proxy for access to the size and coordinate space (for
/// anchor resolution) of the container view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GeometryProxy {

    /// The size of the container view.
    public var size: CGSize { get }

    /// Resolves the value of `anchor` to the container view.
    public subscript<T>(anchor: Anchor<T>) -> T { get }

    /// The safe area inset of the container view.
    public var safeAreaInsets: EdgeInsets { get }

    /// The container view's bounds rectangle converted to a defined
    /// coordinate space.
    public func frame(in coordinateSpace: CoordinateSpace) -> CGRect
}

/// A container view that defines its content as a function of its own
/// size and coordinate space. Returns a flexible preferred size to its
/// parent layout.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GeometryReader<Content> : View where Content : View {

    public var content: (GeometryProxy) -> Content

    @inlinable public init(@ViewBuilder content: @escaping (GeometryProxy) -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An input gesture, a value that matches a sequence of events and
/// returns a stream of values.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Gesture {

    /// The type of value produced by this gesture.
    associatedtype Value

    /// The type of gesture representing the body of `Self`.
    associatedtype Body : Gesture

    /// Returns the current body of `self`.
    var body: Self.Body { get }
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Gesture {

    /// Returns a new gesture that is the same as `self` except that it only
    /// matches events as long as the modifier keys corresponding to the given
    /// modifiers option set are held down.
    ///
    /// - Parameters:
    ///     - modifiers: A set of flags corresponding to the modifier keys that
    ///       must be down in order for the gesture to succeed.
    /// - Returns: A new gesture.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func modifiers(_ modifiers: EventModifiers) -> _ModifiersGesture<Self>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Adds an action to perform when the gesture ends.
    ///
    /// - Parameter action: The action to perform when this gesture ends. The
    ///   `action` closure's parameter contains the final value of the
    ///    gesture.
    /// - Returns: A gesture that triggers `action` when the gesture ends.
    public func onEnded(_ action: @escaping (Self.Value) -> Void) -> _EndedGesture<Self>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture where Self.Value : Equatable {

    /// Adds an action to perform when the gesture's value changes.
    ///
    /// - Parameter action: The action to perform when this gesture's value
    ///   changes. The `action` closure's parameter contains the gesture's new
    ///   value.
    /// - Returns: A gesture that triggers `action` when this gesture's value
    ///   changes.
    public func onChanged(_ action: @escaping (Self.Value) -> Void) -> _ChangedGesture<Self>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    @inlinable public func simultaneously<Other>(with other: Other) -> SimultaneousGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    public func map<T>(_ body: @escaping (Self.Value) -> T) -> _MapGesture<Self, T>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    @inlinable public func exclusively<Other>(before other: Other) -> ExclusiveGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Returns a new gesture that will sequence `self` and `other`,
    /// such that `other` does not receive any events until `self` has
    /// succeeded.
    @inlinable public func sequenced<Other>(before other: Other) -> SequenceGesture<Self, Other> where Other : Gesture
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Returns a new version of the gesture that will use the `body`
    /// function to update `state` as the gesture's value changes,
    /// resetting `state` to its initial value when the gesture becomes
    /// inactive.
    @inlinable public func updating<State>(_ state: GestureState<State>, body: @escaping (Self.Value, inout State, inout Transaction) -> Void) -> GestureStateGesture<Self, State>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GestureMask : OptionSet {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: UInt32

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: UInt32)

    public static let none: GestureMask

    public static let gesture: GestureMask

    public static let subviews: GestureMask

    public static let all: GestureMask

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = GestureMask

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = GestureMask

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = UInt32
}

/// Link type to store gesture state that is updated as a gesture
/// changes and implicitly reset when the gesture becomes inactive.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct GestureState<Value> : DynamicProperty {

    /// Initialize with the initial state value.
    public init(wrappedValue: Value)

    /// Initialize with the initial state value.
    public init(initialValue: Value)

    /// Initialize with the initial state value, and the transaction
    /// used to reset the state back to the initial value when its
    /// associated gesture becomes inactive.
    public init(wrappedValue: Value, resetTransaction: Transaction)

    /// Initialize with the initial state value, and the transaction
    /// used to reset the state back to the initial value when its
    /// associated gesture becomes inactive.
    public init(initialValue: Value, resetTransaction: Transaction)

    /// Initialize with the initial state value, and a function that's
    /// called to provide the transaction used to reset the state back
    /// to the initial value when its associated gesture becomes
    /// inactive.
    public init(wrappedValue: Value, reset: @escaping (Value, inout Transaction) -> Void)

    /// Initialize with the initial state value, and a function that's
    /// called to provide the transaction used to reset the state back
    /// to the initial value when its associated gesture becomes
    /// inactive.
    public init(initialValue: Value, reset: @escaping (Value, inout Transaction) -> Void)

    /// The current value of the state.
    public var wrappedValue: Value { get }

    /// The GestureState value, exposed via `$property` syntax.
    public var projectedValue: GestureState<Value> { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension GestureState where Value : ExpressibleByNilLiteral {

    public init(resetTransaction: Transaction = Transaction())

    public init(reset: @escaping (Value, inout Transaction) -> Void)
}

/// The result of calling `Gesture.updating()`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct GestureStateGesture<Base, State> : Gesture where Base : Gesture {

    /// The type of value produced by this gesture.
    public typealias Value = Base.Value

    public var base: Base

    public var state: GestureState<State>

    public var body: (Base.Value, inout State, inout Transaction) -> Void

    @inlinable public init(base: Base, state: GestureState<State>, body: @escaping (GestureStateGesture<Base, State>.Value, inout State, inout Transaction) -> Void)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A color gradient. Represented as an array of color stops, each
/// color having a parametric location value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Gradient : Equatable {

    /// One color stop in the gradient.
    public struct Stop : Equatable {

        /// The color for the stop.
        public var color: Color

        /// The parametric location of the stop, must be in the range
        /// [0, 1] or results are undefined.
        public var location: CGFloat

        /// Initialize with a color and location.
        public init(color: Color, location: CGFloat)

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Gradient.Stop, b: Gradient.Stop) -> Bool
    }

    /// The array of color stops.
    public var stops: [Gradient.Stop]

    /// Initialize with an array of color stops.
    public init(stops: [Gradient.Stop])

    /// Initialize with an array of colors, location values will be
    /// synthesized to evenly space the colors along the gradient.
    public init(colors: [Color])

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Gradient, b: Gradient) -> Bool
}

/// A system style of `DatePicker` that displays an interactive calendar or
/// clock.
///
/// This style is useful when wanting to allow browsing through days in a
/// calendar, or when the look of a clock face is appropriate.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GraphicalDatePickerStyle : DatePickerStyle {

    public init()
}

/// An affordance for grouping view content.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Group<Content> {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Group : View where Content : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    @inlinable public init(@ViewBuilder content: () -> Content)
}

/// A stylized view with an optional label that is associated with a logical
/// grouping of content.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct GroupBox<Label, Content> : View where Label : View, Content : View {

    public init(label: Label, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension GroupBox where Label == EmptyView {

    public init(@ViewBuilder content: () -> Content)
}

/// A layout container that arranges its children in a horizontal line
/// and allows the user to resize them using dividers placed between them.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct HSplitView<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A view that arranges its children in a vertical line.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct HStack<Content> : View where Content : View {

    /// Creates an instance with the given `spacing` and Y axis `alignment`.
    ///
    /// - Parameters:
    ///     - alignment: the guide that will have the same horizontal screen
    ///       coordinate for all children.
    ///     - spacing: the distance between adjacent children, or nil if the
    ///       stack should choose a default distance for each pair of children.
    @inlinable public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// An alignment position along the horizontal axis
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct HorizontalAlignment {

    /// Creates an instance with the given ID.
    ///
    /// Note: each instance should have a unique ID.
    public init(_ id: AlignmentID.Type)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: HorizontalAlignment, b: HorizontalAlignment) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension HorizontalAlignment {

    /// A guide marking the leading edge of the view.
    public static let leading: HorizontalAlignment

    /// A guide marking the horizontal center of the view.
    public static let center: HorizontalAlignment

    /// A guide marking the trailing edge of the view.
    public static let trailing: HorizontalAlignment
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension HorizontalAlignment : Equatable {
}

/// An environment-dependent image.
///
/// An `Image` is a late-binding token - its actual value is only resolved
/// when it is about to be used in a given environment. At that time it is
/// resolved to a concrete value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Image : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Image, rhs: Image) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates a labeled image usable as content for controls.
    ///
    /// - Parameters:
    ///     - name: the name of the image resource to lookup, as well as
    ///       the localization key with which to label the image.
    ///     - bundle: the bundle to search for the image resource and
    ///       localization content. If `nil`, uses the main `Bundle`.
    ///       Defaults to `nil`.
    public init(_ name: String, bundle: Bundle? = nil)

    /// Creates a labeled image usable as content for controls, with an custom
    /// specified label.
    ///
    /// - Parameters:
    ///     - name: the name of the image resource to lookup
    ///     - bundle: the bundle to search for the image resource.
    ///       If `nil`, uses the main `Bundle`. Defaults to `nil`.
    ///     - label: The label associated with the image. The label is used for
    ///       things like accessibility.
    public init(_ name: String, bundle: Bundle? = nil, label: Text)

    /// Creates an unlabeled, decorative image.
    ///
    /// - Parameters:
    ///   - name: the name of the image resource to lookup
    ///   - bundle: the bundle to search for the image resource. If `nil`, uses
    ///     the main `Bundle`. Defaults to `nil`.
    ///
    /// This image will be specifically ignored for accessibility purposes.
    public init(decorative name: String, bundle: Bundle? = nil)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Image {

    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(nsImage: NSImage)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public enum TemplateRenderingMode {

        case template

        case original

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.TemplateRenderingMode, b: Image.TemplateRenderingMode) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public enum Interpolation {

        case none

        case low

        case medium

        case high

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.Interpolation, b: Image.Interpolation) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public func interpolation(_ interpolation: Image.Interpolation) -> Image

    public func antialiased(_ isAntialiased: Bool) -> Image
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    public enum ResizingMode {

        case tile

        case stretch

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Image.ResizingMode, b: Image.ResizingMode) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }

    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// Creates a labeled image based on a `CGImage`, usable as content for
    /// controls.
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    ///   - label: The label associated with the image. The label is used for
    ///     things like accessibility.
    public init(_ cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up, label: Text)

    /// Creates an unlabeled, decorative image based on a `CGImage`.
    ///
    /// - Parameters:
    ///   - cgImage: the base graphical image
    ///   - scale: the scale factor the image is intended for
    ///     (e.g. 1.0, 2.0, 3.0)
    ///   - orientation: the orientation of the image
    ///
    /// This image will be specifically ignored for accessibility purposes.
    public init(decorative cgImage: CGImage, scale: CGFloat, orientation: Image.Orientation = .up)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image {

    /// The orientation of an image.
    public enum Orientation : UInt8, CaseIterable, Hashable {

        case up

        case upMirrored

        case down

        case downMirrored

        case left

        case leftMirrored

        case right

        case rightMirrored

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = UInt8

        /// Creates a new instance with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init?(rawValue: UInt8)

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public var rawValue: UInt8 { get }

        /// A type that can represent a collection of all values of this type.
        public typealias AllCases = [Image.Orientation]

        /// A collection of all values of this type.
        public static var allCases: [Image.Orientation] { get }
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image : View {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.TemplateRenderingMode : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.Interpolation : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.ResizingMode : Hashable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Image.Orientation : RawRepresentable {
}

/// A shape style that fills a shape with a repeated subregion of an
/// image.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ImagePaint : ShapeStyle {

    /// The image to be drawn.
    public var image: Image

    /// A unit-space rectangle defining how much of the source image to
    /// draw. Results are undefined if this selects areas outside the
    /// [0, 1] range in either axis.
    public var sourceRect: CGRect

    /// A scale factor applied to the image while being drawn.
    public var scale: CGFloat

    /// Initializes with the subrect of `image` defined by
    /// `sourceRect`, a rectangle in the unit coordinate space of
    /// `image`. A scale factor is applied while rendering. Results are
    /// undefined if `sourceRect` selects areas outside the [0, 1]
    /// range in either axis
    public init(image: Image, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1)
}

/// A shape type that is able to inset itself to produce another shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol InsettableShape : Shape {

    /// The type of the inset shape.
    associatedtype InsetShape : InsettableShape

    /// Returns `self` inset by `amount`.
    func inset(by amount: CGFloat) -> Self.InsetShape
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension InsettableShape {

    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with `content`.
    @inlinable public func strokeBorder<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> some View where S : ShapeStyle


    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with the foreground color.
    @inlinable public func strokeBorder(style: StrokeStyle, antialiased: Bool = true) -> some View


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with `content`. This is
    /// equivalent to insetting `self` by `width / 2` and stroking the
    /// resulting shape with `width` as the line-width.
    @inlinable public func strokeBorder<S>(_ content: S, lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View where S : ShapeStyle


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with the foreground color.
    /// This is equivalent to insetting `self` by `width / 2` and
    /// stroking the resulting shape with `width` as the line-width.
    @inlinable public func strokeBorder(lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LayoutDirection : Hashable, CaseIterable {

    case leftToRight

    case rightToLeft

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LayoutDirection, b: LayoutDirection) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [LayoutDirection]

    /// A collection of all values of this type.
    public static var allCases: [LayoutDirection] { get }
}

/// The LegibilityWeight enumerates the Accessibility Bold Text user setting
/// options. The user's choice cannot be overridden by the app.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum LegibilityWeight : Hashable {

    /// Use regular font weight (no Accessibility Bold).
    case regular

    /// Use heavier font weight (force Accessibility Bold).
    case bold

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LegibilityWeight, b: LegibilityWeight) -> Bool
}

/// A linear gradient. The gradient's color function is applied along
/// an axis, where the axis is defined by a start and end points. The
/// unit-space points are mapped into the bounding rectangle of each
/// shape filled with the gradient.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct LinearGradient : ShapeStyle, View {

    public init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A standard `Button` style used for buttons that emulate links.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct LinkButtonStyle : PrimitiveButtonStyle {

    public init()

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    public func makeBody(configuration: LinkButtonStyle.Configuration) -> some View


    /// A `View` representing the body of a `Button`.
    public typealias Body = some View
}

/// A container that presents rows of data arranged in a single column.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct List<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates a List that supports multiple selection.
    ///
    /// - Parameter selection: A binding to a set that identifies the selected
    ///   rows.
    ///
    /// - See Also: `View.selectionValue` which gives an identifier to the rows.
    ///
    /// - Note: On iOS and tvOS, you must explicitly put the `List` into Edit
    ///   Mode for the selection to apply.
    @available(watchOS, unavailable)
    public init(selection: Binding<Set<SelectionValue>>?, @ViewBuilder content: () -> Content)

    /// Creates a List that supports optional single selection.
    ///
    /// - Parameter selection: A binding to the optionally selected row.
    ///
    /// - See Also: `View.selectionValue` which gives an identifier to the rows.
    ///
    /// - Note: On iOS and tvOS, you must explicitly put the `List` into Edit
    ///   Mode for the selection to apply.
    @available(watchOS, unavailable)
    public init(selection: Binding<SelectionValue?>?, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension List {

    /// Creates a List that computes its rows on demand from an underlying
    /// collection of identified data.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a List that identifies its rows based on the `id` key path to a
    /// property on an underlying data element.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a List that computes views on demand over a *constant* range.
    ///
    /// This instance only reads the initial value of `data` and so it does not
    /// need to identify views across updates.
    ///
    /// To compute views on demand over a dynamic range use
    /// `List(_:id:selection:content:)`.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<Set<SelectionValue>>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View

    /// Creates a List that computes its rows on demand from an underlying
    /// collection of identified data.
    @available(watchOS, unavailable)
    public init<Data, RowContent>(_ data: Data, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a List that identifies its rows based on the `id` key path to a
    /// property on an underlying data element.
    @available(watchOS, unavailable)
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a List that computes views on demand over a *constant* range.
    ///
    /// This instance only reads the initial value of `data` and so it does not
    /// need to identify views across updates.
    ///
    /// To compute views on demand over a dynamic range use
    /// `List(_:id:selection:content:)`.
    @available(watchOS, unavailable)
    public init<RowContent>(_ data: Range<Int>, selection: Binding<SelectionValue?>?, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension List where SelectionValue == Never {

    public init(@ViewBuilder content: () -> Content)

    /// Creates a List that computes its rows on demand from an underlying
    /// collection of identified data.
    public init<Data, RowContent>(_ data: Data, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, Data.Element.ID, HStack<RowContent>>, Data : RandomAccessCollection, RowContent : View, Data.Element : Identifiable

    /// Creates a List that identifies its rows based on the `id` key path to a
    /// property on an underlying data element.
    public init<Data, ID, RowContent>(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) where Content == ForEach<Data, ID, HStack<RowContent>>, Data : RandomAccessCollection, ID : Hashable, RowContent : View

    /// Creates a List that computes views on demand over a *constant* range.
    ///
    /// This instance only reads the initial value of `data` and so it does not
    /// need to identify views across updates.
    ///
    /// To compute views on demand over a dynamic range use
    /// `List(_:id:content:)`.
    public init<RowContent>(_ data: Range<Int>, @ViewBuilder rowContent: @escaping (Int) -> RowContent) where Content == ForEach<Range<Int>, Int, HStack<RowContent>>, RowContent : View
}

/// A specification for the appearance and interaction of a `List`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ListStyle {
}

/// The key used to looked up in a .string or .stringdict file.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct LocalizedStringKey : Equatable, ExpressibleByStringInterpolation {

    public init(_ value: String)

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String)

    /// Creates an instance from a string interpolation.
    /// 
    /// Most `StringInterpolation` types will store information about the
    /// literals and interpolations appended to them in one or more properties.
    /// `init(stringInterpolation:)` should use these properties to initialize
    /// the instance.
    /// 
    /// - Parameter stringInterpolation: An instance of `StringInterpolation`
    ///             which has had each segment of the string literal appended
    ///             to it.
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation)

    /// The type each segment of a string literal containing interpolations
    /// should be appended to.
    ///
    /// The `StringLiteralType` of an interpolation type must match the
    /// `StringLiteralType` of the conforming type.
    public struct StringInterpolation : StringInterpolationProtocol {

        /// Creates an empty instance ready to be filled with string literal content.
        /// 
        /// Don't call this initializer directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        /// 
        /// Swift passes this initializer a pair of arguments specifying the size of
        /// the literal segments and the number of interpolated segments. Use this
        /// information to estimate the amount of storage you will need.
        /// 
        /// - Parameter literalCapacity: The approximate size of all literal segments
        ///   combined. This is meant to be passed to `String.reserveCapacity(_:)`;
        ///   it may be slightly larger or smaller than the sum of the counts of each
        ///   literal segment.
        /// - Parameter interpolationCount: The number of interpolations which will be
        ///   appended. Use this value to estimate how much additional capacity will
        ///   be needed for the interpolated segments.
        public init(literalCapacity: Int, interpolationCount: Int)

        /// Appends a literal segment to the interpolation.
        /// 
        /// Don't call this method directly. Instead, initialize a variable or
        /// constant using a string literal with interpolated expressions.
        /// 
        /// Interpolated expressions don't pass through this method; instead, Swift
        /// selects an overload of `appendInterpolation`. For more information, see
        /// the top-level `StringInterpolationProtocol` documentation.
        /// 
        /// - Parameter literal: A string literal containing the characters
        ///   that appear next in the string literal.
        public mutating func appendLiteral(_ literal: String)

        public mutating func appendInterpolation(_ string: String)

        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : ReferenceConvertible

        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject : NSObject

        public mutating func appendInterpolation<T>(_ value: T) where T : _FormatSpecifiable

        public mutating func appendInterpolation<T>(_ value: T, specifier: String) where T : _FormatSpecifiable

        /// The type that should be used for literal segments.
        public typealias StringLiteralType = String
    }

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: LocalizedStringKey, b: LocalizedStringKey) -> Bool
}

/// A gesture that ends once a long-press event sequence has been
/// recognized.
@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct LongPressGesture {

    /// The duration that must elapse before the gesture ends.
    public var minimumDuration: Double

    /// The maximum distance the event can move before the gesture fails.
    public var maximumDistance: CGFloat

    public init(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10)

    /// The type of value produced by this gesture.
    public typealias Value = Bool

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension LongPressGesture : Gesture {
}

/// A gesture that tracks how a magnification event sequence changes.
@available(iOS 13.0, OSX 10.15, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct MagnificationGesture : Gesture {

    /// The minimum delta required before the gesture starts.
    public var minimumScaleDelta: CGFloat

    public init(minimumScaleDelta: CGFloat = 0.01)

    /// The type of value produced by this gesture.
    public typealias Value = CGFloat

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A control which, when interacted with will present controls for the
/// user to interact with. Interaction with any presented control may or may
/// not perform some additional action.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MenuButton<Label, Content> : View where Label : View, Content : View {

    /// Creates an instance of `MenuButton` with a given label and content
    /// to present to the user.
    ///
    /// - Parameters:
    ///   - label: Describes the purpose of this `MenuButton`.
    ///   - content: The content to present to the user when the `MenuButton` is
    ///   interacted with.
    public init(label: Label, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension MenuButton where Label == Text {

    /// Creates an instance of `MenuButton` with a given localized title and
    /// content to be presented to the user.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///     - content: The content to present to the user when the `MenuButton` is
    ///       interacted with.
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content)

    /// Creates an instance of `MenuButton` with a given title and content to
    /// be presented to the user.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - content: The content to present to the user when the `MenuButton` is
    ///     interacted with.
    public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S : StringProtocol
}

/// A custom specification for the appearance and interaction of a `MenuButton`.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol MenuButtonStyle {
}

/// Represents a value with a view modifier applied to it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ModifiedContent<Content, Modifier> {

    public var content: Content

    public var modifier: Modifier

    @inlinable public init(content: Content, modifier: Modifier)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : Equatable where Content : Equatable, Modifier : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ModifiedContent<Content, Modifier>, b: ModifiedContent<Content, Modifier>) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : View where Content : View, Modifier : ViewModifier {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// Declares the content and behavior of this view.
    public var body: ModifiedContent<Content, Modifier>.Body { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : ViewModifier where Content : ViewModifier, Modifier : ViewModifier {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Add an accessibility action to an element.
    public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier>

    /// Add a custom action to an element and all sub-elements.
    public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Content, Modifier>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent : DynamicViewContent where Content : DynamicViewContent, Modifier : ViewModifier {

    /// The collection of underlying data.
    public var data: Content.Data { get }

    /// The type of the underlying collection of data.
    public typealias Data = Content.Data
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Convenience function for attaching an AccessibilityScrollAction to a
    /// view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Content, Modifier>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    /// Convenience function for attaching an AccessibilityAdjustableAction to a
    /// view.
    public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Content, Modifier>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ModifiedContent where Modifier == AccessibilityAttachmentModifier {

    public func accessibility(hidden: Bool) -> ModifiedContent<Content, Modifier>

    public func accessibility(label: Text) -> ModifiedContent<Content, Modifier>

    public func accessibility(value: Text) -> ModifiedContent<Content, Modifier>

    public func accessibility(hint: Text) -> ModifiedContent<Content, Modifier>

    public func accessibility(addTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    public func accessibility(removeTraits traits: AccessibilityTraits) -> ModifiedContent<Content, Modifier>

    public func accessibility(identifier: String) -> ModifiedContent<Content, Modifier>

    public func accessibility(sortPriority: Double) -> ModifiedContent<Content, Modifier>

    public func accessibility(activationPoint: CGPoint) -> ModifiedContent<Content, Modifier>

    public func accessibility(activationPoint: UnitPoint) -> ModifiedContent<Content, Modifier>
}

/// Specifies the direction of an arrow movement
///
/// - SeeAlso: `View.onMoveCommand(perform:)`
@available(OSX 10.15, tvOS 13.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
public enum MoveCommandDirection {

    case up

    case down

    case left

    case right

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: MoveCommandDirection, b: MoveCommandDirection) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(OSX 10.15, tvOS 13.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
extension MoveCommandDirection : Equatable {
}

@available(OSX 10.15, tvOS 13.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
extension MoveCommandDirection : Hashable {
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
open class NSHostingController<Content> : NSViewController where Content : View {

    public init(rootView: Content)

    public init?(coder: NSCoder, rootView: Content)

    @objc required dynamic public init?(coder: NSCoder)

    public var rootView: Content

    public func sizeThatFits(in size: CGSize) -> CGSize

    @objc override dynamic public init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?)
}

/// An `NSView` which hosts a `View` hierarchy.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
open class NSHostingView<Content> : NSView, NSUserInterfaceValidations, NSDraggingSource where Content : View {

    required public init(rootView: Content)

    @objc required dynamic public init?(coder aDecoder: NSCoder)

    @objc override final public var isFlipped: Bool

    @objc override dynamic open func renewGState()

    @objc override dynamic open var intrinsicContentSize: NSSize { get }

    @objc override dynamic open class var requiresConstraintBasedLayout: Bool { get }

    @objc override dynamic open func updateConstraints()

    @objc override dynamic open var layerContentsRedrawPolicy: NSView.LayerContentsRedrawPolicy

    @objc override dynamic open func layout()

    @objc override dynamic open func setFrameSize(_ newSize: NSSize)

    /// The root `View` of the view hierarchy to display.
    public var rootView: Content

    @objc override dynamic open func viewDidChangeBackingProperties()

    @objc override dynamic open func viewDidChangeEffectiveAppearance()

    @objc override dynamic open var userInterfaceLayoutDirection: NSUserInterfaceLayoutDirection

    @objc override dynamic open func viewWillMove(toWindow newWindow: NSWindow?)

    @objc override dynamic open func viewDidMoveToWindow()

    @objc override dynamic open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)

    @objc override dynamic open func hitTest(_ point: NSPoint) -> NSView?

    @objc override dynamic open var acceptsFirstResponder: Bool { get }

    @objc override dynamic open var needsPanelToBecomeKey: Bool { get }

    @objc override dynamic open var canBecomeKeyView: Bool { get }

    @objc override dynamic open func magnify(with event: NSEvent)

    @objc override dynamic open func rotate(with event: NSEvent)

    @objc override dynamic open func mouseDown(with event: NSEvent)

    @objc override dynamic open func mouseDragged(with event: NSEvent)

    @objc override dynamic open func mouseUp(with event: NSEvent)

    @objc override dynamic open func rightMouseDown(with event: NSEvent)

    @objc override dynamic open func rightMouseDragged(with event: NSEvent)

    @objc override dynamic open func rightMouseUp(with event: NSEvent)

    @objc override dynamic open func otherMouseDown(with event: NSEvent)

    @objc override dynamic open func otherMouseDragged(with event: NSEvent)

    @objc override dynamic open func otherMouseUp(with event: NSEvent)

    @objc override dynamic open func mouseEntered(with event: NSEvent)

    @objc override dynamic open func mouseExited(with event: NSEvent)

    @objc override dynamic open func scrollWheel(with event: NSEvent)

    @objc override dynamic open func touchesBegan(with event: NSEvent)

    @objc override dynamic open func touchesMoved(with event: NSEvent)

    @objc override dynamic open func touchesEnded(with event: NSEvent)

    @objc override dynamic open func touchesCancelled(with event: NSEvent)

    @objc override dynamic open func menu(for event: NSEvent) -> NSMenu?

    @objc override dynamic open var accessibilityFocusedUIElement: Any? { get }

    @objc override dynamic open func accessibilityChildren() -> [Any]?

    @objc override dynamic open func accessibilityHitTest(_ point: NSPoint) -> Any?

    @objc public func validateUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool

    @objc override dynamic open func responds(to selector: Selector!) -> Bool

    @objc override dynamic open func forwardingTarget(for selector: Selector!) -> Any?

    @objc public func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation

    @objc override dynamic public init(frame frameRect: NSRect)
}

/// A view that represents a `NSViewController`.
///
/// In the lifetime of a representable view, its `NSViewController` and
/// `Coordinator` will be initialized, (often repeatedly) updated, and
/// eventually deinitialized.
///
/// For each phase the following methods will be called in order:
///
///     // Initialization phase:
///     makeCoordinator()
///     makeNSViewController(context:)
///     updateNSViewController(_:context:)
///
///     // Update phase:
///     updateNSViewController(_:context:)
///
///     // Deinitialization phase:
///     dismantleNSViewController(_:coordinator:)
///
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol NSViewControllerRepresentable : View where Self.Body == Never {

    /// The type of `NSViewController` to be presented.
    associatedtype NSViewControllerType : NSViewController

    /// Creates a `NSViewController` instance to be presented.
    func makeNSViewController(context: Self.Context) -> Self.NSViewControllerType

    /// Updates the presented `NSViewController` (and coordinator) to the latest
    /// configuration.
    func updateNSViewController(_ nsViewController: Self.NSViewControllerType, context: Self.Context)

    /// Cleans up the presented `NSViewController` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleNSViewController(_ nsViewController: Self.NSViewControllerType, coordinator: Self.Coordinator)

    /// A type to coordinate with the `NSViewController`.
    associatedtype Coordinator = Void

    /// Creates a `Coordinator` instance to coordinate with the
    /// `NSViewController`.
    ///
    /// `Coordinator` can be accessed via `Context`.
    func makeCoordinator() -> Self.Coordinator

    typealias Context = NSViewControllerRepresentableContext<Self>
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NSViewControllerRepresentable where Self.Coordinator == Void {

    /// Creates a `Coordinator` instance to coordinate with the
    /// `NSViewController`.
    ///
    /// `Coordinator` can be accessed via `Context`.
    public func makeCoordinator() -> Self.Coordinator
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NSViewControllerRepresentable {

    /// Cleans up the presented `NSViewController` (and coordinator) in
    /// anticipation of their removal.
    public static func dismantleNSViewController(_ nsViewController: Self.NSViewControllerType, coordinator: Self.Coordinator)

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

/// The context in which an associated NSViewController instance is updated.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct NSViewControllerRepresentableContext<ViewController> where ViewController : NSViewControllerRepresentable {

    /// The view's associated coordinator.
    public let coordinator: ViewController.Coordinator

    /// The current `Transaction`.
    public var transaction: Transaction { get }

    /// The current `Environment`.
    public var environment: EnvironmentValues { get }
}

/// A view that represents a `NSView`.
///
/// In the lifetime of a representable view, its `NSView` and
/// `Coordinator` will be initialized, (often repeatedly) updated, and
/// eventually deinitialized.
///
/// For each phase the following methods will be called in order:
///
///     // Initialization phase:
///     makeCoordinator()
///     makeNSView(context:)
///     updateNSView(_:context:)
///
///     // Update phase:
///     updateNSView(_:context:)
///
///     // Deinitialization phase:
///     dismantleNSView(_:coordinator:)
///
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol NSViewRepresentable : View where Self.Body == Never {

    /// The type of `NSView` to be presented.
    associatedtype NSViewType : NSView

    /// Creates a `NSView` instance to be presented.
    func makeNSView(context: Self.Context) -> Self.NSViewType

    /// Updates the presented `NSView` (and coordinator) to the latest
    /// configuration.
    func updateNSView(_ nsView: Self.NSViewType, context: Self.Context)

    /// Cleans up the presented `NSView` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleNSView(_ nsView: Self.NSViewType, coordinator: Self.Coordinator)

    /// A type to coordinate with the `NSView`.
    associatedtype Coordinator = Void

    /// Creates a `Coordinator` instance to coordinate with the
    /// `NSView`.
    ///
    /// `Coordinator` can be accessed via `Context`.
    func makeCoordinator() -> Self.Coordinator

    typealias Context = NSViewRepresentableContext<Self>
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NSViewRepresentable where Self.Coordinator == Void {

    /// Creates a `Coordinator` instance to coordinate with the
    /// `NSView`.
    ///
    /// `Coordinator` can be accessed via `Context`.
    public func makeCoordinator() -> Self.Coordinator
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension NSViewRepresentable {

    /// Cleans up the presented `NSView` (and coordinator) in
    /// anticipation of their removal.
    public static func dismantleNSView(_ nsView: Self.NSViewType, coordinator: Self.Coordinator)

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

/// The context in which an associated NSView instance is updated.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct NSViewRepresentableContext<View> where View : NSViewRepresentable {

    /// The view's associated coordinator.
    public let coordinator: View.Coordinator

    /// The current `Transaction`.
    public var transaction: Transaction { get }

    /// The current `Environment`.
    public var environment: EnvironmentValues { get }
}

/// A view that controls a navigation presentation.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {

    /// Creates an instance that presents `destination`.
    public init(destination: Destination, @ViewBuilder label: () -> Label)

    /// Creates an instance that presents `destination` when active.
    public init(destination: Destination, isActive: Binding<Bool>, @ViewBuilder label: () -> Label)

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`.
    public init<V>(destination: Destination, tag: V, selection: Binding<V?>, @ViewBuilder label: () -> Label) where V : Hashable

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension NavigationLink where Label == Text {

    /// Creates an instance that presents `destination`, with a `Text` label
    /// generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination)

    /// Creates an instance that presents `destination`, with a `Text` label
    /// generated from a title string.
    public init<S>(_ title: S, destination: Destination) where S : StringProtocol

    /// Creates an instance that presents `destination` when active, with a
    /// `Text` label generated from a title string.
    public init(_ titleKey: LocalizedStringKey, destination: Destination, isActive: Binding<Bool>)

    /// Creates an instance that presents `destination` when active, with a
    /// `Text` label generated from a title string.
    public init<S>(_ title: S, destination: Destination, isActive: Binding<Bool>) where S : StringProtocol

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a `Text` label generated from a title string.
    public init<V>(_ titleKey: LocalizedStringKey, destination: Destination, tag: V, selection: Binding<V?>) where V : Hashable

    /// Creates an instance that presents `destination` when `selection` is set
    /// to `tag`, with a `Text` label generated from a title string.
    public init<S, V>(_ title: S, destination: Destination, tag: V, selection: Binding<V?>) where S : StringProtocol, V : Hashable
}

/// A view for presenting a stack of views representing a visible path in a
/// navigation hierarchy.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct NavigationView<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A specification for the appearance and interaction of a `NavigationView`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public protocol NavigationViewStyle {
}

/// A dynamic view property that subscribes to a `ObservableObject` automatically invalidating the view
/// when it changes.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct ObservedObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {

    /// A wrapper of the underlying `ObservableObject` that can create
    /// `Binding`s to its properties using dynamic member lookup.
    @dynamicMemberLookup public struct Wrapper {

        /// Creates a `Binding` to a value semantic property of a
        /// reference type.
        ///
        /// If `Value` is not value semantic, the updating behavior for
        /// any views that make use of the resulting `Binding` is
        /// unspecified.
        public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> { get }
    }

    public init(initialValue: ObjectType)

    public init(wrappedValue: ObjectType)

    public var wrappedValue: ObjectType

    public var projectedValue: ObservedObject<ObjectType>.Wrapper { get }
}

/// A shape with a translation offset applied to it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct OffsetShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var offset: CGSize

    @inlinable public init(shape: Content, offset: CGSize)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, CGSize.AnimatableData>

    /// The data to be animated.
    public var animatableData: AnimatablePair<Content.AnimatableData, CGSize.AnimatableData>

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension OffsetShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> OffsetShape<Content.InsetShape>

    /// The type of the inset shape.
    public typealias InsetShape = OffsetShape<Content.InsetShape>
}

/// A system Button that enables reading data from the pasteboard in
/// response to being triggered.
///
/// Currently, `PasteButton` will not automatically invalidate on pasteboard
/// changes, and so should be mainly used in transient contexts like in
/// `ContextMenu`.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct PasteButton : View {

    /// Creates an instance that is filtered to accepting specific type
    /// identifiers from the pasteboard.
    ///
    /// - Parameters:
    ///   - supportedTypes: The exact uniform type identifiers supported by the
    ///     button. If the pasteboard does not contain any of the supported
    ///     types, the button will be disabled.
    ///   - payloadAction: The handler to call on trigger of the button with the
    ///     items from the pasteboard that conform to `supportedTypes`.
    ///
    /// `supportedTypes` is ordered based on preference of types. The pasteboard
    /// items provided to `dataHandler` will have a type that is the most
    /// preferred type out of all the types the source supports.
    public init(supportedTypes: [String], payloadAction: @escaping ([NSItemProvider]) -> Void)

    /// Creates an instance that is filtered to accepting specific type
    /// identifiers from the pasteboard, as well as allows custom validation
    /// of the data conforming to those types.
    ///
    /// - Parameters:
    ///   - supportedTypes: The exact uniform type identifiers supported by the
    ///     button. If the pasteboard does not contain any of the supported
    ///     types, the button will be disabled.
    ///   - validator: The handler that is called on validation of the button
    ///     with items from the pasteboard that conform to `supportedTypes`. The
    ///     return result of `validator` will be provided to `dataHandler` on
    ///     trigger of the button. If `nil` is returned, the button will be
    ///     disabled.
    ///   - payloadAction: The handler to call on trigger of the button with the
    ///     pre-processed result of `validator`.
    ///
    /// `supportedTypes` is ordered based on preference of types. The pasteboard
    /// items provided to `validator` will have a type that is the most
    /// preferred type out of all the types the source supports.
    public init<Payload>(supportedTypes: [String], validator: @escaping ([NSItemProvider]) -> Payload?, payloadAction: @escaping (Payload) -> Void)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

/// Describes an outline of a 2D shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Path : Equatable, LosslessStringConvertible {

    /// Initialize with an empty path.
    public init()

    /// Initialize from the immutable shape `path`.
    public init(_ path: CGPath)

    /// Initialize from a copy of the mutable shape `path`.
    public init(_ path: CGMutablePath)

    /// Initialize as the rectangle `rect`.
    public init(_ rect: CGRect)

    /// Initialize as the rounded rectangle `rect`.
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular)

    /// Initialize as the rounded rectangle `rect`.
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .circular)

    /// Initialize as an ellipse inscribed within `rect`.
    public init(ellipseIn rect: CGRect)

    /// Initializes to an empty path then calls `callback` to add
    /// the initial elements.
    public init(_ callback: (inout Path) -> ())

    /// Initializes from the result of a previous call to
    /// `Path.stringRepresentation`. Fails if the `string` does not
    /// describe a valid path.
    public init?(_ string: String)

    /// A description of the path that may be used to recreate the path
    /// via `init?(_:)`.
    public var description: String { get }

    /// An immutable CGPath representing the elements in the path.
    public var cgPath: CGPath { get }

    /// True if the path contains no elements.
    public var isEmpty: Bool { get }

    /// A rectangle containing all path segments.
    public var boundingRect: CGRect { get }

    /// Returns true if the path contains point `p`. If `eoFill` is
    /// true the even-odd rule is used to define which points are
    /// inside the path, otherwise the non-zero rule is used.
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool

    /// An element of a path.
    public enum Element : Equatable {

        /// Terminates the current subpath (without closing it) and
        /// defines a new current point.
        case move(to: CGPoint)

        /// A line from the previous current point to the given point,
        /// which becomes the new current point.
        case line(to: CGPoint)

        /// A quadratic bezier curve from the previous current point to
        /// the given end-point, using the single control point to
        /// define the curve. The end-point becomes the new current
        /// point.
        case quadCurve(to: CGPoint, control: CGPoint)

        /// A cubic bezier curve from the previous current point to the
        /// given end-point, using the two control points to define the
        /// curve. The end-point becomes the new current point.
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)

        /// If a subpath is active, draws a line from its start point
        /// to the current point, terminating the subpath. The current
        /// point is undefined afterwards.
        case closeSubpath

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Path.Element, b: Path.Element) -> Bool
    }

    /// Calls `body` with each element in the path.
    public func forEach(_ body: (Path.Element) -> Void)

    /// Returns a stroked copy of the path using `style` to define how
    /// the stroked outline is created.
    public func strokedPath(_ style: StrokeStyle) -> Path

    /// Returns a partial copy of the path, containing the region
    /// between `from` and `to`, both of which must be fractions
    /// between zero and one defining points linearly-interpolated
    /// along the path.
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Path, b: Path) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in _: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Path {

    /// Begins a new subpath at the specified point.
    public mutating func move(to p: CGPoint)

    /// Appends a straight line segment from the current point to the
    /// specified point.
    public mutating func addLine(to p: CGPoint)

    /// Adds a quadratic Bézier curve to the path, with the
    /// specified end point and control point.
    public mutating func addQuadCurve(to p: CGPoint, control cp: CGPoint)

    /// Adds a cubic Bézier curve to the path, with the
    /// specified end point and control points.
    public mutating func addCurve(to p: CGPoint, control1 cp1: CGPoint, control2 cp2: CGPoint)

    /// Closes and completes the current subpath.
    public mutating func closeSubpath()

    /// Adds a rectangular subpath to the path.
    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity)

    /// Adds a rounded rectangle to the path.
    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .circular, transform: CGAffineTransform = .identity)

    /// Adds an ellipse to the path.
    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity)

    /// Adds a sequence of rectangular subpaths to the path.
    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity)

    /// Adds a sequence of connected straight-line segments to the
    /// path.
    public mutating func addLines(_ lines: [CGPoint])

    /// Adds an arc of a circle to the path, specified with a radius
    /// and a difference in angle.
    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity)

    /// Adds an arc of a circle to the path, specified with a radius
    /// and angles.
    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity)

    /// Adds an arc of a circle to the path, specified with a radius
    /// and two tangent lines.
    public mutating func addArc(tangent1End p1: CGPoint, tangent2End p2: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity)

    /// Appends a copy of `path` to the path.
    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity)

    /// Returns the last point in the path, or nil if the path contains
    /// no points.
    public var currentPoint: CGPoint? { get }

    /// Returns a path constructed by applying `transform` to all
    /// points of `self`.
    public func applying(_ transform: CGAffineTransform) -> Path

    /// Returns a path constructed by translating `self` by `(dx, dy)`.
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path
}

/// A control for selecting from a set of mutually exclusive values.
///
/// - SeeAlso: `ViewContent.tag(_:)`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Picker<Label, SelectionValue, Content> : View where Label : View, SelectionValue : Hashable, Content : View {

    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init(selection: Binding<SelectionValue>, label: Label, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Picker where Label == Text {

    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init(_ titleKey: LocalizedStringKey, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content)

    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init<S>(_ title: S, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S : StringProtocol
}

/// A custom specification for the appearance and interaction of a `Picker`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PickerStyle {
}

/// A `Button` style that does not style or decorate its content while idle.
///
/// The style may apply a visual effect to indicate the pressed, focused,
/// or enabled state of the button.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainButtonStyle : PrimitiveButtonStyle {

    public init()

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    public func makeBody(configuration: PlainButtonStyle.Configuration) -> some View


    /// A `View` representing the body of a `Button`.
    public typealias Body = some View
}

/// A `ListStyle` that implements the system default `List` interaction
/// and appearance.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainListStyle : ListStyle {

    public init()
}

/// A `TextField` style with no decoration.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainTextFieldStyle : TextFieldStyle {

    public init()
}

/// A `PickerStyle` where the options are disclosed from a button that
/// presents them in a menu, and the button itself indicates the selected
/// option.
///
/// This style is also appropriate for including auxiliary controls in the
/// set of options, such as a customization button to customize the list
/// of options.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct PopUpButtonPickerStyle : PickerStyle {

    public init()
}

/// An attachment anchor for a popover.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PopoverAttachmentAnchor {

    case rect(Anchor<CGRect>.Source)

    case point(UnitPoint)
}

/// A named value produced by a view. Views with multiple children
/// automatically combine all child values into a single value visible
/// to their ancestors.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreferenceKey {

    /// The type of value produced by the preference.
    associatedtype Value

    /// The default value of the preference reduction; this is the
    /// value that will be implicitly produced by views that have no
    /// explicit value for the key. Implicit values may be removed from
    /// the reduction sequence, this means that `reduce(value: &x,
    /// nextValue: { defaultValue })` should not change the meaning of
    /// `x`.
    static var defaultValue: Self.Value { get }

    /// Given the current value of the reduction, and a function that
    /// returns the next value in the sequence of input values, updates
    /// the current value to reflect the next value. Values will be
    /// supplied in view-tree order.
    static func reduce(value: inout Self.Value, nextValue: () -> Self.Value)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreferenceKey where Self.Value : ExpressibleByNilLiteral {

    /// Let nil-expressible values default-initialize to nil.
    public static var defaultValue: Self.Value { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreferenceKey {
}

/// The mode of a view indicating whether it is currently presented by another
/// view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PresentationMode {

    /// Indicates whether a view is currently presented.
    public var isPresented: Bool { get }

    /// Dismisses the view if it is currently presented.
    ///
    /// If `isPresented` is false, `dismiss()` is a no-op.
    public mutating func dismiss()
}

/// The simulator device for running a preview on.
///
/// This can be a marketing name as it appears in Xcode's run destination menu
/// (e.g. "iPhone X") or a model number (iPad8,1).
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PreviewDevice : RawRepresentable, ExpressibleByStringLiteral {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: String

    /// Creates a new instance with the specified raw value.
    ///
    /// If there is no value of the type that corresponds with the specified raw
    /// value, this initializer returns `nil`. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     print(PaperSize(rawValue: "Legal"))
    ///     // Prints "Optional("PaperSize.Legal")"
    ///
    ///     print(PaperSize(rawValue: "Tabloid"))
    ///     // Prints "nil"
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    public init(rawValue: String)

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral: String)

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = String

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String
}

/// The size constraint for a preview.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewLayout {

    /// Centers the preview in a container the size of the device the preview
    /// is running on.
    case device

    /// Fits the container to the size of the preview (when offered the size
    /// of the device the preview is running on).
    case sizeThatFits

    /// Centers the preview in a fixed size container.
    case fixed(width: CGFloat, height: CGFloat)
}

/// OS platform for running a preview on.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum PreviewPlatform {

    case iOS

    case macOS

    case tvOS

    case watchOS

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: PreviewPlatform, b: PreviewPlatform) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewPlatform : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewPlatform : Hashable {
}

/// Produces view previews in Xcode.
///
/// Xcode statically discovers types that conform to `PreviewProvider` and
/// generates previews in the canvas for each provider it discovers.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PreviewProvider : _PreviewProvider {

    /// The type of the previews variable.
    associatedtype Previews : View

    /// Generates a collection of previews.
    ///
    /// Example:
    ///
    ///     struct MyPreviews : PreviewProvider {
    ///         static var previews: some View {
    ///             return Group {
    ///                 GreetingView("Hello"),
    ///                 GreetingView("Guten Tag"),
    ///
    ///                 ForEach(otherGreetings, id: \.self) {
    ///                     GreetingView($0)
    ///                 }
    ///             }
    ///             .previewDevice("iPhone X")
    ///         }
    ///     }
    static var previews: Self.Previews { get }

    /// Returns which platform to run the provider on.
    ///
    /// When `nil`, Xcode infers the platform based on the file the
    /// `PreviewProvider` is defined in. This should only be provided when the
    /// file is in targets that support multiple platforms.
    static var platform: PreviewPlatform? { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension PreviewProvider {

    /// Returns which platform to run the provider on.
    ///
    /// When `nil`, Xcode infers the platform based on the file the
    /// `PreviewProvider` is defined in. This should only be provided when the
    /// file is in targets that support multiple platforms.
    public static var platform: PreviewPlatform? { get }
}

/// Defines the implementation of all `Button` instances within a view
/// hierarchy.
///
/// To configure the current `PrimitiveButtonStyle` for a view hiearchy, use the
/// `.buttonStyle()` modifier.
///
/// - SeeAlso: `ButtonStyle`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol PrimitiveButtonStyle {

    /// A `View` representing the body of a `Button`.
    associatedtype Body : View

    /// Creates a `View` representing the body of a `Button`.
    ///
    /// - Parameter configuration: The properties of the button instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Button` created within
    /// a view hierarchy where this style is the current `ButtonStyle`.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a `Button` instance being created.
    typealias Configuration = PrimitiveButtonStyleConfiguration
}

/// The properties of a `Button` instance being created.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PrimitiveButtonStyleConfiguration {

    /// A type-erased label of a `Button`.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of calling `action`.
    public let label: PrimitiveButtonStyleConfiguration.Label

    /// Performs the button's action.
    public func trigger()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ProjectionTransform {

    public var m11: CGFloat

    public var m12: CGFloat

    public var m13: CGFloat

    public var m21: CGFloat

    public var m22: CGFloat

    public var m23: CGFloat

    public var m31: CGFloat

    public var m32: CGFloat

    public var m33: CGFloat

    @inlinable public init()

    @inlinable public init(_ m: CGAffineTransform)

    @inlinable public init(_ m: CATransform3D)

    @inlinable public var isIdentity: Bool { get }

    @inlinable public var isAffine: Bool { get }

    public mutating func invert() -> Bool

    public func inverted() -> ProjectionTransform
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: ProjectionTransform, b: ProjectionTransform) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ProjectionTransform {

    @inlinable public func concatenating(_ rhs: ProjectionTransform) -> ProjectionTransform
}

@available(iOS, unavailable)
@available(OSX, deprecated, message: "Use MenuButton instead.")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias PullDownButton

/// An `MenuButtonStyle` which manifests as a pull-down button.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct PullDownMenuButtonStyle : MenuButtonStyle {

    public init()
}

/// A radial gradient. The gradient's color function is applied as the
/// distance from a center point, scaled to fit within defined start
/// and end radii. The unit-space center point is mapped into the
/// bounding rectangle of each shape filled with the gradient.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct RadialGradient : ShapeStyle, View {

    public init(gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A `PickerStyle` where each option is represented as a radio button
/// in a group of all options.
///
/// This style is appropriate when there are two to five options. Consider
/// the `popUpButton` style when there are more.
///
/// Generally, use sentence-style capitalization without ending punctuation
/// as the label for each option.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RadioGroupPickerStyle : PickerStyle {

    public init()
}

/// A rectangular shape aligned inside the frame of the view containing
/// it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Rectangle : Shape {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    @inlinable public init()

    /// The type defining the data to be animated.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Rectangle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A shape with a rotation transform applied to it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct RotatedShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var angle: Angle

    public var anchor: UnitPoint

    @inlinable public init(shape: Content, angle: Angle, anchor: UnitPoint = .center)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to be animated.
    public var animatableData: AnimatablePair<Content.AnimatableData, AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>>

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension RotatedShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> RotatedShape<Content.InsetShape>

    /// The type of the inset shape.
    public typealias InsetShape = RotatedShape<Content.InsetShape>
}

/// A gesture that tracks how a rotation event sequence changes.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RotationGesture : Gesture {

    /// The minimum delta required before the action runs.
    public var minimumAngleDelta: Angle

    public init(minimumAngleDelta: Angle = .degrees(1))

    /// The type of value produced by this gesture.
    public typealias Value = Angle

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

/// A `TextField` style with a system-defined rounded border.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RoundedBorderTextFieldStyle : TextFieldStyle {

    public init()
}

/// Defines the shape of a rounded rectangle's corners.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum RoundedCornerStyle {

    /// Quarter-circle rounded rect corners.
    case circular

    /// Continuous curvature rounded rect corners.
    case continuous

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: RoundedCornerStyle, b: RoundedCornerStyle) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedCornerStyle : Hashable {
}

/// A rectangular shape with rounded corners, aligned inside the frame
/// of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct RoundedRectangle : Shape {

    public var cornerSize: CGSize

    public var style: RoundedCornerStyle

    @inlinable public init(cornerSize: CGSize, style: RoundedCornerStyle = .circular)

    @inlinable public init(cornerRadius: CGFloat, style: RoundedCornerStyle = .circular)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The data to be animated.
    public var animatableData: CGSize.AnimatableData

    /// The type defining the data to be animated.
    public typealias AnimatableData = CGSize.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedRectangle : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

/// A shape with a scale transform applied to it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ScaledShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var scale: CGSize

    public var anchor: UnitPoint

    @inlinable public init(shape: Content, scale: CGSize, anchor: UnitPoint = .center)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<CGSize.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to be animated.
    public var animatableData: AnimatablePair<Content.AnimatableData, AnimatablePair<CGSize.AnimatableData, UnitPoint.AnimatableData>>

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A scroll view.
///
/// The `content` is displayed within the scrollable content region.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ScrollView<Content> : View where Content : View {

    /// The content of the scroll view.
    public var content: Content

    /// The scrollable axes.
    ///
    /// The default is `.vertical`.
    public var axes: Axis.Set

    /// If true, the scroll view may indicate the scrollable component of
    /// the content offset, in a way suitable for the platform.
    ///
    /// The default is `true`.
    public var showsIndicators: Bool

    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ScrollView {
}

/// An affordance for creating hierarchical view content.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Section<Parent, Content, Footer> {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section : View where Parent : View, Content : View, Footer : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    public init(header: Parent, footer: Footer, @ViewBuilder content: () -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer : View {

    public init(footer: Footer, @ViewBuilder content: () -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent : View, Content : View, Footer == EmptyView {

    public init(header: Parent, @ViewBuilder content: () -> Content)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Section where Parent == EmptyView, Content : View, Footer == EmptyView {

    public init(@ViewBuilder content: () -> Content)
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Section where Parent : View, Content : View, Footer : View {

    /// Sets whether a `Section` can be collapsed by the user.
    ///
    /// Currently this modifier only applies to sections in `.sidebar`-styled `List` views.
    public func collapsible(_ collapsible: Bool) -> some View

}

/// A control that allows entry of private user text contents that should be
/// kept secure.
///
/// - SeeAlso: `View.textContentType(_:)`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SecureField<Label> : View where Label : View {

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SecureField where Label == Text {

    /// Creates an instance.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///     - text: The text to be displayed and edited.
    ///     - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `SecureField` has focus.
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void = {})

    /// Creates an instance.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - text: The text to be displayed and edited.
    ///     - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `SecureField` has focus.
    public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void = {}) where S : StringProtocol
}

/// A `PickerStyle` where the options are contained in a segmented control.
///
/// - Note: Only supports segments of type `Label` and `Image`. Passing any
/// other type of view will result in a visible, but empty, segment.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct SegmentedPickerStyle : PickerStyle {

    public init()
}

/// A style usable as the backgrounds for selected elements.
///
/// - Parameter isSelected: Whether or not the associated view is selected.
///   Passing `false` results in the style being equivalent to clear.
///   Defaults to `true`.
///
/// For example:
///
///     ForEach(items, id: \.id) {
///        ItemView(item)
///           .padding()
///           .background(SelectionShapeStyle(isSelected: item.id == selectedID))
///     }
///
/// On macOS this automatically reflects window key state and focus state,
/// where the emphasized appearance will be used only when the window is
/// key and the nearest focusable element is actually focused.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SelectionShapeStyle : ShapeStyle {
}

/// A style appropriate for foreground separator or border lines.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SeparatorShapeStyle : ShapeStyle {

    public init()
}

/// A gesture type that sequences two sub-gestures.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SequenceGesture<First, Second> where First : Gesture, Second : Gesture {

    /// The type of value produced by this gesture.
    public enum Value {

        /// The first gesture has not ended.
        case first(First.Value)

        /// The first gesture has ended.
        case second(First.Value, Second.Value?)
    }

    public var first: First

    public var second: Second

    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SequenceGesture : Gesture {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SequenceGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SequenceGesture<First, Second>.Value, b: SequenceGesture<First, Second>.Value) -> Bool
}

/// A two-dimensional shape you can use as part of drawing a view.
///
/// Shapes without an explicit fill or stroke get a default fill based on the
/// foreground color.
///
/// You can define shapes in relation to an implicit frame of
/// reference --- for example, the natural size of the view that contains it ---
/// or you can define shapes in terms of absolute coordinates.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Shape : Animatable, View {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    func path(in rect: CGRect) -> Path
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Fills this shape with a color or gradient.
    ///
    /// - Parameters:
    ///   - content: The color or gradient to use when filling this shape.
    ///   - style: The style options that determine how the fill renders.
    /// - Returns: A shape filled with the color or gradient you supply.
    @inlinable public func fill<S>(_ content: S, style: FillStyle = FillStyle()) -> some View where S : ShapeStyle


    /// Fills this shape with the foreground color.
    ///
    /// - Parameter style: The style options that determine how the fill
    ///   renders.
    /// - Returns: A shape filled with the foreground color.
    @inlinable public func fill(style: FillStyle = FillStyle()) -> some View


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example adds a dashed purple stroke to a `Capsule`:
    ///
    ///     Capsule()
    ///     .stroke(
    ///         Color.purple,
    ///         style: StrokeStyle(
    ///             lineWidth: 5,
    ///             lineCap: .round,
    ///             lineJoin: .miter,
    ///             miterLimit: 0,
    ///             dash: [5, 10],
    ///             dashPhase: 0
    ///         )
    ///     )
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render this
    ///     shape.
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, style: StrokeStyle) -> some View where S : ShapeStyle


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// The following example draws a circle with a purple stroke:
    ///
    ///     Circle().stroke(Color.purple, lineWidth: 5)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - lineWidth: The width of the stroke that outlines this shape.
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, lineWidth: CGFloat = 1) -> some View where S : ShapeStyle

}

/// A shape acts as view by filling itself with the foreground color and
/// default fill style.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Declares the content and behavior of this view.
    public var body: _ShapeView<Self, ForegroundStyle> { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Changes the relative position of this shape using the specified size.
    ///
    /// The following example shows two circles: One circle at its default
    /// position and another outlined with a stroke is overlaid on top and
    /// offset by 100 points to the left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGSize(width: -100, height: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGSize) -> OffsetShape<Self>

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example shows two circles: One circle at its default
    /// position and another outlined with a stroke is overlaid on top and
    /// offset by 100 points to the left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(CGPoint(x: -100, y: 50))
    ///         .stroke()
    ///     )
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGPoint) -> OffsetShape<Self>

    /// Changes the relative position of this shape using the specified
    /// coordinates.
    ///
    /// The following example shows two circles: One circle at its default
    /// position and another outlined with a stroke is overlaid on top and
    /// offset by 100 points to the left and 50 points below.
    ///
    ///     Circle()
    ///     .overlay(
    ///         Circle()
    ///         .offset(x: -100, y: 50)
    ///         .stroke()
    ///     )
    ///
    /// - Parameters:
    ///   - x: The horizontal amount, in points, by which you offset the shape.
    ///     Negative numbers are to the left and positive numbers are to the
    ///     right.
    ///   - y: The vertical amount, in points, by which you offset the shape.
    ///     Negative numbers are up and positive numbers are down.
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> OffsetShape<Self>

    /// Scales this shape without changing its bounding frame.
    ///
    /// Both the `x` and `y` multiplication factors halve their respective
    /// dimension's size when set to `0.5`, maintain their existing size when
    /// set to `1`, double their size when set to `2`, and so forth.
    ///
    /// - Parameters:
    ///   - x: The multiplication factor used to resize this shape along its
    ///     x-axis.
    ///   - y: The multiplication factor used to resize this shape along its
    ///     y-axis.
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(x: CGFloat = 1, y: CGFloat = 1, anchor: UnitPoint = .center) -> ScaledShape<Self>

    /// Scales this shape without changing its bounding frame.
    ///
    /// - Parameters:
    ///   - scale: The multiplication factor used to resize this shape. A value
    ///     of `0` scales the shape to have no size, `0.5` scales to half size
    ///     in both dimensions, `2` scales to twice the regular size, and so on.
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(_ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self>

    /// Rotates this shape around an anchor point at the angle you specify.
    ///
    /// The following example rotates a square by 45 degrees to create a diamond
    /// shape:
    ///
    ///     RoundedRectangle(cornerRadius: 10)
    ///     .rotation(Angle(degrees: 45))
    ///     .aspectRatio(1.0, contentMode: .fit)
    ///
    /// - Parameters:
    ///   - angle: The angle of rotation to apply. Positive angles rotate
    ///     clockwise; negative angles rotate counterclockwise.
    ///   - anchor: The point to rotate the shape around.
    /// - Returns: A rotated shape.
    @inlinable public func rotation(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self>

    /// Applies an affine transform to this shape.
    ///
    /// Affine transforms present a mathematical approach to applying
    /// combinations of rotation, scaling, translation, and skew to shapes.
    ///
    /// - Parameter transform: The affine transformation matrix to apply to
    ///   this shape.
    /// - Returns: A transformed shape, based on its matrix values.
    @inlinable public func transform(_ transform: CGAffineTransform) -> TransformedShape<Self>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Trims this shape by a fractional amount based on its representation as a
    /// path.
    ///
    /// To create a `Shape` instance, you define the shape's path using lines and
    /// curves. Use the `trim(from:to:)` method to draw a portion of a shape by
    /// ignoring portions of the beginning and ending of the shape's path.
    ///
    /// For example, if you're drawing a figure eight or infinity symbol (∞)
    /// starting from its center, setting the `startFraction` and `endFraction`
    /// to different values determines the parts of the overall shape.
    ///
    /// The following example shows a simplified infinity symbol that draws
    /// only three quarters of the full shape. That is, of the two lobes of the
    /// symbol, one lobe is complete and the other is half complete.
    ///
    ///     Path { path in
    ///         path.addLines([
    ///             .init(x: 2, y: 1),
    ///             .init(x: 1, y: 0),
    ///             .init(x: 0, y: 1),
    ///             .init(x: 1, y: 2),
    ///             .init(x: 3, y: 0),
    ///             .init(x: 4, y: 1),
    ///             .init(x: 3, y: 2),
    ///             .init(x: 2, y: 1)
    ///         ])
    ///     }
    ///     .trim(from: 0.25, to: 1.0)
    ///     .scale(50, anchor: .topLeading)
    ///     .stroke(Color.black, lineWidth: 3)
    ///
    /// Changing the parameters of `trim(from:to:)` to
    /// `.trim(from: 0, to: 1)` draws the full infinity symbol, while
    /// `.trim(from: 0, to: 0.5)` draws only the left lobe of the symbol.
    ///
    /// - Parameters:
    ///   - startFraction: The fraction of the way through drawing this shape
    ///     where drawing starts.
    ///   - endFraction: The fraction of the way through drawing this shape
    ///     where drawing ends.
    /// - Returns: A shape built by capturing a portion of this shape's path.
    @inlinable public func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Returns a new version of self representing the same shape, but
    /// that will ask it to create its path from a rect of `size`. This
    /// does not affect the layout properties of any views created from
    /// the shape (e.g. by filling it).
    @inlinable public func size(_ size: CGSize) -> some Shape


    /// Returns a new version of self representing the same shape, but
    /// that will ask it to create its path from a rect of size
    /// `(width, height)`. This does not affect the layout properties
    /// of any views created from the shape (e.g. by filling it).
    @inlinable public func size(width: CGFloat, height: CGFloat) -> some Shape

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Returns a new shape that is a stroked copy of `self`, using the
    /// contents of `style` to define the stroke characteristics.
    @inlinable public func stroke(style: StrokeStyle) -> some Shape


    /// Returns a new shape that is a stroked copy of `self` with
    /// line-width defined by `lineWidth` and all other properties of
    /// `StrokeStyle` having their default values.
    @inlinable public func stroke(lineWidth: CGFloat = 1) -> some Shape

}

/// A way to turn a shape into a view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ShapeStyle {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle {

    /// Return a new paint value matching `self` except using `rect` to
    /// map unit-space coordinates to absolute coordinates.
    @inlinable public func `in`(_ rect: CGRect) -> some ShapeStyle

}

/// Default View.body implementation to fill a Rectangle with `self`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle where Self : View, Self.Body == _ShapeView<Rectangle, Self> {

    public var body: _ShapeView<Rectangle, Self> { get }
}

/// A `ListStyle` that implements the system default sidebar list
/// (or source list) interaction and appearance.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SidebarListStyle : ListStyle {

    public init()
}

/// A container event handler that evaluates its two child gestures
/// simultaneously.
///
/// The phase of `SimultaneousGesture` is a combination of the phases
/// of children, representing the phase that most accurately describes
/// the entire group.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SimultaneousGesture<First, Second> where First : Gesture, Second : Gesture {

    /// The type of value produced by this gesture.
    public struct Value {

        public var first: First.Value?

        public var second: Second.Value?
    }

    public var first: First

    public var second: Second

    /// Creates an instance from two child gestures.
    @inlinable public init(_ first: First, _ second: Second)

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture : Gesture {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SimultaneousGesture<First, Second>.Value, b: SimultaneousGesture<First, Second>.Value) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Hashable where First.Value : Hashable, Second.Value : Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

/// A control for selecting a value from a bounded linear range of values.
@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct Slider<Label, ValueLabel> : View where Label : View, ValueLabel : View {

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///     - minimumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///     - maximumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///     - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - step: The distance between each valid value.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///     - minimumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///     - maximumValueLabel: A `View` that describes `bounds.lowerBound`.
    ///     - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, minimumValueLabel: ValueLabel, maximumValueLabel: ValueLabel, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where ValueLabel == EmptyView {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///     - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - step: The distance between each valid value.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///     - label: A `View` that describes the purpose of the instance.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension Slider where Label == EmptyView, ValueLabel == EmptyView {

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V> = 0...1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint

    /// Creates an instance that selects a value from within a range.
    ///
    /// - Parameters:
    ///     - value: The selected value within `bounds`.
    ///     - bounds: The range of the valid values. Defaults to `0...1`.
    ///     - step: The distance between each valid value.
    ///     - onEditingChanged: A callback for when editing begins and ends.
    ///
    /// The `value` of the created instance will be equal to the position of
    /// the given value within `bounds`, mapped into `0...1`.
    ///
    /// `onEditingChanged` will be called when editing begins and ends. For
    /// example, on iOS, a `Slider` is considered to be actively editing while
    /// the user is touching the knob and sliding it around the track.
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint
}

/// A flexible space that expands along the major axis of its containing stack
/// layout, or on both axes if not contained in a stack.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Spacer {

    /// The minimum length this spacer can be shrunk to, along the axis or axes
    /// of expansion.
    ///
    /// If `nil`, the system default spacing between views is used.
    public var minLength: CGFloat?

    @inlinable public init(minLength: CGFloat? = nil)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Spacer : View {
}

/// A `TextField` style with a system-defined square border.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SquareBorderTextFieldStyle : TextFieldStyle {

    public init()
}

/// A linked View property that instantiates a persistent state
/// value of type `Value`, allowing the view to read and update its
/// value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct State<Value> : DynamicProperty {

    /// Initialize with the provided initial value.
    public init(wrappedValue value: Value)

    /// Initialize with the provided initial value.
    public init(initialValue value: Value)

    /// The current state value.
    public var wrappedValue: Value { get nonmutating set }

    /// Produces the binding referencing this state value
    public var projectedValue: Binding<Value> { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension State where Value : ExpressibleByNilLiteral {

    /// Initialize with a nil initial value.
    @inlinable public init()
}

/// A control used to perform semantic increment and decrement actions.
@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Stepper<Label> : View where Label : View {

    /// Creates an instance that performs `onIncrement` and `onDecrement` when
    /// incremented and decremented, respectively.
    public init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper {

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step` and clamped to `bounds`.
    ///
    /// `onIncrement` will be initialized to `nil` if attempting to increment
    /// `value` will have no effect. Likewise, `onDecrement` will be initialized
    /// to `nil` if attempting to decrement `value` will have no effect.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Stepper where Label == Text {

    /// Creates an instance that performs `onIncrement` and `onDecrement` when
    /// incremented and decremented, respectively.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in })

    /// Creates an instance that performs `onIncrement` and `onDecrement` when
    /// incremented and decremented, respectively.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step`.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step` and clamped to `bounds`.
    ///
    /// `onIncrement` will be initialized to `nil` if attempting to increment
    /// `value` will have no effect. Likewise, `onDecrement` will be initialized
    /// to `nil` if attempting to decrement `value` will have no effect.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable

    /// Creates an instance configured to increment and decrement `value` by
    /// units of `step` and clamped to `bounds`.
    ///
    /// `onIncrement` will be initialized to `nil` if attempting to increment
    /// `value` will have no effect. Likewise, `onDecrement` will be initialized
    /// to `nil` if attempting to decrement `value` will have no effect.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable
}

/// A system style that displays the components in an editable field, with
/// adjoining stepper that can increment/decrement the selected component.
///
/// This style is useful when space is constrained and users expect to
/// make specific date and time selections.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct StepperFieldDatePickerStyle : DatePickerStyle {

    public init()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct StrokeStyle : Equatable {

    public var lineWidth: CGFloat

    public var lineCap: CGLineCap

    public var lineJoin: CGLineJoin

    public var miterLimit: CGFloat

    public var dash: [CGFloat]

    public var dashPhase: CGFloat

    public init(lineWidth: CGFloat = 1, lineCap: CGLineCap = .butt, lineJoin: CGLineJoin = .miter, miterLimit: CGFloat = 10, dash: [CGFloat] = [CGFloat](), dashPhase: CGFloat = 0)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: StrokeStyle, b: StrokeStyle) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension StrokeStyle : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>

    /// The data to be animated.
    public var animatableData: StrokeStyle.AnimatableData
}

/// A view that subscribes to a `Publisher` with an `Action`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SubscriptionView<PublisherType, Content> where PublisherType : Publisher, Content : View, PublisherType.Failure == Never {

    /// The content view.
    public var content: Content

    /// The `Publisher` that is being subscribed.
    public var publisher: PublisherType

    /// The `Action` executed when `publisher` emits an event.
    public var action: (PublisherType.Output) -> Void

    @inlinable public init(content: Content, publisher: PublisherType, action: @escaping (PublisherType.Output) -> Void)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension SubscriptionView : View {
}

/// A `ToggleStyle` represented by a trailing switch.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SwitchToggleStyle : ToggleStyle {

    public init()

    /// Creates a `View` representing the body of a `Toggle`.
    ///
    /// - Parameter configuration: The properties of the toggle instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Toggle` created within
    /// a view hierarchy where this style is the current `ToggleStyle`.
    public func makeBody(configuration: SwitchToggleStyle.Configuration) -> some View


    /// A `View` representing the body of a `Toggle`.
    public typealias Body = some View
}

/// A view which allows for switching between multiple child views using
/// interactable user interface elements.
///
/// - Note: `TabView` only supports tab items of type `Text`, `Image`, or a
/// `LayoutView` of `Image` and `Text`. Passing any other type of view will
/// result in a visible, empty tab item.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
public struct TabView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {

    /// Creates an instance that selects from content associated with
    /// `Selection` values.
    public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension TabView where SelectionValue == Int {

    @available(watchOS, unavailable)
    public init(@ViewBuilder content: () -> Content)
}

/// A gesture that ends once a specified number of tap event sequences
/// have been recognized.
@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct TapGesture {

    /// The required number of tap events.
    public var count: Int

    public init(count: Int = 1)

    /// The type of value produced by this gesture.
    public typealias Value = ()

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension TapGesture : Gesture {
}

/// A view that displays one or more lines of read-only text.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Text : Equatable {

    /// Creates an instance that displays `content` verbatim.
    @inlinable public init(verbatim content: String)

    /// Creates an instance that displays `content` verbatim.
    public init<S>(_ content: S) where S : StringProtocol

    /// Creates text that displays localized content identified by a key.
    ///
    /// - Parameters:
    ///     - key: The key for a string in the table identified by `tableName`.
    ///     - tableName: The name of the string table to search. If `nil`, uses
    ///       the table in `Localizable.strings`.
    ///     - bundle: The bundle containing the strings file. If `nil`, uses the
    ///       main `Bundle`.
    ///     - comment: Contextual information about this key-value pair.
    public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Text, b: Text) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// Sets the color of this text.
    ///
    /// - Parameter color: The color to use when displaying this text.
    /// - Returns: Text that uses the color value you supply.
    public func foregroundColor(_ color: Color?) -> Text

    /// Sets the font to use when displaying this text.
    ///
    /// - Parameter font: The font to use when displaying this text.
    /// - Returns: Text that uses the font you specify.
    public func font(_ font: Font?) -> Text

    /// Sets the font weight of this text.
    ///
    /// - Parameter weight: One of the available font weights.
    /// - Returns: Text that uses the font weight you specify.
    public func fontWeight(_ weight: Font.Weight?) -> Text

    /// Applies a bold font weight to this text.
    ///
    /// - Returns: Bold text.
    public func bold() -> Text

    /// Applies italics to this text.
    ///
    /// - Returns: Italic text.
    public func italic() -> Text

    /// Applies a strikethrough to this text.
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has a
    ///     strikethrough applied.
    ///   - color: The color of the strikethrough. If `color` is `nil`, the
    ///     strikethrough uses the default foreground color.
    /// - Returns: Text with a line through its center.
    public func strikethrough(_ active: Bool = true, color: Color? = nil) -> Text

    /// Applies an underline to this text.
    ///
    /// - Parameters:
    ///   - active: A Boolean value that indicates whether the text has an
    ///     underline.
    ///   - color: The color of the underline. If `color` is `nil`, the
    ///     underline uses the default foreground color.
    /// - Returns: Text with a line running along its baseline.
    public func underline(_ active: Bool = true, color: Color? = nil) -> Text

    /// Sets the kerning for this text.
    ///
    /// - Parameter kerning: How many points the following character should be
    ///   shifted from its default offset as defined by the current character's
    ///   font in points; a positive kerning indicates a shift farther along
    ///   and a negative kern indicates a shift closer to the current character.
    /// - Returns: Text with the specified amount of kerning.
    public func kerning(_ kerning: CGFloat) -> Text

    /// Sets the tracking for this text.
    ///
    /// - Parameter tracking: The tracking attribute indicates how much
    ///   additional space, in points, should be added to each character cluster
    ///   after layout. The effect of this attribute is similar to `kerning()`
    ///   but differs in that the added tracking is treated as trailing
    ///   whitespace and a non-zero amount disables non-essential ligatures.
    /// - Returns: Text with the specified amount of tracking.
    ///   If both `kerning()` and `tracking()` are present, `kerning()` will be
    ///   ignored; `tracking()` will still be honored.
    public func tracking(_ tracking: CGFloat) -> Text

    /// Sets the baseline offset for this text.
    ///
    /// - Parameter baselineOffset: The amount to shift the text vertically
    ///   (up or down) in relation to its baseline.
    /// - Returns: Text that's above or below its baseline.
    public func baselineOffset(_ baselineOffset: CGFloat) -> Text
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    public static func + (lhs: Text, rhs: Text) -> Text
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {

    /// How text is truncated when a line of text is too long to fit into the
    /// available space.
    public enum TruncationMode {

        case head

        case tail

        case middle

        /// Returns a Boolean value indicating whether two values are equal.
        ///
        /// Equality is the inverse of inequality. For any values `a` and `b`,
        /// `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        public static func == (a: Text.TruncationMode, b: Text.TruncationMode) -> Bool

        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        ///
        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        public var hashValue: Int { get }

        /// Hashes the essential components of this value by feeding them into the
        /// given hasher.
        ///
        /// Implement this method to conform to the `Hashable` protocol. The
        /// components used for hashing must be the same as the components compared
        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
        /// with each of these components.
        ///
        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
        ///   compile-time error in the future.
        ///
        /// - Parameter hasher: The hasher to use when combining the components
        ///   of this instance.
        public func hash(into hasher: inout Hasher)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Equatable {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text.TruncationMode : Hashable {
}

/// Aligns the child view within its bounds given anchor types
///
/// Child sizing: Respects the child's preferred size on the aligned axes. The child fills the context bounds on unaligned axes.
///
/// Preferred size: Child's preferred size
/// An alignment in the horizontal axis.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public enum TextAlignment : Hashable, CaseIterable {

    case leading

    case center

    case trailing

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: TextAlignment, b: TextAlignment) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// A type that can represent a collection of all values of this type.
    public typealias AllCases = [TextAlignment]

    /// A collection of all values of this type.
    public static var allCases: [TextAlignment] { get }
}

/// A control that displays an editable text interface.
///
/// The appearance and interaction of `TextField` is determined at runtime and
/// can be customized. `TextField` uses the `TextFieldStyle` provided by its
/// environment to define its appearance and interaction. Each platform provides
/// a default style that reflects the platform style, but providing a new style
/// will redefine all `TextField` instances within that environment.
///
/// - SeeAlso: `TextFieldStyle`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct TextField<Label> : View where Label : View {

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension TextField where Label == Text {

    /// Creates an instance with a `Text` label generated from a localized title
    /// string.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///     - text: The text to be displayed and edited.
    ///     - onEditingChanged: An `Action` that will be called when the user
    ///     begins editing `text` and after the user finishes editing `text`,
    ///     passing a `Bool` indicating whether `self` is currently being edited
    ///     or not.
    ///     - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `TextField` has focus.
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})

    /// Creates an instance with a `Text` label generated from a title string.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - text: The text to be displayed and edited.
    ///     - onEditingChanged: An `Action` that will be called when the user
    ///     begins editing `text` and after the user finishes editing `text`,
    ///     passing a `Bool` indicating whether `self` is currently being edited
    ///     or not.
    ///     - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `TextField` has focus.
    public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: The `Formatter` to use when converting between the
    ///     `String` the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` will not be modified.
    ///   - onEditingChanged: An `Action` that will be called when the user
    ///     begins editing `text` and after the user finishes editing `text`,
    ///     passing a `Bool` indicating whether `self` is currently being edited
    ///     or not.
    ///   - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `TextField` has focus.
    public init<T>(_ titleKey: LocalizedStringKey, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {})

    /// Create an instance which binds over an arbitrary type, `T`.
    ///
    /// - Parameters:
    ///   - title: The title of `self`, describing its purpose.
    ///   - value: The underlying value to be edited.
    ///   - formatter: The `Formatter` to use when converting between the
    ///     `String` the user edits and the underlying value of type `T`.
    ///     In the event that `formatter` is unable to perform the conversion,
    ///     `binding.value` will not be modified.
    ///   - onEditingChanged: An `Action` that will be called when the user
    ///     begins editing `text` and after the user finishes editing `text`,
    ///     passing a `Bool` indicating whether `self` is currently being edited
    ///     or not.
    ///   - onCommit: The action to perform when the user performs an action
    ///     (usually the return key) while the `TextField` has focus.
    public init<S, T>(_ title: S, value: Binding<T>, formatter: Formatter, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) where S : StringProtocol
}

/// A specification for the appearance and interaction of a `TextField`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol TextFieldStyle {
}

/// A control that toggles between "on" and "off" states.
///
/// The appearance and interaction of `Toggle` is determined at runtime and can
/// be customized. `Toggle` uses the `ToggleStyle` provided by its environment
/// to define its appearance and interaction. Each platform provides a default
/// style that reflects the platform style, but providing a new style will
/// redefine all `Toggle` instances within that environment.
///
/// - SeeAlso: `ToggleStyle`
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Toggle<Label> : View where Label : View {

    /// Creates an instance that displays state based on `isOn`.
    ///
    /// - Parameters:
    ///     - isOn: Whether `self` is "on" or "off".
    ///     - label: A view that describes the effect of toggling `isOn`.
    public init(isOn: Binding<Bool>, @ViewBuilder label: () -> Label)

    /// Declares the content and behavior of this view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == ToggleStyleConfiguration.Label {

    /// Creates an instance representing the configuration of a `ToggleStyle`.
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
    public init(_ configuration: ToggleStyleConfiguration)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Toggle where Label == Text {

    /// Creates an instance with a `Text` label generated from a localized title
    /// string.
    ///
    /// - Parameters:
    ///     - titleKey: The key for the localized title of `self`, describing
    ///       its purpose.
    ///     - isOn: Whether `self` is "on" or "off".
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>)

    /// Creates an instance with a `Text` label generated from a title string.
    ///
    /// - Parameters:
    ///     - title: The title of `self`, describing its purpose.
    ///     - isOn: Whether `self` is "on" or "off".
    public init<S>(_ title: S, isOn: Binding<Bool>) where S : StringProtocol
}

/// Defines the implementation of all `Toggle` instances within a view
/// hierarchy.
///
/// To configure the current `ToggleStyle` for a view hiearchy, use the
/// `.toggleStyle()` modifier.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ToggleStyle {

    /// A `View` representing the body of a `Toggle`.
    associatedtype Body : View

    /// Creates a `View` representing the body of a `Toggle`.
    ///
    /// - Parameter configuration: The properties of the toggle instance being
    ///   created.
    ///
    /// This method will be called for each instance of `Toggle` created within
    /// a view hierarchy where this style is the current `ToggleStyle`.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a `Toggle` instance being created.
    typealias Configuration = ToggleStyleConfiguration
}

/// The properties of a `Toggle` instance being created.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ToggleStyleConfiguration {

    /// A type-erased label of a `Toggle`.
    public struct Label : View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required `body` property.
        public typealias Body = Never
    }

    /// A view that describes the effect of toggling `isOn`.
    public let label: ToggleStyleConfiguration.Label

    /// Whether or not the toggle is currently "on" or "off".
    public var isOn: Bool { get nonmutating set }

    public var $isOn: Binding<Bool> { get }
}

/// A model object that contains a `View` to be shown in the Touch Bar
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct TouchBar<Content> where Content : View {

    /// Creates a non-customizable `TouchBar`.
    public init(@ViewBuilder content: () -> Content)

    /// Creates a customizable `TouchBar`.
    ///
    /// Each view in `content` is required to have an explicit
    /// `touchBarItemPresence` with customization identifier.
    ///
    /// - Parameter id: A globally unique identifier for this TouchBar.
    public init(id: String, @ViewBuilder content: () -> Content)
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public enum TouchBarItemPresence {

    /// Visible by default and cannot be removed during customization
    ///
    /// - Parameter id: A globally unique identifier for this item.
    case required(String)

    /// Visible by default, but can be removed during customization
    /// ///
    /// - Parameter id: A globally unique identifier for this item.
    case `default`(String)

    /// Not visible by default, but appears in the customization palette
    ///
    /// - Parameter id: A globally unique identifier for this item.
    case optional(String)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Transaction {

    @inlinable public init()
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    /// True if the transaction was created by a "continuous" action,
    /// e.g. dragging a slider rather than tapping it once.
    public var isContinuous: Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Transaction {

    public init(animation: Animation?)

    public var animation: Animation?

    public var disablesAnimations: Bool
}

/// A shape with an affine transform applied to it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct TransformedShape<Content> : Shape where Content : Shape {

    public var shape: Content

    public var transform: CGAffineTransform

    @inlinable public init(shape: Content, transform: CGAffineTransform)

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path

    /// The type defining the data to be animated.
    public typealias AnimatableData = Content.AnimatableData

    /// The data to be animated.
    public var animatableData: Content.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

/// A View created from a swift tuple of View values.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct TupleView<T> {

    public var value: T

    @inlinable public init(_ value: T)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension TupleView : View {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct UnitPoint : Hashable {

    public var x: CGFloat

    public var y: CGFloat

    @inlinable public init()

    @inlinable public init(x: CGFloat, y: CGFloat)

    public static let zero: UnitPoint

    public static let center: UnitPoint

    public static let leading: UnitPoint

    public static let trailing: UnitPoint

    public static let top: UnitPoint

    public static let bottom: UnitPoint

    public static let topLeading: UnitPoint

    public static let topTrailing: UnitPoint

    public static let bottomLeading: UnitPoint

    public static let bottomTrailing: UnitPoint

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: UnitPoint, b: UnitPoint) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UnitPoint : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to be animated.
    public var animatableData: UnitPoint.AnimatableData
}

/// A layout container that arranges its children in a vertical line
/// and allows the user to resize them using dividers placed between them.
@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VSplitView<Content> : View where Content : View {

    public init(@ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A view that arranges its children in a vertical line.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct VStack<Content> : View where Content : View {

    /// Creates an instance with the given `spacing` and Y axis `alignment`.
    ///
    /// - Parameters:
    ///     - alignment: the guide that will have the same horizontal screen
    ///       coordinate for all children.
    ///     - spacing: the distance between adjacent children, or nil if the
    ///       stack should choose a default distance for each pair of children.
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// A type that may be used as the `AnimatableData` associated type of
/// a type conforming to the `Animatable` protocol. Extends the
/// `AdditiveArithmetic` protocol with scalar multiplication and a way
/// to query the vector magnitude of the value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol VectorArithmetic : AdditiveArithmetic {

    /// Multiplies each component of `self` by the scalar `rhs`.
    mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    var magnitudeSquared: Double { get }
}

/// An alignment position along the horizontal axis
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct VerticalAlignment {

    /// Creates an instance with the given ID.
    ///
    /// Note: each instance should have a unique ID.
    public init(_ id: AlignmentID.Type)

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: VerticalAlignment, b: VerticalAlignment) -> Bool
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension VerticalAlignment {

    /// A guide marking the top edge of the view.
    public static let top: VerticalAlignment

    /// A guide marking the vertical center of the view.
    public static let center: VerticalAlignment

    /// A guide marking the bottom edge of the view.
    public static let bottom: VerticalAlignment

    /// A guide marking the topmost text baseline view.
    public static let firstTextBaseline: VerticalAlignment

    /// A guide marking the bottom-most text baseline in a view.
    public static let lastTextBaseline: VerticalAlignment
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension VerticalAlignment : Equatable {
}

/// A piece of user interface.
///
/// You create custom views by declaring types that conform to the `View`
/// protocol. Implement the required `body` property to provide the content
/// and behavior for your custom view.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    associatedtype Body : View

    /// Declares the content and behavior of this view.
    var body: Self.Body { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension View {

    /// Sets the tab item to be used for this content.
    @available(watchOS, unavailable)
    public func tabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition for whether the view hierarchy for `self` can
    /// be deleted.
    @inlinable public func deleteDisabled(_ isDisabled: Bool) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `Button` within the environment of `self`.
    public func buttonStyle<S>(_ style: S) -> some View where S : PrimitiveButtonStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `Button` within the environment of `self`.
    public func buttonStyle<S>(_ style: S) -> some View where S : ButtonStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies the given transaction mutation function to all transactions
    /// used within the view.
    ///
    /// Use this modifier on leaf views rather than container views. The
    /// transformation applies to all child views within this view; calling
    /// `transaction(_:)` on a container view can lead to unbounded scope.
    ///
    /// - Parameter transform: The transformation to apply to transactions
    ///   within this view.
    /// - Returns: A view that wraps this view and applies `transformation`
    ///   to all transactions used within the view.
    @inlinable public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some View


    /// Applies the given animation to all animatable values within this view.
    ///
    /// Use this modifier on leaf views rather than container views. The
    /// animation applies to all child views within this view; calling
    /// `animation(_:)` on a container view can lead to unbounded scope.
    ///
    /// - Parameter animation: The animation to apply to animatable values
    ///   within this view.
    /// - Returns: A view that wraps this view and applies `animation`
    ///   to all animatable values used within the view.
    @inlinable public func animation(_ animation: Animation?) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func mask<Mask>(_ mask: Mask) -> some View where Mask : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view wrapping `self` that sets a `value` for an environment
    /// `keyPath`.
    @inlinable public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Adds an action to perform when the user moves the pointer over or away
    /// from this view's frame.
    ///
    /// Calling this method defines a region for detecting pointer movement
    /// with the size and position of this view.
    ///
    /// - Parameter action: The action to perform whenever the pointer enters or
    ///   exits this view's frame. If the pointer is in the view's frame,
    ///   the `action` closure passes `true` as a parameter; otherwise, `false`.
    /// - Returns: A view that triggers `action` when the pointer enters and
    ///   exits this view's frame.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func onHover(perform action: @escaping (Bool) -> Void) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for `NavigationView` within the environment of `self`
    @available(watchOS, unavailable)
    public func navigationViewStyle<S>(_ style: S) -> some View where S : NavigationViewStyle

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the `TouchBar` to be shown in the Touch Bar when applicable.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func touchBar<Content>(_ touchBar: TouchBar<Content>) -> some View where Content : View


    /// Sets the `TouchBar` content to be shown in the Touch Bar when applicable.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func touchBar<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View where Self : Equatable {

    /// Returns a new view that will prevent `self` updating its child
    /// view when its new value is the same as its old value.
    @inlinable public func equatable() -> EquatableView<Self>
}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension View {

    /// Returns a version of `self` that will invoke `action` after
    /// recognizing a tap gesture.
    public func onTapGesture(count: Int = 1, perform action: @escaping () -> Void) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Overrides the device for a preview.
    ///
    /// If `nil` (default), Xcode will automatically pick an appropriate device
    /// based on your target.
    ///
    /// The following values are supported:
    ///
    ///     "Mac"
    ///     "iPhone 7"
    ///     "iPhone 7 Plus"
    ///     "iPhone 8"
    ///     "iPhone 8 Plus"
    ///     "iPhone SE"
    ///     "iPhone X"
    ///     "iPhone Xs"
    ///     "iPhone Xs Max"
    ///     "iPhone Xʀ"
    ///     "iPad mini 4"
    ///     "iPad Air 2"
    ///     "iPad Pro (9.7-inch)"
    ///     "iPad Pro (12.9-inch)"
    ///     "iPad (5th generation)"
    ///     "iPad Pro (12.9-inch) (2nd generation)"
    ///     "iPad Pro (10.5-inch)"
    ///     "iPad (6th generation)"
    ///     "iPad Pro (11-inch)"
    ///     "iPad Pro (12.9-inch) (3rd generation)"
    ///     "iPad mini (5th generation)"
    ///     "iPad Air (3rd generation)"
    ///     "Apple TV"
    ///     "Apple TV 4K"
    ///     "Apple TV 4K (at 1080p)"
    ///     "Apple Watch Series 2 - 38mm"
    ///     "Apple Watch Series 2 - 42mm"
    ///     "Apple Watch Series 3 - 38mm"
    ///     "Apple Watch Series 3 - 42mm"
    ///     "Apple Watch Series 4 - 40mm"
    ///     "Apple Watch Series 4 - 44mm"
    @inlinable public func previewDevice(_ value: PreviewDevice?) -> some View


    /// Overrides the size of the container for the preview.
    ///
    /// Default is `.device`.
    @inlinable public func previewLayout(_ value: PreviewLayout) -> some View


    /// Provides a user visible name shown in the editor.
    ///
    /// Default is `nil`.
    @inlinable public func previewDisplayName(_ value: String?) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets up an action that triggers in response to the given selector.
    ///
    /// This view or one of the views it contains must be in focus in order
    /// for the action to trigger. Other actions for the same command
    /// on views *closer* to the view in focus take priority, potentially
    /// overriding this action.
    ///
    /// - Parameters:
    ///   - selector: The selector to register for `action`.
    ///   - action: The action to perform. If `action` is `nil`, `command`
    ///     keeps its association with this view but doesn't trigger.
    /// - Returns: A view that triggers `action` when the `command` occurs.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onCommand(_ selector: Selector, perform action: (() -> Void)?) -> some View


    /// Sets up an action that triggers in response to the system paste command.
    ///
    /// Pass an array of uniform type identifiers to the `supportedTypes`
    /// parameter. Place the higher priority types closer to the beginning of the
    /// array. The pasteboard items that the `action` closure receives have the
    /// most preferred type out of all the types the source supports.
    ///
    /// For example, if your app can handle plain text and rich text, but you
    /// prefer rich text, place the rich text type first in the array. If rich
    /// text is available when the paste action occurs, the `action` closure
    /// passes that rich text along.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through a paste action.
    ///     If the pasteboard doesn't contain any of the supported types, the
    ///     paste command doesn't trigger.
    ///   - payloadAction: The action to perform when the paste command triggers.
    ///     The action closure's parameter contains items from the pasteboard
    ///     with the types you specify in the `supportedTypes` parameter.
    /// - Returns: A view that triggers `action` when a system paste command
    ///   occurs.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onPasteCommand(of supportedTypes: [String], perform payloadAction: @escaping ([NSItemProvider]) -> Void) -> some View


    /// Sets up an action that triggers in response to the system paste command
    /// that you validate with the given closure.
    ///
    /// Pass an array of uniform type identifiers to the `supportedTypes`
    /// parameter. Place the higher priority types closer to the beginning of the
    /// array. The pasteboard items that the `validator` closure receives have the
    /// most preferred type out of all the types the source supports.
    ///
    /// For example, if your app can handle plain text and rich text, but you
    /// prefer rich text, place the rich text type first in the array. If rich
    /// text is available when the paste action occurs, the `validator` closure
    /// passes that rich text along.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through a paste action.
    ///     If the pasteboard doesn't contain any of the supported types, the
    ///     paste command doesn't trigger.
    ///   - validator: A handler that validates the command. This handler
    ///     receives items from the pasteboard with the types you specify in the
    ///    `supportedTypes` parameter. Use this handler to decide whether
    ///     the items are valid and preprocess them for the `action` closure.
    ///     If you return `nil` instead, the paste command doesn't trigger.
    ///   - payloadAction: The action to perform when the paste command triggers.
    /// - Returns: A view that triggers `action` when the system paste command
    ///   is invoked, validating the paste command with `validator`.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onPasteCommand<Payload>(of supportedTypes: [String], validator: @escaping ([NSItemProvider]) -> Payload?, perform payloadAction: @escaping (Payload) -> Void) -> some View


    /// Sets up an action that triggers in response to the system copy command.
    ///
    /// - Parameters:
    ///   - payloadAction: An action closure returning the `NSItemProvider`s that
    ///     should be copied to the pasteboard when the copy command is
    ///     triggered. If `action` is `nil`, the copy command is considered
    ///     disabled.
    /// - Returns: A view that triggers `action` when a system copy command
    ///   occurs.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onCopyCommand(perform payloadAction: (() -> [NSItemProvider])?) -> some View


    /// Sets up an action that triggers in response to the system cut command.
    ///
    /// - Parameters:
    ///   - payloadAction: An action closure that should delete the selected
    ///     data and return `NSItemProvider`s corresponding to that data, which
    ///     should be written to the pasteboard. If `action` is `nil`, the cut
    ///     command is considered disabled.
    /// - Returns: A view that triggers `action` when a system cut command
    ///   occurs.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onCutCommand(perform payloadAction: (() -> [NSItemProvider])?) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Activates this view as the source of a drag and drop operation.
    ///
    /// Applying the `onDrag(_:)` modifier adds the appropriate gestures for
    /// drag and drop to this view. When a drag operation begins,
    /// a rendering of this view is generated and used as the preview image.
    ///
    /// - Parameter data: A closure that returns a single `NSItemProvider` that
    ///   represents the draggable data from this view.
    /// - Returns: A view that activates this view as the source of a drag
    ///   and drop operation, beginning with user gesture input.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrag(_ data: @escaping () -> NSItemProvider) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view whose identity is explicitly bound to the proxy
    /// value `id`. When `id` changes the identity of the view (for
    /// example, its state) is reset.
    @inlinable public func id<ID>(_ id: ID) -> some View where ID : Hashable

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when the specified preference key's value
    /// changes.
    ///
    /// - Parameters:
    ///   - key: The key to monitor for value changes.
    ///   - action: The action to perform when the value for `key` changes. The
    ///     `action` closure passes the new value as its parameter.
    /// - Returns: A view that triggers `action` when the value for `key`
    ///   changes.
    @inlinable public func onPreferenceChange<K>(_ key: K.Type = K.self, perform action: @escaping (K.Value) -> Void) -> some View where K : PreferenceKey, K.Value : Equatable

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func allowsHitTesting(_ enabled: Bool) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Presents a sheet.
    ///
    /// - Parameters:
    ///     - item: A `Binding` to an optional source of truth for the sheet.
    ///     When representing a non-nil item, the system uses `content` to
    ///     create a sheet representation of the item.
    ///
    ///     If the identity changes, the system will dismiss a
    ///     currently-presented sheet and replace it by a new sheet.
    ///
    ///     - onDismiss: A closure executed when the sheet dismisses.
    ///     - content: A closure returning the content of the sheet.
    public func sheet<Item, Content>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View


    /// Presents a sheet.
    ///
    /// - Parameters:
    ///     - isPresented: A `Binding` to whether the sheet is presented.
    ///     - onDismiss: A closure executed when the sheet dismisses.
    ///     - content: A closure returning the content of the sheet.
    public func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Presents an alert.
    ///
    /// - Parameters:
    ///     - item: A `Binding` to an optional source of truth for the `Alert`.
    ///     When representing a non-nil item, the system uses `content` to
    ///     create an alert representation of the item.
    ///
    ///     If the identity changes, the system will dismiss a
    ///     currently-presented alert and replace it by a new alert.
    ///
    ///     - content: A closure returning the `Alert` to present.
    public func alert<Item>(item: Binding<Item?>, content: (Item) -> Alert) -> some View where Item : Identifiable


    /// Presents an alert.
    ///
    /// - Parameters:
    ///     - isPresented: A `Binding` to whether the `Alert` should be shown.
    ///     - content: A closure returning the `Alert` to present.
    public func alert(isPresented: Binding<Bool>, content: () -> Alert) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Attaches `gesture` to `self` such that it has lower precedence
    /// than gestures defined by `self`.
    public func gesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture


    /// Attaches `gesture` to `self` such that it has higher precedence
    /// than gestures defined by `self`.
    public func highPriorityGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture


    /// Attaches `gesture` to self such that it will be processed
    /// simultaneously with gestures defined by `self`.
    public func simultaneousGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func projectionEffect(_ transform: ProjectionTransform) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a new view representing `self` with `modifier` applied
    /// to it.
    @inlinable public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Layers a secondary view in front of this view.
    ///
    /// When you apply an overlay to a view, the original view continues to
    /// provide the layout characteristics for the resulting view. For example,
    /// the layout for the caption in this view fits within the width of the
    /// image:
    ///
    ///     Image(name: "artichokes")
    ///         .overlay(
    ///             HStack {
    ///                 Text("Artichokes"), // Text to use as a caption.
    ///                 Spacer()
    ///             }
    ///             .padding()
    ///             .foregroundColor(.white)
    ///             .background(Color.black.opacity(0.5)),
    ///
    ///             alignment: .bottom
    ///         )
    ///
    /// - Parameters:
    ///   - overlay: The view to layer in front of this view.
    ///   - alignment: The alignment for `overlay` in relation to this view.
    /// - Returns: A view that layers `overlay` in front of this view.
    @inlinable public func overlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .center) -> some View where Overlay : View


    /// Adds a border to this view with the specified style and width.
    ///
    /// By default, the border appears inside the bounds of this view. In this
    /// example, the four-point border covers the text:
    ///
    ///     Text("Artichokes")
    ///     .font(.title)
    ///     .border(Color.green, width: 4)
    ///
    /// To place a border around the outside of this view, apply padding of the
    /// same width before adding the border:
    ///
    ///     Text("Artichokes")
    ///     .font(.title)
    ///     .padding(4)
    ///     .border(Color.green, width: 4)
    ///
    /// - Parameters:
    ///   - content: The border style.
    ///   - width: The thickness of the border.
    /// - Returns: A view that adds a border with the specified style and width
    ///   to this view.
    @inlinable public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition for whether the view hierarchy for `self` can
    /// be moved.
    @inlinable public func moveDisabled(_ isDisabled: Bool) -> some View

}

@available(OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@available(iOS, unavailable)
extension View {

    /// Sets whether this view is focusable and, if so, adds an action to
    /// perform when the view comes into focus.
    ///
    /// - Parameters:
    ///   - isFocusable: A Boolean value that indicates whether this view
    ///     is focusable.
    ///   - onFocusChange: A closure that's called whenever this view either
    ///     gains or loses focus. The Boolean parameter to `onFocusChange` is
    ///     `true` when the view is in focus; otherwise, it's `false`.
    /// - Returns: A view that sets whether a view is focusable, and triggers
    ///   `onFocusChange` when the view gains or loses focus.
    @available(iOS, unavailable)
    public func focusable(_ isFocusable: Bool = true, onFocusChange: @escaping (Bool) -> Void = { _ in }) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Defines the destination for a drag and drop operation, using the same
    /// size and position as this view, handling dropped content with the given
    /// closure.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true`
    ///     when the cursor is inside the area, and `false` when the cursor is
    ///     outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The parameter to `action` contains the dropped
    ///     items, with types specified by `supportedTypes`. Return `true`
    ///     if the drop operation was successful; otherwise, return `false`.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View


    /// Defines the destination for a drag and drop operation with the same size
    /// and position as this view, handling dropped content and the drop
    /// location with the given closure.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - isTargeted: A binding that updates when a drag and drop operation
    ///     enters or exits the drop target area. The binding's value is `true`
    ///     when the cursor is inside the area, and `false` when the cursor is
    ///     outside.
    ///   - action: A closure that takes the dropped content and responds
    ///     appropriately. The first parameter to `action` contains the dropped
    ///     items, with types specified by `supportedTypes`. The second
    ///     parameter contains the drop location in this view's coordinate
    ///     space. Return `true` if the drop operation was successful;
    ///     otherwise, return `false`.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider], CGPoint) -> Bool) -> some View


    /// Defines the destination for a drag and drop operation with the same size
    /// and position as this view, with behavior controlled by the given
    /// delegate.
    ///
    /// - Parameters:
    ///   - supportedTypes: The uniform type identifiers that describe the
    ///     types of content this view can accept through drag and drop.
    ///     If the drag and drop operation doesn't contain any of the supported
    ///     types, then this drop destination doesn't activate and `isTargeted`
    ///     doesn't update.
    ///   - delegate: A type that conforms to the `DropDelegate` protocol. You
    ///     have comprehensive control over drop behavior when you use a
    ///     delegate.
    /// - Returns: A view that provides a drop destination for a drag
    ///   operation of the specified types.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDrop(of supportedTypes: [String], delegate: DropDelegate) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Constrains this view's dimensions to the specified aspect ratio.
    ///
    /// If this view is resizable, the resulting view will have `aspectRatio`
    /// as its aspect ratio. In this example, the purple ellipse has a 3:4
    /// width to height ratio, and scales to fit its frame:
    ///
    ///     Ellipse()
    ///     .fill(Color.purple)
    ///     .aspectRatio(0.75, contentMode: .fit)
    ///     .frame(width: 200, height: 200)
    ///     .border(Color(white: 0.75))
    ///
    /// - Parameters:
    ///   - aspectRatio: The ratio of width to height to use for the resulting
    ///     view. If `aspectRatio` is `nil`, the resulting view maintains this
    ///     view's aspect ratio.
    ///   - contentMode: A flag indicating whether this view should fit or
    ///     fill the parent context.
    /// - Returns: A view that constrains this view's dimensions to
    ///   `aspectRatio`, using `contentMode` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> some View


    /// Constrains this view's dimensions to the aspect ratio of the given size.
    ///
    /// If this view is resizable, the resulting view uses `aspectRatio` as its
    /// own aspect ratio. In this example, the purple ellipse has a 3:4 width
    /// to height ratio, and scales to fill its frame:
    ///
    ///     Ellipse()
    ///     .fill(Color.purple)
    ///     .aspectRatio(Size(width: 3, height: 4), contentMode: .fill)
    ///     .frame(width: 200, height: 200)
    ///     .border(Color(white: 0.75))
    ///
    /// - Parameters:
    ///   - aspectRatio: A size specifying the ratio of width to height to use
    ///     for the resulting view.
    ///   - contentMode: A flag indicating whether this view should fit or
    ///     fill the parent context.
    /// - Returns: A view that constrains this view's dimensions to
    ///   `aspectRatio`, using `contentMode` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGSize, contentMode: ContentMode) -> some View


    /// Scales this view to fit its parent.
    ///
    /// This view's aspect ratio is maintained as the view scales. This
    /// method is equivalent to calling `aspectRatio(nil, contentMode: .fit)`.
    ///
    ///      Circle()
    ///      .fill(Color.pink)
    ///      .scaledToFit()
    ///      .frame(width: 300, height: 150)
    ///      .border(Color(white: 0.75))
    ///
    /// - Returns: A view that scales this view to fit its parent,
    ///   maintaining this view's aspect ratio.
    @inlinable public func scaledToFit() -> some View


    /// Scales this view to fill its parent.
    ///
    /// This view's aspect ratio is maintained as the view scales. This
    /// method is equivalent to calling `aspectRatio(nil, contentMode: .fill)`.
    ///
    ///     Circle()
    ///     .fill(Color.pink)
    ///     .scaledToFill()
    ///     .frame(width: 300, height: 150)
    ///     .border(Color(white: 0.75))
    ///
    /// - Returns: A view that scales this view to fit its parent,
    ///   maintaining this view's aspect ratio.
    @inlinable public func scaledToFill() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Pads this view using the edge insets you specify.
    ///
    /// - Parameter insets: The edges to inset.
    /// - Returns: A view that pads this view using edge the insets you specify.
    @inlinable public func padding(_ insets: EdgeInsets) -> some View


    /// Pads this view using the edge insets you specify.
    ///
    /// The following example only pads the horizontal edge insets:
    ///
    ///     List {
    ///         Text("Item 1")
    ///     }
    ///     .padding([.horizontal])
    ///
    /// - Parameters:
    ///     - edges: The set of edges along which to inset this view.
    ///     - length: The amount to inset this view on each edge. If `nil`,
    ///       the amount is the system default amount.
    /// - Returns: A view that pads this view using edge the insets you specify.
    @inlinable public func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View


    /// Pads this view along all edge insets by the amount you specify.
    ///
    /// - Parameter length: The amount to inset this view on each edge.
    /// - Returns: A view that pads this view by the amount you specify.
    @inlinable public func padding(_ length: CGFloat) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Offsets this view by the horizontal and vertical distances in the given
    /// size.
    ///
    /// The original dimensions of the view are considered to be unchanged by
    /// offsetting the contents. For example, the gray border drawn by this
    /// view surrounds the original position of the text:
    ///
    ///     Text("Hello world!")
    ///     .font(.title)
    ///     .offset(CGSize(width: 50, height: 10))
    ///     .border(Color.gray)
    ///
    /// - Parameter size: The distance to offset this view.
    /// - Returns: A view that offsets this view by `size`.
    @inlinable public func offset(_ offset: CGSize) -> some View


    /// Offsets this view by the specified horizontal and vertical distances.
    ///
    /// The original dimensions of the view are considered to be unchanged by
    /// offsetting the contents. For example, the gray border drawn by this
    /// view surrounds the original position of the text:
    ///
    ///     Text("Hello world!")
    ///     .font(.title)
    ///     .offset(x: 50, y: 10)
    ///     .border(Color.gray)
    ///
    /// - Parameters:
    ///   - x: The horizontal distance to offset this view.
    ///   - y: The vertical distance to offset this view.
    /// - Returns: A view that offsets this view by `x` and `y`.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Fixes the center of this view at the specified point in its parent's
    /// coordinate space.
    ///
    /// - Parameter position: The point at which to place the center of this
    ///   view.
    /// - Returns: A view that fixes the center of this view at `position`.
    @inlinable public func position(_ position: CGPoint) -> some View


    /// Fixes the center of this view at the specified coordinates in its
    /// parent's coordinate space.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate at which to place the center of this view.
    ///   - y: The y-coordinate at which to place the center of this view.
    /// - Returns: A view that fixes the center of this view at
    ///   `x` and `y`.
    @inlinable public func position(x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a new view that defines the content shape for
    /// hit-testing `self` as `shape`. `eoFill` defines whether the
    /// shape is interpreted using the even-odd winding number rule or
    /// not.
    @inlinable public func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func transformEffect(_ transform: CGAffineTransform) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a condition that controls whether users can interact with this
    /// view.
    ///
    /// The higher views in a view hierarchy can override the value you set on
    /// this view. In the following example, the button isn't interactive
    /// because the outer `disabled(_:)` modifier overrides the inner one:
    ///
    ///     HStack {
    ///         Button(Text("Press")) {}
    ///         .disabled(false)
    ///     }
    ///     .disabled(true)
    ///
    /// - Parameter disabled: A Boolean value that determines whether users can
    ///   interact with this view.
    /// - Returns: A view that controls whether users can interact with this
    ///   view.
    @inlinable public func disabled(_ disabled: Bool) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Set the foreground color within `self`.
    @inlinable public func foregroundColor(_ color: Color?) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func scaleEffect(_ scale: CGSize, anchor: UnitPoint = .center) -> some View


    @inlinable public func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some View


    @inlinable public func scaleEffect(x: CGFloat = 0.0, y: CGFloat = 0.0, anchor: UnitPoint = .center) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Hides this view.
    ///
    /// Hidden views are invisible and can't receive or respond to
    /// interactions.
    ///
    /// Returns: A view that hides this view.
    @inlinable public func hidden() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a Gaussian blur to this view.
    ///
    /// - Parameters:
    ///   - radius: The radial size of the blur. A blur is more diffuse when its
    ///     radius is large.
    ///   - opaque: A Boolean value that indicates whether the blur renderer
    ///     permits transparency in the blur output. Set to `true` to create
    ///     an opaque blur, or set to `false` to permit transparency.
    @inlinable public func blur(radius: CGFloat, opaque: Bool = false) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width,
    /// height, or both. If you only specify one of the dimensions, the
    /// resulting view assumes this view's sizing behavior in the other
    /// dimension.
    ///
    /// For example, the first ellipse in the following code is rendered in a
    /// fixed 200 by 100 frame. The second ellipse has only its height fixed,
    /// at 100; its width still expands to fill its parent's dimensions.
    ///
    ///     VStack {
    ///         Ellipse()
    ///         .fill(Color.purple)
    ///         .frame(width: 100, height: 100),
    ///         Ellipse()
    ///         .fill(Color.blue)
    ///         .frame(height: 100)
    ///     }
    ///
    /// If this view is smaller than the resulting frame in either dimension,
    /// `alignment` specifies this view's alignment within the frame.
    ///
    ///     Text("Hello world!")
    ///     .frame(width: 200, height: 200, alignment: topLeading)
    ///     .border(Color.gray)
    ///
    /// - Parameters:
    ///   - width: A fixed width for the resulting view. If `width` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - height: A fixed width for the resulting view. If `width` is `nil`,
    ///     the resulting view assumes this view's sizing behavior.
    ///   - alignment: The alignment of this view inside the resulting view.
    ///     `alignment` applies if this view is smaller than the size given
    ///     by the resulting frame.
    /// - Returns: A view with fixed dimensions of `width` and `height`, for
    ///   the parameters that are non-`nil`.
    @inlinable public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View


    /// This function should never be used.
    ///
    /// It is merely a hack to catch the case where the user writes .frame(),
    /// which is nonsensical.
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @inlinable public func frame() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Positions this view within an invisible frame with the specified width
    /// and height constraints.
    ///
    /// Always specify at least one size characteristic when calling this
    /// method. Pass `nil` or leave out a characteristic to indicate that
    /// the frame should adopt this view's sizing behavior, constrained by
    /// the other non-`nil` arguments.
    ///
    /// The size proposed to this view is the size proposed to the frame,
    /// limited by any constraints specified, and with any ideal dimensions
    /// specified replacing corresponding nil dimensions in the proposal.
    ///
    /// If you no minimum or maximum constraint is specified in a given
    /// dimension, the frame adopts the sizing behavior of its child in that
    /// dimension. If both constraints are specified in a dimension, the frame
    /// unconditionally adopts the size proposed for it, clamped to the
    /// constraints.  In detail, the size of the frame in either dimension is:
    ///
    /// - If a minimum constraint is specified and the size proposed for the
    ///   frame by the parent is less than the size of this view, the proposed
    ///   size, clamped to that minimum.
    /// - If a maximum constraint is specified and the size proposed for the
    ///   frame by the parent is greater than the size of this view, the
    ///   proposed size, clamped to that maximum.
    /// - Otherwise, the size of this view.
    ///
    /// - Parameters:
    ///   - minWidth: The minimum width of the resulting frame.
    ///   - idealWidth: The ideal width of the resulting frame.
    ///   - maxWidth: The maximum width of the resulting frame.
    ///   - minHeight: The minimum height of the resulting frame.
    ///   - idealHeight: The ideal height of the resulting frame.
    ///   - maxHeight: The maximum height of the resulting frame.
    ///   - alignment: The alignment of this view inside the resulting frame.
    ///     Note that most alignment values have no apparent effect when the
    ///     size of the frame happens to match that of this view.
    /// - Returns: A view with flexible dimensions given by the call's non-`nil`
    ///   parameters.
    @inlinable public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Brightens this view by the specified amount.
    ///
    /// - Parameter amount: A value between 0 (no effect) and 1 (full white
    ///     brightening) that represents the intensity of the brightness effect.
    /// - Returns: A view that brightens this view by the specified amount.
    @inlinable public func brightness(_ amount: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view modified so that its value for the given `guide` is the
    /// result of passing the `ViewDimensions` of the underlying view to
    /// `computeValue`.
    @inlinable public func alignmentGuide(_ g: HorizontalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View


    /// Returns a view modified so that its value for the given `guide` is the
    /// result of passing the `ViewDimensions` of the underlying view to
    /// `computeValue`.
    @inlinable public func alignmentGuide(_ g: VerticalAlignment, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View

}

extension View {

    /// Sets whether autocorrection is enabled for the view hierarchy contained
    /// in `self`.
    @available(iOS 13.0, OSX 10.15, tvOS 13.0, *)
    @available(watchOS, unavailable)
    public func disableAutocorrection(_ disable: Bool?) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Inverts the colors in this view.
    ///
    /// The `colorInvert()` modifier inverts all of the colors in a view so that
    /// each color displays as its complementary color. For example, blue
    /// converts to yellow, and white converts to black.
    ///
    /// - Returns: A view that inverts its colors.
    @inlinable public func colorInvert() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a color multiplication effect to this view.
    ///
    /// The following shows two versions of the same image side by side; at left
    /// is the original, and at right is a duplicate with the
    /// `colorMultiply(_:)` modifier applied with `Color.purple`.
    ///
    /// - Parameter color: The color to bias this view toward.
    /// - Returns: A view with a color multiplication effect.
    @inlinable public func colorMultiply(_ color: Color) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the contrast and separation between similar colors in this view.
    ///
    /// Apply contrast to a view when you want to increase or decrease the
    /// separation between similar colors in the view.
    ///
    /// - Parameter amount: The intensity of color constrast to apply. Negative
    ///     values invert colors in addition to applying contrast.
    /// - Returns: A view that applies color contrast to this view.
    @inlinable public func contrast(_ amount: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a grayscale effect to this view.
    ///
    /// A grayscale effect reduces the intensity of colors in this view.
    ///
    /// - Parameter amount: The intensity of grayscale to apply. Values
    ///   closer to 0.0 are more colorful, and values closer to 1.0 are less
    ///   colorful.
    /// - Returns: A view that adds a grayscale effect to this view.
    @inlinable public func grayscale(_ amount: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a hue rotation effect to this view.
    ///
    /// A hue rotation effect shifts all of the colors in a view according
    /// to the angle you specify.
    ///
    /// - Parameter angle: The hue rotation angle to apply to the colors in this
    ///   view.
    /// - Returns: A view that applies a hue rotation effect to this view.
    @inlinable public func hueRotation(_ angle: Angle) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a luminance to alpha effect to this view.
    ///
    /// The `luminanceToAlpha()` modifier creates a semitransparent mask out of
    /// the view you apply it to. The dark regions in a view become transparent,
    /// and the bright regions become opaque black. Medium brightness regions
    /// become a partially opay gray color.
    ///
    /// Returns: A view that applies a luminance to alpha effect to this view.
    @inlinable public func luminanceToAlpha() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adjusts the color saturation of this view.
    ///
    /// Changing color saturation increases or decreases the intensity of colors
    /// in a view.
    ///
    /// - Parameter amount: The amount of saturation to apply to this view.
    /// - Returns: A view that adjusts the saturation of this view.
    @inlinable public func saturation(_ amount: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the transparency of this view.
    ///
    /// Apply opacity to reveal views that are behind another view or to
    /// de-emphasize a view.
    ///
    /// When applying the `opacity(_:)` modifier to a view that already has
    /// an opacity, the modifier supplements---rather than replaces---the view's
    /// opacity.
    ///
    /// - Parameter opacity: A value between 0 (fully transparent) and 1
    ///     (fully opaque).
    /// - Returns: A view that sets the transparency of this view.
    @inlinable public func opacity(_ opacity: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies the given animation to this view, whenever the specified value
    /// changes.
    ///
    /// - Parameters:
    ///   - animation: The animation to apply. If `animation` is `nil`, the view
    ///     doesn't animate.
    ///   - value: A value to monitor for changes.
    /// - Returns: A view that applies `animation` to this view whenever `value`
    ///   changes.
    @inlinable public func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the blend mode for compositing this view with overlapping views.
    ///
    /// - Parameter blendMode: The blend mode for compositing this view.
    /// - Returns: A view that applies `blendMode` to this view.
    @inlinable public func blendMode(_ blendMode: BlendMode) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view wrapping `self` that transforms the value of the
    /// environment key described by `keyPath` by applying a transform
    /// function.
    @inlinable public func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `Toggle` within the environment of `self`
    public func toggleStyle<S>(_ style: S) -> some View where S : ToggleStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Composites this view's contents into an offscreen image before final
    /// display.
    ///
    /// Views backed by native platform views don't render into the image.
    /// Instead, they log a warning and display a placeholder image to highlight
    /// the error.
    ///
    /// - Parameters:
    ///   - opaque: A Boolean value that indicates whether the image is opaque.
    ///     If `true`, the alpha channel of the image must be one.
    ///   - colorMode: The working color space and storage format of the image.
    /// - Returns: A view that composites this view's contents into an offscreen
    ///   image before display.
    public func drawingGroup(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Wraps this view in a compositing group.
    ///
    /// A compositing group makes compositing effects in this view's ancestor
    /// views, like opacity and the blend mode, take effect before this view
    /// renders.
    ///
    /// - Returns: A view that wraps this view in a compositing group.
    @inlinable public func compositingGroup() -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds a shadow to this view.
    ///
    /// - Parameters:
    ///   - color: The shadow's color.
    ///   - radius: The shadow's size.
    ///   - x: A horizontal offset you use to position the shadow relative to
    ///     this view.
    ///   - y: A vertical offset you use to position the shadow relative to
    ///     this view.
    /// - Returns: A view that adds a shadow to this view.
    @inlinable public func shadow(color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when the given publisher emits an event.
    ///
    /// - Parameters:
    ///   - publisher: The publisher to subscribe to.
    ///   - action: The action to perform when an event is emitted by
    ///     `publisher`. The event emitted by publisher is passed as a
    ///     parameter to `action`.
    /// - Returns: A view that triggers `action` when `publisher` emits an
    ///   event.
    @inlinable public func onReceive<P>(_ publisher: P, perform action: @escaping (P.Output) -> Void) -> some View where P : Publisher, P.Failure == Never

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the tag of the view, used for selecting from a list of `View`
    /// options.
    ///
    /// - SeeAlso: `List`, `Picker`
    @inlinable public func tag<V>(_ tag: V) -> some View where V : Hashable

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets this view's color scheme.
    ///
    /// - Parameter colorScheme: The color scheme for this view.
    /// - Returns: A view that sets this view's color scheme.
    @inlinable public func colorScheme(_ colorScheme: ColorScheme) -> some View


    /// Sets the default font for text in this view.
    ///
    /// - Parameter font: The default font to use in this view.
    /// - Returns: A view with the default font set to the value you supply.
    @inlinable public func font(_ font: Font?) -> some View

}

extension View {

    /// Add an accessibility action to an element.
    public func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Add a custom action to an element and all sub-elements.
    public func accessibilityAction(named name: Text, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Presents a popover.
    ///
    /// - Parameters:
    ///     - item: A `Binding` to an optional source of truth for the popover.
    ///     When representing a non-nil item, the system uses `content` to
    ///      create a popover representation of the item.
    ///
    ///     If the identity changes, the system will dismiss a
    ///     currently-presented popover and replace it by a new popover.
    ///
    ///     - attachmentAnchor: The positioning anchor which defines where the
    ///      popover is attached.
    ///     - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///     - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Item, Content>(item: Binding<Item?>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View


    /// Presents a popover.
    ///
    /// - Parameters:
    ///     - isPresented: A `Binding` to whether the popover is presented.
    ///     - attachmentAnchor: The positioning anchor which defines where the
    ///      popover is attached.
    ///     - arrowEdge: The edge of the `attachmentAnchor` where the popover's
    ///     arrow is located.
    ///     - content: A closure returning the content of the popover.
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Provides a closure that vends the drag representation to be used for a
    /// particular `DynamicContent`.
    @inlinable public func itemProvider(_ action: (() -> NSItemProvider?)?) -> some View

}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension View {

    /// Adds a contextual menu to this view.
    ///
    /// Use contextual menus to add actions that change depending on the user's
    /// current focus and task.
    ///
    /// The following example creates text with a contextual menu:
    ///
    ///     Text("Control Click Me")
    ///     .contextMenu {
    ///         Button(Text("Add")) {}
    ///         Button(Text("Remove")) {}
    ///     }
    ///
    /// - Returns: A view that adds a contextual menu to this view.
    @available(tvOS, unavailable)
    public func contextMenu<MenuItems>(@ViewBuilder menuItems: () -> MenuItems) -> some View where MenuItems : View


    /// Attaches a `ContextMenu` and its children to `self`.
    ///
    /// This modifier allows for the contextual menu to be conditionally
    /// available by passing `nil` as the value for `contextMenu`.
    @available(tvOS, unavailable)
    public func contextMenu<MenuItems>(_ contextMenu: ContextMenu<MenuItems>?) -> some View where MenuItems : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Fixes this view at its ideal size in the specified dimensions.
    ///
    /// This example shows the effect of `fixedSize(horizontal:vertical:)` on
    /// a text view that is wider than its parent, preserving the ideal,
    /// untruncated width of the text view.
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///     .fixedSize(horizontal: true, vertical: false)
    ///     .frame(width: 200, height: 200)
    ///     .border(Color.gray)
    ///
    /// Without the call to `fixedSize(_:)`, the text view has its width set
    /// by its parent, which truncates the line of text.
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///     .frame(width: 200, height: 200)
    ///     .border(Color.gray)
    ///
    /// - Parameters:
    ///   - horizontal: A Boolean value indicating whether to fix the width of
    ///     the view.
    ///   - vertical: A Boolean value indicating whether to fix the height of
    ///     the view.
    /// - Returns: A view that fixes this view at its ideal size in the
    ///   dimensions specified by `horizontal` and `vertical`.
    @inlinable public func fixedSize(horizontal: Bool, vertical: Bool) -> some View


    /// Fixes this view at its ideal size.
    ///
    /// This example shows the effect of `fixedSize()` on a text view that
    /// is wider than its parent, preserving the ideal, untruncated width
    /// of the text view.
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///     .fixedSize()
    ///     .frame(width: 200, height: 200)
    ///     .border(Color.gray)
    ///
    /// Without the call to `fixedSize(_:)`, the text view has its width set
    /// by its parent, which truncates the line of text.
    ///
    ///     Text("A single line of text, too long to fit in a box.")
    ///     .frame(width: 200, height: 200)
    ///     .border(Color.gray)
    ///
    /// - Returns: A view that fixes this view at its ideal size in the
    ///   dimensions given in `fixedDimensions`.
    @inlinable public func fixedSize() -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for `MenuButton` within the environment of `self`.
    public func menuButtonStyle<S>(_ style: S) -> some View where S : MenuButtonStyle

}

@available(iOS 13.0, OSX 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Sets the style for `DatePicker` within the environment of `self`
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func datePickerStyle<S>(_ style: S) -> some View where S : DatePickerStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func anchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (Anchor<A>) -> K.Value) -> some View where K : PreferenceKey

}

@available(iOS 13.0, OSX 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
extension View {

    /// Returns a version of `self` that will invoke `action` after
    /// recognizing a longPress gesture.
    public func onLongPressGesture(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10, pressing: ((Bool) -> Void)? = nil, perform action: @escaping () -> Void) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Convenience function for attaching an AccessibilityScrollAction to a
    /// view.
    public func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    public func accessibilityElement(children: AccessibilityChildBehavior = .ignore) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Adds an action to perform when this view appears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    /// - Returns: A view that triggers `action` when this view appears.
    @inlinable public func onAppear(perform action: (() -> Void)? = nil) -> some View


    /// Adds an action to perform when this view disappears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    /// - Returns: A view that triggers `action` when this view disappears.
    @inlinable public func onDisappear(perform action: (() -> Void)? = nil) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets whether this view flips its contents horizontally when the layout
    /// direction is right-to-left.
    ///
    /// - Parameter enabled: A Boolean value that indicates whether this view
    ///   flips its content horizontally when the layout direction is
    ///   right-to-left.
    /// - Returns: A view that conditionally flips its contents horizontally
    /// when the layout direction is right-to-left.
    @inlinable public func flipsForRightToLeftLayoutDirection(_ enabled: Bool) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func transformAnchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (inout K.Value, Anchor<A>) -> Void) -> some View where K : PreferenceKey

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Convenience function for attaching an AccessibilityAdjustableAction to a
    /// view.
    public func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// The behavior of the view when being customized by the user.
    /// Views may be:
    /// - required and not allowed to be removed by the user
    /// - shown by default prior to user customization, but removable
    /// - not visible by default, but can be added through the palette
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func touchBarItemPresence(_ presence: TouchBarItemPresence) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Principal views have special significance to this TouchBar.
    /// Currently, that item will be placed in the center of the row.
    /// - Note: multiple visible bars may each specify a principal view,
    /// but only one of them can have the request honored.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func touchBarItemPrincipal(_ principal: Bool = true) -> some View

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// The user-visible `String` identifying the view's functionality.
    /// Visible during user customization.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func touchBarCustomizationLabel(_ label: Text) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func rotation3DEffect(_ angle: Angle, axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    public func accessibility(hidden: Bool) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    public func accessibility(label: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    public func accessibility(value: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    public func accessibility(hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Add accessibility traits to the current accessibility element.
    public func accessibility(addTraits traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    public func accessibility(removeTraits traits: AccessibilityTraits) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Set an identifier for the current accessibility element.
    /// This is not user-visible and is good for testing.
    public func accessibility(identifier: String) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Set the sort priority value used to order the current accessibility
    /// element relative to other elements at it's level.
    /// Higher numbers are sorted first. The default sort priority is zero.
    public func accessibility(sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets the accessibility activation point, relative to the frame of the
    /// accessibility element.
    public func accessibility(activationPoint: CGPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>

    /// Sets the accessibility activation point, relative to the frame of the
    /// accessibility element. Normalized between 0 and 1.
    public func accessibility(activationPoint: UnitPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the view to be placed behind `self` when placed in a `List`
    @inlinable public func listRowBackground<V>(_ view: V?) -> some View where V : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Associates a transition with `self`.
    @inlinable public func transition(_ t: AnyTransition) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the Z index for an item.
    @inlinable public func zIndex(_ value: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Changes the area proposed for this view so that—were the proposal
    /// accepted—this view would extend outside the safe area to the bounds of
    /// the screen in the specified edges.
    ///
    /// If this view does not accept the size proposed for it, it is positioned
    /// in the center of the proposed area.
    ///
    /// - Parameter edges: The set of the edges in which to expand the size
    ///   proposed for this view.
    ///
    /// - Returns: A view that accepts the size proposed for it, extends that
    ///   size out of the safe area on the edges specified by `edges`, proposes
    ///   that area to this view, and centers this view.
    @inlinable public func edgesIgnoringSafeArea(_ edges: Edge.Set) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view producing `value` as the value of preference
    /// `Key` seen by its ancestors.
    @inlinable public func preference<K>(key _: K.Type = K.self, value: K.Value) -> some View where K : PreferenceKey

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `Picker` within the environment of `self`.
    public func pickerStyle<S>(_ style: S) -> some View where S : PickerStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `List` within the environment of `self`.
    public func listStyle<S>(_ style: S) -> some View where S : ListStyle

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the style for `TextField` within the environment of `self`.
    public func textFieldStyle<S>(_ style: S) -> some View where S : TextFieldStyle

}

@available(OSX 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {

    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @inlinable public func controlSize(_ controlSize: ControlSize) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets a clipping shape for this view.
    ///
    /// By applying a clipping shape to a view, you preserve the parts of the
    /// view covered by the shape, while eliminating other parts of the view.
    /// The clipping shape itself isn't visible.
    ///
    /// For example, this code applies clipping shape to a square image:
    ///
    ///     Image(name: "artichokes")
    ///         .clipShape(Circle())
    ///
    /// The resulting view shows only the portion of the image that lies within
    /// the bounds of the circle.
    ///
    /// - Parameters:
    ///   - shape: The clipping shape to use for this view. The `shape` fills
    ///     the view's frame, while maintaining its aspect ratio.
    ///   - style: The fill style to use when rasterizing `shape`.
    /// - Returns: A view that clips this view to `shape`, using `style` to
    ///   define the shape's rasterization.
    @inlinable public func clipShape<S>(_ shape: S, style: FillStyle = FillStyle()) -> some View where S : Shape


    /// Clips this view to its bounding rectangular frame.
    ///
    /// By default, a view's bounding frame is used only for layout, so any
    /// content that extends beyond the edges of the frame is still visible.
    /// Use the `clipped()` modifier to hide any content that extends beyond
    /// these edges.
    ///
    /// - Parameter antialiased: A Boolean value that indicates whether
    ///   smoothing is applied to the edges of the clipping rectangle.
    /// - Returns: A view that clips this view to its bounding frame.
    @inlinable public func clipped(antialiased: Bool = false) -> some View


    /// Clips this view to its bounding frame, with the specified corner radius.
    ///
    /// By default, a view's bounding frame only affects its layout, so any
    /// content that extends beyond the edges of the frame remains visible.
    /// Use the `cornerRadius()` modifier to hide any content that extends
    /// beyond these edges while applying a corner radius.
    ///
    /// The following code applies a corner radius of 20 to a square image:
    ///
    ///     Image(name: "walnuts")
    ///         .cornerRadius(20)
    ///
    /// - Parameter antialiased: A Boolean value that indicates whether
    ///   smoothing is applied to the edges of the clipping rectangle.
    /// - Returns: A view that clips this view to its bounding frame.
    @inlinable public func cornerRadius(_ radius: CGFloat, antialiased: Bool = true) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the inset to be applied to `self` in a `List`.
    @inlinable public func listRowInsets(_ insets: EdgeInsets?) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the alignment of multiline text in this view.
    ///
    /// - Parameter alignment: A value you use to align lines of text to the
    ///   left, right, or center.
    /// - Returns: A view that aligns the lines of multiline `Text` instances
    ///   it contains.
    @inlinable public func multilineTextAlignment(_ alignment: TextAlignment) -> some View


    /// Sets the truncation mode for lines of text that are too long to fit in
    /// the available space.
    ///
    /// Use the `truncationMode(_:)` modifier to determine whether text in a
    /// long line is truncated at the beginning, middle, or end. Truncation
    /// adds an ellipsis (…) to the line when removing text to indicate to
    /// readers that text is missing.
    ///
    /// - Parameter mode: The truncation mode.
    /// - Returns: A view that truncates text at different points in a line
    ///   depending on the mode you select.
    @inlinable public func truncationMode(_ mode: Text.TruncationMode) -> some View


    /// Sets the amount of space between lines of text in this view.
    ///
    /// - Parameter lineSpacing: The amount of space between the bottom of one
    ///   line and the top of the next line.
    @inlinable public func lineSpacing(_ lineSpacing: CGFloat) -> some View


    /// Sets whether text in this view can compress the space between characters
    /// when necessary to fit text in a line.
    ///
    /// - Parameter flag: A Boolean value that indicates whether the space
    ///   between characters compresses when necessary.
    /// - Returns: A view that can compress the space between characters when
    ///   necessary to fit text in a line.
    @inlinable public func allowsTightening(_ flag: Bool) -> some View


    /// Sets the maximum number of lines that text can occupy in this view.
    ///
    /// The line limit applies to all `Text` instances within this view. For
    /// example, an `HStack` with multiple pieces of text longer than three
    /// lines caps each piece of text to three lines rather than capping the
    /// total number of lines across the `HStack`.
    ///
    /// - Parameter number: The line limit. If `nil`, no line limit applies.
    /// - Returns: A view that limits the number of lines that `Text` instances
    ///   display.
    ///
    /// - Note: a non-nil `number` less than 1 will be treated as 1.
    @inlinable public func lineLimit(_ number: Int?) -> some View


    /// Sets the minimum amount that text in this view scales down to fit in the
    /// available space.
    ///
    /// Use the `minimumScaleFactor(_:)` modifier if the text you place in a
    /// view doesn't fit and it's okay if the text shrinks to accommodate.
    /// For example, a label with a `minimumScaleFactor` of `0.5` draws its
    /// text in a font size as small as half of the actual font if needed.
    ///
    /// - Parameter factor: A fraction between 0 and 1 (inclusive) you use to
    ///   specify the minimum amount of text scaling that this view permits.
    /// - Returns: A view that limits the amount of text downscaling.
    @inlinable public func minimumScaleFactor(_ factor: CGFloat) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view that applies `callback(&value)` to the value of
    /// preference `Key` that's seen by its ancestors.
    @inlinable public func transformPreference<K>(_ key: K.Type = K.self, _ callback: @escaping (inout K.Value) -> Void) -> some View where K : PreferenceKey

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the priority by which a parent layout should apportion
    /// space to this child.
    ///
    /// The default priority is `0`.  In a group of sibling views,
    /// raising a view's layout priority encourages that view to shrink
    /// later when the group is shrunk and stretch sooner when the group
    /// is stretched.
    ///
    /// A parent layout should offer the child(ren) with the highest
    /// layout priority all the space offered to the parent minus the
    /// minimum space required for all its lower-priority children, and
    /// so on for each lower priority value.
    @inlinable public func layoutPriority(_ value: Double) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Returns a view that reads the value of preference `Key` from
    /// `self`, uses that to produce another view which is displayed as
    /// an overlay on `self`.
    @inlinable public func overlayPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View


    /// Returns a view that reads the value of preference `Key` from
    /// `self`, uses that to produce another view which is displayed as
    /// as the background to `self`.
    @inlinable public func backgroundPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func coordinateSpace<T>(name: T) -> some View where T : Hashable

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Supplies an `ObservableObject` to a view subhierachy.
    ///
    /// The object can be read by any child by using `EnvironmentObject`.
    ///
    /// - Parameter bindable: the object to store and make available to
    ///     the view's subhiearchy.
    @inlinable public func environmentObject<B>(_ bindable: B) -> some View where B : ObservableObject

}

@available(OSX 10.15, tvOS 13.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
extension View {

    /// Invokes `action` when a move command is issued while
    /// `self` is focused.
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    public func onMoveCommand(perform action: ((MoveCommandDirection) -> Void)?) -> some View


    /// Invokes `action` when the exit command is issued while
    /// `self` is focused.
    ///
    /// This corresponds to the 'Menu' button on tvOS, and the escape key on
    /// macOS.
    @available(iOS, unavailable)
    @available(watchOS, unavailable)
    public func onExitCommand(perform action: (() -> Void)?) -> some View


    /// Invokes `action` when the delete command is issued while
    /// `self` is focused.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func onDeleteCommand(perform action: (() -> Void)?) -> some View

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Hides the labels of controls contained within the view.
    ///
    /// While the labels are not visually laid out alongside the controls, they
    /// are still used for disclosable purposes, such as accessibility.
    public func labelsHidden() -> some View

}

extension View {

    /// Sets the style for `.radioGroup` style `Picker`s within the environment
    /// of `self` to be radio buttons horizontally arranged inside of `layout`.
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public func horizontalRadioGroupLayout() -> some View

}

/// The `ViewBuilder` type is a custom parameter attribute that constructs views from multi-statement
/// closures.
///
/// The typical use of `ViewBuilder` is as a parameter attribute for child view-producing closure
/// parameters, allowing those closures to provide multiple child views. For example, the following
/// `contextMenu` function accepts a closure that produces one or more views via the `ViewBuidler`.
///
/// ```
/// func contextMenu<MenuItems : View>(
///         @ViewBuilder menuItems: () -> MenuItems
///     ) -> some View
/// ```
///
/// Clients of this function can use multiple-statement closures to provide several child views, e.g.,
///
/// ```
/// myView.contextMenu {
///     Text("Cut")
///     Text("Copy")
///     Text("Paste")
///     if isSymbol {
///         Text("Jump to Definition")
///     }
/// }
/// ```
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder public struct ViewBuilder {

    /// Builds an empty view from an block containing no statements, `{ }`.
    public static func buildBlock() -> EmptyView

    /// Passes a single view written as a child view (e..g, `{ Text("Hello") }`) through
    /// unmodified.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    /// Provides support for "if" statements in multi-statement closures, producing an `Optional` view
    /// that is visible only when the `if` condition evaluates `true`.
    public static func buildIf<Content>(_ content: Content?) -> Content? where Content : View

    /// Provides support for "if" statements in multi-statement closures, producing
    /// ConditionalContent for the "then" branch.
    public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View

    /// Provides support for "if-else" statements in multi-statement closures, producing
    /// ConditionalContent for the "else" branch.
    public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0 : View, C1 : View, C2 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)> where C0 : View, C1 : View, C2 : View, C3 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewBuilder {

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View
}

/// A view's size and its alignment guides in its own coordinate space.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ViewDimensions {

    /// The view's width
    public var width: CGFloat { get }

    /// The view's height
    public var height: CGFloat { get }

    /// Accesses the value of the given guide.
    public subscript(guide: HorizontalAlignment) -> CGFloat { get }

    /// Accesses the value of the given guide.
    public subscript(guide: VerticalAlignment) -> CGFloat { get }

    /// Returns the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? { get }

    /// Returns the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewDimensions : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool
}

/// A modifier that can be applied to a view or other view modifier,
/// producing a different version of the original value.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ViewModifier {

    /// The type of view representing the body of `Self`.
    associatedtype Body : View

    /// Returns the current body of `self`. `content` is a proxy for
    /// the view that will have the modifier represented by `Self`
    /// applied to it.
    func body(content: Self.Content) -> Self.Body

    /// The content view type passed to `body()`.
    typealias Content
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new version of the modifier that will apply the
    /// transaction mutation function `transform` to all transactions
    /// within the modifier.
    @inlinable public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier


    /// Returns a new version of the modifier that will apply
    /// `animation` to all animatable values within the modifier.
    @inlinable public func animation(_ animation: Animation?) -> some ViewModifier

}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier where Self.Body == Never {

    /// Returns the current body of `self`. `content` is a proxy for
    /// the view that will have the modifier represented by `Self`
    /// applied to it.
    public func body(content: Self.Content) -> Self.Body
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewModifier {

    /// Returns a new modifier that is the result of concatenating
    /// `self` with `modifier`.
    @inlinable public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T>
}

/// A view that overlays its children, aligning them in both axes.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ZStack<Content> : View where Content : View {

    @inlinable public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content)

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

/// Returns the result of executing `body` with `animation` installed
/// as the thread's current animation, by setting it as the animation
/// property of the thread's current transaction.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result

/// Returns the result of executing `body()` with `transaction`
/// installed as the thread's current transaction.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Optional : View where Wrapped : View {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Float : VectorArithmetic {

    /// Multiplies each component of `self` by the scalar `rhs`.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    public var magnitudeSquared: Double { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Double : VectorArithmetic {

    /// Multiplies each component of `self` by the scalar `rhs`.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    public var magnitudeSquared: Double { get }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGFloat : VectorArithmetic {

    /// Multiplies each component of `self` by the scalar `rhs`.
    public mutating func scale(by rhs: Double)

    /// Returns the dot-product of `self` with itself.
    public var magnitudeSquared: Double { get }
}

extension RangeReplaceableCollection where Self : MutableCollection {

    /// Removes all the elements at the specified offsets from the collection.
    ///
    /// - Complexity: O(*n*) where *n* is the length of the collection.
    public mutating func remove(atOffsets offsets: IndexSet)
}

extension MutableCollection {

    /// Moves all the elements at the specified offsets to the specified
    /// destination offset, preserving ordering.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    public mutating func move(fromOffsets source: IndexSet, toOffset destination: Int)
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGPoint {

    public func applying(_ m: ProjectionTransform) -> CGPoint
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Int {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Int8 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Int16 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Int32 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Int64 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UInt {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UInt8 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UInt16 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UInt32 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension UInt64 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Float {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Float80 {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Double {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGFloat {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never {

    /// The type of value produced by this gesture.
    public typealias Value = Never
}

extension NSView : CALayerDelegate {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = Never

    /// Declares the content and behavior of this view.
    public var body: Never { get }
}

/// Extends `T?` to conform to `Gesture` type if `T` also conforms to
/// `Gesture`. A nil value is mapped to an empty (i.e. failing)
/// gesture.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Optional : Gesture where Wrapped : Gesture {

    /// The type of value produced by this gesture.
    public typealias Value = Wrapped.Value
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never : View {
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGPoint : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to be animated.
    public var animatableData: CGPoint.AnimatableData
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGSize : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>

    /// The data to be animated.
    public var animatableData: CGSize.AnimatableData
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGRect : Animatable {

    /// The type defining the data to be animated.
    public typealias AnimatableData = AnimatablePair<CGPoint.AnimatableData, CGSize.AnimatableData>

    /// The data to be animated.
    public var animatableData: CGRect.AnimatableData
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Never : Gesture {
}

