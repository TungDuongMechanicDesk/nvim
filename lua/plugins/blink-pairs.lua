return {
  'saghen/blink.pairs',
  dependencies = 'saghen/blink.download',
  version = 'v0.5.0',

  opts = {
    mappings = {
      enabled = true,
      cmdline = true,
      disabled_filetypes = {},
      wrap = {
        ['<C-b>'] = 'motion',
        ['<C-S-b>'] = 'motion_reverse',
      },
      pairs = {},
    },
    highlights = {
      enabled = true,
      cmdline = true,
      groups = { 'BlinkPairsOrange', 'BlinkPairsPurple', 'BlinkPairsBlue' },
      unmatched_group = 'BlinkPairsUnmatched',

      matchparen = {
        enabled = true,
        cmdline = false,
        include_surrounding = false,
        group = 'BlinkPairsMatchParen',
        priority = 250,
      },
    },
    debug = false,
  }
}
