// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package database

import (
	"database/sql"
	"time"
)

type Account struct {
	ID        int64     `json:"id"`
	Name      string    `json:"name"`
	Balance   int64     `json:"balance"`
	Currency  string    `json:"currency"`
	CreatedAt time.Time `json:"created_at"`
}

type Entry struct {
	ID        int64     `json:"id"`
	AccountID int64     `json:"account_id"`
	Amount    int64     `json:"amount"`
	CreatedAt time.Time `json:"created_at"`
}

type Transfer struct {
	ID          int64         `json:"id"`
	FromAccount sql.NullInt64 `json:"from_account"`
	ToAccount   sql.NullInt64 `json:"to_account"`
	Amount      int64         `json:"amount"`
	CreatedAt   time.Time     `json:"created_at"`
}
