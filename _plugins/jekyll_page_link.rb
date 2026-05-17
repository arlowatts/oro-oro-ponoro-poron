module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end

        def render(context)
            site = context.registers[:site]
            pages = site.pages.select {|page| page.registers[:data]["title"] == @text}
            "[#{@text}](#{pages.first.path})"
        end

        Liquid::Template.register_tag("page_link", Jekyll::PageLink)

    end
end
