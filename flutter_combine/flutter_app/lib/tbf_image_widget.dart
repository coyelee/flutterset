import 'package:flutter/material.dart';

class TbImageWidget extends StatefulWidget {

  // GIF标签
  static const String tagGif = "GIF";

  // 长图标签
  static const String tagLongImage = "长图";

  // 顶部左边的是否有圆角
  static const int borderTopLeft = 0x01;

  // 顶部右边的是否有圆角
  static const int borderTopRight = 0x02;

  // 底部左边的是否有圆角
  static const int borderBottomLeft = 0x04;

  // 底部右边的是否有圆角
  static const int borderBottomRight = 0x08;

  // 四角均圆角
  static const int borderAll = 0xff;

  // 四角均非圆角
  static const int borderNone = 0x00;

  // 图片地址
  final String url;

  // 缩放系数
  final double scale;

  // 图片语义描述
  final String semanticLabel;

  // 是否包含在semantic内
  final bool excludeFromSemantics;

  // 宽度
  final double width;

  // 高度
  final double height;

  // 颜色
  final Color color;

  // 混合模式
  final BlendMode colorBlendMode;

  // 裁剪策略
  final BoxFit fit;

  // 位置对齐
  final AlignmentGeometry alignment;

  // 图片重复显示
  final ImageRepeat repeat;

  // 点九图中心显示区域
  final Rect centerSlice;

  // 图片绘制方向
  final bool matchTextDirection;

  // 当图片provider更改的间隙时间内，是否显示旧图
  final bool gaplessPlayback;

  // 图片质量
  final FilterQuality filterQuality;

  // HTTP请求头部
  final Map<String, String> headers;

  // 占位符颜色
  final Color placeHolderColor;

  // 圆角大小
  final double borderRadiusSize;

  // 圆角标志
  final int borders;

  // 点击事件
  final VoidCallback onPressed;

  // 标签名称
  final String tagName;

  // 更多提示
  final int moreNum;

  TbImageWidget({
    Key key,
    @required this.url,
    this.onPressed,
    this.scale = 1.0,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.placeHolderColor,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
    this.borderRadiusSize = 10,
    this.borders = borderNone,
    this.tagName,
    this.moreNum,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.headers,
  }) : super(key: key);

  @override
  State createState() => _TbImageWidgetState();
}

class _TbImageWidgetState extends State<TbImageWidget> {

  // url为空时默认图
  static const String defaultUrl = "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiyudiItp3hAhXnFqYKHWtAB24QjRx6BAgBEAU&url=https%3A%2F%2Fwww.coolapk.com%2Fapk%2Fcom.baidu.tieba%3Ft%3Dcomment%26p%3D29&psig=AOvVaw3WowWoKxHqZaNNd9GqH9E3&ust=1553607757959151";

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List<Widget>();
    // 图片
    children.add(_getBaseImageWidget());
    // 标签
    if (widget.tagName != null) {
      children.add(_getTagWidget());
    }
    // 更多
    if (widget.moreNum != null) {
      children.add(_getMoreTipWidget());
    }
    return GestureDetector(
        onTap: widget.onPressed,
        child: Stack(
          children: children,
        )
    );
  }

  /// 获取基本的图片
  Widget _getBaseImageWidget() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.33),
          borderRadius: _getBorderRadius(),
        ),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: _getBorderRadius(),
          color: _getPlaceHolderColor(),
          child: Image.network(
            widget.url ?? defaultUrl,
            scale: widget.scale,
            semanticLabel: widget.semanticLabel,
            excludeFromSemantics: widget.excludeFromSemantics,
            width: widget.width,
            height: widget.height,
            color: widget.color,
            colorBlendMode: widget.colorBlendMode,
            fit: widget.fit,
            alignment: widget.alignment,
            repeat: widget.repeat,
            centerSlice: widget.centerSlice,
            matchTextDirection: widget.matchTextDirection,
            gaplessPlayback: widget.gaplessPlayback,
            filterQuality: widget.filterQuality,
            headers: widget.headers,
          ),
        ));
  }

  /// 获取标签
  Widget _getTagWidget() {
    return Positioned(
      bottom: 5.3,
      right: 5.3,
      child: Container(
        padding: const EdgeInsets.only(
            left: 6.0, top: 3.0, right: 6.0, bottom: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.3)),
          color: Colors.black12,
        ),
        child: Text(
          widget.tagName,
          style: TextStyle(
              inherit: true,
              color: Colors.blueAccent,
              fontSize: 8.0),
        ),
      ),
    );
  }

  /// 获取更多提示
  Widget _getMoreTipWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
        color: Colors.black38,
      ),
      child: Text(
        "+${widget.moreNum}",
        style: TextStyle(
          inherit: true,
          color: Colors.orangeAccent,
          fontSize: 17.0,
        ),
      ),
    );
  }

  /// 获取圆角设置
  BorderRadius _getBorderRadius() {
    return BorderRadius.only(
      topLeft: widget.borders & TbImageWidget.borderTopLeft > 0 ? Radius.circular(widget.borderRadiusSize) : Radius.zero,
      topRight: widget.borders & TbImageWidget.borderTopRight > 0 ? Radius.circular(widget.borderRadiusSize) : Radius.zero,
      bottomLeft: widget.borders & TbImageWidget.borderBottomLeft > 0 ? Radius.circular(widget.borderRadiusSize) : Radius.zero,
      bottomRight: widget.borders & TbImageWidget.borderBottomRight > 0 ? Radius.circular(widget.borderRadiusSize) : Radius.zero,
    );
  }

  /// 获取冰淇淋背景色
  Color _getPlaceHolderColor() {
    return widget.placeHolderColor ?? Colors.redAccent;
  }
}
