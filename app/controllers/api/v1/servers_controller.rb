class Api::V1::ServersController < ApplicationController
	def import
		file_path = 'public/files/LeaseWeb_servers_filters_assignment.xlsx'
		excel_importer = ::ExcelImporter.new(file_path)  # Use :: to specify the top-level namespace
		imported_servers = excel_importer.import_to_models(Server)
		
		if imported_servers.present?
			servers_data = imported_servers.map do |server|
			  {
				model: server.model,
				ram: server.ram,
				hdd: server.hdd,
				location: server.location,
				price: server.price
			  }
		end
			render json: { message: 'Import successful', servers: servers_data }
		else
			render json: { message: 'No servers imported' }, status: :unprocessable_entity
		end
	end
  end
  