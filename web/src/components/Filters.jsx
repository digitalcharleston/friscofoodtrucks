import searchIcon from '../images/search-icon.svg';

const Filters = ({ filter, setFilter }) => (
  <form>
    <div className="mb-3">
      <div className="input-group">
        <div className="input-group-text">
          <img src={searchIcon} alt="search" style={{ height: 16, width: 16 }} />
        </div>
        <input
          autoFocus
          type="text"
          className="form-control"
          id="filter"
          aria-describedby="filter"
          value={filter}
          onChange={(e) => setFilter(e.target.value.trim())}
        />
      </div>
    </div>
  </form>
);

export default Filters;
