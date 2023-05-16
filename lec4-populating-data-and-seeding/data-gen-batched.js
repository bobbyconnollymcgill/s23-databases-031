import { faker } from "@faker-js/faker";
import pg from "pg";

let str = "";
for (let k = 0; k < 5000; k++) {
  str += `($${k * 5 + 1}, $${k * 5 + 2}, $${k * 5 + 3}, $${k * 5 + 4}, $${
    k * 5 + 5
  }),`;
}

let modifiedStr = str.slice(0, -1);

const text =
  `
INSERT INTO patients (last_name, first_name, birth_date, gender, email)
VALUES ` + modifiedStr;

const client = new pg.Client({
  host: "localhost",
  port: 5432,
  database: "test_gen",
  user: "postgres",
  password: "password",
});

await client.connect();

const NUM_OF_RECORDS = 1000000;
const RECORDS_PER_BATCH = 5000;

const NUM_OF_BATCHES = Math.floor(NUM_OF_RECORDS / RECORDS_PER_BATCH);

for (let i = 1; i <= NUM_OF_BATCHES; i++) {
  let data = [];

  for (let j = 1; j <= RECORDS_PER_BATCH; j++) {
    const lastName = faker.person.lastName();
    const firstName = faker.person.firstName();
    const email = faker.internet.email();
    const genderArr = ["male", "female", "non-binary", "other", "unknown"];
    const gender = genderArr[Math.floor(Math.random() * genderArr.length)];
    const dob = faker.date.past({ years: 90 }).toISOString().split("T")[0]; // ex:2000-01-01
    data = data.concat([lastName, firstName, dob, gender, email]);
  }

  await client.query(text, data); // 200 invocations versus the

  console.log(`Batch ${i} pushed`);
}
