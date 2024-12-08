pub const Entity = packed struct(u64) {
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
