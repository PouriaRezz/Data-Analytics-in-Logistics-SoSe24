#!/bin/gawk -f

# mein Kommentar

BEGIN {
    FS = ","
    OFS = ","
    # Print header for extracted data
    print "OrderID,SupplierID,ProductID,ProductName,Quantity,UnitPrice,TotalPrice"
}

# Process master file
NR == FNR {
    # Skip header
    if (FNR > 1) {
        # If the supplier is located in New York, store its ID
        if ($3 == "New York") {
            suppliers[$1] = $2
        }
    }
}

# Process detail file
NR != FNR {
    # Skip header
    if (FNR > 1) {
        # If the supplier ID of the current order exists in the New York suppliers list, print the order details
        if (suppliers[$2] != "") {
            print $0
        }
    }
}
