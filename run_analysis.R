
# Set to TRUE to attempt the download automatically
# May not work on all platforms or in VM environments
download.file.automatically <- FALSE

data.file <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
local.data.file <- './original-dataset.zip'
local.data.dir <- './UCI HAR Dataset'

if (! file.exists(local.data.file)) {
    if (download.file.automatically) {
        download.file(data.file,
                      destfile = local.data.file, method = 'curl')
    }
}

if (! file.exists(local.data.file)) {
    stop(paste(local.data.file, 'must be present in working directory.'))
}

if (! file.exists(local.data.dir)) {
    unzip(local.data.file)
}

if (! file.exists(local.data.dir)) {
    stop(paste('Unable to unpack the compressed data.'))
}

acts <- read.csv(paste(res.dir, 'activity_labels.txt', sep = '/'),
                 sep = ' ', header = FALSE)
names(acts) <- c('id', 'name')

feats <- read.csv(paste(res.dir, 'features.txt', sep = '/'),
                 sep = ' ', header = FALSE)
names(acts) <- c('id', 'name')
