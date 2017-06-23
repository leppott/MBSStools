# MBSStools, ion matrix calculation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Ion Matrix Calculation
#'
#' Calculates conductivity contribution from provided ion concentrations.  Uses Kohlrausch's Law.
#' If a total conductivity measurement is not provided the total conductivity is calculated as the sum of all ions
#' present in the data.
#' If the user provides a conductivity measurement then ion contributions are a percentage of that number.
#' In this case "Other" is added as an ion to capture any percentage of total conductivity not represented by the provided ions.
#' Plotting is done outside of this function.
#'
#' @param ion.data Input data.  Column names match rows in the ref table
#' @param ion.ref Reference data for ions; Name (matches columns in data), Multiplier, and SortOrder. Default is included ref table.
#' @param col.Cond Column name with conductivity in "data".  Default is blank.
#' If blank only ions present are used to calculate total conductivity for samples.
#' @return Returns a data frame with additional fields for "multiplier", "ion conductivity", "total conductivity", "percent contribution" (per ion).
#' @keywords MBSS, ion, matrix
#' @examples
#' # Load Data
#' data.ion <- MBSS.Ion.Data
#' # Load Reference Table
#' ref.ion <- MBSS.Ion.Ref
#' # Calculate Percent Contribution by Ion (data table only)
#' contrib.ion <- IonContrib(data.ion)
#' View(contrib.ion)
#' # Calculate Percent Contribution by Ion (data table and reference table)
#' contrib.ion.2 <- IonContrib(data.ion, ref.ion)
#' View(contrib.ion.2)
#' # Calculate Percent Contribution by Ion (data table, reference table, and conductivity values)
#' ## add dummy conductivity values for each sample
#' myCond <- "Cond"
#' data.ion[,myCond] <- 4000
#' contrib.ion.3 <- IonContrib(data.ion, ref.ion, myCond)
#' View(contrib.ion.3)
#' # Save Results (use write.table())
#' # Plot Results
#' myIons <- c("Chloride (mg/L)", "Bromide (mg/L)", "Nitrate-N (mg/L)", "Sulfate (mg/L)", "Sodium (mg/L)",
#'      "Potassium (mg/L)", "Magnesium (mg/L)",  "Calcium (mg/L)" )
#' myIons.Contrib <- paste0("PctContrib.",myIons)
#' mySite <- "BELK-101-X"
#' data.plot <- subset(contrib.ion, contrib.ion[,"Site"]==mySite, select=c("Site","Cond.Total",myIons.Contrib,myIons))
#' ## Plot, one site (with cond value)
#' dotchart(as.numeric(as.vector(data.plot[,myIons.Contrib])), labels=myIons, main=mySite, xlab="Percent Contribution",pch=19,pt.cex=1.2)
#' mtext(paste0("Conductivity (uS/cm) = ",round(data.plot[,"Cond.Total"],1)))
#' ## Plot all sites using panel.dotplot() in the lattice package
#' @export
IonContrib <- function(ion.data, ion.ref=MBSS.Ion.Ref, col.Cond="") {##FUNCTION.IonContrib.START
  #
  # # QC
  # ion.data <- MBSS.Ion.Data
  # ion.ref <- MBSS.Ion.Ref
  # col.Cond <- ""
  # 0. Rename Data
  data.calc <- ion.data
  # 1. Get Ion List
  myIons <- ion.ref$Name[ion.ref$Name %in% colnames(data.calc)]
  #print(myIons)
  ion.ref.MyIons <- ion.ref[ion.ref$Name %in% myIons,]
  #     ** Need to ensure are in SortOrder
  # 2. Add Multiplier to Data
  data.calc[,c(paste0("Mult.",myIons))] <- ion.ref.MyIons[ion.ref.MyIons[,"Name"]==myIons,"Multiplier"]
  # 3. Calculate Conductivty Per Ion
  data.calc[,c(paste0("Cond.",myIons))] <- data.calc[,myIons] * data.calc[,c(paste0("Mult.",myIons))]
  # 4. Calculate Total Conductivity
  # 4.1. Subtotal Conductivity based on Ions present in data file
  CondSubTotal <-"Cond.SubTotal"
  data.calc[,CondSubTotal] <- rowSums(data.calc[,c(paste0("Cond.",myIons))])
  # 4.2. Total Conductivity
  # Use provided name for total cond.  If "blank" use only ions given in data file.
  # If have a name will need to computer "Other"
  ## make subtotal = total, just in case total col is invalid
  CondTotal <- "Cond.Total"
  data.calc[,CondTotal] <- data.calc[,CondSubTotal]
  if (col.Cond!=""){
    data.calc[,"Cond.Total"] <- data.calc[,col.Cond]
    cat("Conductivity values provided. \n Ion contributions (including 'other') calculated from these values.")
  } else {
    cat("*No* conductivity values provided.  \n Ion contributions calculated from the sum of calculated ion conductivity values.")
  }
  Other <- "Other (mg/L)"
  data.calc[,paste0("Cond.",Other)] <- data.calc[,"Cond.Total"] - data.calc[,CondSubTotal]
  # 5. Calculate Percent Contribution Per Ion
  data.calc[,paste0("PctContrib.",c(myIons,Other))] <- data.calc[,c(paste0("Cond.",c(myIons,Other)))] / data.calc[,CondTotal]
  # 6. Add QC field for percentages
  data.calc[,"QC.PctContrib"] <- rowSums(data.calc[c(paste0("PctContrib.",c(myIons,Other)))])
  # 7. Return Data Frame
  return(data.calc)
}##FUNCTION.IonContrib.END



