-- name: GetAccount :one
SELECT * FROM accounts 
WHERE id = $1 LIMIT 1;


-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateAccount :one
INSERT INTO accounts (name, balance, currency)
VALUES ($1, $2, $3)
RETURNING *;

-- name: CreateTransfer :one
INSERT INTO transfers (from_account, to_account, amount)
VALUES ($1, $2, $3)
RETURNING *;

-- name: CreateEntry :one
INSERT INTO entries (account_id, amount)
VALUES ($1, $2)
RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers
WHERE id = $1 LIMIT 1;

-- name: GetEntry :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: UpdateAccount :one
UPDATE accounts
SET name = $1, balance = $2, currency = $3
WHERE id = $4
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = $1
RETURNING *;

-- name: UpdateAccountBalance :one
UPDATE accounts
SET balance =  $2
WHERE id = $1
RETURNING *;