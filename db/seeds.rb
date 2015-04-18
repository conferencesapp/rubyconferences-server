conferences = [
  {
    name: "JRubyConf EU",
    location: "Potsdam, Germany",
    twitter_username: "jrubyconfeu",
    image_url: "https://pbs.twimg.com/profile_images/3495510306/c7112b8467087af09d3061e4575ac36b_400x400.png",
    start_date: Date.parse("July 31, 2015"),
    end_date: Date.parse("July 31, 2015")
  },
  {
    name: "Brighton Ruby",
    location: "Brighton, UK",
    twitter_username: "brightonruby",
    image_url: "https://pbs.twimg.com/profile_images/430399697090387968/ERkMia_c_400x400.png",
    start_date: Date.parse("July 20, 2015"),
    end_date: Date.parse("July 20, 2015")
  },
  {
    name: "Gotham Ruby Conference",
    location: "New York, NY",
    twitter_username: "goruco",
    image_url: "https://pbs.twimg.com/profile_images/64991940/logo_400x400.png",
    start_date: Date.parse("June 20"),
    end_date: Date.parse("June 20")
  },
  {
    name: "RubyNation",
    location: "Washington, DC",
    twitter_username: "rubynation",
    image_url: "https://pbs.twimg.com/profile_images/565325260547833856/TsQqkrwY_400x400.png",
    start_date: Date.parse("June 12"),
    end_date: Date.parse("June 13")
  },
  {
    name: "RedDotRubyConf",
    location: "Singapore",
    twitter_username: "reddotrubyconf",
    image_url: "https://pbs.twimg.com/profile_images/3261940620/0a27e2dfbd04ac82ccde7502b9b3d16d_400x400.png",
    start_date: Date.parse("June 4"),
    end_date: Date.parse("June 5")
  },
  {
    name: "Ruby Conference Kiev",
    location: "Kiev, Ukraine",
    twitter_username: "rubyc_eu",
    image_url: "https://pbs.twimg.com/profile_images/517668915854319616/2seWeRRJ.png",
    start_date: Date.parse("May 30"),
    end_date: Date.parse("May 31")
  },
  {
    name: "RubyConf Kenya",
    location: "Nairobi, Kenya",
    twitter_username: "nairubyke",
    image_url: "https://pbs.twimg.com/profile_images/459584639523241985/wuuZhm6Y_400x400.png",
    start_date: Date.parse("May 8"),
    end_date: Date.parse("May 9")
  },
  {
    name: "ROSSConf Vienna",
    location: "Vienna, Austria",
    twitter_username: "rossconf",
    image_url: "https://pbs.twimg.com/profile_images/529674584841134080/imnkYmgX_400x400.png",
    start_date: Date.parse("April 25"),
    end_date: Date.parse("April 25")
  },
  {
    name: "RailsConf",
    location: "Atlanta, GA",
    twitter_username: "railsconf",
    image_url: "https://pbs.twimg.com/profile_images/555794992384327680/l6g_DE69.jpeg",
    start_date: Date.parse("April 21"),
    end_date: Date.parse("April 23")
  }
]

Conference.delete_all

conferences.each do |conference|
  Conference.create!(conference)
end
