require 'minitest/autorun'
require 'hashie'
require 'default_aircall'

module DefaultTest
=begin
  def deep_find(key, object=self, found=[])
    if object.respond_to?(:key?) && object.key?(key)
      found << object[key]
    end
    if object.is_a? Enumerable
      found << object.collect { |*a| deep_find(key, a.last) }
    end
    found.flatten.compact
  end
=end

  Run = ->(*variables_to_test) do
    describe "Default test" do
      variables_to_test.each do |variable|

        it "is Hash" do
          self.class.send(variable).must_be_instance_of Hash
        end

        it "no error return" do
          self.class.send(variable)['error'].must_be_nil
        end

      end
    end
  end

  Params_checker = ->(category, *functions_names_and_arguments) do
    describe "Check params" do

      functions_names_and_arguments.each do |function_name_and_argument|

        it "number of result" do
          number_of_result = 1
          results = DefaultAircall::AIRCALL
                        .send(category)
                        .method(function_name_and_argument[:function])
                        .call(function_name_and_argument[:argument], per_page: number_of_result)

          results["meta"]["per_page"].must_equal number_of_result
        end

        it "page number" do
          page_number = 2
          results = DefaultAircall::AIRCALL
                        .send(category)
                        .method(function_name_and_argument[:function])
                        .call(function_name_and_argument[:argument], per_page: 1, page: page_number)

          results["meta"]["current_page"].must_equal page_number
        end

        it "order" do
          results = DefaultAircall::AIRCALL
                        .send(category)
                        .method(function_name_and_argument[:function])
                        .call(function_name_and_argument[:argument], per_page: 3, order: "desc")

          results[category][0].extend Hashie::Extensions::DeepFind
          results[category][1].extend Hashie::Extensions::DeepFind

          first_created_at = results[category][0].deep_find("created_at")
          second_created_at = results[category][1].deep_find("created_at")

          if !first_created_at.nil?
            first_created_at.wont_be :<, second_created_at
          else
            first_started_at = results[category][0].deep_find("started_at")
            second_started_at = results[category][1].deep_find("started_at")

            first_started_at.wont_be :<, second_started_at
          end
        end

        it "order by" do
          results = DefaultAircall::AIRCALL
                        .send(category)
                        .method(function_name_and_argument[:function])
                        .call(function_name_and_argument[:argument], per_page: 3, order: "updated_at")

          results[category][0].extend Hashie::Extensions::DeepFind
          results[category][1].extend Hashie::Extensions::DeepFind

          first_created_at = results[category][0].deep_find("created_at")
          second_created_at = results[category][1].deep_find("created_at")

          if !first_created_at.nil?
            first_created_at.wont_be :>, second_created_at
          else
            first_started_at = results[category][0].deep_find("started_at")
            second_started_at = results[category][1].deep_find("started_at")

            first_started_at.wont_be :>, second_started_at
          end
        end
      end

    end
  end
end