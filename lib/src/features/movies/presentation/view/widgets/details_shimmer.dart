part of '../movies_page.dart';

class MovieDetailShimmer extends StatelessWidget {
  const MovieDetailShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(50.w, 12),
                bottomRight: Radius.elliptical(50.w, 12)),
            child: Row(
              children: [(size.height * .7).ph],
            ),
          ),
        ),
        18.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .75,
              height: 18.h,
            ),
          ),
        ),
        18.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .65,
              height: 18.h,
            ),
          ),
        ),
        30.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .3,
              height: 18.h,
            ),
          ),
        ),
        18.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .65,
              height: 12.h,
            ),
          ),
        ),
        5.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .65,
              height: 12.h,
            ),
          ),
        ),
        5.h.ph,
        Shimmer.fromColors(
          baseColor: Colors.grey.shade500.withOpacity(.4),
          highlightColor: Colors.white60,
          child: Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: size.width * .65,
              height: 12.h,
            ),
          ),
        ),
      ],
    );
  }
}
