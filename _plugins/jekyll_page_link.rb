module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end

        def render(context)
            site = context.registers[:site]
            pages = site.pages.select {|page| page.data["title"] == @text}
            "[#{@text}](#{site.baseurl}#{pages.first.url})"
        end

        Liquid::Template.register_tag("a", Jekyll::PageLink)

    end
end
