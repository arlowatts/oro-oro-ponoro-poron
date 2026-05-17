module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text
        end

        def render(context)
            "[#{@text}](arlowatts.com)"
        end

        Liquid::Template.register_tag("page_link", Jekyll::PageLink)

    end
end
