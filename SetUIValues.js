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
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break
        case 1:
            userInputObjectId.happyCheckedVal = true
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false

            break
        case 2:
            userInputObjectId.sadCheckedVal = true
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false

            break
        case 3:
            userInputObjectId.worriedCheckedVal = true
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break;
        case 4:
            userInputObjectId.fearfulCheckedVal = true
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.angryCheckedVal = false
            break
        case 5:
            userInputObjectId.angryCheckedVal = true
            userInputObjectId.worriedCheckedVal = false
            userInputObjectId.sadCheckedVal = false
            userInputObjectId.happyCheckedVal = false
            userInputObjectId.joyCheckedVal = false
            userInputObjectId.fearfulCheckedVal = false
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

function setDefaultEmoticonGraphValues()
{
    joyBarWidth = 0
    joyBarText = "0"
    happyBarWidth = 0
    happyBarText = "0"
    sadBarWidth = 0
    sadBarText = "0"
    worriedBarWidth = 0
    worriedBarText = "0"
    fearfulBarWidth = 0
    fearfulBarText = "0"
    angryBarWidth = 0
    angryBarText = "0"
}

function setIsoDate(year, month, day)
{
    var isoMonth = month
    var isoDay = day

    if(month < 10)
    {
        isoMonth = "0" + month
    }

    if(day < 10)
    {
        isoDay = "0" + day
    }

    var isoDate = year + "-" + isoMonth + "-" + isoDay
    return isoDate
}

function setIsoMonth(month)
{
    if(month < 10)
    {
        return ("0" + month)
    }

    else
        return month
}

function setEmoticonValues()
{
    var moodArray = DB.getEmoticonGraphValues()
    var max = 0
    var moodAmounts = [0,0,0,0,0,0]

    if(moodArray[0] === -1)
    {
        emoticonsGraphId.joyBarWidth = 0
        emoticonsGraphId.joyBarText = "0"
        emoticonsGraphId.happyBarWidth = 0
        emoticonsGraphId.happyBarText = "0"
        emoticonsGraphId.sadBarWidth = 0
        emoticonsGraphId.sadBarText = "0"
        emoticonsGraphId.worriedBarWidth = 0
        emoticonsGraphId.worriedBarText = "0"
        emoticonsGraphId.fearfulBarWidth = 0
        emoticonsGraphId.fearfulBarText = "0"
        emoticonsGraphId.angryBarWidth = 0
        emoticonsGraphId.angryBarText = "0"
    }

    else
    {
        for(i in moodArray)
        {
            switch(i)
            {
            case 0:
                moodAmounts[0] += 1
                break
            case 1:
                moodAmounts[1] += 1
                break
            case 2:
                moodAmounts[2] += 1
                break
            case 3:
                moodAmounts[3] += 1
                break
            case 4:
                moodAmounts[4] += 1
                break
            case 5:
                moodAmounts[5] += 1
                break
            }
        }

        for(i in moodAmounts)
        {
            if(i > max)
                max = i
        }

        emoticonsGraphId.maxBarWidth = max
        emoticonsGraphId.joyBarWidth = moodAmounts[0] / max
        emoticonsGraphId.joyBarText = moodAmounts[0]
        emoticonsGraphId.happyBarWidth = moodAmounts[1] / max
        emoticonsGraphId.happyBarText = moodAmounts[1]
        emoticonsGraphId.sadBarWidth = moodAmounts[2] / max
        emoticonsGraphId.sadBarText = moodAmounts[2]
        emoticonsGraphId.worriedBarWidth = moodAmounts[3] / max
        emoticonsGraphId.worreidBarText = moodAmounts[3]
        emoticonsGraphId.fearfulBarWidth = moodAmounts[4] / max
        emoticonsGraphId.fearfulBarText = moodAmounts[4]
        emoticonsGraphId.angryBarWidth = moodAmounts[5] / max
        emoticonsGraphId.angryBarText = moodAmounts[5]
    }

}

