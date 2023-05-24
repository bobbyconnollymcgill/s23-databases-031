import React from "react";
import ReactDOM from "react-dom/client";
import { App } from "./App.jsx";
import "./index.css";

// SPA react projects need to do this thing to "turn on React"
ReactDOM.createRoot(document.getElementById("root")).render(<App />);
