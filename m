Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKk1IW40HWpbWQkAu9opvQ:T2
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13961ADA7
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B90112EE3;
	Mon,  1 Jun 2026 07:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="aTUT/r5S";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Sun, 31 May 2026 05:06:54 UTC
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41935112A86
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 05:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1780203553; x=1780462753;
 bh=JgXmbmRQhvxiYbQ8/af9ooPxSRB/f+wfhM3H1iUU/NE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=aTUT/r5SwxI54YFXsS4RmiLlPPODXhaCCwX84lSmBO6AftwQIaVbdU5BhdAyxt9ct
 z56/W7u4dOrm4uVQRM7Ianl4Rrv/IrBO6jCQjel7Z+TY6EXpeC5Z6uDHgrAFdp0aJy
 DrzS12YedB0VTGoQfeh+0ktHUAQSdHmAXP0VIJwkRQR0PRh8M7r52nhAlSZh53T/xQ
 uABlt+fty7BplDNq75DTeCzd3oUWAzPUy+qm+HB2Z8nPrloNFEQhetEIgk3mYv+whk
 6nWFFLMsuuhXpmgJI9j0R/8cvkj/ooY3Gtk5gjxXaIPyHQnO464oaY0CY6dHfenmzs
 f8Z+vdD2+TfLg==
Date: Sun, 31 May 2026 04:59:09 +0000
To: dri-devel@lists.freedesktop.org
From: =?utf-8?Q?Gustavo_Kenji_Mendon=C3=A7a_Kaneko?= <kaneko.dev@pm.me>
Cc: airlied@gmail.com, simona@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com, corbet@lwn.net,
 amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Gustavo_Kenji_Mendon=C3=A7a_Kaneko?= <kaneko.dev@pm.me>
Subject: [PATCH 2/2] drm/amd/display: rename timeout_occured to
 timeout_occurred
Message-ID: <20260531045852.41849-2-kaneko.dev@pm.me>
In-Reply-To: <20260531045852.41849-1-kaneko.dev@pm.me>
References: <20260531045852.41849-1-kaneko.dev@pm.me>
Feedback-ID: 165279626:user:proton
X-Pm-Message-ID: 8cb3de63cbc7a301755003877c36a5a6a68ade29
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 01 Jun 2026 07:27:37 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[26];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,lwn.net,lists.freedesktop.org,vger.kernel.org,pm.me];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kaneko.dev@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kaneko.dev@pm.me,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[kaneko.dev@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pm.me:email,pm.me:mid,pm.me:dkim]
X-Rspamd-Queue-Id: 3B13961ADA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling mistake in struct dmub_timeout_info field name.
Rename 'timeout_occured' to 'timeout_occurred' and update
all references in dc_dmub_srv.c accordingly.

Signed-off-by: Gustavo Kenji Mendon=C3=A7a Kaneko <kaneko.dev@pm.me>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 4 ++--
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm=
/amd/display/dc/dc_dmub_srv.c
index 79c8b4cab053..4b47172a71c0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -285,8 +285,8 @@ bool dc_dmub_srv_wait_for_idle(struct dc_dmub_srv *dc_d=
mub_srv,
=20
 =09=09if (status !=3D DMUB_STATUS_OK) {
 =09=09=09DC_LOG_DEBUG("No reply for DMUB command: status=3D%d\n", status);
-=09=09=09if (!dmub->debug.timeout_info.timeout_occured) {
-=09=09=09=09dmub->debug.timeout_info.timeout_occured =3D true;
+=09=09=09if (!dmub->debug.timeout_info.timeout_occurred) {
+=09=09=09=09dmub->debug.timeout_info.timeout_occurred =3D true;
 =09=09=09=09if (cmd_list)
 =09=09=09=09=09dmub->debug.timeout_info.timeout_cmd =3D *cmd_list;
 =09=09=09=09dmub->debug.timeout_info.timestamp =3D dm_get_timestamp(dc_dmu=
b_srv->ctx);
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/=
amd/display/dmub/dmub_srv.h
index c18ff8f00bb8..33fcda687a86 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -355,11 +355,11 @@ struct dmub_srv_hw_params {
=20
 /**
  * struct dmub_srv_debug - Debug info for dmub_srv
- * @timeout_occured: Indicates a timeout occured on any message from drive=
r to dmub
+ * @timeout_occurred: Indicates a timeout occurred on any message from dri=
ver to dmub
  * @timeout_cmd: first cmd sent from driver that timed out - subsequent ti=
meouts are not stored
  */
 struct dmub_timeout_info {
-=09bool timeout_occured;
+=09bool timeout_occurred;
 =09union dmub_rb_cmd timeout_cmd;
 =09unsigned long long timestamp;
 };
--=20
2.54.0


