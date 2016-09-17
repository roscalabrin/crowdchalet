class Seed
  def self.start
    create_users
    create_searching_groups
    create_users_groups
  end
  
  def self.create_users
    100.times do |i|
      User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        image: Faker::Placeholdit.image("50x50")
      )
    end  
  end
  
  def self.create_searching_groups
    12.times do |i|
      group_leader = User.offset(rand(User.count)).first.id
      budgets = [200, 250, 300, 350, 400, 450, 500, 550, 600]
      locations = ["Vail, CO", "Frisco, CO", "Breckenridge, CO"]
      SearchingGroup.create(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph(1),
        location: locations.sample,
        max_number_of_people: rand(4..16),
        max_budget_per_month:budgets.sample,
        group_leader: group_leader
      )
    end
  end
  
  def self.create_users_groups
    SearchingGroup.all.each do |group|
      UsersGroup.create(
        user_id: group.group_leader,
        searching_group_id: group.id
      )
    end
  end
end

Seed.start