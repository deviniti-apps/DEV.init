typedef Function0<R> = R Function<R>();

abstract class Either<L, R> {
  const Either();

  B fold<B>(B ifLeft(L l), B ifRight(R r));

  Either<L, R> orElse(Either<L, R> other()) => fold((_) => other(), (_) => this);

  R getOrElse(R dflt()) => fold((_) => dflt(), id);

  R operator |(R dflt) => getOrElse(() => dflt);

  Either<L2, R> leftMap<L2>(L2 f(L l)) => fold((l) => left(f(l)), right);

  bool isLeft() => fold((_) => true, (_) => false);

  bool isRight() => fold((_) => false, (_) => true);

  Either<R, L> swap() => fold(right, left);

  //ignore: avoid_types_on_closure_parameters
  Either<L, R2> map<R2>(R2 f(R r)) => fold(left, (R r) => right(f(r)));
}

class Left<L, R> extends Either<L, R> {
  const Left(this._l);

  final L _l;

  L get value => _l;

  @override
  B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifLeft(_l);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(other) => other is Left && other._l == _l;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  const Right(this._r);

  final R _r;

  R get value => _r;

  @override
  B fold<B>(B ifLeft(L l), B ifRight(R r)) => ifRight(_r);

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(other) => other is Right && other._r == _r;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => _r.hashCode;
}

Either<L, R> left<L, R>(L l) => Left(l);

Either<L, R> right<L, R>(R r) => Right(r);

Either<dynamic, A> catching<A>(Function0<A> thunk) {
  try {
    return right(thunk());
  } on Exception catch (e) {
    return left(e);
  }
}

A id<A>(A a) => a;
