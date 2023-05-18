import express from "express";
import cookieParser from "cookie-parser";

import db from "./db.js";
import animalsRouter from "./routes/animals.js";
// import enclosuresRouter from "./routes/enclosures.js";
// import staffRouter from "./routes/staff.js";
import signUpSignIn from "./routes/signInSignUp.js";

import authMiddleware from "./authMiddleware.js";

const app = express();

app.use(express.static("public", { extensions: ["html"] }));

app.use(cookieParser()); // req.cookies
app.use(express.json()); // req.body
app.use(express.urlencoded({ extended: false })); // req.query

// Using the routers
app.use("/animals", authMiddleware, animalsRouter);
// app.use("/enclosures", enclosuresRouter);
// app.use("/staff", staffRouter);

app.use("/", signUpSignIn);

app.get("/me", authMiddleware, async (req, res) => {
  const { rows } = await db.query("SELECT * FROM users WHERE id = $1", [
    req.user_id,
  ]);
  res.json(rows[0]);
});

app.get("/test", (req, res) => {
  res.send("Zoo Management API is running!");
});

const port = process.env.PORT || 3000;

db.connect()
  .then(() => {
    app.listen(port, () => {
      console.log(`Zoo Management API listening on port ${port}`);
    });
  })
  .catch((err) => {
    console.error("Failed to establish connection with the database:", err);
    process.exit(1); // Exit the process with 'failure' status code
  });
