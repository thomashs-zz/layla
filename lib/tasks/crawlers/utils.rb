module Utils

  def parse_cookies text
    cookies = {}
    cookies_list = text.split(";").map{|i| i.strip.split("=")}
    cookies_list.each {|c| cookies[c[0]] = c[1]}
    cookies
  end

  def fetch_url raw_url
    url = URI.parse(raw_url)
    Net::HTTP.start(url.host, url.port) {|http|
      http.get(raw_url)
    }
  end

  def follow_redirects raw_url
    url = raw_url
    res = fetch_url raw_url
    while res.code != "200"
      raise IOError, "#{res.code} - #{raw_url} (#{url})" if res.code != "302"
      url = res['location']
      puts "Fetching: #{url}"
      res = fetch_url url
    end
    url
  end

end
