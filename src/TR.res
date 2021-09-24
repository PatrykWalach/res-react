type taskResult<'l, 'r> = unit => Promise.t<Belt.Result.t<'l, 'r>>

let map = (taskResult, fn, ()) => taskResult()->Promise.thenResolve(Belt.Result.map(_, fn))

let flatMap = (taskResult, fn, ()) =>
  taskResult()->Promise.then(result =>
    switch result {
    | Ok(value) => fn(value)()
    | Error(value) => Promise.resolve(Error(value))
    }
  )

let make = (value, ()) => Promise.resolve(Ok(value))

let flatMapFirst = fn =>
  flatMap(_, value =>
    make(
      switch fn(value) {
      | Error(value) => Error(value)
      | Ok(_) => Ok(value)
      },
    )
  )
