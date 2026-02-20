import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scrollpage_a_d_s_model.dart';
export 'scrollpage_a_d_s_model.dart';

/// Create a scroll page like tiktok
class ScrollpageADSWidget extends StatefulWidget {
  const ScrollpageADSWidget({super.key});

  static String routeName = 'scrollpageADS';
  static String routePath = '/scrollpageADS';

  @override
  State<ScrollpageADSWidget> createState() => _ScrollpageADSWidgetState();
}

class _ScrollpageADSWidgetState extends State<ScrollpageADSWidget> {
  late ScrollpageADSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScrollpageADSModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instante = InstantTimer.periodic(
        duration: Duration(milliseconds: 80000),
        callback: (timer) async {
          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'points': FieldValue.increment(3),
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
      await currentUserReference!.update(createUserRecordData(
        points: valueOrDefault<int>(
          valueOrDefault(currentUserDocument?.points, 0),
          0,
        ),
      ));
      _model.instante?.cancel();
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserRecord> scrollpageADSUserRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final scrollpageADSUserRecord = scrollpageADSUserRecordList.isNotEmpty
            ? scrollpageADSUserRecordList.first
            : null;

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
                                                pageViewVideosRecordList
                                                        .length -
                                                    1))),
                                scrollDirection: Axis.vertical,
                                itemCount: pageViewVideosRecordList.length,
                                itemBuilder: (context, pageViewIndex) {
                                  final pageViewVideosRecord =
                                      pageViewVideosRecordList[pageViewIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 100.0,
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
                                              width: 1117.1,
                                              height: 2229.0,
                                              autoPlay: true,
                                              looping: true,
                                              showControls: false,
                                              allowFullScreen: false,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
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
                                                -0.92, 0.77),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/465/600',
                                                fit: BoxFit.cover,
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
                                                    .hasLikedBy()) {
                                                  await pageViewVideosRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'liked_by': FieldValue
                                                            .arrayRemove([
                                                          scrollpageADSUserRecord
                                                              ?.reference
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
                                                          scrollpageADSUserRecord
                                                              ?.reference
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
                                                0.95, 0.19),
                                            child: Text(
                                              valueOrDefault<String>(
                                                pageViewVideosRecord.likes
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.5, 0.74),
                                            child: Text(
                                              pageViewVideosRecord.title,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.92, 0.85),
                                            child: Text(
                                              pageViewVideosRecord.description,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                        ],
                                      ),
                                    ),
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
      },
    );
  }
}
