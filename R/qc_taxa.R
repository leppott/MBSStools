#' Quality Control Check on User Data Against Master Taxa List
#'
#' This function compares the user's data frame to a data frame with the
#' official (or user supplied) master taxa list (fish or benthic
#' macroinvertebrates).
#'
#' Output is a data frame with matches.
#'
#' Messages are output to the console with the number of matches and which user
#' taxa did not match the official list.
#'
#' The official list is stored online but the user can input their own saved
#' copy.
#'
#' Any columns in the user input file that match the official master taxa list
#' will be renamed with the "_NonMBBS" suffix.
#'
#' New/different taxa in the user data are handled by the 'useMBSSTaxaInfo'
#' parameter.  For taxa that did not match the master taxa list the user has
#' options on how to handle the differences for the phylogeny (e.g., columns for
#' phylum, class, family, etc.) and autecology (e.g., columns for FFG, habit,
#' tolerance value, etc.).  The options are below.
#'
#' * only_MBSS = use only MBSS master taxa information.  Any non-matching taxa
#' will not have any master taxa information.
#'
#' * only_user = only use the information provided by the user.  Information
#' from the 'MBSS' will not be used.  This should only be used for non-official
#' calculations of the MBSS IBIs.
#'
#' * add_new = hybrid approach that uses MBSS master taxa information, when
#' present, but includes user information for non-matching taxa if the column
#' names match.
#'
#' Default master taxa lists are saved as CSV files online at:
#'
#' https://github.com/leppott/MBSStools_SupportFiles
#'
#' The files can be downloaded with the following code.
#'
#' **Benthic Macroinvertebrate**
#' url_mt_bugs <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Bugs.csv"
#' df_mt_bugs <- read.csv(url_mt_bugs)
#'
#' **Fish**
#' url_mt_fish <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Fish.csv"
#' df_mt_fish<- read.csv(url_mt_fish)
#'
#' These files are maintained by MBSS staff.  Update dates will be logged on the
#' GitHub repository.
#'
#' Expected fields include:
#'
#' **Benthic Macroinvertebrates**
#'
#'     + TAXON, Phylum, Class, Order, Family, Genus, Other_Taxa, Tribe, FFG,
#'       FAM_TV, Habit, FinalTolVal07, Comment
#'
#' **Fish**
#'
#'     + SPECIES, TYPE, PTOLR, NATIVE, TROPHIC, SILT, PIRHALLA, DATA.ADDED,
#'       REASON, SOURCE, FAM, GENUS, SP_SCI, IN_KEY, APPROX_ID
#'
#' @param DF_User User taxa data.
#' @param DF_Official Official MBSS master taxa list.  Can be a local file or
#' from a URL.
#' Default is NULL.  A NULL value will use the official online files.
#' @param fun.Community Community name for which to compare the master taxa list
#'  (bugs or fish).
#' @param useMBSSTaxaInfo Select how to handle new/different taxa.
#' See 'Details' for more information.
#' Valid values are "only_MBSS", "only_user", "add_new".
#' Default = "only_MBSS".
#'
#' @return input data frame with master taxa information added to it.
#'
#' @examples
#' \dontrun{
#' # Example 1, Master Taxa List, Bugs
#' url_mt_bugs <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Bugs.csv"
#' df_mt_bugs <- read.csv(url_mt_bugs)
#'
#' # User data
#' DF_User<- taxa_bugs_genus
#' DF_Official = NULL   # NULL df_mt_bugs
#' fun.Community = "bugs"
#' useMBSSTaxaInfo = "only_MBSS"
#'
#' df_qc_taxa_bugs <- qc_taxa(DF_User
#'                           , DF_Official
#'                           , fun.Community
#'                           , useMBSSTaxaInfo)
#'
#' # QC input/output
#' dim(DF_User)
#' dim(df_qc_taxa_bugs)
#' names(DF_User)
#' names(df_qc_taxa_bugs)
#'
#' ~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Example 2, Master Taxa List, Fish
#' url_mt_fish <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Fish.csv"
#' df_mt_fish<- read.csv(url_mt_fish)
#'
#' DF_User<- taxa_fish
#' DF_Official = NULL  # NULL df_mt_fish
#' fun.Community = "fish"
#' useMBSSTaxaInfo = "add_new"
#'
#' df_qc_taxa_fish <- qc_taxa(DF_User
#'                            , DF_Official
#'                            , fun.Community
#'                            , useMBSSTaxaInfo)
#'
#' # QC input/output
#' dim(DF_User)
#' dim(df_qc_taxa_fish)
#' names(DF_User)
#' names(df_qc_taxa_fish)
#' }
#
#' @export
qc_taxa <- function(DF_User
                   , DF_Official = NULL
                   , fun.Community = NULL
                   , useMBSSTaxaInfo = "only_MBSS") {
  ##FUNCTION ~ mastertaxa ~START
  #
  boo_DEBUG <- FALSE
  if(boo_DEBUG==TRUE){##IF~boo_DEBUG~START
    # # Fish
    # DF_User<- taxa_fish
    # DF_Official = NULL
    # fun.Community = "fish"
    # useMBSSTaxaInfo = "only_MBSS"
    # # # Bugs
    # DF_User<- taxa_bugs_genus
    # DF_Official = NULL
    # fun.Community = "bugs"
    # useMBSSTaxaInfo = "only_MBSS"
    # #
  }##IF~boo_DEBUG~END

  # Col Suffixes
  sfx_MBSS <- "_Official"
  sfx_NonMBSS <- "_NonOfficial"

  # QC
  ## inputs as data frames (just in case have a tibble)
  DF_User <- data.frame(DF_User)
  # DF_Official handled when checking URL
  ## Community, convert community to lowercase
  fun.Community <- tolower(fun.Community)

  # Taxa list, official
  # run the proper sub function
  if (fun.Community == "bugs") {##IF.START
    url_mt <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Bugs.csv"
    col_mt <- c("Taxon", "Phylum", "Class", "Order", "Family", "Genus"
                , "Other_Taxa", "Tribe", "FFG", "FAM_TV", "Habit"
                , "FinalTolVal07", "Comment")
    col_taxon <- col_mt[1]
  } else if(fun.Community == "fish"){
    url_mt <- "https://github.com/leppott/MBSStools_SupportFiles/raw/master/Data/CHAR_Fish.csv"
    col_mt <- c("SPECIES", "TYPE", "PTOLR", "NATIVE", "TROPHIC", "SILT"
                , "PIRHALLA","DATE.ADDED", "REASON", "SOURCE", "FAM", "GENUS"
                , "SP_SCI", "IN_KEY", "APPROX_ID" )
    col_taxon <- col_mt[1]
  } else {
    msg <- "Valid values for fun.Community are 'bugs' or 'fish'."
    stop(msg)
  }##IF ~ fun.community ~ END

  # Master Taxa
  # Download "official" list if none provided
  if(is.null(DF_Official)){
    # 404 Error if file not found
    df_mt <- utils::read.csv(url_mt)
  } else {
    df_mt <- data.frame(DF_Official)
  }## IF ~ is.null(DF_Official) ~ END

  # Names to upper case
  names(DF_User) <- toupper(names(DF_User))
  names(df_mt) <- toupper(names(df_mt))
  # col_mt <- toupper(col_mt)
  col_taxon <- toupper(col_taxon)
  # taxa names to ALL CAPS for bugs and fish
  DF_User[, col_taxon] <- toupper(DF_User[, col_taxon])


  # Check Numbers
  taxa_user      <- sort(unique(DF_User[, col_taxon]))
  taxa_user_n    <- length(taxa_user)
  boo_taxa_match <- taxa_user %in% df_mt[, col_taxon]
  sum_taxa_match <- sum(boo_taxa_match)
  taxa_nonmatch  <- taxa_user[!boo_taxa_match]
  # Output to Console
  msg <- paste0("Taxa match, ", sum_taxa_match, " / ", taxa_user_n)
  message(msg)
  # Inform user of the non-matches
  if(sum_taxa_match != taxa_user_n){
    n_nonmatch <- taxa_user_n - sum_taxa_match
    str_tax <- ifelse(n_nonmatch == 1, "taxon", "taxa")
    msg_1 <- paste0("The following user "
                    , str_tax
                    , " ("
                    , n_nonmatch
                    , "/"
                    , taxa_user_n
                    , ") did not match the master list.\n")
    msg_2 <- paste0(taxa_nonmatch, collapse = "\n")
    message(paste0(msg_1, msg_2))
  }##IF ~ non-matches ~ END



  # Merge and Munge Columns
  ## Columns
  # col_mt_nonTaxon <- col_mt[!(col_mt %in% col_taxon)]
  # col_mt_nonMBSS <- paste0(col_mt_nonTaxon, sfx_NonMBSS)
  # boo_col_match <- colnames(DF_User) %in% col_mt_nonTaxon
  # col_mod <- colnames(DF_User)[boo_col_match]
  ## Rename matching columns before merge
  #names(DF_User)[boo_col_match] <- paste0(names(DF_User)[boo_col_match]
  # , "_NonMBSS")
  # more control than using suffixes in merge()
  #
  ## Merge
  # df_merge <- merge(DF_User, df_mt
  #                    , by = col_taxon
  #                    , all.x = TRUE)
  ## Munge Cols
  if(useMBSSTaxaInfo == "only_MBSS"){
    # Do Nothing
    # leave in "_NonMBSS" columns
    df_result <- merge(DF_User, df_mt
                       , by = col_taxon
                       , all.x = TRUE
                       , suffixes = c(sfx_NonMBSS, ""))

    #names(df_result) <- gsub(".x$", "", names(df_result))

    # df_result <- dplyr::left_join(DF_User, df_mt
    #                              , by = col_taxon
    #                              , suffix = c(sfx_NonMBSS, ""))

  } else if(useMBSSTaxaInfo == "only_user"){
    # Reverse and keep _NonMBSS and remove official field
    # # Remove Official Cols
    # col_keep <- !(names(df_merge) %in% col_mod)
    # df_result <- df_merge[, col_keep]
    # # Revert "_NonMBSS"
    # names(df_result) <- gsub("_NonMBSS$", "", names(df_result))

    df_result <- merge(DF_User, df_mt
                       , by = col_taxon
                       , all.x = TRUE
                       , suffixes = c("", sfx_MBSS))


    # df_result <- dplyr::left_join(DF_User, df_mt
    #                               , by = col_taxon
    #                               , suffix = c("", sfx_MBSS))

  } else if(useMBSSTaxaInfo == "add_new"){
    # add user info for new taxa to official columns
    # df_result <- df_merge
    # df_merge[df_merge[, col_taxon] == taxa_nonmatch, col_mod] <-
    #   df_merge[df_merge[, col_taxon] == taxa_nonmatch, paste0(col_mod
    # , "_NonMBSS")]

    df_result <- merge(DF_User, df_mt
                       , by = col_taxon
                       , all.x = TRUE
                       , suffixes = c(sfx_NonMBSS, ""))

    # df_result <- dplyr::left_join(DF_User, df_mt
    #                               , by = col_taxon
    #                               , suffix = c(sfx_NonMBSS, ""))

    col_match_y <- names(df_result)[grepl(paste0(sfx_NonMBSS,"$")
                                          , names(df_result))]
    col_match_x <- gsub(paste0(sfx_NonMBSS,"$"), "", col_match_y)
    df_result[df_result[, col_taxon] == taxa_nonmatch, col_match_x] <-
      df_result[df_result[, col_taxon] == taxa_nonmatch, col_match_y]

  } else {
    # Stop if wrong values
    msg <- "Valid values for useMBSSTaxaInfo are 'only_MBSS', 'only_user'
            , or 'add_new'."
    stop(msg)
  }

  # QC
  ## Missing Columns

  ## Valid values
  # Bugs = "FFG", "FAM_TV", "Habit", "FinalTolVal07"
  # Fish = TYPE, PTROLR, TROPHIC

  # Other columns for metric calculation
  # Bugs = EXCLUDE, STRATA_R
  # Fish =


  # Output
  return(df_result)
  #
}##FUNCTION ~ qc_taxa ~ END
