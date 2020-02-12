# Patch Notes

## 1.0.1 (12/02/20)

 * Removed `searchable` from `Builder.addField`. Searching now requires an object from the client.
 * Added ability to create custom REST components.
 * The `id` parameter of the generated `modify` function of database objects is now of type `Dynamic` for greater flexibility.
 * Added `isPrimary` parameter to `Builder.addField` to specify what field should be the primary key in the generated database object.
 * Added `Router.remainder` function to retrieve the remaining route components as a string from the currently matched index.
 * The `Request.get` function should call `cb` with `false` even if a status code of `200` is not given. This allows for greater flexibility on finding issues on the server-side.