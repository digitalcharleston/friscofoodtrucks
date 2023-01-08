import { useEffect } from 'react';
import { useState } from 'react';
import Truck from './Truck';

const Trucks = ({ filter }) => {
  const [trucks, setTrucks] = useState([]);

  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_URL}/trucks`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ filter }),
    })
      .then((response) => response.json())
      .then((data) => setTrucks(data.data));
  }, [filter]);
  return (
    <main>
      <div className="col-md-12">
        {trucks.map((truck) => (
          <Truck key={truck.id} truck={truck} />
        ))}
      </div>
    </main>
  );
};

export default Trucks;
