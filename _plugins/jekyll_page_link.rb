module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.gsub(/\s+/, " ").strip
        end

        def render(context)
            site = context.registers[:site]
            page = context.registers[:page]

            match = site.pages.find {|element| element.data["title"] == @text}

            unless match
                raise "broken link \"#{@text}\" in #{page.url}"
            end

            if page.url.include?(match.url)
                raise "parent link \"#{@text}\" in #{page.url}"
            end

            "[#{@text}](#{site.baseurl}#{match.url})"
        end

        Liquid::Template.register_tag("a", Jekyll::PageLink)

    end
end
