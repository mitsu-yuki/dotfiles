-- 設定を作成するための関数
local set_indent = function(filetype, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      for k, v in pairs(opts) do
        vim.bo[k] = v
      end
    end,
  })
end

-- JavaScript, TypeScript (2スペース)
set_indent({ "javascript", "typescript" }, {
  expandtab = true, -- タブをスペースに変換
  shiftwidth = 2,   -- インデント幅
  tabstop = 2,      -- タブ幅
})

-- Go (タブ)
set_indent("go", {
  expandtab = false, -- タブを使用
  shiftwidth = 4,    -- インデント幅
  tabstop = 4,       -- タブ幅
})

-- C (4スペース)
set_indent("c", {
  expandtab = true, -- タブをスペースに変換
  shiftwidth = 4,   -- インデント幅
  tabstop = 4,      -- タブ幅
})

-- Python (4スペース)
set_indent("python", {
  expandtab = true, -- タブをスペースに変換
  shiftwidth = 4,   -- インデント幅
  tabstop = 4,      -- タブ幅
})

-- Makefile (タブ)
set_indent("make", {
  expandtab = false, -- タブを使用
  shiftwidth = 8,    -- インデント幅
  tabstop = 8,       -- タブ幅
})

-- Bash (2スペース)
set_indent("sh", {
  expandtab = true, -- タブをスペースに変換
  shiftwidth = 2,   -- インデント幅
  tabstop = 2,      -- タブ幅
})
