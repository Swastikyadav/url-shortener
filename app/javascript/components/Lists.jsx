import React, { useState } from 'react'

const Links = props => {
  const [links, setLinks] = useState(props.links);

  const handlePinClick = (slug) => {
    fetch(`/links/${slug}`, {
      method: "PATCH",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ "link": { "pinned": true } })
    }).then(res => res.json()).then(res => setLinks(res.links))
  }

  const handleLinkClick = (slug) => {
    fetch(`/links/${slug}.json`, {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content
      }
    }).then(res => res.json()).then(res => window.open(res.original_url));
  }  

  return (
    <div className="container">
      <table className="table">
        <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col">Original Link</th>
            <th scope="col">Shortened Link</th>
            <th scope="col">Clicked Count</th>
          </tr>
        </thead>
        <tbody>
          {
            links.map(({ url, id, slug, pinned, clicked }) => (
              <tr key={id} className={ pinned ? "text-white bg-info" : "" }>
                <th
                  scope="row"
                  style={{ cursor: "pointer" }}
                  onClick={() => handlePinClick(slug)}
                >
                  &#128204;
                </th>
                <td>{ url }</td>
                <td onClick={() => handleLinkClick(slug)}>
                  {window.location.origin}/links/{ slug }
                </td>
                <td>{clicked}</td>
              </tr>
            ))
          }
        </tbody>
      </table>
    </div>
  )
}

export default Links;