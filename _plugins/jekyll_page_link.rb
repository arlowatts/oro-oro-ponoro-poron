module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end

        def render(context)
            pages = context.registers[:site].pages.select {|page| page.title == @text}
            "[#{@text}](#{pages.first.url})"
        end

        Liquid::Template.register_tag("page_link", Jekyll::PageLink)

    end
end
