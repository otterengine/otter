// Copyright (c) 2024 Otter Engine Contributors
// Licensed under either of:
//   * MIT License (https://opensource.org/licenses/MIT)
//   * Apache License, Version 2.0 (https://www.apache.org/licenses/LICENSE-2.0)
// at your option.

pub const Entity = packed struct(u64) {
    // TODO: Use https://github.com/ziglang/zig/issues/3806 if/when it's
    // implemented, as it could greatly enhance ergonomics here.
    pub const invalid = Entity{ .id = 0 };

    id: u32,
    generation: u32 = 0,

    pub fn nextGeneration(self: Entity) Entity {
        return Entity{
            .id = self.id,
            .generation = self.generation + 1,
        };
    }
};
