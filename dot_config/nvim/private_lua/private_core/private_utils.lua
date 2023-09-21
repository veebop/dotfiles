return {
  -- string padding (I stole this code hehe https://github.com/sho-87/dotfiles/blob/master/nvim/lua/utils.lua
  pad_string = function(str, len, align, num_nerd_font)
    -- Lua doesn't handle nerd font characters well, so we have to manually remove extra counted characters
    local str_len = #str - ((num_nerd_font or 0) * 2)
    if str_len >= len then
      return str
    end

    local pad_len = len - str_len
    local pad = string.rep(" ", pad_len)

    if align == "left" then
      return str .. pad
    elseif align == "right" then
      return pad .. str
    elseif align == "center" then
      local left_pad = math.floor(pad_len / 2)
      local right_pad = pad_len - left_pad
      return string.rep(" ", left_pad) .. str .. string.rep(" ", right_pad)
    end
  end
}
