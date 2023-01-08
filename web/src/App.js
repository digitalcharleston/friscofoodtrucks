import { useState } from 'react';

import Header from './components/Header';
import Filters from './components/Filters';
import Trucks from './components/Trucks';
import Footer from './components/Footer';

const App = () => {
  const [filter, setFilter] = useState('');

  return (
    <div className="col-lg-8 mx-auto p-4 py-md-5">
      <Header />
      <main>
        <Filters filter={filter} setFilter={setFilter} />
        <Trucks filter={filter} />
      </main>
      <Footer />
    </div>
  );
};

export default App;
