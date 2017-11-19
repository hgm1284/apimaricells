class Session < ApplicationRecord
	def update  #Le falta.
  
    if self.expires_at > Date.today

      self.expires_at = Time.now + 30.minutes
      self.save
    else
      false
    end
    end
      serialize :data, Array

end
