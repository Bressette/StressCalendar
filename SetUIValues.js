function setDefaultValues()
{
    setRadioButtonsFalse()
    physicalActivityInputTextFieldId.text = "0"
    notesTextAreaId.text = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

function setRadioButton(dbRadioButtonSelection)
{
    switch(dbRadioButtonSelection)
    {
        case 0:
            radioGroupId.joyChecked = true
            break
        case 1:
            radioGroupId.happyChecked = true
            break
        case 2:
            radioGroupId.sadChecked = true
            break
        case 3:
            radioGroupId.worriedChecked = true
            break;
        case 4:
            radioGroupId.fearfulChecked = true
            break
        case 5:
            radioGroupId.angryChecked = true
            break
        case 6:
            setRadioButtonsFalse()
            break
    }
}

function setValuesFromQuery(result)
{
    var dbRadioButtonSelection = result.rows.item(0).mood
    setRadioButton(dbRadioButtonSelection)
    physicalActivityInputTextFieldId.text = result.rows.item(0).physicalActivity
    notesTextAreaId.text = result.rows.item(0).notes
    dayPopupId.dataStatusText = "Holds data"
}

function setRadioButtonsFalse()
{
    radioGroupId.joyChecked = false
    radioGroupId.happyChecked = false
    radioGroupId.sadChecked = false
    radioGroupId.worriedChecked = false
    radioGroupId.fearfulChecked = false
    radioGroupId.angryChecked = false
}
