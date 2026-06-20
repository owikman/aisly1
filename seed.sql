-- Run this AFTER creating your account in admin.html
-- It fills your store with demo aisles and items

DO $$
DECLARE
  v_store uuid;
  v_produce uuid;
  v_bakery uuid;
  v_dairy uuid;
  v_meat uuid;
  v_frozen uuid;
  v_snacks uuid;
  v_drinks uuid;
  v_breakfast uuid;
  v_tinned uuid;
  v_cleaning uuid;
BEGIN
  SELECT id INTO v_store FROM stores ORDER BY created_at LIMIT 1;
  IF v_store IS NULL THEN
    RAISE EXCEPTION 'No store found — create your account in admin.html first';
  END IF;

  -- Update store details
  UPDATE stores SET
    name = 'Sunrise Supermarket',
    city = 'London',
    country = 'UK',
    address = '14 High Street',
    description = 'Your friendly neighbourhood supermarket'
  WHERE id = v_store;

  -- Aisles
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Produce',           'Fresh fruit and vegetables',        1) RETURNING id INTO v_produce;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Bakery',            'Bread, cakes and pastries',          2) RETURNING id INTO v_bakery;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Dairy & Eggs',      'Milk, cheese, yoghurt and eggs',     3) RETURNING id INTO v_dairy;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Meat & Fish',       'Fresh and frozen meat and fish',     4) RETURNING id INTO v_meat;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Frozen Foods',      'Ready meals, ice cream and more',    5) RETURNING id INTO v_frozen;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Snacks',            'Crisps, nuts, chocolate, sweets',    6) RETURNING id INTO v_snacks;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Drinks',            'Water, juice, fizzy drinks, alcohol', 7) RETURNING id INTO v_drinks;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Breakfast',         'Cereal, porridge, spreads, jam',     8) RETURNING id INTO v_breakfast;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Tinned & Dried',    'Pasta, rice, tinned goods, sauces',  9) RETURNING id INTO v_tinned;
  INSERT INTO aisles (store_id, name, description, position) VALUES (v_store, 'Cleaning',          'Household and laundry products',     10) RETURNING id INTO v_cleaning;

  -- Items
  INSERT INTO items (store_id, aisle_id, name, category, location_detail) VALUES
    -- Produce
    (v_store, v_produce, 'Bananas',            'Fruit',      'Bottom shelf, entrance side'),
    (v_store, v_produce, 'Apples',             'Fruit',      'Bottom shelf, next to bananas'),
    (v_store, v_produce, 'Strawberries',       'Fruit',      'Eye level, refrigerated section'),
    (v_store, v_produce, 'Avocados',           'Fruit',      'Middle shelf, right side'),
    (v_store, v_produce, 'Broccoli',           'Vegetables', 'Top shelf, left side'),
    (v_store, v_produce, 'Spinach',            'Vegetables', 'Eye level, bagged salads'),
    (v_store, v_produce, 'Carrots',            'Vegetables', 'Bottom shelf, loose section'),
    (v_store, v_produce, 'Tomatoes',           'Vegetables', 'Middle shelf, vine tomatoes'),
    (v_store, v_produce, 'Potatoes',           'Vegetables', 'Floor level, large bags'),
    (v_store, v_produce, 'Onions',             'Vegetables', 'Floor level, next to potatoes'),
    (v_store, v_produce, 'Garlic',             'Vegetables', 'Middle shelf, loose bulbs'),
    (v_store, v_produce, 'Lemons',             'Fruit',      'Middle shelf, citrus section'),

    -- Bakery
    (v_store, v_bakery, 'Sourdough Bread',     'Bread',      'Top shelf, left side'),
    (v_store, v_bakery, 'White Sliced Bread',  'Bread',      'Eye level, centre'),
    (v_store, v_bakery, 'Wholemeal Bread',     'Bread',      'Eye level, next to white'),
    (v_store, v_bakery, 'Croissants',          'Pastry',     'Middle shelf, packaged section'),
    (v_store, v_bakery, 'Bagels',              'Bread',      'Top shelf, right side'),
    (v_store, v_bakery, 'Muffins',             'Cake',       'Bottom shelf, grab and go'),
    (v_store, v_bakery, 'Baguette',            'Bread',      'Tall basket, end of aisle'),

    -- Dairy
    (v_store, v_dairy, 'Whole Milk',           'Milk',       'Eye level, first fridge'),
    (v_store, v_dairy, 'Semi-Skimmed Milk',    'Milk',       'Eye level, next to whole milk'),
    (v_store, v_dairy, 'Oat Milk',             'Milk',       'Top shelf, alternative milks'),
    (v_store, v_dairy, 'Butter',               'Dairy',      'Middle fridge, eye level'),
    (v_store, v_dairy, 'Cheddar Cheese',       'Cheese',     'Middle fridge, block cheese'),
    (v_store, v_dairy, 'Mozzarella',           'Cheese',     'Middle fridge, fresh cheese'),
    (v_store, v_dairy, 'Greek Yoghurt',        'Yoghurt',    'Bottom fridge, large tubs'),
    (v_store, v_dairy, 'Eggs (6 pack)',        'Eggs',       'Bottom fridge, right side'),
    (v_store, v_dairy, 'Eggs (12 pack)',       'Eggs',       'Bottom fridge, next to 6 pack'),
    (v_store, v_dairy, 'Double Cream',         'Cream',      'Top fridge, cream section'),

    -- Meat
    (v_store, v_meat, 'Chicken Breast',        'Chicken',    'Eye level, fresh meat fridge'),
    (v_store, v_meat, 'Chicken Thighs',        'Chicken',    'Eye level, next to breast'),
    (v_store, v_meat, 'Beef Mince',            'Beef',       'Middle fridge, mince section'),
    (v_store, v_meat, 'Beef Steak',            'Beef',       'Top fridge, premium cuts'),
    (v_store, v_meat, 'Pork Sausages',         'Pork',       'Middle fridge, sausages'),
    (v_store, v_meat, 'Bacon',                 'Pork',       'Eye level, cured meats'),
    (v_store, v_meat, 'Salmon Fillet',         'Fish',       'Bottom fridge, fish section'),
    (v_store, v_meat, 'Cod Fillet',            'Fish',       'Bottom fridge, next to salmon'),
    (v_store, v_meat, 'Prawns',                'Fish',       'Bottom fridge, shellfish'),

    -- Frozen
    (v_store, v_frozen, 'Fish Fingers',        'Fish',       'Middle freezer, fish section'),
    (v_store, v_frozen, 'Frozen Peas',         'Vegetables', 'Top freezer, vegetables'),
    (v_store, v_frozen, 'Chips / Fries',       'Potatoes',   'Middle freezer, potato section'),
    (v_store, v_frozen, 'Ice Cream',           'Dessert',    'Bottom freezer, end of aisle'),
    (v_store, v_frozen, 'Frozen Pizza',        'Ready Meal', 'Top freezer, pizza section'),
    (v_store, v_frozen, 'Chicken Nuggets',     'Chicken',    'Middle freezer, chicken'),

    -- Snacks
    (v_store, v_snacks, 'Walkers Crisps',      'Crisps',     'Eye level, crisps section'),
    (v_store, v_snacks, 'Pringles',            'Crisps',     'Top shelf, tall tubes'),
    (v_store, v_snacks, 'Doritos',             'Crisps',     'Eye level, sharing bags'),
    (v_store, v_snacks, 'Cadbury Dairy Milk',  'Chocolate',  'Eye level, chocolate section'),
    (v_store, v_snacks, 'Kit Kat',             'Chocolate',  'Eye level, next to Dairy Milk'),
    (v_store, v_snacks, 'Haribo',              'Sweets',     'Bottom shelf, sweets section'),
    (v_store, v_snacks, 'Peanuts',             'Nuts',       'Middle shelf, nuts and seeds'),
    (v_store, v_snacks, 'Popcorn',             'Snacks',     'Top shelf, popcorn section'),

    -- Drinks
    (v_store, v_drinks, 'Coca-Cola (2L)',      'Fizzy',      'Bottom shelf, large bottles'),
    (v_store, v_drinks, 'Coca-Cola (cans)',    'Fizzy',      'Eye level, cans section'),
    (v_store, v_drinks, 'Pepsi',               'Fizzy',      'Eye level, next to Coca-Cola'),
    (v_store, v_drinks, 'Sparkling Water',     'Water',      'Middle shelf, water section'),
    (v_store, v_drinks, 'Still Water',         'Water',      'Middle shelf, next to sparkling'),
    (v_store, v_drinks, 'Orange Juice',        'Juice',      'Top shelf, juice cartons'),
    (v_store, v_drinks, 'Apple Juice',         'Juice',      'Top shelf, next to orange'),
    (v_store, v_drinks, 'Beer (6 pack)',       'Alcohol',    'Bottom shelf, beer section'),
    (v_store, v_drinks, 'Red Wine',            'Alcohol',    'End of aisle, wine rack'),
    (v_store, v_drinks, 'White Wine',          'Alcohol',    'End of aisle, next to red'),

    -- Breakfast
    (v_store, v_breakfast, 'Cornflakes',       'Cereal',     'Eye level, cereal section'),
    (v_store, v_breakfast, 'Weetabix',         'Cereal',     'Eye level, next to cornflakes'),
    (v_store, v_breakfast, 'Porridge Oats',    'Cereal',     'Top shelf, oats section'),
    (v_store, v_breakfast, 'Granola',          'Cereal',     'Top shelf, next to oats'),
    (v_store, v_breakfast, 'Nutella',          'Spreads',    'Middle shelf, spreads'),
    (v_store, v_breakfast, 'Peanut Butter',    'Spreads',    'Middle shelf, next to Nutella'),
    (v_store, v_breakfast, 'Strawberry Jam',   'Spreads',    'Middle shelf, jams section'),
    (v_store, v_breakfast, 'Honey',            'Spreads',    'Middle shelf, end of spreads'),

    -- Tinned & Dried
    (v_store, v_tinned, 'Pasta (Spaghetti)',   'Pasta',      'Eye level, pasta section'),
    (v_store, v_tinned, 'Pasta (Penne)',       'Pasta',      'Eye level, next to spaghetti'),
    (v_store, v_tinned, 'Basmati Rice',        'Rice',       'Eye level, rice section'),
    (v_store, v_tinned, 'Tinned Tomatoes',     'Tinned',     'Middle shelf, tinned section'),
    (v_store, v_tinned, 'Baked Beans',         'Tinned',     'Middle shelf, next to tomatoes'),
    (v_store, v_tinned, 'Tinned Tuna',         'Tinned',     'Middle shelf, fish tins'),
    (v_store, v_tinned, 'Pasta Sauce',         'Sauces',     'Top shelf, pasta sauces'),
    (v_store, v_tinned, 'Coconut Milk',        'Tinned',     'Top shelf, world foods'),
    (v_store, v_tinned, 'Olive Oil',           'Oils',       'Top shelf, oils and vinegars'),
    (v_store, v_tinned, 'Soy Sauce',           'Condiments', 'Top shelf, condiments'),
    (v_store, v_tinned, 'Ketchup',             'Condiments', 'Middle shelf, sauces'),
    (v_store, v_tinned, 'Mayonnaise',          'Condiments', 'Middle shelf, next to ketchup'),

    -- Cleaning
    (v_store, v_cleaning, 'Washing Up Liquid', 'Cleaning',   'Eye level, dish section'),
    (v_store, v_cleaning, 'Dishwasher Tablets','Cleaning',   'Eye level, next to liquid'),
    (v_store, v_cleaning, 'Laundry Powder',    'Laundry',    'Bottom shelf, laundry section'),
    (v_store, v_cleaning, 'Fabric Softener',   'Laundry',    'Bottom shelf, next to powder'),
    (v_store, v_cleaning, 'Bleach',            'Cleaning',   'Bottom shelf, far right'),
    (v_store, v_cleaning, 'Toilet Roll',       'Paper',      'Top shelf, paper products'),
    (v_store, v_cleaning, 'Kitchen Roll',      'Paper',      'Top shelf, next to toilet roll'),
    (v_store, v_cleaning, 'Bin Bags',          'Cleaning',   'Middle shelf, bags section');

  RAISE NOTICE 'Demo store seeded successfully!';
END $$;
