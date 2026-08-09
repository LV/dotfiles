# Dotfile Profiles

- `shared/`: configuration used everywhere
- `platforms/`: OS- or desktop-specific configuration
- `hosts/`: configuration for one machine, composed from the other layers

Profiles support two directives:

```text
include shared/base
link config/nvim .config/nvim
```

Sources are relative to the repository; targets are relative to `$HOME`.
Nothing is linked unless a profile explicitly includes it.
