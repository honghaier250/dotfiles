define plist
 
    set $list=$arg0
 
    while($list)
        p *$list
        set $list=$list->next
    end
end
