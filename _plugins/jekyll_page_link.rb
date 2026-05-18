module Jekyll
    class PageLink < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.gsub(/\s+/, " ").strip
        end

        def render(context)
            site = context.registers[:site]
            url = context.registers[:page]["url"]

            match = site.pages.find {|page| page.data["title"] == @text}

            unless match
                raise "broken link \"#{@text}\""
            end

            if url.include?(match.url)
                raise "parent link \"#{@text}\""
            end

            "[#{@text}](#{site.baseurl}#{match.url})"
        end

        Liquid::Template.register_tag("a", Jekyll::PageLink)

    end
end
