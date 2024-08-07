import 'all.dart';

extension CustomSpacing on num {
  SizedBox get verticalSpace => SizedBox(height: this.toDouble());
  SizedBox get horizontalSpace => SizedBox(width: this.toDouble());
  SliverToBoxAdapter get verticalSpaceSliver => SliverToBoxAdapter(child: SizedBox(height: this.toDouble()));
  SliverToBoxAdapter get horizontalSpaceSliver => SliverToBoxAdapter(child: SizedBox(width: this.toDouble()));
}