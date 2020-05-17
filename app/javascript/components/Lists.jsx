import React, { useState } from 'react'

const Links = props => {
  const [links, setLinks] = useState(props.links);

  const handleClick = (slug) => {
    fetch(`/links/${slug}`, {
      method: "PATCH",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ "link": { "pinned": true } })
    }).then(res => res.json()).then(res => setLinks(res.links))
  }

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
            links.map(({ url, id, slug, pinned }) => (
              <tr key={id} className={ pinned ? "text-white bg-info" : "" }>
                <th
                  scope="row"
                  style={{ cursor: "pointer" }}
                  onClick={() => handleClick(slug)}
                >
                  &#128204;
                </th>
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