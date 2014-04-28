require "redpygments/version"
require 'redcarpet'
require 'pygments.rb'

module Redpygments
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def self.parse_markdown(text)
    options = {fenced_code_blocks: true}
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, options)
    markdown.render text
  end

  def self.parse_slim(template, html, option={})
    Slim::Template.new(template, option).render{ html }
  end
end
