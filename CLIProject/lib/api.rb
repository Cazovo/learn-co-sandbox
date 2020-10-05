class API
    @@url = "https://cdn.animenewsnetwork.com/encyclopedia/api.xml?"
    @@urlmostrecent = 'https://cdn.animenewsnetwork.com/encyclopedia/reports.xml?id='

    def most_recent(choice)
        
        s = Net::HTTP.get_response(URI.parse(@@urlmostrecent + choice)).body
        json = Hash.from_xml(s).to_json

        data = JSON.parse(json)
        return data
    end    
    def get_anime_info_by_name(choice)
        s = Net::HTTP.get_response(URI.parse(@@url + "anime=" + "~" + choice)).body
        json = Hash.from_xml(s).to_json

        data = JSON.parse(json)
        return data
    end    
end