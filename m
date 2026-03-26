Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP6PJst6xmmjKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:43 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C4344594
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A710EDFF;
	Fri, 27 Mar 2026 12:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h/P2q9m6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B130010EB43
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:54:37 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-4670bcc40d7so498967b6e.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551275; x=1775156075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvJTZGwFnKZj+neDJ4vh0DEg0/Ks/7VePFt3kMjVxDw=;
 b=h/P2q9m6kJtcjtecYpgpCnsfk7xikoTpYFXM8ndLg0o+ydGel2F3uZL+DOD/V5RHar
 wWwwH2UtOcVkxaxE7VVsusvZ0JHcinKk5AFLWdHQWjHVBAkaXVuk4NTvQc5cyA9jP/Lt
 FQKAYQlHCVxm+eKaQubjiGspNB/6VDvBGnHzLFFdOTgehmWJUiXPufZY6k6w5/g5q0kq
 MTQC3PYDzu0H9MonxDOgMUpsplnT2SqH7ykjdOhEGrtvm9O4Io6iXAzFG63tMnMXRgJn
 Lp3Jz/KNfd90pKwp8xyysHUHdK3XKlCf4IgaYJzMokPRefJoc+yPFaE3FDcjp0qqrQWp
 xuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551275; x=1775156075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TvJTZGwFnKZj+neDJ4vh0DEg0/Ks/7VePFt3kMjVxDw=;
 b=TBWQX9fGyK3GNBMsvjl1wciJX7IHOoV25SpFfybwdvQNq+pM7JJgzNIvMEQPXnDihZ
 pUpBF4Z8WfEGJGWsJ8HRGc8gCfdiapCUqNuZnPFSQdt/6GIXmZN2kJhDz1ZjJ+ssMiyA
 Hq1LTAsewYpa67h4ao3pD7EFqNUvbJbA/LKi2TCvPrR3YFJ+tC8r2m1vC0MS1Lk+BYkd
 EcbvepfrtODIKSNZwQ9z8S1K3HE1BivTDnuB/m/FaBBYUxm+QbrYGvPMZjbDS3vbDDxA
 LUBSeMQ/mOPNAzbiCuJMcNcBKIydRbnqV059YU5LLYmU6zy2X7gsF5wbPoBvLb3Fl4WQ
 /EaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHShT8KFxhcsKKsrPzFUw0tTWj53IgXmrfpqlhlmPK8flby3i7RyOPTrVnC87E9wuwjCjYSU3G@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycvgGR2amZDOd5ev0ps9dna04F+p5YQTfK5w/0EWemX6QCiFR9
 nAtFUBGd3q2cABjs/2M9bUfTz1Ou8DVIScuvpLU7+N064878MxGkL9NT
X-Gm-Gg: ATEYQzwTfre1IKsTPjCBXt5jpewdblJ7cQJvuLSZPoaCZrjcB6GEFxWNLjvllA/viJm
 Bq7GAgA2YFHra2jZlszG779tEvXcEs5PMc6lsTL5P9+zfxrIuRJTVhvvK4aG85nYTRR7xTmr/yY
 EYY5/bKfa+3q/FBsd2P+vPoiiIgA7wZNfcqvOJ7PuAx6V3jRrAtZvzkTIEcumlJnknlPBHWRPXi
 9umcHz1QKFeLuU31Uv/bTiZKDswjOjENi9nZf7JReTn67EvrMfPTDWxIrCynI7DZegBoYVq2xDz
 mhYMs5xkv8RmrhmmDfjRJ48TTgSDDwiHIrFCQgO/QGxkvKkshMMxmgvqYujg2s5BMwPG9Vae6zf
 6A/Xjd1bBYlEd+run4ptgPYD7qxV1QxX8ek9yJ/Ienj2225MWWI74oYY4M3nWBSCuvB2xAHvYRW
 agiqWdxxygXTU7GY7IuIFs2UVVCHBXe2EZBMSJ+NCVTV4NA8yp
X-Received: by 2002:a05:6808:1995:b0:467:1c6b:ee14 with SMTP id
 5614622812f47-46a5c708135mr3630668b6e.33.1774551275278; 
 Thu, 26 Mar 2026 11:54:35 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:54:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 jbaron@akamai.com, gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v12 04/69] vmlinux.lds.h: drop unused HEADERED_SECTION* macros
Date: Thu, 26 Mar 2026 12:53:08 -0600
Message-ID: <20260326185413.1205870-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 12:40:00 +0000
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,ffwll.ch,akamai.com,linuxfoundation.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 299C4344594
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 280a893bbe29..416b2e6f6788 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */
-- 
2.53.0

