return {
  "RRethy/vim-illuminate",
  event = {"CursorHold", "CursorHoldI"},
  opts = {
    delay = 500
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end
}
