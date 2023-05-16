// const { faker } = require("@faker-js/faker");
// const { Pool } = require("pg");

import { faker } from "@faker-js/faker";
import pg from "pg";

const pool = new pg.Pool({
  host: "localhost",
  port: 5432,
  database: "test_gen",
  user: "postgres",
  password: "password",
});

await pool.connect();

for (let i = 0; i < 1000000; i++) {
  const lastName = faker.person.lastName();
  const firstName = faker.person.firstName();
  const email = faker.internet.email();
  const genderArr = ["male", "female", "non-binary", "other", "unknown"];
  const gender = genderArr[Math.floor(Math.random() * genderArr.length)];
  const dob = faker.date.past({ years: 90 }).toISOString().split("T")[0]; // ex:2000-01-01

  const text = `
    INSERT INTO patients (last_name, first_name, birth_date, gender, email)
    VALUES ($1, $2, $3, $4, $5)`;

  const data = [lastName, firstName, dob, gender, email];

  await pool.query(text, data);

  if (i > 0) {
    if (i % 1000 === 0) {
      console.log(`${i} rows processed`);
    }
  }
}
