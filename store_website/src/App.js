import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom'

import Main from './Screens/Main'
import Header from './Screens/Header'
import Footer from './Screens/Footer'
function App() {
  return (
    <div className="App">
      <Header />
     <BrowserRouter>
        <Route exact path='/' component={Main} />
      </BrowserRouter>
      <Footer />
    </div>
  );
}

export default App;
