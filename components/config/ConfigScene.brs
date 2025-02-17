sub init()
    m.top.setFocus(true)
    m.top.optionsAvailable = false
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    ' Returns true if user navigates to a new focusable element
    if not press then return false

    list = m.top.findNode("configOptions")
    checkbox = m.top.findNode("onOff")
    button = m.top.findNode("submit")
    if key = "back"
        m.top.backPressed = true
    else if key = "down" and checkbox.focusedChild = invalid and button.focusedChild = invalid
        limit = list.content.getChildren(-1, 0).count() - 1

        if limit = list.itemFocused
            checkbox.setFocus(true)
            return true
        end if
    else if key = "down" and button.focusedChild = invalid
        button.setFocus(true)
        return true
    else if key = "up" and button.focusedChild <> invalid
        checkbox.setFocus(true)
        return true
    else if key = "up" and checkbox.focusedChild <> invalid
        list.setFocus(true)
        return true
    end if
    return false
end function
