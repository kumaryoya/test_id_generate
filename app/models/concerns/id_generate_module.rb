module IdGenerateModule
  extend ActiveSupport::Concern

  included do
    before_create :generate, if: -> { has_attribute?(:id) }
  end

  def generate
    self.id ||= loop do
      id = SecureRandom.hex(5)
      break id unless self.class.exists?(id: id)
    end
  end
end
