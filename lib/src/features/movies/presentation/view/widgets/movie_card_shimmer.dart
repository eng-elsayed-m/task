part of '../movies_page.dart';

class MovieShimmerCard extends StatelessWidget {
  const MovieShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          clipBehavior: Clip.hardEdge,
          color: Colors.grey.shade500.withOpacity(.3),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(28.w),
            child: Image.asset(
              AppImages.moviePlaceHolder,
              // height: 190.h,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        context.theme.scaffoldBackgroundColor.withOpacity(.7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Text(
                      '0.0',
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        context.theme.scaffoldBackgroundColor.withOpacity(.7),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: context.theme.colorScheme.secondary,
                      )),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade600,
            highlightColor: Colors.white70,
            enabled: true,
            child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Row(
                children: [30.ph],
              ),
            ),
          ),
        )
      ],
    );
  }
}
