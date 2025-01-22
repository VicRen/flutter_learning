# flutter_learning

**工程目录结构：**

```
lib/
├── features/         // 功能模块 (Features)
│   └── splash/       // Splash 功能模块
│       ├── data/         // Splash 的数据层
│       │   ├── datasources/ // 数据源接口和实现
│       │   │   └── remote/
│       │   │       ├── splash_auth_remote_data_source.dart // DataSource 接口
│       │   │       └── splash_auth_remote_data_source_impl.dart // DataSource 实现
│       │   └── repositories/ // 仓库接口和实现
│       │       └── splash_auth_repository_impl.dart // Repository 实现
│       ├── domain/       // Splash 的领域层
│       │   ├── entities/ // 实体
│       │   │   └── splash_user.dart
│       │   ├── repositories/ // 仓库接口
│       │   │   └── splash_auth_repository.dart
│       │   └── usecases/ // 用例
│       │       └── auto_login_user.dart
│       ├── presentation/   // 表现层 (UI)
│       │   ├── bloc/      // BLoC 状态管理
│       │   │   ├── splash_bloc.dart
│       │   │   ├── splash_event.dart
│       │   │   └── splash_state.dart
│       │   ├── navigation/ // 特有的导航逻辑
│       │   │   └── splash_navigation_service.dart
│       │   ├── pages/   // 页面
│       │       └── splash_page.dart
│       │   └── widgets/ // 组件
│       │        └── splash_widget.dart
│       └── splash_feature.dart // 导出 Splash 模块的组件
│   └── home/         // Home 功能模块 (结构类似 splash)
│       ├── data/
│       │   ├── datasources/
│       │   │   └── remote/
│       │   │       ├── home_remote_data_source.dart
│       │   │       └── home_remote_data_source_impl.dart
│       │   └── repositories/
│       │       └── home_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── home_entity.dart
│       │   ├── repositories/
│       │   │   └── home_repository.dart
│       │   └── usecases/
│       │       └── get_home_data.dart
│       ├── presentation/   // 表现层 (UI)
│       │   ├── bloc/      // BLoC 状态管理
│       │   │   ├── home_bloc.dart
│       │   │   ├── home_event.dart
│       │   │   └── home_state.dart
│       │   ├── navigation/ // 特有的导航逻辑
│       │   │   └── home_navigation_service.dart
│       │   ├── pages/   // 页面
│       │       └── home_page.dart
│       │   └── widgets/ // 组件
│       │        └── home_widget.dart
│       └── home_feature.dart // 导出 Home 模块的组件
├── shared/         // 共享代码
│   ├── data/     // 共享数据层
│   │   └── models/ // 数据模型
│   │       └── user_model.dart
│   └── domain/   //共享实体
│       └── entities/
│           └── user.dart  // 仅在需要共享 User 实体时存在
├── common/         // 通用代码
│   ├── navigation/ // 通用导航服务
│   │   └── navigation_service.dart
│   ├── constants/ // 常量
│   │   └── app_constants.dart
│   ├── extensions/ // 扩展方法
│   │   └── string_extensions.dart
│   ├── theme/     // 主题
│   │   └── app_theme.dart
│   ├── utils/     // 工具类
│   │   └── date_formatter.dart
│   └── widgets/   // 通用组件
│       ├── buttons/
│       │   └── primary_button.dart
│       ├── text_fields/
│       │   └── custom_text_field.dart
│       └── loading/
│           └── loading_indicator.dart
├── core/           // 核心代码
│   ├── domain/
│   │   └── usecases/   // 通用用例抽象
│   │       └── use_case.dart
│   └── error/     // 错误处理
│       └── exceptions.dart
├── infrastructure/ // 基础设施层
│   ├── network/   // 网络请求
│   │   └── api_client.dart
│   └── local_storage/ //本地存储
│       └── shared_preferences_service.dart
├── router/         // 路由
│   ├── app_router.dart
│   └── route_name.dart
├── locator.dart    // 依赖注入
└── main.dart       // 应用入口
```

**目录作用说明：**

*   **`features/`：** 包含应用程序的所有功能模块。
    *   **`splash/` 和 `home/` (范式)：**
        *   **`data/`：** 该 Feature 的数据层，包含数据访问的接口和实现。
            *   **`datasources/`：** 数据源的接口和实现。
                *   **`remote/`：** 远程数据源的接口和实现。
            *   **`repositories/`：** 仓库的实现。
        *   **`domain/`：** 该 Feature 的领域层，包含业务逻辑和领域模型。
            *   **`entities/`：** 定义领域实体。
            *   **`repositories/`：** 定义仓库接口。
            *   **`usecases/`：** 定义用例。
        *   **`presentation/`：** 负责 UI 的展示和用户交互。
            *   **`bloc/`：** 使用 BLoC 模式管理 UI 状态。
            *   **`navigation/`：** 封装该 Feature 特有的导航逻辑。
            *   **`pages/`：** 实现 UI 页面。
            *   **`widgets/`：** 定义该 Feature 内部可复用的 UI 组件。
        *   **`*_feature.dart`：** 用于导出该 Feature 的公共组件。
*   **`shared/`：** 包含不同 Feature 之间共享的代码。
*   **`common/`：** 包含通用的代码。
*   **`core/`：** 包含应用程序的核心代码。
*   **`infrastructure/`：** 基础设施层。
*   **`router/`：** 路由。
*   **`locator.dart`：** 依赖注入。
*   **`main.dart`：** 应用入口。

**针对 `features` 结构的范式讲解：**

每个 Feature（例如 `splash` 和 `home`）都应该遵循相同的结构，这使得代码更加一致和易于理解。一个 Feature 通常包含以下几个部分：

*   **`data/`：** 这是该 Feature 的数据层，包含数据访问的接口和实现。
    *   **`datasources/`：** 包含数据源的接口和实现。
        *   **`remote/`：** 包含远程数据源的接口和实现。例如，`splash_auth_remote_data_source.dart` 定义接口，`splash_auth_remote_data_source_impl.dart` 实现接口。
    *   **`repositories/`：** 包含仓库的实现。例如，`splash_auth_repository_impl.dart` 实现了 `domain` 层定义的 `splash_auth_repository.dart` 接口。

*   **`domain/`：** 这是 Feature 的核心，包含业务逻辑和领域模型。它完全独立于任何外部依赖（UI、数据访问等）。
    *   **`entities/`：** 定义该 Feature 的领域实体。
    *   **`repositories/`：** 定义该 Feature 需要的仓库接口。
    *   **`usecases/`：** 定义该 Feature 的用例。

*   **`presentation/`：** 负责 UI 的展示和用户交互。
    *   **`bloc/`：** 使用 BLoC 模式管理

**关键设计原则：**

*   **Clean Architecture：** 严格遵循依赖倒置原则，使代码职责清晰，易于维护和测试。
*   **模块化：** 每个 Feature 都是一个独立的模块，最大限度地减少模块之间的依赖。
*   **关注点分离：** 将不同的关注点分离到不同的层或模块中。
*   **可测试性：** 通过依赖注入和接口，使代码更易于进行单元测试。

