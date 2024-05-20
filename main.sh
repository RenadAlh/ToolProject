# Main menu loop 
echo "*   Welcome to the Journal Manager!   *"
echo "*  Your personal journaling assistant *"
echo " "

while true; do 
    echo "Journal Manager Menu:" 
    echo "1. Create a new journal page" 
    echo "2. Search for a journal page" 
    echo "3. Edit a journal page" 
    echo "4. Delete a journal page" 
    echo "5. List all journal pages" 
    echo "6. Display a journal page" 
    echo "7. Exit" 
    echo "Enter your choice (operation number):" 
    read choice 
 
    case $choice in 
        1) create_page ;; 
        2) search_pages ;;
        3) edit_page ;; 
        4) delete_page ;; 
        5) list_pages ;; 
        6) display_page ;; 
        7) echo "Exiting the Journal Manager. Goodbye!"; exit 0 ;; 
        *) echo "Invalid choice! Please enter a valid option." ;; 
    esac 
done