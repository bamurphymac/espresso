module EMoreTest__View__ViewPrefix

  class App < E
    map '/path-test-i-dont-care'
    view_prefix '/path_test'
    layouts_path 'layouts'
    layout :base

    def index
      render
    end
  end

  class CanonicalTest < E
    map '/canonical_test', '/canonical-url'
    view_prefix base_url

    def index
      @greeting = "Hello!"
      render
    end
  end

  Spec.new App do
    get
    expect(last_response.body) == 'HEADER/index.erb'
  end

  Spec.new CanonicalTest do
    get
    expect(last_response.body) == 'Hello!'

    get '/canonical-url'
    expect(last_response.body) == 'Hello!'
  end

end
