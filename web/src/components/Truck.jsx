const Truck = ({ truck }) => (
  <div className="mb-2">
    <div className="fs-5">{truck.name}</div>
    {truck.location && (
      <div className="fs-7">
        <strong>Where: </strong>
        {truck.location}
      </div>
    )}
    {truck.items && (
      <div className="fs-7">
        <strong>Food: </strong>
        {truck.items}
      </div>
    )}
  </div>
);

export default Truck;
