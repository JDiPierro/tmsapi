FactoryGirl.define do
  factory :program, class: TMSAPI::Model::Program do
    tms_id              "SH014122930000"
    root_id             "8648428"
    series_id           "8648428"
    title               "The Amazing World of Gumball"
    title_lang          "en"
    long_description    "No, this animated series is not about anthropomorphic chewing gum, it's about a young cat named Gumball Watterson. Gumball has a penchant for getting into trouble, often resulting from schemes he comes up with, but he never seems to learn his lesson. Gumball's best friend is a fish named Darwin, who used to be the family pet until he grew legs and became part of the family. Gumball resents his younger sister, Anais, because she is the smartest member of the family. Gumball's mother is the breadwinner in the family, working long hours at the rainbow factory, and his father stays at home watching TV and playing video games."
    description_lang    "en"
    genres              ["Children", "Comedy", "Animated"]
    preferred_image     { build(:image) }
    ratings             { build_list(:rating, 3) }
    recommendations     { build_list(:recommendation, 2) }
    cast                { build_list(:person, 4) }
    orig_air_date       "2011-05-03"
    sub_type            "Series"
    total_seasons       1
    total_episodes      485
    entity_type         "Show"
    
  end
  
  factory :rating, class: TMSAPI::Model::Rating do
    sequence(:body) { |n| "Rating Body #{n}" }
    sequence(:code) { |n| "Rating #{n}" }
  end
  
  factory :recommendation, class: TMSAPI::Model::Recommendation do
    sequence(:tms_id) { |n| "SH01362768000#{n}" }
    sequence(:root_id) { |n| "843663#{n}" }
    title               "The Fairly OddParents"
  end
  
  factory :person, class: TMSAPI::Model::Person do
    sequence(:person_id) { |n| "62332#{n}" }
    sequence(:name_id) { |n| "15682#{n}" }
    name                "Logan Grove"
    role                "Voice"
    character_name      "Gumball Watterson"
    sequence(:billing_order) { |n| "#{n}" }
  end
  
  factory :image, class: TMSAPI::Model::Image do
    uri                 "http://demo.tmsimg.com/assets/p8648428_b_v5_aa.jpg"
    height              360
    width               240
    primary             true
    category            "Banner-L1"
    tier                "Series"
  end
  
end