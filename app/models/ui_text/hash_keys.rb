module UiText
  module HashKeys
    def self.flat_key_map(*args)
      run(*args).reduce Hash.new, :merge
    end

    private

    def self.run(hash, parents = [])
      a = []
      Hash(hash).each do |k, v|
        case v
        when Hash
          a << run(v, [parents, [k]])
        else
          a << { [parents, k].flatten.join('.') => v }
        end
      end
      a.flatten
    end
  end
end
