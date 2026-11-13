# Ghostty

| File     | Linked to                  | On            |
|----------|----------------------------|---------------|
| `common` | `~/.config/ghostty/common` | every machine |
| `darwin` | `~/.config/ghostty/config` | macOS         |
| `linux`  | `~/.config/ghostty/config` | Linux         |

Ghostty reads `~/.config/ghostty/config`. Each platform file starts with
`config-file = common`, which loads the shared settings next to it.
