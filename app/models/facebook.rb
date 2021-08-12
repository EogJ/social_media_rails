class Facebook
  def self.wrap_from_json(attrs)
    attrs.map do |t|
      new(name: t.fetch("name"), status: t.fetch("status"))
    end
  end

  attr_reader :name, :status

  def initialize(name:, status:)
    @name = name
    @status = status
  end
end
