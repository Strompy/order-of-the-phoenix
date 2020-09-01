class PotterService
  def self.search(house)
    members = get_json("characters?orderOfThePhoenix=true&house=#{house}")
    members.map do |member|
      Character.create(name: member[:name], house: member[:house], role: member[:role], patronus: member[:patronus])
    end
  end

  private

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.potterapi.com/v1') do |faraday|
      faraday.params[:key] = ENV['POTTER_API_KEY']
    end
  end

end
