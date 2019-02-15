from sklearn.model_selection import train_test_split

# Split the data into train, val, test
def split_data(df, X_cols, target):
    '''Split the data into train, validate, test data by columns provided.'''

    X = df[X_cols]
    y = df[target]

    # split the model into train-validation and test sets
    X, X_test, y, y_test = train_test_split(X, y, test_size=.2, random_state=11)
    # further split data for train and validation
    X_train, X_val, y_train, y_val = train_test_split(X, y, test_size=.2, random_state=11)
    return X_train, y_train, X_val, y_val, X_test, y_test

