function setDefaultValues()
{
    setRadioButtonsFalse()
    userInputObjectId.physicalActivityTextFieldText = "0"
    userInputObjectId.notesTextAreaText = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

function setRadioButton(dbRadioButtonSelection)
{
    switch(dbRadioButtonSelection)
    {
        case 0:
            userInputObjectId.joyCheckedVal = true
            break
        case 1:
            userInputObjectId.happyCheckedVal = true
            break
        case 2:
            userInputObjectId.sadCheckedVal = true
            break
        case 3:
            userInputObjectId.worriedCheckedVal = true
            break;
        case 4:
            userInputObjectId.fearfulCheckedVal = true
            break
        case 5:
            userInputObjectId.angryCheckedVal = true
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
    userInputObjectId.physicalActivityTextFieldText = result.rows.item(0).physicalActivity
    userInputObjectId.notesTextAreaText = result.rows.item(0).notes
    dayPopupId.dataStatusText = "Holds data"
    console.log(dbRadioButtonSelection + " " + userInputObjectId.physicalActivityTextFieldText + " " + userInputObjectId.notesTextAreaText)
}

function setRadioButtonsFalse()
{
    userInputObjectId.joyCheckedVal = false
    userInputObjectId.happyCheckedVal = false
    userInputObjectId.sadCheckedVal = false
    userInputObjectId.worriedCheckedVal = false
    userInputObjectId.fearfulCheckedVal = false
    userInputObjectId.angryCheckedVal = false
}

function getRadioButtonSelection()
{
    if(userInputObjectId.joyCheckedVal === true)
        return 0
    else if(userInputObjectId.happyCheckedVal === true)
        return 1
    else if(userInputObjectId.sadCheckedVal === true)
        return 2
    else if(userInputObjectId.worriedCheckedVal === true)
        return 3
    else if(userInputObjectId.fearfulCheckedVal === true)
        return 4
    else if(userInputObjectId.angryCheckedVal === true)
        return 5
    else
        return 6
}
