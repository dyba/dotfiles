IEx.configure(
  colors: [
    syntax_colors: [
      number: :yellow,
      atom: :cyan,
      string: :green,
      boolean: [:blue],
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
    eval_result: [:cyan, :bright]
  ],
  default_prompt: [
    "\e[G",
    :light_magenta,
    "🧪 iex",
    " >",
    :white,
    :reset
  ]
  |> IO.ANSI.format()
  |> IO.chardata_to_string()
)
