require "redpygments/version"
require 'redcarpet'
require 'pygments.rb'

require 'sass'

module Redpygments
  class HTMLRender < Redcarpet::Render::HTML
    def paragraph(text)
      definition_list = /([^\n]*)\n:\s+([^\n]*(\n\s+([^\n]*))*)\n?/m
      if definition_list
        %Q{<dl>#{
          text.gsub(definition_list) do |m|
            %Q(<dt>#{$1}</dt><dd>#{$2}</dd>)
          end
          }<dl>}
      else
        %Q(<p>#{text}</p>)
      end
    end

    def list_item(text, list_type)
      "<li>#{
        text.gsub(/^\[(x| )\]/) do |m|
          "<input type=\"checkbox\"#{$1 == 'x' ? " checked" : ""} disabled>"
        end
        }</li>"
    end

    def block_code(code, language)
      language ||= "text"
      Pygments.highlight(code, lexer: language)
    end
  end

  def self.parse_markdown(text)
    options = {fenced_code_blocks: true}
    markdown = Redcarpet::Markdown.new(HTMLRender, options)
    markdown.render text
  end

  def self.parse_slim(template, html, option={})
    Slim::Template.new(template, option).render{ html }
  end

  def self.default_template()
    File.expand_path('../../template', __FILE__) + "/default.slim"
  end
end
