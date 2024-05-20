# Function to list all journal page
list_pages() { 
    if [ -z "$(ls -A "$journal_dir")" ]; then 
        echo "No journal pages found." 
    else 
        echo "Journal pages:" 
        ls "$journal_dir" 
    fi 
} 

# Function to display a journal page
display_page() { 
    echo "Enter the name of the journal page to display:" 
    read name 
    file="$journal_dir/$name.txt" 
    if [ -f "$file" ]; then 
        echo "Journal page content:" 
        cat "$file"
    else 
        echo "No matching pages found." 
    fi 
}
