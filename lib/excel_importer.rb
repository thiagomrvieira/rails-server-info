require 'roo'

class ExcelImporter
    def initialize(file_path)
        @workbook = Roo::Excelx.new(file_path)  # Use Roo::Excel para arquivos .xls
    end

    def import_to_models(model_class)
        models = []

        @workbook.each_row_streaming(offset: 1) do |row|  # Ignorando o cabeçalho, assumindo que começa na segunda linha
        attributes = {
            'model' => row[0],
            'ram' => row[1],
            'hdd' => row[2],
            'location' => row[3],
            'price' => row[4]
        }

        model = model_class.new(attributes)
        models << model if model.valid?
    end

    models.each(&:save)
    models
    end
end