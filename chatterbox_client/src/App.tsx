import { Suspense, useEffect, useState } from 'react'
import './App.css'
import axios from 'axios'

// const testFetch = () => {
//   
// }

const App = () => {
  const [data, setData] = useState('')

  useEffect(() => {
    axios
      .get('localhost:4000/api/feeds')
      .then(res => {
        setData(res.data)
      })
      .catch(err => {
        console.error(err)
      })
  }, [])

  return (
    <>
      <Suspense fallback="Loading...">
        <p>
          {data}
        </p>
      </Suspense>
    </>
  )
}

export default App
