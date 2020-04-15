function setDefaultValues()
{
    joyRadioButtonId.checked = false
    happyRadioButtonId.checked = false
    sadRadioButtonId.checked = false
    worriedRadioButtonId.checked = false
    fearfulRadioButtonId.checked = false
    angryRadioButtonId.checked = false
    physicalActivityInputTextFieldId.text = "0"
    notesTextAreaId.text = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

function setRadioButton(dbRadioButtonSelection)
{
    switch(dbRadioButtonSelection)
    {
        case 0:
            joyRadioButtonId.checked = true
            break
        case 1:
            happyRadioButtonId.checked = true
            break
        case 2:
            sadRadioButtonId.checked = true
            break
        case 3:
            worriedRadioButtonId.checked = true
            break;
        case 4:
            fearfulRadioButtonId.checked = true
            break
        case 5:
            angryRadioButtonId.checked = true
    }
}

function setValuesFromQuery(result)
{
    var dbRadioButtonSelection = result.rows.item(0).mood
    setRadioButton(dbRadioButtonSelection)
    physicalActivityInputTextFieldId.text = result.rows.item(0).physicalActivity
    notesTextAreaId.text = result.rows.item(0).notes
}
