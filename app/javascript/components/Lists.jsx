import React from 'react'

const Links = ({ links }) => {
  return (
    <div className="container">
      <table className="table">
        <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col">Original Link</th>
            <th scope="col">Shortened Link</th>
          </tr>
        </thead>
        <tbody>
          {
            links.map(({ url, id, slug }) => (
              <tr key={id}>
                <th scope="row" style={{ cursor: "pointer" }}>&#128204;</th>
                <td>{ url }</td>
                <td>https://short.is/{ slug }</td>
              </tr>
            ))
          }
        </tbody>
      </table>
    </div>
  )
}

export default Links;