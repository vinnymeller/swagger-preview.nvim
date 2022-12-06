# swagger-preview.nvim

A neovim plugin to live-preview Swagger files.

## Installation

**Prerequisites**:

This plugin requires [swagger-ui-watcher](https://github.com/moon0326/swagger-ui-watcher) to be installed.


### packer.nvim

```lua

  use {
      "vinnymeller/swagger-preview.nvim",
      run = "npm install -g swagger-ui-watcher",
      config = function()
        require("swagger-preview").setup()
      end
  }
```

## Configuration

I've been quite lazy with the config options because I made this quickly for myself because the other preview plugin wasn't working for me.

```lua
require("swagger-preview").setup({
    -- The port to run the preview server on
    port = 8000,
    -- The host to run the preview server on
    host = "localhost",
})
```
