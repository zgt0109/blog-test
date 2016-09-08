module UsersHelper
	def find_all_doctor(user)
		user.doctors.map(&:name)
	end
end
