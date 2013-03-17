require 'feedzirra'

class Tasks::FetchFeedTask
  def self.test

    Feed.all.each do |feed|

      if false && feed.last_modified != nil
        parsedFeed = Feedzirra::Feed.fetch_and_parse feed.feed_url, :if_modified_since => feed.last_modified
      else
        parsedFeed = Feedzirra::Feed.fetch_and_parse feed.feed_url
      end

      if !parsedFeed || parsedFeed.instance_of?(Fixnum)
        p 'Skipped '+feed.feed_url
        p parsedFeed
        next
      end

      # Get latest entry
      latest_entry = Entry.where(:feed_id => feed.id).order('created_at DESC').first

      # Take updated entries
      if latest_entry != nil
        updatedEntries = parsedFeed.entries.take_while {|e| e.entry_id != latest_entry.url}
      else
        updatedEntries = parsedFeed.entries
      end

      # Save entries
      updatedEntries.reverse.each do |feed_entry|

        p 'Add => ' + feed_entry.url

        entry = Entry.new({
          :title        => feed_entry.title,
          :url          => feed_entry.url,
          :summary      => (feed_entry.summary || feed_entry.content).gsub(/<.+?>/m, '').slice(0, 255),
          :published_at => feed_entry.published,
          :feed_id      => feed.id
        })
        entry.save
      end

      # Update feed meta data
      feed.title = parsedFeed.title
      feed.last_modified = parsedFeed.last_modified
      feed.save
    end

  end
end
