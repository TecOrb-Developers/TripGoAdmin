ActiveAdmin.register_page "Partner List" do
  menu :priority => 2
    #config.filters = false    #disable filters
    #actions :all , :except => [:new]  #hide link to "delete" and "add new"
   # permit_params :name,:email,:contact_no,:role,:approved
   
content do
		partners = User.where("role = ?","supplier")
   	table do
	   	tr do
	   		th { 'Name' }
	   	    th { 'Email' }
	   	    th { 'Phone No.' }
	   	    th { 'Website' }
	   	    th { 'IATA Ref.' }
	   	    th { 'Status' }
	   	    th { 'Action' }
		end	
    partners.each do |user| 
	    tr do
	      td { user.name }
	      td { user.email }
	      td { user.contact_no }
	      td { user.profile.website_name }
	      td { " IATA" }
	      td {  user.approved? ? status_tag( "Approved", :ok ) : status_tag( "Disapproved" ) }      
 	  	  td :class=>"" do 
             a  link_to 'View /', admin_user_path(user) 
             l = user.approved? ? 'Disapprove' : 'Approve'
           	 a  link_to l, approve_partner_path(user),:data => { :confirm => "Are you sure, you want to #{l} this user?" }
          end
	    end
	end
  end 
end

  #  content do
  #  	    table 
  #        partners.each do |partner|    
	
		#    column "Name " do |partner|
		#       partner.name 
		#     end
		#     column " Email " do |partner|
		#       partner.email
		#     end
		#     column " Phone No. " do |partner|
		#       partner.contact_no
		#     end
		#     column "Website" do |partner|
		#       partner.profile.website_name
		#     end
		#     column " IATA Ref. " do |partner|
		        
		#     end
		#     column " Status " do |partner|
		#       if partner.approved == false
		#         "Inactive"
		#       else
		#        "Active"
		#      end
		#    end
		#     column "Actions" do |partner|
		#       links = ''.html_safe
		#       links += link_to 'View / ', admin_user_path(partner)

		#       a do
		#         if partner.approved == false
		#           links += link_to 'Approve / ', approve_user_path(partner),:data => { :confirm => 'Are you sure, you want to approve this user?' }
		#         else
		#           links += link_to 'Disapprove / ', approve_user_path(partner),:data => { :confirm => 'Are you sure, you want to disapprove this user?' }
		#         end
		#         links += link_to 'Delete', admin_user_path(partner), method: :delete,:data => { :confirm => 'Are you sure, you want to delete this user?' }
		#       end
		#       links
		#     end

		# end
  # end

end
