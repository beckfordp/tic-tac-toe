options = ["--ghc-options=-ignore-dot-ghci -DTEST"]

notification :growl, sticky: false
guard :haskell, all_on_start: true, all_on_pass: true, repl_options: [] do
    watch(%r{test/.+Spec\.l?hs$})
    watch(%r{src/.+\.l?hs$})
  notification :growl
end

