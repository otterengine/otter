# Contributing to Otter

## Commit Message Guidelines

### Why Conventional Commits?

We use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) as
our commit message format.

Conventional commits help us:
- Automatically generate changelogs
- Manage semantic versioning
- Maintain a clear project history

### Commit Types

- `feat`: New features (MINOR version bump)
- `fix`: Bug fixes (PATCH version bump)
- `docs`: Documentation changes
- `style`: Code formatting
- `refactor`: Code restructuring
- `test`: Adding/modifying tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements
- `ci`: CI configuration changes
- `build`: Build system changes
- `revert`: Reverts a previous commit

### Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

### Examples

Good commit:
```
feat(renderer): add shader compilation cache

- Improves rendering performance
- Reduces startup time for complex scenes
```

Bad commit:
```
fixed some stuff
```

### Breaking Changes

Use `!` or footer to indicate breaking changes:
```
refactor(scene)!: completely redesign scene management

BREAKING CHANGE: Requires update to scene initialization
```

## Pull Request Process

1. Follow coding standards
2. Update documentation
3. PRs will only be merged if they pass CI, are approved by a maintainer, and use conventional commit messages.

## Recommended Tools

- [commitlint](https://commitlint.js.org/)
- [commitizen](https://commitizen.github.io/cz-cli/)
