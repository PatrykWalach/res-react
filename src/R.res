let flatMapError = (result, fn) =>
  switch result {
  | Belt.Result.Ok(value) => Ok(value)
  | Error(value) => fn(value)
  }

let mapError = fn => flatMapError(_, value => Belt.Result.Error(fn(value)))

let t = Error(12)->flatMapError(_ => Ok("12"))
