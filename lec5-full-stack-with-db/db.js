import pg from "pg";

const pool = new pg.Pool({
  host: "localhost",
  port: 5432,
  database: "zoo_management",
  user: "postgres",
  password: "password",
});

export default pool;
