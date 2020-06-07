module ApplicationHelper
    def get_youtube_id(url)
        id = ''
        url = url.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
        if url[2] != nil
          id = url[2].split(/[^0-9a-z_\-]/i)
          id = id[0];
        else
          id = url;
        end
        id
    end
end
