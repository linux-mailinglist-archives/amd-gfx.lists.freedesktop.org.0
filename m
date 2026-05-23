Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBGrEvi6EWo5pQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2026 16:34:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45555BF64A
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2026 16:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2210E306;
	Sat, 23 May 2026 14:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="VUH4jfRk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D2810E307
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 May 2026 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-953a8a3ca9;
 t=1779546477; bh=1kaQpcjlTPbJyHMMUuKsWlIGMUI6oEhhSnhxb0i36yo=;
 b=VUH4jfRkXIGUoyJ5JSNiSkugwFTjgwEzPIOtz6rSsKCWt6ipgpr6uLiEenlxdK6EQUdePyOfy
 DYOv2+BP1bofXPPmQ14bS8U17uQG9vg1quPTy4WQEsE36FMm9YGt5d92wwcMyBYCMqP2ImEjmJV
 mslWDjNCLJMzNYfwH7UOkKHwsnKlWVvM2e5TS1cYouQ2HKicFZYyX0YXiK88a07eZsdo7ntO/sa
 /VmoCJ45dMYM6pKEchvvOY3kk1lgpLCHB3edYSqk8GH9s2GOpQ6PPfVfqpiO0D/LOQcZOhMjRTw
 1iEFHwhY3nzLKKT5zcv4rfKfDnXaG8DCA5YG+GHMwwEA==
X-Forward-Email-ID: 6a11b96aa1e1c50b7c2a7637
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH NEXT 2/2] drm/radeon/radeon_connectors: remove
 radeon_connector_free_edid
Date: Sat, 23 May 2026 10:27:48 -0400
Message-ID: <20260523142748.50034-3-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523142748.50034-1-jpeisach@ubuntu.com>
References: <20260523142748.50034-1-jpeisach@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [4.69 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:email,ubuntu.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[ubuntu.com:s=fe-953a8a3ca9];
	DMARC_POLICY_ALLOW(0.00)[ubuntu.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email,ubuntu.com:mid,ubuntu.com:dkim]
X-Rspamd-Queue-Id: D45555BF64A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since we are using struct drm_edid, we can call drm_edid_free directly.
Also make sure to set the pointer to NULL afterwards.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index d3a2efbcfd0d..da678f41823d 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -314,14 +314,6 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
 	}
 }
 
-static void radeon_connector_free_edid(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-
-	kfree(radeon_connector->edid);
-	radeon_connector->edid = NULL;
-}
-
 static int radeon_ddc_get_modes(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
@@ -895,7 +887,9 @@ static void radeon_connector_destroy(struct drm_connector *connector)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
-	radeon_connector_free_edid(connector);
+	drm_edid_free(radeon_connector->edid);
+	radeon_connector->edid = NULL;
+
 	kfree(radeon_connector->con_priv);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
@@ -1007,7 +1001,8 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 		dret = radeon_ddc_probe(radeon_connector, false);
 	if (dret) {
 		radeon_connector->detected_by_load = false;
-		radeon_connector_free_edid(connector);
+		drm_edid_free(radeon_connector->edid);
+		radeon_connector->edid = NULL;
 		radeon_connector_get_edid(connector);
 
 		if (!radeon_connector->edid) {
@@ -1022,7 +1017,8 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if (radeon_connector->use_digital && radeon_connector->shared_ddc) {
-				radeon_connector_free_edid(connector);
+				drm_edid_free(radeon_connector->edid);
+				radeon_connector->edid = NULL;
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -1251,7 +1247,8 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 	}
 	if (dret) {
 		radeon_connector->detected_by_load = false;
-		radeon_connector_free_edid(connector);
+		drm_edid_free(radeon_connector->edid);
+		radeon_connector->edid = NULL;
 		radeon_connector_get_edid(connector);
 
 		if (!radeon_connector->edid) {
@@ -1277,7 +1274,8 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if ((!radeon_connector->use_digital) && radeon_connector->shared_ddc) {
-				radeon_connector_free_edid(connector);
+				drm_edid_free(radeon_connector->edid);
+				radeon_connector->edid = NULL;
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -1301,7 +1299,8 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 						if (list_connector->connector_type != DRM_MODE_CONNECTOR_VGA) {
 							/* hpd is our only option in this case */
 							if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd)) {
-								radeon_connector_free_edid(connector);
+								drm_edid_free(radeon_connector->edid);
+								radeon_connector->edid = NULL;
 								ret = connector_status_disconnected;
 							}
 						}
@@ -1635,7 +1634,8 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 		goto out;
 	}
 
-	radeon_connector_free_edid(connector);
+	drm_edid_free(radeon_connector->edid);
+	radeon_connector->edid = NULL;
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_eDP) ||
 	    (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)) {
-- 
2.53.0

