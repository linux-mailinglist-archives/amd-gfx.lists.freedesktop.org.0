Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOSDHfv+gmmagQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:35 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5DE2F86
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4010E555;
	Wed,  4 Feb 2026 08:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i69R149b";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97810E764
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:57 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-64b6f896689so583600a12.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770145016; x=1770749816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcsHykae6qG2zsboDKqK9u6avGg/+VQbgr8PaYkpraM=;
 b=i69R149bu0/tXcNw1NQAMVGHuEiyNCVQl1WUiPX8dYoL65gOAUG4Q8qEDZB/QjjFrW
 vLS2Gd5Makd3k5Y2n9Mkfx+xYI3gRjNLbqDTo9OjK6S/wt710KzEtBhleKbyugt+ebEl
 RD6+M4U/wwPQNF0VZJAIVwLLqSeZGACPFnhJopP3ixeHlbpoP+1V8QlENPGRTrG4Y36y
 q4mbRNZ/kmZuDvQXf/p/dfBlti6ikyB+pz4keJUnX5Hg3igtYHpRFWVbTcnpTnnSuXYb
 vRdRsVOlBu+BZKWwlY4BeZrlsipY/V62AzKzfoKSn/zvloNMoBJlaFIAthp70cSs6Bod
 0saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770145016; x=1770749816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dcsHykae6qG2zsboDKqK9u6avGg/+VQbgr8PaYkpraM=;
 b=MccfAKeHu8JjDZIavEN74Qr1abk+4iqjhb531kh8MVv/6gwjkZEpxo4q//SvNQnaUn
 jCPwc9FtzUWIzoatHfvkXzlgeZ1zuDg1L5EG9NopOT4j0E2crlWyhElZHvI8v1est3jG
 yfAUlXS/g7sK1bjjVZHbrw0o9tO6+CNCm4AR6RXDIJbRzUNwpTqNA+WqwFwyxo8maFz9
 j7zuKCR3Z4Lvg0SwiPYUFfFkHJNl4PYIS53GVfZPG+tk6uCDyCOPur1R4Quutiowf02F
 0EJxsvNyFQbwD3vvUVDXS25MBI3kHU0d9vSW38+aBzzLKg1b+/jSChRripnP46+FSiF/
 sV9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5TVoxf2pjx7CnJDdrDw6u2fuuE6IqSez7O9Kv/BEuK5sUvMm0JNFPcw6R0RA1n+ec6TOS5sQ3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziKAC65Vvsz6dpoPhHE1OwtGrZtlhZntE5PxuCI1XZNHeZZCSS
 KMgwamgA/h9Ilytaw54LVSnDP2N7ky2MlfYhyZeLlgtsDOw2j7XvuHOV
X-Gm-Gg: AZuq6aJ3sRzEPZ8fLVylvNI4gLsf8st2iJ0kzkScQB00F0FRxKQGbycIsAlBAR8DyWp
 dJ0Rqj+A8XMUlOjAVzgIfJ0x/WpgBy14gkYuGuX3RbmA7U0ckFEsICBVfRu8X3U23SejUu79INk
 5s61QK/i8yVWTjGu+Q/6ktHmTiNJTMl9C9uxR5u6LcJPR4QsJKWBbGrv3r08JHjw1mPAKwcZh9s
 IeWi94Is/LI4DrarwjUi4GTGepSICGRk62YE2lWM+pq4DS++F0DOGPA6ER6Y9T/RKTTX04dY18a
 wIYCVfnmhlOnw9VZAhSDItT51NplLQOrgpPC8ab/Qpi9pta0TGeeGGkDQyvxHJaqR9VAqxwzifd
 xSmYgRjauRMZaH6fi632XMcdOUF5CSVtF/hnE1gRcpPQmnGhU7dkHkeVSqFYGtaBOv+bk93qlUL
 ha+L6kpSxbhn3qQejtH3/Az2ycRpiTdptIMk2QjoLB2mlQGitdRoCa62FFP7d3gYNl
X-Received: by 2002:a05:6402:2790:b0:655:b07e:95c8 with SMTP id
 4fb4d7f45d1cf-6594a1ed7b5mr222788a12.8.1770145015634; 
 Tue, 03 Feb 2026 10:56:55 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:55 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 18/19] drm/amd/display: Enable HDMI VRR
Date: Tue,  3 Feb 2026 19:56:25 +0100
Message-ID: <20260203185626.55428-19-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Feb 2026 08:10:21 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 21A5DE2F86
X-Rspamd-Action: no action

[Why]
We'd like to expose VRR functionality to end user if HDMI sink is
advertising it's support.

[How]
VTEM info frame is used to signal HDMI sink that VRR is active.
Use VTEM info packet as vrr_infopacket

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 ++++++++++++---
 .../drm/amd/display/modules/freesync/freesync.c   |  4 ++++
 .../drm/amd/display/modules/inc/mod_info_packet.h |  1 +
 .../amd/display/modules/info_packet/info_packet.c |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ab01a45aef1c..6f841c84d114 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9620,7 +9620,10 @@ static void update_freesync_state_on_stream(
 
 	aconn = (struct amdgpu_dm_connector *)new_stream->dm_stream_context;
 
-	if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
+	if (aconn && aconn->as_type == ADAPTIVE_SYNC_TYPE_HDMI)
+		packet_type = PACKET_TYPE_VTEM;
+
+	else if (aconn && (aconn->as_type == ADAPTIVE_SYNC_TYPE_PCON_ALLOWED ||
 		      aconn->vsdb_info.replay_mode)) {
 		pack_sdp_v1_3 = aconn->pack_sdp_v1_3;
 
@@ -13380,8 +13383,14 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		}
 
 	/* HDMI */
-	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
-		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr.supported) {
+			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_HDMI;
+			monitor_range_from_hdmi(&connector->display_info, &vsdb_info);
+		} else if (vsdb_info.freesync_supported)
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 
 	/* DP -> HDMI PCON */
diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 1aae46d703ba..db197cf048e1 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -27,6 +27,7 @@
 #include "dc.h"
 #include "mod_freesync.h"
 #include "core_types.h"
+#include "mod_info_packet.h"
 
 #define MOD_FREESYNC_MAX_CONCURRENT_STREAMS  32
 
@@ -955,6 +956,9 @@ void mod_freesync_build_vrr_infopacket(struct mod_freesync *mod_freesync,
 		return;
 
 	switch (packet_type) {
+	case PACKET_TYPE_VTEM:
+		mod_build_vtem_infopacket(stream, vrr, infopacket);
+		break;
 	case PACKET_TYPE_FS_V3:
 		build_vrr_infopacket_v3(stream->signal, vrr, app_tf, infopacket, stream->freesync_on_desktop);
 		break;
diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
index 07e86b16ef77..ca7c5542620d 100644
--- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
+++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
@@ -60,6 +60,7 @@ enum adaptive_sync_type {
 	ADAPTIVE_SYNC_TYPE_PCON_ALLOWED     = 2,
 	ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED = 3,
 	ADAPTIVE_SYNC_TYPE_EDP              = 4,
+	ADAPTIVE_SYNC_TYPE_HDMI             = 5,
 };
 
 enum adaptive_sync_sdp_version {
diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index b08b52bba574..5fd9e8aadc98 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -722,6 +722,7 @@ void mod_build_adaptive_sync_infopacket(const struct dc_stream_state *stream,
 		break;
 	case ADAPTIVE_SYNC_TYPE_NONE:
 	case ADAPTIVE_SYNC_TYPE_PCON_NOT_ALLOWED:
+	case ADAPTIVE_SYNC_TYPE_HDMI:
 	default:
 		break;
 	}
-- 
2.52.0

