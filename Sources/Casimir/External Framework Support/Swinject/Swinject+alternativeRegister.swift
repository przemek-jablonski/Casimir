#if canImport(Swinject)
import Swinject

public extension Container {
  func register<Service>(
    type: Service.Type,
    scoped: ObjectScope,
    factory: @escaping (Resolver) -> Service
  ) {
    register(type, factory: factory).inObjectScope(scoped)
  }

  func register<Service, Arg1>(
    type: Service.Type,
    scoped: ObjectScope,
    factory: @escaping (Resolver,
                        Arg1) -> Service
  ) {
    register(type, factory: factory).inObjectScope(scoped)
  }

  func register<Service, Arg1, Arg2>(
    type: Service.Type,
    scoped: ObjectScope,
    factory: @escaping (Resolver, Arg1, Arg2) -> Service
  ) {
    register(type, factory: factory).inObjectScope(scoped)
  }
}
#endif
