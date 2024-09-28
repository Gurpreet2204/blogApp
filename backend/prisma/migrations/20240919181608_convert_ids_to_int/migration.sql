-- This migration alters the `User` and `Blog` tables to change the id and authorId columns from String to Int

-- Start a transaction
BEGIN;

-- Drop foreign key constraints
ALTER TABLE "Blog" DROP CONSTRAINT "Blog_authorId_fkey";

-- Alter the User table
ALTER TABLE "User" 
  ALTER COLUMN "id" TYPE INTEGER USING "id"::integer;

-- Alter the Blog table
ALTER TABLE "Blog" 
  ALTER COLUMN "id" TYPE INTEGER USING "id"::integer,
  ALTER COLUMN "authorId" TYPE INTEGER USING "authorId"::integer;

-- Recreate foreign key constraints
ALTER TABLE "Blog" 
  ADD CONSTRAINT "Blog_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id");

-- Commit the transaction
COMMIT;
