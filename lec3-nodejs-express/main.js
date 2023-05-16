import pg from "pg";

const { Pool, Query } = pg;

const pool = new Pool({
  host: "localhost",
  port: 5432,
  database: "medical_app",
  user: "postgres",
  password: "password",
});

await pool.connect().catch((err) => {
  console.error("connection error", err.stack);
  process.exit(1);
});

console.log("connected");

pool
  .query("INSERT INTO patients DEFAULT VALUES RETURNING *;")
  .then((result) => {
    console.log("result", result);
    const id = result.rows[0].id;
    return id;
  })
  .then((id) => {
    const text = `
INSERT INTO patient_registrations 
(patient_id, last_name, first_name, birth_date, gender) 
VALUES ($1, $2, $3, $4, $5);`;

    const data = [id, "connolly", "bobby", "1990-01-01", "male"];

    return pool.query(text, data);
  })
  .then(() => {
    console.log("operation completed");
  })
  //   .then((data) => {
  //     console.log("data", data);
  //     const d = data.rows[0].now;
  //     console.log("NOW()", d);
  //   })
  .catch((err) => console.error("query error", err));

console.log("Hi");
