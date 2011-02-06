# A hack to convert outputs into Shif_JIS on the Rails console.
# Special thanks to TOBY SOFT wiki:
#   http://tobysoft.net/wiki/index.php?Ruby%2Fautotest%2FWindows%A4%C7UTF-8%C9%BD%BC%A8
if Bundler::WINDOWS
  require 'nkf'

  class << $stdout
    def write_with_conversion(str)
      write_without_conversion NKF.nkf('-sxm0', str.to_s)
    end
    alias_method_chain :write, :conversion
  end
end
