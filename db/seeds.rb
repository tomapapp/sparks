# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Category.destroy_all
Category.create([{ name: "Cinema" }, { name: "Restaurants" }, { name: "Bars" }, { name: "Museums" }, { name: "Art galleries" },  { name: "Theater" }, { name: "Outdoors" }])

Recommendation.destroy_all
puts 'Creating date recommendations...'

recommendation_attributes = [
  {
    name: "Get Reacquainted with Central Park",
    description: "More than 8.6 million people live in New York City, but it doesn't feel that way at this four-season—and free-to-enter—oasis in the middle of Manhattan. Measuring in at 840 acres, there's plenty of room to go around here, whether your idea of the perfect date is a picnic lunch on the Great Lawn, a paddle across Central Park Lake in a rowboat, or a visit to the Central Park Zoo.",
    location: "Central Park, New York, NY",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/6EFI6OJLS3p88uYpVavlMSdZ3M0=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/central-park-2027904_1280-61bbf428a5c84c98b2c7d059f53a5464.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Explore the MoMA",
    description: "For residents of New York state, admission at The Met is pay-as-you-wish, so you and your date can browse the storied museum's 5,000 years' worth of artwork and still have some cash left over to grab a quick bite at one of the museum's on-site eateries. MoMA, on the other hand, waives entry fees between 5:36 p.m. and 9 p.m. every Friday during UNIQLO Free Friday Nights, so plan your outing accordingly.",
    location: "11 W 53rd St, New York, NY 10019",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Museums").id,
    photolink: "https://www.mydomaine.com/thmb/s6Ujg3fG0eFmWeA53NyOIlUmHZ0=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/photo-1515204159654-2625784b406c-98aae864a7ed4034bd2163e4f5b5c0a6.jpeg",
    reviewcount: rand(50..500)
  },
  {
    name: "Explore the Met",
    description: "For residents of New York state, admission at The Met is pay-as-you-wish, so you and your date can browse the storied museum's 5,000 years' worth of artwork and still have some cash left over to grab a quick bite at one of the museum's on-site eateries. MoMA, on the other hand, waives entry fees between 5:36 p.m. and 9 p.m. every Friday during UNIQLO Free Friday Nights, so plan your outing accordingly.",
    location: "1000 5th Ave, New York, NY 10028",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Museums").id,
    photolink: "https://www.mydomaine.com/thmb/s6Ujg3fG0eFmWeA53NyOIlUmHZ0=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/photo-1515204159654-2625784b406c-98aae864a7ed4034bd2163e4f5b5c0a6.jpeg",
    reviewcount: rand(50..500)
  },
  {
    name: "Take a Sunset Stroll across the Brooklyn Bridge",
    description: "Whether you start at the Brooklyn or Manhattan side of the stone-and-steel bridge, you'll encounter an intoxicating panorama that really outdoes itself come nightfall. Plan your stroll around sunset to watch as the skyline is enveloped in golds and ambers before transforming into a glittering display of lights as the sun slips behind Manhattan.",
    location: "Brooklyn Bridge, New York, NY 10038",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/h8Qo7mmMFaigRABPdQA-RVQ-AX8=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Brooklyn-Bridge-at-Sunset_Philipp-Klinger-Moment-Getty-Images-56a5ee3c3df78cf7728aa069.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Explore the Hudson by Kayak",
    description: "With a mission of promoting public access to the water for all, Downtown Boathouse offers free kayaking between the months of May and October. Push off from the organization's locations on Pier 26 or Governor's Island for a 20-minute paddle through NYC waterways.",
    location: "61 Chelsea Piers, New York, NY 10011",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/mv6z5HeANJrwshUyFs9y8D8cMKw=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/nadim-merrikh-LJ36url5Z_U-unsplash-09fd8a726b2248859b3aa91e3766ccee.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Lace up Your Roller (Or Ice) Skates",
    description: "Relive a childhood pastime with a visit to Brooklyn Bridge Park's Pier 2 Roller Rink. In the shadows of the Brooklyn Bridge, the outdoor facility hosts regular public skate sessions that are either free or under $10, plus the cost of skate rentals. (Aim to show up on a Friday evening for DJ-led sessions.) When temperatures drop, swap your wheels for a blade and hit the ice skating rink at Central Park, the Bank of America Winter Village at Bryant Park, or, for a date experience that's quintessentially NYC, Rockefeller Center.",
    location: "150 Furman St, Brooklyn, NY 11201",
    rating: rand(36..50).to_f/10,
    price: 20,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/I0JgW_6oRTHLZkqMyq_OkUd63Lc=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-603739077-58d585845f9b5846833670b9.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Browse the Stalls at a Food Market, Festival, or Flea",
    description: "If you're not opposed to a daytime date, meet your S.O. at the Brooklyn Flea, Auqaduck Flea, Grand Bazaar NYC, or Chelsea Flea Market. Not only are these spots open year-round, their pay-as-you-go pay structure allows you to spend as much (or as little) and you want. Similarly, food halls and markets (think Smorgasbord or Essex Market) and city-sponsored festivals follow a no-purchase-necessary format. Bookmark the NYC Parks events calendar to stay informed about upcoming low-cost and free events.",
    location: "29 W 25th St, New York, NY 10010",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Art galleries").id,
    photolink: "https://www.mydomaine.com/thmb/JfjObMDs1BU2F9ebxrGIL0RqsZk=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/9WkKkZ_A-284281cf1b1242dc855981186d3d7ea5.jpeg",
    reviewcount: rand(50..500)
  },
  {
    name: "Beat Each Other's High Scores at an Arcade",
    description: "Give your date a glimpse of your competitive side by challenging him or her to a round of Skee-Ball, ping pong, pool, pinball, or an old-school video game. Spots like Two-Bit's Retro Arcade, Barcade, Full Circle Bar, and Fat Cat promise all of the above, plus brewskies and mixed drinks for the 21-and-up set.",
    location: "153 Essex St, New York, NY 10002",
    rating: rand(36..50).to_f/10,
    price: 36,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://www.mydomaine.com/thmb/IGmc1idkIVPlfA78V2meIFhHdd4=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/IMG_7926-d72683337f064d278645306c7cb9815e.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Take a Spin on a Carousel",
    description: "Channel your inner child with a ride on one of NYC's famous carousels, like the Central Park Carousel ($3.25/ride), The Battery's SeaGlass Carousel ($5/ride) or Hudson River Park’s Pier 62 Carousel ($3.50/ride). But if you have to choose just one, go with Jane's Carousel ($2/ride). Dating back to 1922, this historic, 48-horse carousel merges nostalgia with stunning views of the Manhattan skyline and the Brooklyn and Manhattan bridges.",
    location: "1802 E 65th St, New York, NY 10065",
    rating: rand(36..50).to_f/10,
    price: 5,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/CBgfdvb0_ph0UHaIpjDtV4NSZAw=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/20479723_1572247962819216_5231264461960939055_n-d2e60beeb3fb4aec8989eb2deeb71698.jpg",
    reviewcount: rand(50..500)
  },
{
    name: "Catch a Budget Flick",
    description: "New York has several independent movie theaters to choose from. Try catching a flick at Syndicated. This Brooklyn venue offers food, drinks, and movies—all under one roof. Grab a seat in the cozy theater-meets-restaurant to watch a second-run flick for just $7, then order from a menu of drinks and handheld eats to enjoy while you watch.",
    location: "40 Bogart St, Brooklyn, NY 11206",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Cinema").id,
    photolink: "https://www.mydomaine.com/thmb/hAHLosWGTqXDAhieJX5R5VkV4xY=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/myke-simon-atsUqIm3wxo-unsplash-dca2c0bbe6cb4672988b781aa46d5b16.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Ride the Staten Island Ferry",
    description: "Who says the Staten Island Ferry is just for tourists and school field trips? Add it to your date-night itinerary and take advantage of a free (and dare we say romantic) cruise between Whitehall in lower Manhattan and St. George on Staten Island (or vice-versa). Spend the 25-minute ride marveling at the city skyline and snapping selfies with the Statue of Liberty in the distance.",
    location: "4 South St, New York, NY 10004",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/GUfltJWXb3bcPg9gvhpxyY7KxAs=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-157331288-5c87c8144cedfd000190b21b.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Stroll across the High Line",
    description: "A stunning example of adaptive reuse, this defunct elevated rail line-turned-linear greenway hosts manicured gardens, soothing water features, scenic overlooks, and conversation-starting art installations along its 1.45-mile stretch—and it's free for all to enjoy. We recommend popping by Chelsea Market first for a grab-and-go bite to enjoy on the High Line's many benches and seating areas.",
    location: "High Line, New York, NY",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/p2qX2TluWEMQcUbiToz_WLVV9uk=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-617531678-5c87cb1f46e0fb00012c6764.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Take a Walk in the Brooklyn Botanic Garden",
    description: "A fantastic (and quiet) alternative to the classic weeknight drink, a walk through the Brooklyn Botanical Garden will give you a chance to chat with your date—without having to compete with the noise of a bar. Admission is reasonably priced at $15, but you can score free entry if you show up before noon on an in-season Friday (or any weekday during the winter).",
    location: "990 Washington Ave, Brooklyn, NY 11225",
    rating: rand(36..50).to_f/10,
    price: 15,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/43J-GRX_sc8Y-Kw_7Mk1Xhxul1w=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-95500378-56b8b84f3df78c0b1365ea7a.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Try a Cocktail-Making Class at Liquor Lab",
    description: "If you need some liquid courage to help you soldier through those awkward gaps in the conversation, take a cocktail-making class at Liquor Lab, which leads imbibing students in the creation of craft cocktails, from margaritas to iconic NYC drinks.",
    location: "138 Wooster St, New York, NY 10012",
    rating: rand(36..50).to_f/10,
    price: 50,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://www.mydomaine.com/thmb/-H9GdDZfZfbqtLYzzad5U4T7UzI=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-635173049-9e0aa089b54642c29ec59f3442607b64.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Spin Vinyl at Tokyo Record Bar",
    description: "Grab a drink and a bite to eat at Tokyo Record Bar, an izakaya and vinyl bar where you help make the playlist for the night—so you'll get to know (read: judge) your date's musical taste.",
    location: "127 MacDougal St, New York, NY 10012",
    rating: rand(36..50).to_f/10,
    price: 75,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://www.mydomaine.com/thmb/DEwHDS34ngPMyK-rSIIWN2HVXlU=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cdn.cliqueinc.com__cache__posts__261569__date-ideas-in-new-york-city-261569-1530048213407-image.700x0c-2604a972eaa44446a64a6111a9ea0116.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "See a Concert at Carnegie Hall",
    description: "Dinner and drinks are nice when you're on your second or third date, but a concert at Carnegie Hall is unexpected and something you frankly probably never do as a New Yorker. It's a surefire way to impress your date.",
    location: "881 7th Ave, New York, NY 10019",
    rating: rand(36..50).to_f/10,
    price: 125,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://www.mydomaine.com/thmb/fhRBBzb9ztDOgGgJNVfLvN8xMpo=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/carnegie-hall-at-night--150365226-593debd43df78c537b3746ed.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Explore a New Neighborhood",
    description: "Trying something new is one of the best ways to form a deeper connection with someone, so pick a neighborhood you've never been to, and go for an adventure. May we suggest Red Hook?",
    location: "Red Hook, Brooklyn, NY",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/sMGne9LTHYM2svH6mwwll-ZtqoU=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1168431166-ee893ac8ce5b42d083ae8bb1db7f6939.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Get Your Game on at Royal Palms",
    description: "Skip the local sports bar's pool table and try playing shuffleboard instead. Royal Palms in Brooklyn is a guaranteed good time—and it's way more fun than the bowling alleys at Chelsea Piers.",
    location: "514 Union St, Brooklyn, NY 11215",
    rating: rand(36..50).to_f/10,
    price: 50,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://www.mydomaine.com/thmb/V91e3RttMOiR0Rzqbwv0zEvRU24=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cdn.cliqueinc.com__cache__posts__261569__date-ideas-in-new-york-city-261569-1530048213084-image.700x0c-c77e140c03864161bd1d570cf8632e80.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "See a Comedy Show",
    description: "Sure, comedy shows are a bit of a NYC cliché, but they're also really fun. And while it can be awkward on a first date to get grilled by the comedian onstage at the Comedy Cellar, your visit is sure to be a memory in the making",
    location: "117 MacDougal St, New York, NY 10012",
    rating: rand(36..50).to_f/10,
    price: 75,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://www.mydomaine.com/thmb/BQ9xXJoCENLVG5tbzVRsAeu1ylo=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1186127120-f4a98b7209b04e1994c3954ca9e1fa31.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Try a New Fitness Class",
    description: "A date can be a great excuse to experiment with a new and novel exercise. Try Flatiron's Brrrn, where 50-minute fitness classes are held within a studio that's been chilled to a cool 50°F. You can even try the infrared sauna together afterward. Take advantage of first-time student discounts to save some money.",
    location: "107 W 20th St, New York, NY 10011",
    rating: rand(36..50).to_f/10,
    price: 40,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/v_3pezSK9RqYn4n8wWyjWk-8Igc=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cdn.cliqueinc.com__cache__posts__261569__date-ideas-in-new-york-city-261569-1530048214059-image.700x0c-96b351ce05cd4f7ca3c733d41d96c30a.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Take a Cooking Class at Eataly",
    description: "Cooking together is a great way to deepen a connection with someone new, but in tiny NYC apartments, it can be quite challenging. Why not take a cooking class instead? Eataly offers a great selection, from pasta-making to pizza workshops.",
    location: "200 5th Ave, New York, NY 10010",
    rating: rand(36..50).to_f/10,
    price: 45,
    category_id: Category.find_by(name: "Restaurants").id,
    photolink: "https://www.mydomaine.com/thmb/x7_5VqrnCDdFjdbplQvpr6dn6Ns=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-998426408-f618b5c5207f4136b183a601002738b3.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Go Glamping on Governors Island",
    description: "Collective Retreats is finally in NYC. Take a ferry to Governors Island, and spend a night glamping under the stars overlooking the Manhattan skyline.",
    location: "Governors Island, New York, NY",
    rating: rand(36..50).to_f/10,
    price: 150,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/sH6Zi7yVx6FD-hywUp8tcglkhTQ=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cdn.cliqueinc.com__cache__posts__261569__date-ideas-in-new-york-city-261569-1530048213876-image.700x0c-22c31cb7189d4b529baedd5dfd111402.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Take a Pottery Class in Brooklyn",
    description: "If you've fallen into a routine of going to the same restaurants or watching the same TV series each Monday night, switch it up with a pottery-making class at Choplet in Brooklyn. You'll channel your inner Demi Moore and Patrick Swayze.",
    location: "238 Grand St, Brooklyn, NY 11211",
    rating: rand(36..50).to_f/10,
    price: 360,
    category_id: Category.find_by(name: "Art galleries").id,
    photolink: "https://www.mydomaine.com/thmb/EWlluuG3-Vb8U1QMYIenW-rHujE=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-684068971-b5b2d796523c4f9fa8c085a124647c3c.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Tour the Galleries in Chelsea",
    description: "Chelsea is filled with incredible art galleries, but be honest: When was the last time you actually visited them? Walk around the various gallery spaces with your S.O. and pick imaginary art for your future home together.",
    location: "Chelsea, Manhattan, New York, NY",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Art galleries").id,
    photolink: "https://www.mydomaine.com/thmb/iXbC43vTKQVsYZV74Sghc8swOXw=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1073692184-8c5fa36756ac490ca8f627c372bcd592.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Treat Yourself at Ancient Aire Baths",
    description: "If you're feeling a little exhausted from a long day at work or have young children at home, treat yourself to a day at Ancient Aires Baths, where you get to just relax in a romantic candlelit environment.",
    location: "88 Franklin St, New York, NY 10013",
    rating: rand(36..50).to_f/10,
    price: 200,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://www.mydomaine.com/thmb/eLVGpTJa0kFL1lZYnGsdbwDIlEM=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cdn.cliqueinc.com__cache__posts__261569__date-ideas-in-new-york-city-261569-1530048212853-image.700x0c-05d26735d312459e9ca6efb736b4ac03.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Book a Private Karaoke Room",
    description: "Most New Yorkers love to karaoke, but when was the last time you actually went? Book a room at Sing Sing Karaoke in the East Village and let loose with your S.O.",
    location: "9 St Marks Pl, New York, NY 10003",
    rating: rand(36..50).to_f/10,
    price: 36,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://www.mydomaine.com/thmb/y9UG-b4V7dhqMLb2WnkOb4ySMWs=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/bruno-cervera-Gi6-m_t_W-E-unsplash-929ef0b2e8f34d1f9d05e48ab78eabaa.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Enjoy a Concert",
    description: "The most fun I’ve ever had on a date was when I was still in college and agreed to go to a piano violin concert with a Juilliard concert piano student. Classical music becomes a lot more exciting when the person next to you knows all the intricacies.",
    location: "155 W. 65th Street, New York, NY 10023",
    rating: rand(36..50).to_f/10,
    price: 100,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://www.mydomaine.com/thmb/NxbDyPz8Q-zZXPtOUlcnj_3hZo8=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1066842956-4c608d662e164754aeb3894161203e7d.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Feast at Minetta Tavern, then drink and sing at Marie’s Crisis Café",
    description: "A West Village institution with classy decor, Minetta Tavern serves up that famous burger that’s on your bucket list. After your splurge, turn things up a notch at Marie’s Crisis Café, the iconic piano bar down the street. You can listen to some show tunes and join in the singing once you’ve got a few drinks in you. Who knows, maybe you and your date will harmonize!",
    location: "113 MacDougal St, New York, NY 10012",
    rating: rand(36..50).to_f/10,
    price: 200,
    category_id: Category.find_by(name: "Restaurants").id,
    photolink: "https://media.timeout.com/images/105596618/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "See a burlesque show at the Slipper Room",
    description: "Drop your inhibitions at this seductive, throwback lounge. Cheeky performers will leave you and your date laughing, curious and maybe a bit aroused. From your table by the stage (the space is small enough that there’s not really a bad seat in the house) expect the unexpected as aerial performers, singers, comedians, dancers and sexily clad lads and laddies perform circus and sideshow tricks. You’ll be hard-pressed to find anything like it in the Lower East Side—or anywhere else.",
    location: "167 Orchard St, New York, NY 10002",
    rating: rand(36..50).to_f/10,
    price: 100,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://media.timeout.com/images/100598351/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Couple skate during Dreamland Roller Disco",
    description: "Dreamland Roller Disco provides a modern twist on a retro date. Besides, isn’t there something cute about falling on your butts together? What makes Dreamland special are its themed nights. February is chock-full of romantic rendezvous, such as the upcoming disco party I Feel Love on Valentine’s Day. ",
    location: "171 East Dr, Brooklyn, NY 11225",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/105596608/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Have a rooftop tipple at Gallow Green",
    description: "Many of the city’s various rooftop bars rely heavily on their views as the main selling point for their overpriced drinks. But atop Chelsea’s McKittrick Hotel (the home of the famed Sleep No More) is this highly conceptualized romantic garden party meets cocktail lounge.",
    location: "536 W 27th St, New York, NY 10001",
    rating: rand(36..50).to_f/10,
    price: 50,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/100512593/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Get cozy on the cheap at Porcelain",
    description: "The Austrian-inspired cuisine and lived-in but chic aesthetic make Porcelain a charming first-date option. The prices are refreshingly low, too, with plates in the $10 range. Grab a couple of big, plush chairs, then split brunch and a pastry or three. If that’s not as sweet as can be, we don’t know what is.",
    location: "880 Woodward Ave, Ridgewood, NY 11385",
    rating: rand(36..50).to_f/10,
    price: 36,
    category_id: Category.find_by(name: "Restaurants").id,
    photolink: "https://media.timeout.com/images/105551190/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Sharpen your skills at Kick Axe Throwing",
    description: "Craving an out-of-the-ordinary daytime date that doesn’t involve drinking the afternoon away? Kick Axe Throwing, in Gowanus is an urban adventure that's bound to make you look like a badass—plus, it opens at 11am during the week. Before chucking those hatchets, peruse the Runner & Stone café a few blocks away for a caffeine or pastry fix.",
    location: "622 Degraw St, Brooklyn, NY 11217",
    rating: rand(36..50).to_f/10,
    price: 50,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/105596623/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Trip out at VR World NYC",
    description: "New York is brimming with unique, exciting activities. But if you’re pining for something truly cutting-edge, explore another city—or another planet, for that matter—by bringing your date to VR World, a theme park that proffers 50 mind-bending interactive experiences.",
    location: "8 E 34th St, New York, NY 10016",
    rating: rand(36..50).to_f/10,
    price: 36,
    category_id: Category.find_by(name: "Museums").id,
    photolink: "https://media.timeout.com/images/105603590/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Stay for a while (or just a minute) at Pips",
    description: "Versatility is a key quality in a date spot: somewhere you want to stay but can still bolt if need be. If that’s what you’re seeking, get thee to Jared Braithwaite’s bar Pips, which sports an impressive wine selection alongside small plates inspired by coastal Italian cuisine. Plus, it’s right on Atlantic Avenue, so your subway escape-route options are plentiful.",
    location: "129 Atlantic Ave, Brooklyn, NY 11201",
    rating: rand(36..50).to_f/10,
    price: 75,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/105572114/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Feast and catch a flick at Nitehawk Cinema",
    description: "Why bother going to two separate places when you can combine this classic date at one fantastic eat-in cinema? Grab one of the luxurious, big comfy chairs and take advantage of the table with the seats. Chow down on tacos, burgers, charcuterie or small plates as you take in buzzworthy indie films and retro re-releases. And be sure to take advantage of the sweet cocktail and beer menu.",
    location: "136 Metropolitan Ave, Brooklyn, NY 11249",
    rating: rand(36..50).to_f/10,
    price: 40,
    category_id: Category.find_by(name: "Cinema").id,
    photolink: "https://media.timeout.com/images/103470192/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Have a great date in Times Square (really) at Bugis Street Brasserie",
    description: "No one foresees anything good (with the possible exception of a Broadway show) to come out of Times Square. But consider Bugis Street Brasserie’s laksa: Comprising rice vermicelli, shrimp, chicken, fish cake and bean sprouts, this super-spicy noodle soup is sure to heat up your night. Your date might give you some side-eye as they’re guided into a hotel lobby packed with tourists, but sometimes great things emerge from unexpected places.",
    location: "145 W 44th St, New York, NY 10036",
    rating: rand(36..50).to_f/10,
    price: 36,
    category_id: Category.find_by(name: "Restaurants").id,
    photolink: "https://media.timeout.com/images/105170201/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Hold hands in St. Luke in the Fields Gardens",
    description: "Broke, huh? Well, it sounds like you’re craving a space so bucolic, you love birds will forget it’s free of charge! Everyone appreciates a hidden urban oasis, and the St. Luke in the Fields Gardens—just off Hudson Street, between Barrow and Christopher Streets in the West Village—are up there with the best of them.",
    location: "485 Hudson St, New York, NY 10014",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/100521057/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Graphic Love Stories",
    description: "Nerd is the new cool and nothing says nerdtastic like a good comic book. Geeky sweethearts, make your way to Williamsburg's quaint comic book store, Desert Island. Discover each other's favorites or grab a copy of Smoke Signal, the shop's free weekly anthology.",
    location: "540 Metropolitan Ave, Brooklyn, NY 11211",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Art galleries").id,
    photolink: "https://media.timeout.com/images/103343783/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Laughs and views",
    description: "Start out an evening in LIC by sauntering through Gantry Plaza State Park, a waterfront respite that boasts a beautiful midtown-Manhattan backdrop. Next, head to double-tiered comedy venue The Creek and the Cave, which welcomes stand-ups (including occasional surprise bigwigs like Jerry Seinfeld), improv troupes and variety shows every night of the week, often for nada. Prove that you’re not that much of a Costanza by springing for some fish and pork tacos ($4–$6).",
    location: "10-93 Jackson Ave, Long Island City, NY 11101",
    rating: rand(36..50).to_f/10,
    price: 15,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://media.timeout.com/images/100476699/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Free gigs and high-end cocktails",
    description: "Wait until you’ve been out a few times and you’re ready to squeeze in nice and close before hitting the teeny back room of Pete’s Candy Store, which hosts no-cover shows by indie artists and acoustic troubadours every night of the week. Afterward, head around the corner to The Shanty, a naked brick-and-concrete bar attached to the New York Distilling Company that offers some pretty sweet happy hour specials.",
    location: "709 Lorimer St, Brooklyn, NY 11211",
    rating: rand(36..50).to_f/10,
    price: 20,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://media.timeout.com/images/100110243/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Hot-and-heavy at Alameda’s happy hour",
    description: "This Greenpoint bar knows how to set the mood with rustic wooden tables and romantic lighting without making you go, y’know, broke. Hell, you and your date can get a buzz and some grub for 11 or 12 bucks! You can’t go wrong with a classic beer and burger deal or something a little fancier like boquerones and Prosecco.",
    location: "195 Franklin St, Brooklyn, NY 11222",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/100744073/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Get your groove on at midnight",
    description: "No matter how tight your budget, you can still get loose on the dance floor at Park Slope's Union Hall. Free dance parties go down most Saturday nights, featuring DJs spinning old-school hip-hop crowd pleasers and heavy-hitters at midnight. Check out the drink specials and definitely split a basket of fries ($6) or an order of deviled eggs ($5)—served until midnight —before you hit the dance floor.",
    location: "702 Union St, Brooklyn, NY 11215",
    rating: rand(36..50).to_f/10,
    price: 20,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/100419399/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Dessert and mind-blowing nerdery",
    description: "It’s been scientifically proven that nothing in the known universe is more romantic than pie. At Gowanus go-to Four & Twenty Blackbirds, two slices of shop faves like salted apple caramel or grapefruit custard will run you $11.50. (Arrive early in the evening, as they tend to sell out.) Then, fill your head with, you know, actual scientifically proven knowledge at the Bell House’s monthly Secret Science Club event, where experts lecture on crazy-cool theories for free. Tip: Bring someone geeky to this, lest you seem…like a total geek.",
    location: "439 3rd Ave, Brooklyn, NY 11215",
    rating: rand(36..50).to_f/10,
    price: 15,
    category_id: Category.find_by(name: "Restaurants").id,
    photolink: "https://media.timeout.com/images/100298319/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Nature and history in the Bronx",
    description: "Seeing an outdoorsy guy or gal but don’t have the gas money to drive upstate? Fortunately, there’s ample natural beauty to explore in Van Cortlandt Park. The secluded banks of Van Cortlandt Lake (in the southwest region) are begging for a quiet but passionate make-out session. Post-smooching, stop by the Van Cortlandt House Museum ($5), just west of the lake. Its 1740s stone edifice hosted George Washington twice in the midst of the Revolutionary War, and the current interior features re-creations of furnishings favored by the abode’s namesake, the rich merchant and mayor Jacobus Van Cortlandt.",
    location: "6036 Broadway, Bronx, NY 10471",
    rating: rand(36..50).to_f/10,
    price: 10,
    category_id: Category.find_by(name: "Museums").id,
    photolink: "https://media.timeout.com/images/101484453/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "A cinematic shrine and plenty of Guinness",
    description: "Secure film-buff status by bringing your date to the Museum of the Moving Image on a Friday evening (4–8pm), when the admission fee is waived. Make sure to fool around at the permanent collection’s sound-editing, dubbing and stop-motion-animation stations before leaving. Afterward, drink your fill at the charming Irish joint Quays Pub (45-02 36th Ave at 45th St, Astoria, Queens; 718-204-8435) with rounds of Guinness ($5 to $6), poured just as they should be: in two steps, so that a perfect head peeks over the rim.",
    location: "3601 35th Ave, Astoria, NY 11106",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Museums").id,
    photolink: "https://media.timeout.com/images/102021703/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Experimental theater and suds",
    description: "Take that cute starving artist to The Chocolate Factory, which hosts cheap ($15 to $20) and free avant-garde theater, dance and performance art. If you opt for a gratis show, treat yourself to libations at the roomy craft-brew haven Alewife Queens and have a deep conversation about the meaning of the work you witnessed. Get more bang for your buck by splitting a growler of the 7.2 percent ABV Beerly Legal Saison, brewed specially for the owners by Captain Lawrence.",
    location: "5-49 49th Ave, Long Island City, NY 11101",
    rating: rand(36..50).to_f/10,
    price: 50,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://media.timeout.com/images/102021705/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Mansion Peeping and pub trivia",
    description: "Start off an evening in Yorkville with an amble through Carl Schurz Park. Make sure to swing by Bobby Wagner Walk, a grand promenade along the East River, and Gracie Mansion (at 88th Street), the latest home of Bill de Blasio and official residence of NYC mayors. Then, show off your intellectual prowess—or comical lack thereof—during Tuesday-night trivia at the Gael Pub. The fun battles are always jam-packed, feature six diverse categories and include prizes like a $50 bar tab. Not that you’ll need it to tip back a few: pitchers of beer are only $14.",
    location: "Carl Schurz Park, New York, NY 10028",
    rating: rand(36..50).to_f/10,
    price: 15,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/101484445/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
{
    name: "Brews, sweets and city views",
    description: "The inviting wood-paneling decor and dim lighting at Greenpoint drinking den TØRST make it a hot spot for old-timey romance. After sipping $6 drafts from local faves, head next door to Van Leeuwen Ice Cream for two small ginger, Earl Grey tea or other unconventionally flavored cones ($5.50 each). If the weather is nice, take your sugar rush to nearby McCarren Park, and sit on a bench facing the Empire State Building.",
    location: "615 Manhattan Ave, Brooklyn, NY 11222",
    rating: rand(36..50).to_f/10,
    price: 25,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/101417585/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Bucolic strolls and cheap-ass tacos",
    description: "If you’re looking to impress your companion by spouting off bits of horticultural expertise—hey, it might work—or if you’re just looking for a pretty spot in which to walk around and stare amorously into each other’s eyes, walk around the magnificent six acres that make up the Central Park Conservatory Garden. Once you’re done sniffing the magnolia and lilac trees, scoot over to El Paso Taqueria, where you can get two tasty tacos for $8.",
    location: "64 E 97th St, New York, NY 10029",
    rating: rand(36..50).to_f/10,
    price: 20,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/100724383/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Cans o’ beer and lush gardens",
    description: "Enjoy the city’s cheapest booze cruise and panoramic views of lower Manhattan aboard the Staten Island Ferry, where domestic cans are in the $5 range. Once ashore in Staten Island, take an eight-minute bus ride and tour the grand estates and lovely waterfront grounds of Snug Harbor Cultural Center and Botanical Garden, originally established as a retirement estate for sailors in 1801.",
    location: "1000 Richmond Terrace, Staten Island, NY 10301",
    rating: rand(36..50).to_f/10,
    price: 30,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/102797063/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Free laughs",
    description: "Want to know how to make your date fall madly in love with you? Make ‘em laugh! You might not have enough moolah to treat your honey to one of Bridget Everett's shows, but The Knitting Factory hosts a free comedy night every Sunday. The wildly popular show, originally created by the delightfully understated Hannibal Buress (Broad City's Lincoln), features the funniest pros and up-and-comers. Past guests include Dave Chappelle, Chris Rock and Method Man.",
    location: "361 Metropolitan Ave, Brooklyn, NY 11211",
    rating: rand(36..50).to_f/10,
    price: 0,
    category_id: Category.find_by(name: "Theater").id,
    photolink: "https://media.timeout.com/images/105325951/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Beer knowledge and tastings",
    description: "If you and your sweetheart are major beer enthusiasts, Brooklyn Brewery hosts an intimate tour (no more than 30 souls), where you can geek out and get an exclusive look around the joint. The informative guide not only gives you an in-depth history lesson about the brewery, but a four-beer tasting along the way. And you won’t walk away empty-handed either: all participants leave with a complimentary souvenir stemware glass, so you’ll have a little something to remember the date by (besides the hangover.)",
    location: "79 N 11th St, Brooklyn, NY 11249",
    rating: rand(36..50).to_f/10,
    price: 30,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/103382242/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Bowl some balls",
    description: "Are you ready to bowl with bae? (It’s not cheesy, it’s classic!) Bowlmor’s Midtown West location boasts 48 lanes divided among seven NYC-themed rooms: enter the Times Square of the 1960s through a naughty storefront, or warm up with your date by the cozy and romantic fireplaces in the Bethesda Fountain–inspired bowling suite. Every week there’s a pretty decent deal called “Monday Mayhem,” which includes unlimited bowling (plus shoe rental) and drink specials.",
    location: "222 W 44th St, New York, NY 10036",
    rating: rand(36..50).to_f/10,
    price: 45,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/100320789/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Jazz, table games and cheap drinks",
    description: "They don’t make ‘em like this any more. West Village hangout the Fat Cat is a basement bar and pool hall where the sofas are scruffy, but the drinks are cheap and the ambience is jovial. There’s live jazz every night, and it's only a $3 past 6pm. Challenge your boo to a playfully competitive game of shuffle board, ping-pong or scrabble. Bonus: drinks cost $3 to $9.",
    location: "75 Christopher St, New York, NY 10014",
    rating: rand(36..50).to_f/10,
    price: 30,
    category_id: Category.find_by(name: "Bars").id,
    photolink: "https://media.timeout.com/images/105050915/800/600/image.jpg",
    reviewcount: rand(50..500)
  },
  {
    name: "Fun by the beach",
    description: "On Wednesdays after 3pm, the New York Aquarium at Coney Island is pay what you wish. Ogle more than 300 marine species and cop a feel (of the fish, silly) at the outdoor touch pools filled with sea stars, turtles and more. Afterward, walk a few blocks to the Coney Island boardwalk to watch the sun go down—or (if you’re a risk taker) venture onto the beach itself, climb into a lifeguard chair and hold each other tenderly as you gaze out on the ocean.",
    location: "602 Surf Ave, Brooklyn, NY 11224",
    rating: rand(36..50).to_f/10,
    price: 5,
    category_id: Category.find_by(name: "Outdoors").id,
    photolink: "https://media.timeout.com/images/100773609/800/600/image.jpg",
    reviewcount: rand(50..500)
  }
]

recommendation_attributes.each do |h|
  h[:photolink_2] = recommendation_attributes.sample[:photolink]
  h[:photolink_3] = recommendation_attributes.sample[:photolink]
  h[:photolink_4] = recommendation_attributes.sample[:photolink]
end

Recommendation.create!(recommendation_attributes)

recommendations = Recommendation.all
recommendations.each do |recommendation|
  file = URI.open(recommendation.photolink)
  recommendation.photos.attach(io: file, filename: "#{recommendation.name}1.jpg", content_type: 'image/jpg')
  file_2 = URI.open(recommendation.photolink_2)
  recommendation.photos.attach(io: file_2, filename: "#{recommendation.name}2.jpg", content_type: 'image/jpg')
  file_3 = URI.open(recommendation.photolink_3)
  recommendation.photos.attach(io: file_3, filename: "#{recommendation.name}3.jpg", content_type: 'image/jpg')
  file_4 = URI.open(recommendation.photolink_4)
  recommendation.photos.attach(io: file_4, filename: "#{recommendation.name}4.jpg", content_type: 'image/jpg')
  recommendation.save!
end

puts 'Dates created!'
