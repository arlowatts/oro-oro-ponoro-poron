module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end

        def render(context)
            "[#{@text}](#{@text})"
        end

    Liquid::Template.register_tag("page_link", Jekyll::PageLink)

    end
end
