require_relative '../models/address_book'

RSpec.describe AddressBook do
    let(:book) {AddressBook.new}
    
    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        it "initializes entries as an array" do
            expect(book.entries).to be_a(Array)
        end
        it "initializes entries as empty" do
            expect(book.entries.size).to eq 0
        end
    end
    
    describe "#add_entry" do
        it "add only one entry to the address book" do
            book.add_entry('Ada', '123', 'a@a.com')
            expect(book.entries.size).to eq 1
        end
        it "add the correct info to entries" do
            book.add_entry('Ada', '123', 'a@a.com')
            new_entry = book.entries[0]
            expect(new_entry.name).to eq "Ada"
            expect(new_entry.phone_number).to eq "123"
            expect(new_entry.email).to eq "a@a.com"
        end
    end
    
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            expect(book_size).to eq 5
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555", "aaa@aaa.com")
            expect(entry_one.name).to eq "Bill"
            expect(entry_one.phone_number).to eq "555"
            expect(entry_one.email).to eq "aaa@aaa.com"
        end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            check_entry(entry_two, "Chris", "666", "aaa@bbb.com")
            expect(entry_two.name).to eq "Chris"
            expect(entry_two.phone_number).to eq "666"
            expect(entry_two.email).to eq "aaa@bbb.com"
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            check_entry(entry_three, "Tom", "777", "aaa@ccc.com")
            expect(entry_three.name).to eq "Tom"
            expect(entry_three.phone_number).to eq "777"
            expect(entry_three.email).to eq "aaa@ccc.com"
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            entry_four = book.entries[3]
            check_entry(entry_four, "Mike", "888", "aaa@ddd.com")
            expect(entry_four.name).to eq "Mike"
            expect(entry_four.phone_number).to eq "888"
            expect(entry_four.email).to eq "aaa@ddd.com"
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            entry_five = book.entries[4]
            check_entry(entry_five, "Ben", "999", "aaa@eee.com")
            expect(entry_five.name).to eq "Ben"
            expect(entry_five.phone_number).to eq "999"
            expect(entry_five.email).to eq "aaa@eee.com"
        end
        
    end

     describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size
            expect(book_size).to eq 3
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]
            check_entry(entry_one, "Bill", "555", "aaa@aaa.com")
            expect(entry_one.name).to eq "Bill"
            expect(entry_one.phone_number).to eq "555"
            expect(entry_one.email).to eq "aaa@aaa.com"
        end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            check_entry(entry_two, "Chris", "666", "aaa@bbb.com")
            expect(entry_two.name).to eq "Chris"
            expect(entry_two.phone_number).to eq "666"
            expect(entry_two.email).to eq "aaa@bbb.com"
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            check_entry(entry_three, "Tom", "777", "aaa@ccc.com")
            expect(entry_three.name).to eq "Tom"
            expect(entry_three.phone_number).to eq "777"
            expect(entry_three.email).to eq "aaa@ccc.com"
        end    
    end
    
    describe "#binary_search" do
        it "searches AddressBook for a non-existent entry" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Dan")
            expect(entry).to be_nil
        end
        
        it "searches AddressBook for Bill" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Bill")
            expect(entry).to be_a Entry
            check_entry(entry, "Bill", "555" ,"aaa@aaa.com")
        end
        
        it "searches AddressBook for Chris" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Chris")
            expect(entry).to be_a Entry
            check_entry(entry, "Chris", "666" ,"aaa@bbb.com")
        end
        
        it "searches AddressBook for Tom" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Tom")
            expect(entry).to be_a Entry
            check_entry(entry, "Tom", "777" ,"aaa@ccc.com")
        end
        
        it "searches AddressBook for Mike" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Mike")
            expect(entry).to be_a Entry
            check_entry(entry, "Mike", "888" ,"aaa@ddd.com")
        end
        
        it "searches AddressBook for Ben" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Ben")
            expect(entry).to be_a Entry
            check_entry(entry, "Ben", "999" ,"aaa@eee.com")
        end
        
        it "searches AddressBook for Billy" do
            book.import_from_csv("entries.csv")
            entry = book.binary_search("Billy")
            expect(entry).to be_nil
        end
        
    end
    
    describe "#iterative_search" do
        it "searches AddressBook for a non-existent entry" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Dan")
            expect(entry).to be_nil
        end
        
        it "searches AddressBook for Bill" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Bill")
            expect(entry).to be_a Entry
            check_entry(entry, "Bill", "555" ,"aaa@aaa.com")
        end
        
        it "searches AddressBook for Chris" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Chris")
            expect(entry).to be_a Entry
            check_entry(entry, "Chris", "666" ,"aaa@bbb.com")
        end
        
        it "searches AddressBook for Tom" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Tom")
            expect(entry).to be_a Entry
            check_entry(entry, "Tom", "777" ,"aaa@ccc.com")
        end
        
        it "searches AddressBook for Mike" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Mike")
            expect(entry).to be_a Entry
            check_entry(entry, "Mike", "888" ,"aaa@ddd.com")
        end
        
        it "searches AddressBook for Ben" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Ben")
            expect(entry).to be_a Entry
            check_entry(entry, "Ben", "999" ,"aaa@eee.com")
        end
        
        it "searches AddressBook for Billy" do
            book.import_from_csv("entries.csv")
            entry = book.iterative_search("Billy")
            expect(entry).to be_nil
        end
        
    end
end