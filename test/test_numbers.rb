require 'minitest/autorun'
require 'aircall'

describe Aircall do

  before do
    @aircall = Aircall.new({id: "bd6808bfc128e3cd9691aa7596b5caf0", token: "32cd57d50d21eddf49525418130971fa"})
  end


  describe "Numbers" do
    describe "By id" do
      before do
        @number_by_id = @aircall.numbers.get_by_id(27837)
      end

      it "est un Hash" do
        @number_by_id.must_be_instance_of Hash
      end

      it "ne renvoi pas d'erreurs" do
        @number_by_id['error'].must_be_nil
      end
    end
  end

=begin
  describe "Appels" do
    describe "Liste de tous" do
      before do
        @all_calls = @aircall.calls.all
      end

      it "est un Hash" do
        @all_calls.must_be_instance_of Hash
      end

      it "ne renvoi pas d'erreurs" do
        @all_calls['error'].must_be_nil
      end
    end
  end
=end

end