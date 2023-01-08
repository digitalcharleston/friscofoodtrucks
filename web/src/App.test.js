import { render, screen } from '@testing-library/react';
import App from './App';

test('renders the header', () => {
  render(<App />);
  const headerText = screen.getByText(/Frisco Food Trucks/i);
  expect(headerText).toBeInTheDocument();
});

test('renders the footer', () => {
  render(<App />);
  const footerText = screen.getByText(/Created with ❤️ for the folks at Estee/i);
  expect(footerText).toBeInTheDocument();
});
