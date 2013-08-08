#= require 'syntax_highlighter/shCore.js'
#= require 'syntax_highlighter/shBrushDiff.js'
#= require 'syntax_highlighter/shBrushPlain.js'
#= require 'syntax_highlighter/shBrushRuby'
#= require 'syntax_highlighter/shBrushBash.js'
#= require 'syntax_highlighter/shBrushCss.js'
#= require 'syntax_highlighter/shBrushSass.js'
#= require 'syntax_highlighter/shBrushJScript.js'
#= require 'syntax_highlighter/shBrushXml.js'
#= require 'syntax_highlighter/shBrushVimscript.js'

$ ->
  SyntaxHighlighter.defaults["toolbar"] = false
  SyntaxHighlighter.all()
