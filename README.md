# swagger-preview.nvim

A neovim plugin to live-preview Swagger files.

## Installation

**Prerequisites**:

This plugin requires [swagger-ui-watcher](https://github.com/moon0326/swagger-ui-watcher) to be installed. The default `packer.nvim` configuration will automatically install it globally.


### packer.nvim

```lua

  use {
      "vinnymeller/swagger-preview.nvim",
      run = "npm install -g swagger-ui-watcher",
  }
```

## Usage

Comes with 3 commands, intended to be run from the buffer containing your Swagger file.

- `:SwaggerPreview` - starts a new preview, killing any preexisting server
- `:SwaggerPreviewStop` - stops the curent server
- `:SwaggerPreviewToggle` - turns preview on if it was off, kills it if it was on

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

## Contributing

This plugin does almost nothing so I don't care about style or whatever. If somebody comes across this and you need more customization, make a PR and I'll merge it as long as a) it doesnt break my defaults and b) it isn't trolling 😄 
