/// An `Entity` is any "thing" that exists in the world.
///
/// For most users of the ECS, this should be treated as an opaque identifier
/// that shouldn't be modified.
///
/// Each `Entity` has an `id` and a `generation`.
///
/// The `Entity` struct is packed to ensure it gets treated the same
/// as a `u64` in memory. This can increase performance on some platforms.
pub const Entity = packed struct(u64) {
    /// An `Entity` with an `id` of 0 is invalid,
    /// regardless of the generation. This is used to make
    /// it easy to check if an `Entity` is valid without optionals
    /// that would use more memory.
    // TODO: Use https://github.com/ziglang/zig/issues/3806 if/when it's
    // implemented, as it could greatly enhance ergonomics here.
    pub const invalid = Entity{ .id = 0 };

    /// The unique `id` of the `Entity`. This is only unique on
    /// a per-world basis.
    id: u32,

    /// The `generation` of the `Entity`. This is incremented
    /// every time the `Entity` is re-used.
    generation: u32 = 0,

    /// Returns the same `Entity` but with the `generation` incremented.
    pub fn nextGeneration(self: Entity) Entity {
        return Entity{
            .id = self.id,
            .generation = self.generation + 1,
        };
    }
};
