require("commit-buf").setup(
  {
    window = {
--[[        columns = { ]]
         --[[ [1] = { ]]
         --[[   "commit_buf", ]]
         --[[   "git_show_head", ]]
         --[[ }, ]]
         --[[ [2] = { ]]
         --[[   "git_staged_file_list", ]]
         --[[   "git_diff_staged", ]]
         --[[ }, ]]
       --[[ }, ]]
      min_height = 12,
      min_width = 70,
    },
    verbose = true,
  }
)
