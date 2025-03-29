CREATE TABLE IF NOT EXISTS permissions (
    id bigserial PRIMARY KEY,
    code text NOT NULL
);


-- The PRIMARY KEY (user_id, permission_id) line sets a composite primary key on our
-- users_permissions table, where the primary key is made up of both the users_id and
-- permission_id columns. Setting this as the primary key essentially means that the same
-- user/permission combination can only appear once in the table and cannot be
-- duplicated.
-- When creating the users_permissions table we use the REFERENCES user syntax to
-- create a foreign key constraint against the primary key of our users table, which ensures
-- that any value in the user_id column has a corresponding entry in our users table. And
-- likewise, we use the REFERENCES permissions syntax to ensure that the permission_id
-- column has a corresponding entry in the permissions table.
CREATE TABLE IF NOT EXISTS users_permissions (
    user_id bigint NOT NULL REFERENCES users ON DELETE CASCADE,
    permission_id bigint NOT NULL REFERENCES permissions ON DELETE CASCADE,
    PRIMARY KEY (user_id, permission_id)
);


-- Add the two permissions to the table.
INSERT INTO permissions (code)
VALUES
    ('movies:read'),
    ('movies:write');