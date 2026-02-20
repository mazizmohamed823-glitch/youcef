import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/commenting_thread_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scrollpage_model.dart';
export 'scrollpage_model.dart';

/// Create a scroll page like tiktok
class ScrollpageWidget extends StatefulWidget {
  const ScrollpageWidget({
    super.key,
    required this.videoss,
    this.targetVideo,
  });

  final DocumentReference? videoss;
  final List<DocumentReference>? targetVideo;

  static String routeName = 'scrollpage';
  static String routePath = '/scrollpage';

  @override
  State<ScrollpageWidget> createState() => _ScrollpageWidgetState();
}

class _ScrollpageWidgetState extends State<ScrollpageWidget> {
  late ScrollpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScrollpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 80000),
        callback: (timer) async {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'points': FieldValue.increment(1),
              },
            ),
          });
        },
        startImmediately: false,
      );
    });
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      _model.instantTimer?.cancel();
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: 393.2,
              height: 815.73,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  StreamBuilder<List<VideosRecord>>(
                    stream: queryVideosRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<VideosRecord> pageViewVideosRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView.builder(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            0,
                                            pageViewVideosRecordList.length -
                                                1))),
                            onPageChanged: (_) async {
                              await Future.delayed(
                                Duration(
                                  milliseconds: 30000,
                                ),
                              );
                              if (FFAppState().videoindex ==
                                  _model.pageViewCurrentIndex) {
                                _model.existing = await queryVideosRecordOnce(
                                  queryBuilder: (videosRecord) => videosRecord
                                      .where(
                                        'videoRef',
                                        isEqualTo: widget!.videoss,
                                      )
                                      .where(
                                        'userRef',
                                        isEqualTo: currentUserReference,
                                      ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await VideiViewsRecord.collection
                                    .doc()
                                    .set(createVideiViewsRecordData(
                                      userRef: currentUserReference,
                                    ));

                                await widget!.videoss!.update({
                                  ...mapToFirestore(
                                    {
                                      'views': FieldValue.increment(1),
                                      'Totalviews': FieldValue.increment(1),
                                    },
                                  ),
                                });
                              }

                              safeSetState(() {});
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: pageViewVideosRecordList.length,
                            itemBuilder: (context, pageViewIndex) {
                              final pageViewVideosRecord =
                                  pageViewVideosRecordList[pageViewIndex];
                              return Stack(
                                children: [
                                  Container(
                                    width: 397.1,
                                    height: 976.6,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: 100.0,
                                      height: 877.7,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowVideoPlayer(
                                              path: functions
                                                  .convertStringToVideoPath(
                                                      pageViewVideosRecord
                                                          .videoUrl)!,
                                              videoType: VideoType.network,
                                              width: 1128.8,
                                              height: 2229.0,
                                              autoPlay: true,
                                              looping: true,
                                              showControls: true,
                                              allowFullScreen: false,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -0.9),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                                _model.instantTimer?.cancel();
                                              },
                                              child: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.94, 0.26),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            CommentingThreadWidget(
                                                          videoref:
                                                              pageViewVideosRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Icon(
                                                Icons.mode_comment,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.92, 0.77),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  currentUserPhoto,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.72, 0.72),
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.93, 0.17),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (pageViewVideosRecord
                                                        .hasLikedBy() ==
                                                    pageViewVideosRecord.likedBy
                                                        .contains(
                                                            currentUserReference)) {
                                                  await pageViewVideosRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'liked_by': FieldValue
                                                            .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                        'likes': FieldValue
                                                            .increment(-(1)),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await pageViewVideosRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'liked_by': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                        'likes': FieldValue
                                                            .increment(1),
                                                      },
                                                    ),
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.favorite_border,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.99, 0.65),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault<String>(
                                                  currentUserDisplayName,
                                                  'name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.87),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.instantTimer?.cancel();

                  context.pushNamed(HomepageWidget.routeName);
                },
                child: Icon(
                  Icons.home_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.87),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.instantTimer?.cancel();

                  context.pushNamed(StorepageWidget.routeName);
                },
                child: Icon(
                  Icons.store_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
