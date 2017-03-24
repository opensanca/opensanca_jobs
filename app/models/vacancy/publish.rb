class Vacancy::Publish
  def initialize(vacancy)
    @vacancy = vacancy
  end

  def publish
    @vacancy.save!
  end
end
