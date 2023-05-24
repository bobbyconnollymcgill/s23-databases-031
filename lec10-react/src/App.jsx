import { useState, useEffect } from "react";

import "./App.css";

export function App() {
  const [imageUrl, setImageUrl] = useState("");

  const getImage = () => {
    fetch("https://cataas.com/cat?json=true")
      .then((response) => {
        return response.json();
      })
      .then((json) => {
        console.log("json", json);
        setImageUrl(json.url);
      });
  };

  useEffect(() => {
    getImage();
  }, []);

  return (
    <div>
      <button
        onClick={() => {
          getImage();
        }}
      >
        Get another cat
      </button>
      <img src={`https://cataas.com${imageUrl}`} />
    </div>
  );
}
