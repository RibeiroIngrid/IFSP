import React, { useState, useEffect } from 'react';
import './App.css';

function TodoApp() {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    const fetchTodos = async () => {
      const response = await fetch('https://dummyjson.com/todos');
      const data = await response.json();
      setTodos(data.todos);
    };
    fetchTodos();
  }, []);

  const handleToggleComplete = (id) => {
    setTodos(todos.map((todo) =>
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ));
  };

  return (
    <div className="App">
      <h1>Lista de Tarefas</h1>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id} className={todo.completed ? 'completed' : ''}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => handleToggleComplete(todo.id)}
            />
            {todo.todo}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TodoApp;

