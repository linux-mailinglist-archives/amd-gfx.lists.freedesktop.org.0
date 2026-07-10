Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k6dXAz+VUGrq1wIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 08:46:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DE737CEA
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 08:46:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2EB10E137;
	Fri, 10 Jul 2026 06:46:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945F310E137
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:46:19 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-oplh1GaGMxGlAtAhTQJOTQ-1; Fri,
 10 Jul 2026 02:39:55 -0400
X-MC-Unique: oplh1GaGMxGlAtAhTQJOTQ-1
X-Mimecast-MFC-AGG-ID: oplh1GaGMxGlAtAhTQJOTQ_1783665595
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0EB14195605F
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:39:55 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEFF630001A1
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:39:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] amd/dc: move custom_float definition into custom_float.h
Date: Fri, 10 Jul 2026 16:37:42 +1000
Message-ID: <20260710063946.2262582-2-airlied@gmail.com>
In-Reply-To: <20260710063946.2262582-1-airlied@gmail.com>
References: <20260710063946.2262582-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iVux5ozFNI7FUsTo4NZ2GLtBaywNy0qHilcm7YXQ3Is_1783665595
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
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
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 995DE737CEA

From: Dave Airlie <airlied@redhat.com>

Drop the unused custom_float_value and the spl one.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/inc/custom_float.h   |  7 ++++++-
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h         | 13 -------------
 .../gpu/drm/amd/display/dc/sspl/spl_custom_float.h  |  7 -------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/custom_float.h b/drivers/gp=
u/drm/amd/display/dc/inc/custom_float.h
index f57239672216..c408fee8e181 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/custom_float.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/custom_float.h
@@ -28,7 +28,12 @@
=20
 #include "bw_fixed.h"
 #include "hw_shared.h"
-#include "opp.h"
+
+struct custom_float_format {
+        uint32_t mantissa_bits;
+        uint32_t exponenta_bits;
+        bool sign;
+};
=20
=20
 bool convert_to_custom_float_format(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h b/drivers/gpu/drm/=
amd/display/dc/inc/hw/opp.h
index 73cc34ea7726..ce30eab16f86 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/opp.h
@@ -142,19 +142,6 @@ enum channel_name {
 =09CHANNEL_NAME_BLUE
 };
=20
-struct custom_float_format {
-=09uint32_t mantissa_bits;
-=09uint32_t exponenta_bits;
-=09bool sign;
-};
-
-struct custom_float_value {
-=09uint32_t mantissa;
-=09uint32_t exponenta;
-=09uint32_t value;
-=09bool negative;
-};
-
 struct hw_x_point {
 =09uint32_t custom_float_x;
 =09struct fixed31_32 x;
diff --git a/drivers/gpu/drm/amd/display/dc/sspl/spl_custom_float.h b/drive=
rs/gpu/drm/amd/display/dc/sspl/spl_custom_float.h
index f3fd8d30e638..60620537ae3e 100644
--- a/drivers/gpu/drm/amd/display/dc/sspl/spl_custom_float.h
+++ b/drivers/gpu/drm/amd/display/dc/sspl/spl_custom_float.h
@@ -14,13 +14,6 @@ struct spl_custom_float_format {
 =09bool sign;
 };
=20
-struct spl_custom_float_value {
-=09uint32_t mantissa;
-=09uint32_t exponenta;
-=09uint32_t value;
-=09bool negative;
-};
-
 bool SPL_NAMESPACE(spl_convert_to_custom_float_format(
 =09struct spl_fixed31_32 value,
 =09const struct spl_custom_float_format *format,
--=20
2.54.0

