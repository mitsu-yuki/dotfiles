return {
  "yetone/avante.nvim",
  cmd = { "AvanteAsk",
    "AvanteBuild",
    "AvanteChat",
    "AvanteEdit",
    "AvanteFocus",
    "AvanteRefresh",
    "AvanteSwitchProvider",
    "AvanteShowRepoMap",
    "AvanteToglle"
  },
  build = "make BUILD_FROM_SOURCE=true",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  enabled = function()
    local ollama_host = os.getenv("OLLAMA_HOST")
    if ollama_host ~= nil then
      return true
    else
      return false
    end
  end,
  config = function()
    local ollama_host = os.getenv("OLLAMA_HOST")
    require("avante").setup({
      provider = "ollama_qwen",
      auto_suggestions_provider = "ollama_qwen",
      vendors = {
        ["ollama_qwen"] = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = ollama_host .. "/v1",
          model = "qwen2.5-coder:latest",
          max_token = 65535,
        },
        ["ollama_marco"] = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = ollama_host .. "/v1",
          model = "marco-o1:latest",
          max_token = 65535,
        },
        ["ollama_deepseek"] = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = ollama_host .. "/v1",
          model = "deepseek-coder:6.7b",
          max_token = 65535,
        },
        ["ollama_gemma2"] = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = ollama_host .. "/v1",
          model = "gemma2:latest",
          max_token = 65535,
        },
      }
    })
  end
}
