//! Otter uses the increasinly popular ECS pattern for managing the game world.
//! This design has various advantages, such as amazing modularity and composability.
//! As well as amazing cache-locality if implemented properly.
//! Which should allow for great performance on most systems.

/// An `Entity` is an opaque identifier for any "thing" in the game.
/// Generally, we organize `Entity`s into three categories:
///
/// - Plain `Entity`: purely a container for other `Entity`s.
/// - Component `Entity`: has some associated data, can be added to another `Entity`.
/// - System `Entity`: contains logic for modifying other `Entity`s.
///
/// Because there is no hard seperation between `Entity`s, components and systems,
/// they can often be used interchangeably. Where you would usually only add a component `Entity` to
/// an `Entity`, you can also add a plain `Entity`. This is often called a "tag" (a data-less component).
/// On top of that, systems can contain components, and can be created and deleted dynamically.
pub const Entity = packed struct(u64) {
    /// The type of the `id` part of an `Entity`.
    /// One value is reserved to indicate an invalid `Entity`,
    /// this is to prevent any memory overhead from using `?Entity`.
    pub const Id = enum(u32) {
        /// The only invalid value of an `Id`.
        invalid,
        /// A catch-all variant for all valid values of an `Id`.
        _,

        /// Create an `Id` from a raw `u32`.
        pub fn init(id: u32) Id {
            return @enumFromInt(id);
        }

        /// Get the raw integer value from this `Id`, if valid.
        pub fn get(self: Id) ?u32 {
            return switch (self) {
                .invalid => null,
                _ => @intFromEnum(self),
            };
        }
    };

    /// The `Id` of this `Entity`. This is unique on a per-world basis.
    id: Id = .invalid,
    /// The generation of this `Entity`. This gets incremented every time the `id` gets re-used.
    generation: u32 = 0,
};

const testing = @import("std").testing;

test "Entity Id get" {
    const e: Entity = .{};
    const e2: Entity = .{ .id = .init(123) };

    try testing.expectEqual(null, e.id.get());
    try testing.expectEqual(123, e2.id.get());
}
