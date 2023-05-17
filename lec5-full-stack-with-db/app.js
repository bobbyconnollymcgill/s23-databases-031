import express from "express";
import db from "./db.js";
import animalsRouter from "./routes/animals.js";
// import enclosuresRouter from "./routes/enclosures.js";
// import staffRouter from "./routes/staff.js";

const app = express();
app.use(express.json());
// app.use(express.urlencoded({ extended: false }));

// Using the routers
app.use("/animals", animalsRouter);
// app.use("/enclosures", enclosuresRouter);
// app.use("/staff", staffRouter);

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
