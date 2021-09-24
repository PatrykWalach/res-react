let flatMapFirst = fn =>
  Belt.Option.flatMap(_, value =>
    switch fn(value) {
    | None => None
    | Some(_) => Some(value)
    }
  )
