require_relative '../models/address_book'
RSpec.describe AddressBook do
    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Jay Raja', '615.333.8011', 'jayraja@gmail.com')
            expect(book.entries.size).to eq(1)
        end
        it "add the correct info to entries" do
            book = AddressBook.new
            book.add_entry('Jay Raja', '615.333.8011', 'jayraja@gmail.com')
            new_entry = book.entries[0]
            expect(new_entry.name).to eq('Jay Raja')
            expect(new_entry.phone_number).to eq('615.333.8011')
            expect(new_entry.email).to eq('jayraja@gmail.com')
        end
    end
    describe "#remove_entry" do
        it "removes one entry from entries" do
            book = AddressBook.new
            book.add_entry('Joe Tom', '615-323-2000', 'joetom@gmail.com')
            book.add_entry('Jay Raja', '615.333.8011', 'jayraja@gmail.com')
            expect(book.entries.size).to eq 2
            book.remove_entry('Joe Tom', '615-323-2000', 'joetom@gmail.com')
            expect(book.entries.size).to eq 1
            expect(book.entries.first.name).to eq ('Jay Raja')
        end
    end
end
