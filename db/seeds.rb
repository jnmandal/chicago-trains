# example data for dev env
lines     = %w[El Metra Amtrak Trolley]
operators = %w[SJones MJackson SCastro LBeck KYoon RKanwar MHare]
routes    = {
  el:      ["Brown Line", "Red Line", "Blue Line", "Pink Line"],
  metra:   ["UPN", "Oak Park", "Skokie", "Gary"],
  amtrak:  ["Hiawatha", "Indianapolis", "St. Louis", "Detroit"],
  trolley: ["Willis Tower", "House of Blues", "Thalia Hall"]
}

25.times do
  t = Train.create!(line: lines.sample, operator:  operators.sample)
  t.route = routes[t.line.downcase.to_sym].sample
  t.run = t.line[0] + rand(99..999).to_s
  t.save!
end