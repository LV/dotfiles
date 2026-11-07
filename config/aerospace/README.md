# Aerospace Dotfile Configuration
My dotfile configuration for Aerospace MacOS tiling manager

## Finding an App ID
The app must be open for it to show up.
```console
lvictoria7@FY1V4T0VFJ ~ $ aerospace list-apps | grep "Wispr Flow"
84335 | com.electron.wispr-flow | Wispr Flow
```

## Unbinding a key
Say that you want to reserve the `alt-v` keybinding for a separate program. To disable it from being used by MacOS, simply add the following to `aerospace.toml`:
```toml
alt-v = 'exec-and-forget /usr/bin/true'  # disable to bind for some app
```
