Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GIvLIaeB2oD+wIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 16 May 2026 00:30:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C747558E0F
	for <lists+amd-gfx@lfdr.de>; Sat, 16 May 2026 00:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7DA10E181;
	Fri, 15 May 2026 22:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=triang3l.ru header.i=@triang3l.ru header.b="OGAL3aT5";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out7.jino.ru (smtp-out7.jino.ru [81.177.141.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0288B10E181
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 May 2026 22:30:27 +0000 (UTC)
Received: from [192.168.0.164] (unknown [5.18.177.157])
 (Authenticated sender: ml@triang3l.ru)
 by smtp-out7.jino.ru (Postfix) with ESMTPSA id 954533781059;
 Sat, 16 May 2026 01:30:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triang3l.ru; s=dkim;
 t=1778884225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXfL9XxQU1bTcINY7v48EtXcddZaJtwTvvkZh0hCiAE=;
 b=OGAL3aT5IRrOn3uDXAVas4Cq/eplAjTXrRCeAtUd9cF/3721cMhzJZndGUQf19ML0hfqcb
 1UqgU2ZgnTI9/nhoy3iu0fFyoiOytLTiACIsthsvucz4m7KVV48EFaUYnNKjgLlu6+LwSv
 /ODNw06XwxsoI+ai27/f008UQYSZzXpo7+SI49yXjjzjZhBUGI52OleoHiBWUSAVrAo+U8
 dSDvvpHh/nov/jFkINNyD11PnRT9Cxwl6xs2nAs03wVHgx2QDqfkLg+ZD7xOM49sfPhnXW
 f/8kotsmS2SSmtHxXgVZ8PaeGZ6FUuIjb4ZMICvH//v4QDUJF21WNwtXlNMKMQ==
Message-ID: <aa2b69ce-f581-4828-9460-f1c2792f35a9@triang3l.ru>
Date: Sat, 16 May 2026 01:30:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vitaliy Triang3l Kuzmin <ml@triang3l.ru>
Subject: [PATCH] drm/radeon/evergreen_cs: Add missing NULL prefix check in
 surface check
To: amd-gfx@lists.freedesktop.org
Cc: Arnd Bergmann <arnd@kernel.org>
References: <20260515091054.529610-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260515091054.529610-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 0C747558E0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[triang3l.ru:s=dkim];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[triang3l.ru];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ml@triang3l.ru,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[triang3l.ru:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,triang3l.ru:email,triang3l.ru:mid,triang3l.ru:dkim]
X-Rspamd-Action: no action

'evergreen_surface_check' is called with a NULL warning prefix when
handling potentially recoverable issues or just to compute the alignment
requirements, and 'evergreen_surface_check' is called again in case of
failure (with the correct prefix, as opposed to NULL), therefore, the
initial check must not print a warning, because the surface may be
accepted successfully after having been corrected, however if it isn't,
the final check will print the warning anyway. The surface check
functions specific to array modes already implement this behavior, but
the 'evergreen_surface_check' function itself doesn't.

This is also supposed to fix the "'%s' directive argument is null
[-Werror=format-overflow=]" compiler warning.

Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vitaliy Triang3l Kuzmin <ml@triang3l.ru>
---
  drivers/gpu/drm/radeon/evergreen_cs.c | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index 3142ef4da7f4..9196f85db9ce 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -312,8 +312,10 @@ static int evergreen_surface_check(struct radeon_cs_parser *p,
  	case ARRAY_2D_TILED_THIN1:
  		return evergreen_surface_check_2d(p, surf, prefix);
  	default:
-		dev_warn(p->dev, "%s:%d %s invalid array mode %d\n",
-				__func__, __LINE__, prefix, surf->mode);
+		if (prefix) {
+			dev_warn(p->dev, "%s:%d %s invalid array mode %d\n",
+					__func__, __LINE__, prefix, surf->mode);
+		}
  		return -EINVAL;
  	}
  	return -EINVAL;
-- 
2.43.0

