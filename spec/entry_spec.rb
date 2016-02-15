require_relative '../models/entry'
RSpec.describe Entry do
    describe "attributes" do
        it "responds to Name" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to respond_to(:name)
        end
        it "reports its Name" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to eq('Jay Raja')
        end
        it "responds to Phone Number" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to respond_to(:phone_number)
        end
        it "reports its Phone Number" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to eq('615-323-8011')
        end
         it "responds to Email" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to respond_to(:email)
         end
        it "reports its Email" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@gmail.com')
            expect(entry).to eq('jayraja@gmail.com')
        end
    end
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Jay Raja', '615-323-8011', 'jayraja@email.com')
            expected_string = "Name: Jay Raja\nPhone Number: 615-323-8011\nEmail: jayraja@gmail.com"
            expect(entry.to_s).to eq(expected_string)
        end
    end
end