Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Y4hILw+OmrG4gcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F42166B5209
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=dyllankobal.com header.s=protonmail2 header.b=kIAGDSCv;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=dyllankobal.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3C10E9D4;
	Tue, 23 Jun 2026 08:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0510E5D3
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dyllankobal.com;
 s=protonmail2; t=1782176291; x=1782435491;
 bh=A14xOCSUJIIMFQZE0VRp3UXHUGZdex4M/Cm4rQbdfqU=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=kIAGDSCvtQpJVfwgWxiNZhvmN3K9f2H7Ms2m4nM43uOWw8BKF/Dwi0nXfSsRDcHMs
 /Tpr8RReiI9dxK2qCGKxQl9nI+dsTcQolzacQMND/JMRMBUys4g72ecNAadDQUuOaY
 rigaLK1S0H2qlfco6XoRMlFKWCGWRVYA/+XK+Q3owGt1PU6bcI5pEfjtBvK7y9KzeL
 ZblY34c0JAWPhZMCE2C7Q5OW0qYWGNfrb3JVsz2yyNUNYLm6rCdVqHQDm/q1l5yRb+
 zsaLrFCiUL15mVLho7igXM81mfoA5QDapYrsn8zDf8zAMUz1FH9oomEFQSVJc8Eg5t
 8nt0lby8BMa7w==
Date: Tue, 23 Jun 2026 00:58:04 +0000
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
From: dyllan@dyllankobal.com
Subject: [PATCH] drm/amd/display: fix wrong register field in
 dccg35_set_hdmistreamclk_src_new
Message-ID: <20260623005800.285812-1-dyllan@dyllankobal.com>
Feedback-ID: 33529580:user:proton
X-Pm-Message-ID: 8ccd7c2649e7e5c26899dd0127c6cedcb95bf80a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 23 Jun 2026 08:07:15 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[dyllankobal.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[dyllankobal.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dyllan@dyllankobal.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dyllan@dyllankobal.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[dyllankobal.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,dyllankobal.com:dkim,dyllankobal.com:mid,dyllankobal.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F42166B5209

From: Dyllan Kobal <dyllan.kobal@zetier.com>

dccg35_set_hdmistreamclk_src_new() updates HDMISTREAMCLK_CNTL but
passes DPSTREAMCLK0_SRC_SEL as the field identifier in the second
REG_UPDATE_2 slot.

The current behavior is harmless on DCN3.5 because both fields share the
same bit layout, but it is still incorrect and could break on future
hardware revisions.

Fixes: d36771a03412 ("drm/amd/display: Add DCCG DIO, HPO, OPP, and OPTC sup=
port for FRL")
Signed-off-by: Dyllan Kobal <dyllan.kobal@zetier.com>
---
 drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c b/drive=
rs/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
index 483cd9ab7eb7..42066b8a0362 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
@@ -572,7 +572,7 @@ static void dccg35_set_hdmistreamclk_src_new(
 =09case 0:
 =09=09REG_UPDATE_2(HDMISTREAMCLK_CNTL, HDMISTREAMCLK0_EN,
 =09=09=09=09=09 (src =3D=3D HDMI_STREAM_REFCLK) ? 0 : 1,
-=09=09=09=09=09 DPSTREAMCLK0_SRC_SEL,
+=09=09=09=09=09 HDMISTREAMCLK0_SRC_SEL,
 =09=09=09=09=09 (src =3D=3D HDMI_STREAM_REFCLK) ? 0 : src);
 =09=09break;
 =09default:
--=20
2.54.0


