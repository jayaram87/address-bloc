require "csv"

class AddressBook
    attr_accessor :entries
    
    def initialize
        @entries = []
    end
    
    # adding new entries to the Address Book
    def add_entry(name, phone_number, email)
        index = 0
        @entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        @entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    # importing a csv file with names, phone numbers & emails
    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
    
    # Searching the address book for a specific entry by name using the binary search
    def binary_search(name)
        # divide and conquer design pattern, searching using the array indexes
        lower = 0
        upper = @entries.length - 1
        
        while lower <= upper
            mid = (lower+upper)/2
            mid_name = @entries[mid].name
            
            if name == mid_name
                return @entries[mid]
            # how does compare name is less than mid_name
            elsif name < mid_name
                upper = mid - 1
            elsif name > mid_name
                lower = mid + 1
            end
        end
        
        return nil
        
    end
    
    def iterative_search(name)
        index = 0
        last_index = @entries.length - 1
        
        while index <= last_index
            search_name = @entries[index].name
            if name == search_name
                return @entries[index].name
            else
                index += 1
            end
        end
        
        return nil
    end
    
    def nuke
        @entries =[]        
    end

end

class Entry
    attr_accessor :name, :phone_number, :email
    
    def initialize(name, phone_number, email)
        @name = name
        @phone_number = phone_number
        @email = email
    end
    
    def to_s
        "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
    end
end
