# Function to search for journal pages by content or name 
search_pages() {
    echo "Choose search type:"
    echo "1. Search by name"
    echo "2. Search by content"
    read -p "Enter your choice (operation number): " choice
    case $choice in
        1) search_by="filename"; prompt="Enter the name: ";;
        2) search_by="content"; prompt="Enter the content: ";;
        *) echo "Invalid choice."; return ;;
    esac

    echo "$prompt"
    read query
    echo "Search Results:"
    case $search_by in
        "filename")
            grep_result=$(find "$journal_dir" -type f -name "*$query*" -printf "%f\n")
            ;;
        "content")
            grep_result=$(grep -rl --exclude-dir=".*" --include="*.txt" "$query" "$journal_dir" | sed "s|$journal_dir/||")
            ;;
    esac

    if [ -n "$grep_result" ]; then
        echo "Matches found:"
        echo "$grep_result"
    else
        echo "No matches found."
    fi
}
# Function to edit a journal page
edit_page() { 
    echo "Enter the name of the journal page to edit:" 
    read name 
    file="$journal_dir/$name.txt" 
    if [ -f "$file" ]; then 
        echo "Current page content:" 
        cat "$file" 
        echo "Enter the new content for the journal page (Ctrl+D to save):" 
        cat > "$file" 
        echo "Journal page '$name' updated." 
    else 
        echo "No matching pages found." 
    fi 
} 
 
# Function to delete a journal page
delete_page() { 
    echo "Enter the name of the journal page to delete:" 
    read name 
    file="$journal_dir/$name.txt" 
    if [ -f "$file" ]; then 
        rm "$file" 
        echo "Journal page '$name' deleted." 
    else 
        echo "No matching pages found." 
    fi 
}
