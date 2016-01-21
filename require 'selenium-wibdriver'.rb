def minFunction(ccNumber, cvcNumber)

	require 'selenium-webdriver'
	$driver = Selenium::WebDriver.for(:firefox)
	#Resize the current window to the given dimension
	#$driver.manage.window.resize_to(500, 800)
	$driver.manage.window.maximize
				
	# Open Buy page
	#$driver.get("http://www.myautobrain.com/buy");
	$driver.navigate.to "http://www.myautobrain.com/buy"
	#$driver.navigate.to "http://localhost:3000/buy"

	# library of elements

	$first_name = $driver.find_element(:id,"device_purchase_shipping_address_attributes_first_name")
	$last_name = $driver.find_element(:id,"device_purchase_shipping_address_attributes_last_name")
	$email = $driver.find_element(:id,"device_purchase_shipping_address_attributes_email")
	$address = $driver.find_element(:id,"device_purchase_shipping_address_attributes_street_address")
	$second_address = $driver.find_element(:xpath,"//*[@id='device_purchase_shipping_address_attributes_secondary_address_line']")
	$city = $driver.find_element(:id,"device_purchase_shipping_address_attributes_city")
	$state = $driver.find_element(:id,"device_purchase_shipping_address_attributes_state")
	$zip_code = $driver.find_element(:id,"device_purchase_shipping_address_attributes_zip")
	$cc_first_name = $driver.find_element(:id,"device_purchase_cc_first_name")
	$cc_last_name = $driver.find_element(:id,"device_purchase_cc_last_name")
	$cc_number = $driver.find_element(:id,"card_number")
	$cc_month = $driver.find_element(:xpath,"//select[@id='date_month']/option[@value='9']")
	$cc_year = $driver.find_element(:xpath,"//select[@id='date_year']/option[@value='2017']")
	$cc_cvv = $driver.find_element(:id,"card_code")
	$billing_zip = $driver.find_element(:id,"device_purchase_billing_address_attributes_zip")
	$billing_number = $driver.find_element(:id,"device_purchase_billing_address_attributes_phone_number")
	$not_us_number = $driver.find_element(:xpath,"//label[@class='boolean optional control-label']")
	$submit = $driver.find_element(:xpath,"//input[@data-behavior='purchase_device_submit_button']")
	$how_many = $driver.find_element(:xpath,"//select[@id='device_purchase_quantity']//option[@value='3']")
	$coupon = $driver.find_element(:name, 'coupon_code')




	# Find Stuff and Input Payment Information
		
			$first_name.send_keys("Daymond")
			
			$how_many.click
	
			#Thread.sleep(1000)
			$last_name.send_keys("Burditt")
			
			#Thread.sleep(1000)
			$email.send_keys("burditt1533@yahoo.com")
			
			#Thread.sleep(1000)
			$address.send_keys("2700 Whitney Ave")

			#Thread.sleep(1000)
			$second_address.send_keys("309")
	   
	    	#Thread.sleep(1000)
			$city.send_keys("Harvey")
			
			#Thread.sleep(1000)
			$state.click
			
			#Thread.sleep(1000)
			$state.send_keys("L")
			
			#Thread.sleep(1000)
			$zip_code.send_keys("70058")
			
			#Thread.sleep(1000)
			$cc_first_name.send_keys("Daymond")
			
			#Thread.sleep(1000)
			$cc_last_name.send_keys("Burditt")
			
			#Thread.sleep(1000)
			$cc_number.send_keys(ccNumber)
			
			#Thread.sleep(1000)
			$cc_month.click
			
			#Thread.sleep(1000)
			$cc_year.click
	
			#Thread.sleep(1000)
			$coupon.send_keys("LMNOP123")
			
			#Thread.sleep(1000)
			$cc_cvv.send_keys(cvcNumber)
			
			#Thread.sleep(1000)
			$billing_zip.send_keys("70058")
			
			#Thread.sleep(1000)
			$billing_number.send_keys("504-373-3750")
			
			$not_us_number.click
			
			$submit.click
			
			# wait for a specific element to show up
			# wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
			# wait.until { $driver.find_element(:xpath, "//span[@data-behavior='cc-info-errors']") }

			sleep 5
			test = $driver.find_element(:xpath, "//span[@data-behavior='cc-info-errors']").text

			url = $driver.current_url

			#filename = "yourfilename.html"
			
			$target = open(filename, 'a')
			puts "And finally, we close it."
			# $target.close
			$driver.quit
end


def myTry(functName,dfunct_cc,dfunct_cvv)
			time = Time.new
			

			begin
				minFunction(dfunct_cc,dfunct_cvv);
				$target.write("<tr class='success'>" +
					"<td class='date' rowspan='3'>" + time.inspect + "</td>" +
					"<td class='error'>" + functName + " Function Passed" +
					"<tr class='skip'><td>Card used: " + dfunct_cc + " </td>" +
					"<tr class='skip'><td>CVV used: " + dfunct_cvv + "</td></tr>" +
					"</tr>")

				$target.close
			rescue 
				
				
  			# puts "Let me tell you about heat! #{e.inspect}"
			# $target.write("<tr class='success'>" +
			# 		"<td class='date' rowspan='3'>" + time.inspect + "</td>" +
			# 		"<td class='error'> #{Exception.inspect} "+
			# 		"<tr class='skip'><td>Card used: " + dfunct_cc + " </td>" +
			# 		"<tr class='skip'><td>CVV used: " + dfunct_cvv + "</td></tr>" +
			# 		"</tr>")

			# 	$target.close
			# ensure
			# this_code_is_always_executed
			end

end


myTry("Success added directly","4242424242424242","1234")
myTry("Success added directly","40000","1234")
# myTry("Success","4000000000000093","1234");
# myTry("Successful charge address and zip fail","4000000000000010","1234");
# myTry("Successful charge address line fail","4000000000000028","1234");
# myTry("Successful charge zip fail","4000000000000036","1234");
# myTry("Successful charge zip and address unavailable","4000000000000044","1234");
# myTry("Successful charge cvc will fail charge declined","4000000000000101","1234");
# myTry("Attach card to customer but charge will fail","4000000000000341","1234");
# myTry("Card declined","4000000000000002","1234");
# myTry("Card declined incorrect cvc code","4000000000000127","1234");
# myTry("Card declined expired card","4000000000000069","1234");
# myTry("Card declined processing error","4000000000000119","1234");
# myTry("Card declined for fraudulent reason","4100000000000019","1234");

