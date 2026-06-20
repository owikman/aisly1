-- Demo stores for Aisly
-- Run this in Supabase → SQL Editor
-- It automatically uses your account as the owner

DO $$
DECLARE
  v_owner uuid;

  -- Store IDs
  v_s1 uuid;
  v_s2 uuid;
  v_s3 uuid;

  -- Sunrise Supermarket aisles
  s1_produce uuid; s1_bakery uuid; s1_dairy uuid; s1_meat uuid;
  s1_frozen uuid; s1_snacks uuid; s1_drinks uuid; s1_breakfast uuid;
  s1_tinned uuid; s1_cleaning uuid; s1_health uuid;

  -- TechZone Electronics aisles
  s2_phones uuid; s2_laptops uuid; s2_tv uuid; s2_audio uuid;
  s2_gaming uuid; s2_cameras uuid; s2_cables uuid; s2_smart uuid;

  -- City Pharmacy aisles
  s3_prescriptions uuid; s3_vitamins uuid; s3_skincare uuid;
  s3_firstaid uuid; s3_baby uuid; s3_dental uuid; s3_haircare uuid;

BEGIN

  -- Auto-detect your user account
  SELECT id INTO v_owner FROM auth.users ORDER BY created_at LIMIT 1;
  IF v_owner IS NULL THEN
    RAISE EXCEPTION 'No account found. Create an account in admin.html first, then run this SQL.';
  END IF;

-- ════════════════════════════════════════
-- STORE 1: Sunrise Supermarket
-- ════════════════════════════════════════
INSERT INTO stores (name,address,city,country,description,owner_id)
VALUES ('Sunrise Supermarket','14 High Street','London','UK',
  'Your friendly neighbourhood supermarket with everything you need.',v_owner)
RETURNING id INTO v_s1;

INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Produce','Fresh fruit and vegetables',1) RETURNING id INTO s1_produce;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Bakery','Bread, cakes and pastries',2) RETURNING id INTO s1_bakery;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Dairy & Eggs','Milk, cheese, yoghurt and eggs',3) RETURNING id INTO s1_dairy;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Meat & Fish','Fresh and frozen meat and fish',4) RETURNING id INTO s1_meat;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Frozen Foods','Ready meals, ice cream and more',5) RETURNING id INTO s1_frozen;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Snacks & Sweets','Crisps, chocolate and sweets',6) RETURNING id INTO s1_snacks;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Drinks','Water, juice, fizzy drinks and alcohol',7) RETURNING id INTO s1_drinks;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Breakfast','Cereal, porridge, spreads and jams',8) RETURNING id INTO s1_breakfast;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Tinned & Dried','Pasta, rice, tinned goods and sauces',9) RETURNING id INTO s1_tinned;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Cleaning','Household and laundry products',10) RETURNING id INTO s1_cleaning;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s1,'Health & Beauty','Medicines, skincare and toiletries',11) RETURNING id INTO s1_health;

INSERT INTO items (store_id,aisle_id,name,category,location_detail) VALUES
  (v_s1,s1_produce,'Bananas','Fruit','Bottom shelf, entrance side'),
  (v_s1,s1_produce,'Apples','Fruit','Bottom shelf, next to bananas'),
  (v_s1,s1_produce,'Avocados','Fruit','Middle shelf, right side'),
  (v_s1,s1_produce,'Strawberries','Fruit','Eye level, refrigerated section'),
  (v_s1,s1_produce,'Broccoli','Vegetables','Top shelf, left side'),
  (v_s1,s1_produce,'Spinach','Vegetables','Eye level, bagged salads'),
  (v_s1,s1_produce,'Carrots','Vegetables','Bottom shelf, loose section'),
  (v_s1,s1_produce,'Tomatoes','Vegetables','Middle shelf, vine tomatoes'),
  (v_s1,s1_produce,'Potatoes','Vegetables','Floor level, large bags'),
  (v_s1,s1_produce,'Onions','Vegetables','Floor level, next to potatoes'),
  (v_s1,s1_produce,'Garlic','Vegetables','Middle shelf, loose bulbs'),
  (v_s1,s1_produce,'Lemons','Fruit','Middle shelf, citrus section'),
  (v_s1,s1_bakery,'Sourdough Bread','Bread','Top shelf, left side'),
  (v_s1,s1_bakery,'White Sliced Bread','Bread','Eye level, centre'),
  (v_s1,s1_bakery,'Wholemeal Bread','Bread','Eye level, next to white'),
  (v_s1,s1_bakery,'Croissants','Pastry','Middle shelf, packaged section'),
  (v_s1,s1_bakery,'Bagels','Bread','Top shelf, right side'),
  (v_s1,s1_bakery,'Baguette','Bread','Tall basket, end of aisle'),
  (v_s1,s1_dairy,'Whole Milk','Milk','Eye level, first fridge'),
  (v_s1,s1_dairy,'Semi-Skimmed Milk','Milk','Eye level, next to whole milk'),
  (v_s1,s1_dairy,'Oat Milk','Milk','Top shelf, alternative milks'),
  (v_s1,s1_dairy,'Butter','Dairy','Middle fridge, eye level'),
  (v_s1,s1_dairy,'Cheddar Cheese','Cheese','Middle fridge, block cheese'),
  (v_s1,s1_dairy,'Mozzarella','Cheese','Middle fridge, fresh cheese'),
  (v_s1,s1_dairy,'Greek Yoghurt','Yoghurt','Bottom fridge, large tubs'),
  (v_s1,s1_dairy,'Eggs (6 pack)','Eggs','Bottom fridge, right side'),
  (v_s1,s1_dairy,'Eggs (12 pack)','Eggs','Bottom fridge, next to 6 pack'),
  (v_s1,s1_meat,'Chicken Breast','Chicken','Eye level, fresh meat fridge'),
  (v_s1,s1_meat,'Beef Mince','Beef','Middle fridge, mince section'),
  (v_s1,s1_meat,'Pork Sausages','Pork','Middle fridge, sausages'),
  (v_s1,s1_meat,'Bacon','Pork','Eye level, cured meats'),
  (v_s1,s1_meat,'Salmon Fillet','Fish','Bottom fridge, fish section'),
  (v_s1,s1_frozen,'Fish Fingers','Fish','Middle freezer, fish section'),
  (v_s1,s1_frozen,'Frozen Peas','Vegetables','Top freezer, vegetables'),
  (v_s1,s1_frozen,'Chips / Fries','Potatoes','Middle freezer, potato section'),
  (v_s1,s1_frozen,'Ice Cream','Dessert','Bottom freezer, end of aisle'),
  (v_s1,s1_snacks,'Walkers Crisps','Crisps','Eye level, crisps section'),
  (v_s1,s1_snacks,'Pringles','Crisps','Top shelf, tall tubes'),
  (v_s1,s1_snacks,'Cadbury Dairy Milk','Chocolate','Eye level, chocolate section'),
  (v_s1,s1_snacks,'Kit Kat','Chocolate','Eye level, next to Dairy Milk'),
  (v_s1,s1_snacks,'Haribo','Sweets','Bottom shelf, sweets section'),
  (v_s1,s1_drinks,'Coca-Cola (2L)','Fizzy','Bottom shelf, large bottles'),
  (v_s1,s1_drinks,'Coca-Cola (cans)','Fizzy','Eye level, cans section'),
  (v_s1,s1_drinks,'Sparkling Water','Water','Middle shelf, water section'),
  (v_s1,s1_drinks,'Orange Juice','Juice','Top shelf, juice cartons'),
  (v_s1,s1_drinks,'Beer (6 pack)','Alcohol','Bottom shelf, beer section'),
  (v_s1,s1_drinks,'Red Wine','Alcohol','End of aisle, wine rack'),
  (v_s1,s1_breakfast,'Cornflakes','Cereal','Eye level, cereal section'),
  (v_s1,s1_breakfast,'Weetabix','Cereal','Eye level, next to cornflakes'),
  (v_s1,s1_breakfast,'Porridge Oats','Cereal','Top shelf, oats section'),
  (v_s1,s1_breakfast,'Nutella','Spreads','Middle shelf, spreads'),
  (v_s1,s1_breakfast,'Peanut Butter','Spreads','Middle shelf, next to Nutella'),
  (v_s1,s1_breakfast,'Strawberry Jam','Spreads','Middle shelf, jams section'),
  (v_s1,s1_tinned,'Pasta (Spaghetti)','Pasta','Eye level, pasta section'),
  (v_s1,s1_tinned,'Pasta (Penne)','Pasta','Eye level, next to spaghetti'),
  (v_s1,s1_tinned,'Basmati Rice','Rice','Eye level, rice section'),
  (v_s1,s1_tinned,'Tinned Tomatoes','Tinned','Middle shelf, tinned section'),
  (v_s1,s1_tinned,'Baked Beans','Tinned','Middle shelf, next to tomatoes'),
  (v_s1,s1_tinned,'Pasta Sauce','Sauces','Top shelf, pasta sauces'),
  (v_s1,s1_tinned,'Olive Oil','Oils','Top shelf, oils and vinegars'),
  (v_s1,s1_tinned,'Ketchup','Condiments','Middle shelf, sauces'),
  (v_s1,s1_tinned,'Mayonnaise','Condiments','Middle shelf, next to ketchup'),
  (v_s1,s1_cleaning,'Washing Up Liquid','Cleaning','Eye level, dish section'),
  (v_s1,s1_cleaning,'Laundry Powder','Laundry','Bottom shelf, laundry section'),
  (v_s1,s1_cleaning,'Bleach','Cleaning','Bottom shelf, far right'),
  (v_s1,s1_cleaning,'Toilet Roll','Paper','Top shelf, paper products'),
  (v_s1,s1_cleaning,'Kitchen Roll','Paper','Top shelf, next to toilet roll'),
  (v_s1,s1_health,'Paracetamol','Medicines','Eye level, pain relief'),
  (v_s1,s1_health,'Ibuprofen','Medicines','Eye level, next to paracetamol'),
  (v_s1,s1_health,'Vitamin C','Vitamins','Top shelf, vitamins section'),
  (v_s1,s1_health,'Shampoo','Haircare','Middle shelf, haircare'),
  (v_s1,s1_health,'Toothpaste','Dental','Bottom shelf, dental section'),
  (v_s1,s1_health,'Deodorant','Personal Care','Eye level, personal care');


-- ════════════════════════════════════════
-- STORE 2: TechZone Electronics
-- ════════════════════════════════════════
INSERT INTO stores (name,address,city,country,description,owner_id)
VALUES ('TechZone Electronics','42 Market Square','Manchester','UK',
  'The best place for phones, laptops, gaming and all things tech.',v_owner)
RETURNING id INTO v_s2;

INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Phones & Tablets','Smartphones, tablets and accessories',1) RETURNING id INTO s2_phones;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Laptops & PCs','Laptops, desktops and monitors',2) RETURNING id INTO s2_laptops;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'TVs & Displays','Smart TVs, projectors and mounts',3) RETURNING id INTO s2_tv;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Audio','Headphones, speakers and earbuds',4) RETURNING id INTO s2_audio;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Gaming','Consoles, games and controllers',5) RETURNING id INTO s2_gaming;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Cameras','Cameras, lenses and drones',6) RETURNING id INTO s2_cameras;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Cables & Adapters','Charging cables, HDMI, USB hubs',7) RETURNING id INTO s2_cables;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s2,'Smart Home','Smart speakers, bulbs and doorbells',8) RETURNING id INTO s2_smart;

INSERT INTO items (store_id,aisle_id,name,category,location_detail) VALUES
  (v_s2,s2_phones,'iPhone 16','Smartphones','Left wall display, eye level'),
  (v_s2,s2_phones,'Samsung Galaxy S25','Smartphones','Left wall display, next to iPhone'),
  (v_s2,s2_phones,'Google Pixel 9','Smartphones','Centre display stand'),
  (v_s2,s2_phones,'iPad Air','Tablets','Right side, tablet section'),
  (v_s2,s2_phones,'Samsung Galaxy Tab','Tablets','Right side, next to iPad'),
  (v_s2,s2_phones,'Phone Cases','Accessories','Bottom shelf, accessories wall'),
  (v_s2,s2_phones,'Screen Protectors','Accessories','Bottom shelf, accessories wall'),
  (v_s2,s2_phones,'Wireless Charger','Accessories','Middle shelf, charging section'),
  (v_s2,s2_laptops,'MacBook Air M3','Apple','Top shelf, Apple section'),
  (v_s2,s2_laptops,'MacBook Pro 14"','Apple','Top shelf, next to Air'),
  (v_s2,s2_laptops,'Dell XPS 15','Windows','Middle shelf, premium laptops'),
  (v_s2,s2_laptops,'HP Spectre x360','Windows','Middle shelf, convertibles'),
  (v_s2,s2_laptops,'Lenovo ThinkPad','Windows','Bottom shelf, business laptops'),
  (v_s2,s2_laptops,'ASUS ROG Gaming Laptop','Gaming','Bottom shelf, gaming section'),
  (v_s2,s2_tv,'Samsung 55" QLED','55 inch','Centre floor display'),
  (v_s2,s2_tv,'LG 65" OLED','65 inch','Left wall, premium display'),
  (v_s2,s2_tv,'Sony Bravia 50"','50 inch','Right wall, mid-range'),
  (v_s2,s2_tv,'TV Wall Mounts','Accessories','Bottom shelf, right side'),
  (v_s2,s2_audio,'Sony WH-1000XM5 Headphones','Headphones','Glass case, top shelf'),
  (v_s2,s2_audio,'Apple AirPods Pro','Earbuds','Glass case, Apple section'),
  (v_s2,s2_audio,'Samsung Galaxy Buds','Earbuds','Glass case, Samsung section'),
  (v_s2,s2_audio,'JBL Portable Speaker','Speakers','Middle shelf, portable audio'),
  (v_s2,s2_audio,'Sonos Era 100','Speakers','Display stand, premium audio'),
  (v_s2,s2_gaming,'PlayStation 5','Consoles','Left display stand — ask staff'),
  (v_s2,s2_gaming,'Xbox Series X','Consoles','Right display stand — ask staff'),
  (v_s2,s2_gaming,'Nintendo Switch','Consoles','Centre stand, family gaming'),
  (v_s2,s2_gaming,'PS5 Controller','Controllers','Below console display'),
  (v_s2,s2_gaming,'Game titles — PS5','Games','Right wall, games shelf A-Z'),
  (v_s2,s2_gaming,'Game titles — Xbox','Games','Right wall, next to PS5 games'),
  (v_s2,s2_cameras,'Sony A7 IV','Mirrorless','Glass cabinet, left side'),
  (v_s2,s2_cameras,'Canon EOS R8','Mirrorless','Glass cabinet, next to Sony'),
  (v_s2,s2_cameras,'DJI Mini 4 Pro Drone','Drones','Top shelf, back wall'),
  (v_s2,s2_cameras,'Camera Bags','Accessories','Bottom shelf, accessories'),
  (v_s2,s2_cables,'USB-C to USB-C Cable','Cables','Hanging display, left wall'),
  (v_s2,s2_cables,'HDMI 2.1 Cable','Cables','Hanging display, next to USB-C'),
  (v_s2,s2_cables,'USB Hub 7-port','Hubs','Middle shelf, hubs section'),
  (v_s2,s2_cables,'Lightning Cable (Apple)','Cables','Eye level, Apple accessories'),
  (v_s2,s2_smart,'Amazon Echo (4th Gen)','Smart Speakers','Display stand, smart home corner'),
  (v_s2,s2_smart,'Google Nest Hub','Smart Displays','Display stand, next to Echo'),
  (v_s2,s2_smart,'Philips Hue Starter Kit','Smart Bulbs','Middle shelf, lighting'),
  (v_s2,s2_smart,'Ring Video Doorbell','Security','Top shelf, smart security');


-- ════════════════════════════════════════
-- STORE 3: City Pharmacy
-- ════════════════════════════════════════
INSERT INTO stores (name,address,city,country,description,owner_id)
VALUES ('City Pharmacy','8 Station Road','Birmingham','UK',
  'Your local pharmacy for prescriptions, health products and beauty essentials.',v_owner)
RETURNING id INTO v_s3;

INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Prescriptions','Counter at the back — speak to pharmacist',1) RETURNING id INTO s3_prescriptions;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Vitamins & Supplements','Daily vitamins, protein and health supplements',2) RETURNING id INTO s3_vitamins;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Skincare','Moisturisers, serums, sunscreen and cleansers',3) RETURNING id INTO s3_skincare;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'First Aid','Plasters, bandages and antiseptic',4) RETURNING id INTO s3_firstaid;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Baby & Mum','Nappies, formula, baby skincare and maternity',5) RETURNING id INTO s3_baby;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Dental & Oral Care','Toothbrushes, toothpaste and mouthwash',6) RETURNING id INTO s3_dental;
INSERT INTO aisles (store_id,name,description,position) VALUES (v_s3,'Hair & Beauty','Shampoo, conditioner, styling and makeup',7) RETURNING id INTO s3_haircare;

INSERT INTO items (store_id,aisle_id,name,category,location_detail) VALUES
  (v_s3,s3_prescriptions,'Prescription Collection','Prescription','Counter at the back, right side'),
  (v_s3,s3_prescriptions,'Paracetamol 500mg','Pain Relief','Behind counter — ask pharmacist'),
  (v_s3,s3_prescriptions,'Ibuprofen 400mg','Pain Relief','Eye level, OTC medicines shelf'),
  (v_s3,s3_prescriptions,'Antihistamine (Cetirizine)','Allergy','Eye level, next to ibuprofen'),
  (v_s3,s3_prescriptions,'Omeprazole','Digestive','Middle shelf, digestive health'),
  (v_s3,s3_prescriptions,'Hay Fever Tablets','Allergy','Eye level, seasonal section'),
  (v_s3,s3_vitamins,'Vitamin C 1000mg','Vitamins','Top shelf, vitamins A-C'),
  (v_s3,s3_vitamins,'Vitamin D 4000IU','Vitamins','Top shelf, next to Vitamin C'),
  (v_s3,s3_vitamins,'Omega 3 Fish Oil','Supplements','Middle shelf, omegas'),
  (v_s3,s3_vitamins,'Multivitamin (Adults)','Vitamins','Eye level, multivitamins'),
  (v_s3,s3_vitamins,'Magnesium','Minerals','Middle shelf, minerals section'),
  (v_s3,s3_vitamins,'Protein Powder (Whey)','Sports','Bottom shelf, sports nutrition'),
  (v_s3,s3_vitamins,'Collagen Powder','Beauty','Eye level, beauty supplements'),
  (v_s3,s3_skincare,'Cerave Moisturising Cream','Moisturiser','Eye level, Cerave section'),
  (v_s3,s3_skincare,'La Roche-Posay SPF50','Sunscreen','Eye level, sun care section'),
  (v_s3,s3_skincare,'Neutrogena Face Wash','Cleanser','Middle shelf, cleansers'),
  (v_s3,s3_skincare,'Niacinamide Serum','Serum','Top shelf, serums'),
  (v_s3,s3_skincare,'Hyaluronic Acid Serum','Serum','Top shelf, next to niacinamide'),
  (v_s3,s3_skincare,'E45 Cream','Moisturiser','Middle shelf, E45 range'),
  (v_s3,s3_firstaid,'Plasters (Assorted)','First Aid','Eye level, plasters section'),
  (v_s3,s3_firstaid,'Antiseptic Cream','First Aid','Middle shelf, antiseptics'),
  (v_s3,s3_firstaid,'Bandages','First Aid','Top shelf, bandages and dressings'),
  (v_s3,s3_firstaid,'Pain Relief Gel','Pain Relief','Eye level, topical pain relief'),
  (v_s3,s3_firstaid,'Thermometer (Digital)','Medical','Bottom shelf, medical devices'),
  (v_s3,s3_baby,'Pampers Nappies (Size 3)','Nappies','Bottom shelf, Pampers section'),
  (v_s3,s3_baby,'Huggies Nappies','Nappies','Bottom shelf, Huggies section'),
  (v_s3,s3_baby,'Aptamil Formula','Baby Formula','Middle shelf, formula section'),
  (v_s3,s3_baby,'Sudocrem','Baby Skincare','Eye level, baby skincare'),
  (v_s3,s3_baby,'Baby Wipes','Baby Care','Bottom shelf, wipes'),
  (v_s3,s3_dental,'Oral-B Electric Toothbrush','Toothbrush','Top shelf, electric brushes'),
  (v_s3,s3_dental,'Colgate Total Toothpaste','Toothpaste','Eye level, Colgate section'),
  (v_s3,s3_dental,'Sensodyne Toothpaste','Toothpaste','Eye level, sensitive section'),
  (v_s3,s3_dental,'Listerine Mouthwash','Mouthwash','Bottom shelf, mouthwash'),
  (v_s3,s3_dental,'Dental Floss','Floss','Eye level, floss and picks'),
  (v_s3,s3_haircare,'Head & Shoulders Shampoo','Shampoo','Eye level, shampoo section'),
  (v_s3,s3_haircare,'Pantene Conditioner','Conditioner','Eye level, next to shampoo'),
  (v_s3,s3_haircare,'Tresemme Hair Mask','Hair Treatment','Middle shelf, treatments'),
  (v_s3,s3_haircare,'GHD Heat Protector Spray','Styling','Top shelf, styling products'),
  (v_s3,s3_haircare,'Maybelline Mascara','Makeup','Bottom shelf, eye makeup'),
  (v_s3,s3_haircare,'L''Oreal Foundation','Makeup','Bottom shelf, foundation section'),
  (v_s3,s3_haircare,'Nail Varnish Remover','Nails','Bottom shelf, nail section');

RAISE NOTICE 'Demo stores created: Sunrise Supermarket (London), TechZone Electronics (Manchester), City Pharmacy (Birmingham)';
END $$;
