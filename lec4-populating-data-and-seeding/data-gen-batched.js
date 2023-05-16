// const { faker } = require("@faker-js/faker");
// const { Pool } = require("pg");

import { faker } from "@faker-js/faker";
import pg from "pg";

const client = new pg.Client({
  host: "localhost",
  port: 5432,
  database: "test_gen",
  user: "postgres",
  password: "password",
});

const conn = await client.connect();

const NUM_OF_RECORDS = 1000000;
const RECORDS_PER_BATCH = 5000;

const NUM_OF_BATCHES = Math.floor(NUM_OF_RECORDS / RECORDS_PER_BATCH);

for (let i = 0; i < NUM_OF_BATCHES; i++) {
  const data = [];

  for (let j = 0; j < RECORDS_PER_BATCH; j++) {
    const lastName = faker.person.lastName();
    const firstName = faker.person.firstName();
    const email = faker.internet.email();
    const genderArr = ["male", "female", "non-binary", "other", "unknown"];
    const gender = genderArr[Math.floor(Math.random() * genderArr.length)];
    const dob = faker.date.past({ years: 90 }).toISOString().split("T")[0]; // ex:2000-01-01
    data.push([lastName, firstName, dob, gender, email]);
  }

  const text = `
  INSERT INTO patients (last_name, first_name, birth_date, gender, email)
  VALUES ($1, $2, $3, $4, $5)`;

  // to be continue ...

  // await conn.query(text, data); // 200 invocations versus the
}

// const lastName = faker.person.lastName();
// const firstName = faker.person.firstName();
// const email = faker.internet.email();

// const genderArr = ["male", "female", "non-binary", "other", "unknown"];

// const gender = genderArr[Math.floor(Math.random() * genderArr.length)];

// const dob = faker.date.past({ years: 90 }).toISOString().split("T")[0]; // ex:2000-01-01

// const text = `
//   INSERT INTO patients (last_name, first_name, birth_date, gender, email)
//   VALUES ($1, $2, $3, $4, $5)`;

// const data = [lastName, firstName, dob, gender, email];

// await conn.query(text, data);

// if (i > 0) {
//   if (i % 1000 === 0) {
//     console.log(`${i} rows processed`);
//   }
// }
