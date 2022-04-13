abstract class Mapper<Element, Return> {
  Return map(Element element);
}

abstract class MapperArg<Element, Return, Argument> {
  Return map(Element element, Argument argument);
}
