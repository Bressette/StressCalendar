//sets the value of all of the UI elements on the user input screen to their default state
function setDefaultValues()
{
    setRadioButtonsFalse()
    userInputObjectId.physicalActivityTextFieldText = "0"
    userInputObjectId.notesTextAreaText = "Enter Notes here"
    dayPopupId.dataStatusText = "No data"
}

//sets the checked value of each radio button dependent on the selection passed into the function
function setRadioButton(dbRadioButtonSelection)
{
    //switch statement that sets the checked values based on which radio button should be pressed
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

//sets the values of UI elements on the user input screen based on a sql query
function setValuesFromQuery(result)
{
    var dbRadioButtonSelection = result.rows.item(0).mood
    setRadioButton(dbRadioButtonSelection)
    userInputObjectId.physicalActivityTextFieldText = result.rows.item(0).physicalActivity
    userInputObjectId.notesTextAreaText = result.rows.item(0).notes
    dayPopupId.dataStatusText = "Holds data"
}

//sets the values of all radio buttons to false when the user does not select a radio button
function setRadioButtonsFalse()
{
    userInputObjectId.joyCheckedVal = false
    userInputObjectId.happyCheckedVal = false
    userInputObjectId.sadCheckedVal = false
    userInputObjectId.worriedCheckedVal = false
    userInputObjectId.fearfulCheckedVal = false
    userInputObjectId.angryCheckedVal = false
}


//sets default values for the emoticon graph
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

//returns an iso date based on the values passed into the function
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

//returns an iso month based on the month value passed into the function
function setIsoMonth(month)
{
    if(month < 10)
    {
        return ("0" + month)
    }

    else
        return month
}

//sets the emoticon graph values based on data from the database
function setEmoticonValues()
{
    //creates a moodArray that holds all mood values from the current month
    var moodArray = DB.getEmoticonGraphValues(enterInputRectId.isoMonth)
    //defines a max value to scale the width of the graph bars
    var max = 0
    //defines a moodAmounts array that holds how many of each mood is selected in a month
    var moodAmounts = [0,0,0,0,0,0]

    //sets default values when no mood values are known
    if(moodArray[0] === -1)
    {
        emoticonsGraphId.joyBarWidth = 10
        emoticonsGraphId.joyBarText = "0"
        emoticonsGraphId.happyBarWidth = 10
        emoticonsGraphId.happyBarText = "0"
        emoticonsGraphId.sadBarWidth = 10
        emoticonsGraphId.sadBarText = "0"
        emoticonsGraphId.worriedBarWidth = 10
        emoticonsGraphId.worriedBarText = "0"
        emoticonsGraphId.fearfulBarWidth = 10
        emoticonsGraphId.fearfulBarText = "0"
        emoticonsGraphId.angryBarWidth = 10
        emoticonsGraphId.angryBarText = "0"
    }

    //populates moodAmounts with the number of each mood that is selected in a month
    else
    {
        for(var i in moodArray)
        {
            //switch that determines which mood is selected on a day and increments the
            //corresponding moodAmounts value
            switch(moodArray[i])
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

        //sets max to maximum value of moodAmounts
        for(i in moodAmounts)
        {
            if(moodAmounts[i] > max)
            {
                max = moodAmounts[i]
            }
        }

        //defines a widthRatio based on the max mood value and uses the ratio to scale the width of moods
        var widthRatio = (graphSidebarId.width / 2) / max

        //sets the width of each bar based on the width ratio and sets the text based on the amount of each mood from moodAmounts
        emoticonsGraphId.joyBarWidth = moodAmounts[0] * widthRatio + 10
        emoticonsGraphId.joyBarText = moodAmounts[0]
        emoticonsGraphId.happyBarWidth = moodAmounts[1] * widthRatio + 10
        emoticonsGraphId.happyBarText = moodAmounts[1]
        emoticonsGraphId.sadBarWidth = moodAmounts[2] * widthRatio + 10
        emoticonsGraphId.sadBarText = moodAmounts[2]
        emoticonsGraphId.worriedBarWidth = moodAmounts[3] * widthRatio + 10
        emoticonsGraphId.worriedBarText = moodAmounts[3]
        emoticonsGraphId.fearfulBarWidth = moodAmounts[4] * widthRatio + 10
        emoticonsGraphId.fearfulBarText = moodAmounts[4]
        emoticonsGraphId.angryBarWidth = moodAmounts[5] * widthRatio + 10
        emoticonsGraphId.angryBarText = moodAmounts[5]
    }

}

//sets the values for the physical activity graph
function setPhysicalActivityValues()
{
    //creates an array weeklyPhysicalActivityAmounts that holds the total amounts for each day of the week
    var weeklyPhysicalActivityAmounts = DB.getPhysicalActivityValues(enterInputRectId.isoMonth)
    //defines a max variable to scale the width of the graph bars
    var max = 0

        //sets max to the maximum physical activity value
        for(var i in weeklyPhysicalActivityAmounts)
        {
            if(weeklyPhysicalActivityAmounts[i] > max)
            {
                max = weeklyPhysicalActivityAmounts[i]
            }
        }

        //defines a widthRatio used to scale the size of the graph bars
        var widthRatio = (graphSidebarId.width / 2) / max

        //if else statements used to determine if physical activity values are default or have been set
        if(weeklyPhysicalActivityAmounts[0] === -1)
        {
            physicalActivityGraphId.sundayBarWidth = 10
            physicalActivityGraphId.sundayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.sundayBarWidth = weeklyPhysicalActivityAmounts[0] * widthRatio
            physicalActivityGraphId.sundayBarText = (weeklyPhysicalActivityAmounts[0] + 1)
        }

        if(weeklyPhysicalActivityAmounts[1] === -1)
        {
            physicalActivityGraphId.mondayBarWidth = 10
            physicalActivityGraphId.mondayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.mondayBarWidth = weeklyPhysicalActivityAmounts[1] * widthRatio
            physicalActivityGraphId.mondayBarText = (weeklyPhysicalActivityAmounts[1] + 1)
        }

        if(weeklyPhysicalActivityAmounts[2] === -1)
        {
            physicalActivityGraphId.tuesdayBarWidth = 10
            physicalActivityGraphId.tuesdayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.tuesdayBarWidth = weeklyPhysicalActivityAmounts[2] * widthRatio
            physicalActivityGraphId.tuesdayBarText = (weeklyPhysicalActivityAmounts[2] + 1)
        }

        if(weeklyPhysicalActivityAmounts[3] === -1)
        {
            physicalActivityGraphId.wednesdayBarWidth = 10
            physicalActivityGraphId.wednesdayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.wednesdayBarWidth = weeklyPhysicalActivityAmounts[3] * widthRatio
            physicalActivityGraphId.wednesdayBarText = (weeklyPhysicalActivityAmounts[3] + 1)
        }

        if(weeklyPhysicalActivityAmounts[4] === -1)
        {
            physicalActivityGraphId.thursdayBarWidth = 10
            physicalActivityGraphId.thursdayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.thursdayBarWidth = weeklyPhysicalActivityAmounts[4] * widthRatio
            physicalActivityGraphId.thursdayBarText = (weeklyPhysicalActivityAmounts[4] + 1)
        }

        if(weeklyPhysicalActivityAmounts[5] === -1)
        {
            physicalActivityGraphId.fridayBarWidth = 10
            physicalActivityGraphId.fridayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.fridayBarWidth = weeklyPhysicalActivityAmounts[5] * widthRatio
            physicalActivityGraphId.fridayBarText = (weeklyPhysicalActivityAmounts[5] + 1)
        }

        if(weeklyPhysicalActivityAmounts[6] === -1)
        {
            physicalActivityGraphId.saturdayBarWidth = 10
            physicalActivityGraphId.saturdayBarText = "0"
        }

        else
        {
            physicalActivityGraphId.saturdayBarWidth = weeklyPhysicalActivityAmounts[6] * widthRatio
            physicalActivityGraphId.saturdayBarText = (weeklyPhysicalActivityAmounts[6] + 1)
        }
}

//sets the recent feedback text based on the last 7 records from the database
function setWeeklyFeedback()
{
    //create result and set it to the last 7 records from the database
    var result = DB.getRecentValues()
    //variable used to hold the total amount of physical activity from the database records
    var totalPhysicalActivity = 0
    //holds the feedback about the amount of physical activity
    var physicalActivityText
    //holds the feedback about the mood values
    var moodText
    //holds the summation of mood values
    var totalMood = 0

    //iterates over the records and adds the physical activity amount and mood values to variables
    for(var i = 0; i < result.rows.length; i++)
    {
        totalPhysicalActivity += result.rows.item(i).physicalActivity
        totalMood += result.rows.item(i).mood
    }

    //conditions that change what text is held in physicalActivityText and moodText
    if(totalPhysicalActivity < 150)
    {
        physicalActivityText = "Increasing your physical activity can help you feel better"
    }

    else
    {
        physicalActivityText = "You have a good level of physical activity"
    }

    if(totalMood < 10)
    {
        moodText = "Your mood has been good this week"
    }

    else
    {
        moodText = "Talk to someone that can help you feel better"
    }

    //sets the body text of recent feedback to moodText and physicalActivityText
    recentFeedbackPopupId.textContent = moodText + "\n" + physicalActivityText




}
