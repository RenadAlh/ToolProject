# Make a directory for the journal files
journal_dir="journal" 
mkdir -p "$journal_dir" 
 
# Function to create a new journal page
create_page() { 
    echo "Enter the name of the journal page:" 
    read name 
    echo "Enter your journal content (Ctrl+D to save):" 
    cat > "$journal_dir/$name.txt" 
    echo "Journal page '$name' saved." 
}