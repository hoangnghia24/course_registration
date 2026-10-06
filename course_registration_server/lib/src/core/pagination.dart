typedef PageWindow = ({int limit, int offset});

abstract final class Pagination {
  static const defaultPageSize = 50;
  static const maximumPageSize = 100;

  static PageWindow window({int page = 1, int pageSize = defaultPageSize}) {
    final safePage = page < 1 ? 1 : page;
    final safeSize = pageSize.clamp(1, maximumPageSize);
    return (limit: safeSize, offset: (safePage - 1) * safeSize);
  }
}
