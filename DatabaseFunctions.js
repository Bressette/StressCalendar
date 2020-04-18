//Javascript file that contains functions that access the database


//returns a variable that holds a connection to the sqlite database
function getDatabaseConnection()
{
    var db = LocalStorage.openDatabaseSync("CalendarDB", "1.0", "CalendarDB", 1000000)
    return db
}

//creates the table used to store data
function createTable(tx)
{
    tx.executeSql('CREATE TABLE IF NOT EXISTS day(date Date PRIMARY KEY, mood INT, physicalActivity INT, notes TEXT)')
}

//inserts data that is passed into the function into the database and updates the current record if the row already exists
function insertData(tx, isoDateString, moodNumber, physicalActivityNumber, notesString)
{
    tx.executeSql('REPLACE INTO day (date, mood, physicalActivity, notes) VALUES(?,?,?,?);', [isoDateString, moodNumber, physicalActivityNumber, notesString])
}

//function that select all data for a given date and returns the result
function selectDayData(tx, date)
{
    const isoDate = "\"" + date + "\""
    return tx.executeSql('SELECT * FROM day WHERE date = ' + isoDate)
}

//retrieves data for a given date and sets the values of UI objects from the user input screen
function getDataForDate(isoDate)
{
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    //creates the table if it does not exist
                    createTable(tx)
                    //gets the records for the given date
                    var result = selectDayData(tx, enterInputRectId.isoDate)

                    //when the query is empty sets default values
                    if(!(result.rows.length > 0))
                    {
                        SetVals.setDefaultValues()
                    }

                    //when the query is not empty the values are set based on the returned values
                    else
                    {
                        SetVals.setValuesFromQuery(result)
                    }
                }
            )
}

//creates a database transaction and inserts the passed in data into the database
function insertDataTransaction(isoDateString, moodNumber, physicalActivityNumber, notesString)
{
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    insertData(tx, isoDateString, moodNumber, physicalActivityNumber, notesString)
                }
                    )
}

//the Sqlite function strftime does not exist in the qt quick implementation fo sqlite
//and can't be used to sort by the month making sorting by month more difficult
//this function returns an array of the mood values for a given month
function getEmoticonGraphValues(month)
{
    //create the monthArray variable and initializes the array to initially store -1 if the value remains -1
    //it is a flag that no values have been inserted
    var monthArray = [-1]
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    createTable(tx)
                    var result = tx.executeSql("SELECT * FROM day")



                    //this for loop iterates over the dates in result and compares them to the passed in month
                    //and stores valid values in the monthArray
                    var monthArrayCounter = 0
                    for(var i = 0; i < result.rows.length; i++)
                    {
                        var date = result.rows.item(i).date
                        var dbMonth = date.substring(5,7)
                        if(dbMonth === month)
                        {
                            monthArray[monthArrayCounter] = result.rows.item(i).mood
                            monthArrayCounter++
                        }
                    }
                }
            )
    return monthArray
}

//returns the cumulative physical activity values for a given month
function getPhysicalActivityValues(month)
{
    //creates the physicalActivityArray variable and sets flag values to know when
    //values have not been inserted
    var physicalActivityArray = [-1, -1, -1, -1, -1, -1, -1]

    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    //creates the day table if it does not exist
                    createTable(tx)

                    //selects all values from the database
                    var result = tx.executeSql("SELECT * FROM day")

                    //for loop that iterates over every record in the database and updates physicalActivityArray
                    //based on values that are in the same month as the month value that was passed into the function
                    for(var i = 0; i < result.rows.length; i++)
                    {
                        //stores the iso date for the given day
                        var date = result.rows.item(i).date
                        //stores the iso month extracted from the date
                        var dbMonth = date.substring(5,7)

                        //if the extracted month is the same as the given month physicalActivityArray is updated
                        if(dbMonth === month)
                        {
                            //creates a javascript date to easily extract the day of the week
                            var tempDate = new Date(result.rows.item(i).date)
                            var dayOfWeek = tempDate.getDay()
                            physicalActivityArray[dayOfWeek] += result.rows.item(i).physicalActivity
                        }
                    }
                }
            )

    //shifts the values in physicalActivityArray because the day values are off by one
    var shiftedPhysicalActivityValues = []

    for(var i = 1; i < physicalActivityArray.length; i++)
    {
        shiftedPhysicalActivityValues[i] = physicalActivityArray[i-1]
    }

    shiftedPhysicalActivityValues[0] = physicalActivityArray[shiftedPhysicalActivityValues.length - 1]

    //returns the fixed array
    return shiftedPhysicalActivityValues

}

//returns the last 7 records in the database that will be used to generate the recent feedback
function getRecentValues()
{
    var result
    var db = getDatabaseConnection()
    db.transaction(
                function(tx)
                {
                    createTable(tx)
                    result = tx.executeSql("Select * FROM day ORDER BY date DESC LIMIT 7")
                }
            )
    return result
}


