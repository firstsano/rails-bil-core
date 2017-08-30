module DatabaseCleanHelpers
  def clean
    # DatabaseCleaner.clean
  end

  def clean_before(type = :all, &block)
    before(type) do
      # DatabaseCleaner.clean
      self.instance_eval(&block) if block
    end
  end
end
