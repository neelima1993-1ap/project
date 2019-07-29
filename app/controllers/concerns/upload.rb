module Upload

  	def self.upload_data args
  		Supplier.destroy_all
      file = args.first
  		workbook = RubyXL::Parser.parse(file)
  		worksheet = workbook[0]
      i = 1
      #while(true)
      for i in 1..10
      	hash = Hash.new()
    		row=worksheet.sheet_data[i]
    		break if row[0].nil? #when excel file ends	
  			hash["id"] = row[0].value.to_i
  			hash["product_id"] = row[1].value.to_i
  			hash["product_title"] = row[2].value
  			hash["supplier_id"] = row[3].value.to_i
  			hash["supplier_name"] = row[4].value
  			hash["price"] = row[5].value
  			hash["category"] = row[6].value
  			hash["is_active"] = row[7].value.to_i
        make_objects hash
  		  i = i+1
  	  end #end of while  
  	end

  	def self.make_objects hash_args
      product = Product.new()
      product.id = hash_args["product_id"]
      product.title = hash_args["product_title"]
      product.category = hash_args["category"]
      product.price = hash_args["price"]
      product.active = hash_args["is_active"]
     
      unless Supplier.exists?(hash_args["supplier_id"])
       	supplier = Supplier.new()
       	supplier.id = hash_args["supplier_id"]
       	supplier.name = hash_args["supplier_name"]
       	supplier.save!
      end
      product.supplier = supplier || Supplier.find(hash_args["supplier_id"])
      product.save!
  	end

end