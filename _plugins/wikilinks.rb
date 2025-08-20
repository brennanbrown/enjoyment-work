# Jekyll plugin to support Obsidian-style [[Wiki Links]] with optional aliases and header anchors.
# Examples:
#   [[My Note]]                -> [My Note](/notes/my-note)
#   [[My Note|Read this]]      -> [Read this](/notes/my-note)
#   [[My Note#Section]]        -> [My Note](/notes/my-note#section)
#   [[My Note#Section|Label]]  -> [Label](/notes/my-note#section)
#
# Resolution order (case-insensitive):
# - Exact title match (page.data['title'])
# - Basename (filename without extension)
# - Normalized slug variant
# Searches across notes, posts, and pages.

module Jekyll
  class WikiLinkGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Build an index of possible keys -> url
      index = {}

      # Helper to normalize strings into slugs
      normalize = lambda do |s|
        return nil if s.nil?
        s = s.to_s.downcase.strip
        # Replace spaces/underscores with hyphens
        s = s.gsub(/[\s_]+/, "-")
        # Remove characters that are not alphanumerics, dash or slash
        s = s.gsub(/[^a-z0-9\-\/]/, "")
        # Collapse multiple hyphens
        s = s.gsub(/\-+/, "-")
        s
      end

      # Index a Jekyll::Document or Jekyll::Page
      index_item = lambda do |doc|
        url = doc.url
        title = (doc.data && doc.data["title"]) || nil
        base = doc.respond_to?(:basename_without_ext) ? doc.basename_without_ext : File.basename(doc.path, File.extname(doc.path))

        keys = []
        keys << title if title
        keys << base if base
        keys << normalize.call(title) if title
        keys << normalize.call(base) if base
        keys.compact.uniq.each do |k|
          kstr = k.to_s
          next if kstr.empty?
          index[kstr.downcase] = url
        end
      end

      site.collections.each_value do |collection|
        collection.docs.each { |doc| index_item.call(doc) }
      end
      site.pages.each { |page| index_item.call(page) }

      # Function to build anchor fragments similar to kramdown's auto-ids
      build_anchor = lambda do |s|
        s = s.to_s.downcase.strip
        s = s.gsub(/[\s_]+/, "-")
        s = s.gsub(/[^a-z0-9\-]/, "")
        s = s.gsub(/\-+/, "-")
        s
      end

      wikilink_regex = /\[\[([^\]]+)\]\]/

      transformer = lambda do |content|
        content.gsub(wikilink_regex) do |m|
          inner = Regexp.last_match(1).strip
          target_and_label = inner.split('|', 2)
          target = target_and_label[0].strip
          label  = (target_and_label[1] || target).strip

          anchor = nil
          if target.include?('#')
            tparts = target.split('#', 2)
            target = tparts[0]
            anchor = build_anchor.call(tparts[1])
          end

          key = target.to_s
          norm_key = normalize.call(key)
          url = nil
          if norm_key && !norm_key.empty?
            url = index[norm_key.downcase]
          end
          url ||= index[key.downcase]

          if url
            fragment = anchor && anchor.length > 0 ? "##{anchor}" : ""
            "[#{label}](#{url}#{fragment})"
          else
            # Leave as-is if we can't resolve
            m
          end
        end
      end

      # Transform all documents' content
      site.collections.each_value do |collection|
        collection.docs.each do |doc|
          next unless doc.content
          doc.content = transformer.call(doc.content)
        end
      end
      site.pages.each do |page|
        next unless page.content
        page.content = transformer.call(page.content)
      end
    end
  end
end
