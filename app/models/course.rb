class Course < ActiveRecord::Base
	belongs_to :user

	validates :title, :presence => { :message => "Can't be blank" }
	validates :description, :presence => { :message => "Can't be blank" }
	validates :cost, :presence => { :message => "Can't be blank" } , :numericality => {:greater_than_or_equal_to => 0}

end
