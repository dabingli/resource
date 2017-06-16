class Api::DocsController < ActionController::Base
  DOCS_BASE_PATH = Rails.root.join('doc', 'api').freeze

  def v1
    @version = 'v1'
    render json: parse_spec
  end

  private

  def parse_spec
    spec = load_spec_file('global.yml')

    spec.merge!(
      host:        request.host_with_port,
      parameters:  load_spec_file('parameters.yml'),
      paths:       load_spec_files('paths/*yml'),
      definitions: load_spec_files('definitions/*.yml')
    )

    spec
  end

  def load_spec_file(path)
    filepath = "#{DOCS_BASE_PATH}/#{@version}/#{path}"
    erb = ERB.new(File.read(filepath), nil, '-')
    erb.location = filepath
    YAML.safe_load(erb.result) || {}
  end

  def load_spec_files(path)
    files = Dir["#{DOCS_BASE_PATH}/#{@version}/#{path}"].sort
    results = files.map do |filepath|
      erb = ERB.new(File.read(filepath), nil, '-')
      erb.location = filepath
      YAML.safe_load(erb.result) || {}
    end

    results.reduce(&:merge) || {}
  end
end
