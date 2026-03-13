Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFHDGpNAtGnCjwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:31 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20C287807
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 17:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA33B10ECBE;
	Fri, 13 Mar 2026 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cn4uBlPQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0110EC16
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:48 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-46704177543so1451519b6e.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773408288; x=1774013088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=cn4uBlPQnD4xb1VX/FDyKIceMKu9O5wBmsuYpo4Qtb3i1C8Lek4JzAi220qGfDToiV
 MOJ3bOdvW0wk1g3jyRMd69Il7YzqgzmnxMKfEG8Ds4npK2eQTYwjJflPGozGr641A5cg
 MchZTSVm5EVy6VoyWl1tqYIYXNrM3h8+1c7C6nrqeU8TikVswAZX5As9XTvieVFZNSsc
 mRceTTOhq8Ck72m/CluU7T+qzmlTodkA/MkZepkOIDS2hZ0dZsK5ptIbtvrMSEqK1J5h
 7bjfNmaAgOfesqIRTReplPgl8PcTa1mjZo+uefIseyHAaob/iJpZoEfx4oA6rCitA6/s
 zviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408288; x=1774013088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hkvDWdY7OmvSXSpjnEXWJTz2q+ynFgJjHoQA2h5Gn4E=;
 b=WN4FuI4F52ImWa0E59jq3l61Kb6JQe9jB6U3MPGZ27uuh+E+MXRSBUgOLXIkUskllO
 l4aLzpjETKwoSGnMNGkxQ8j75m0snJTVgYLIypY9F0igW8BcFxdnHKkWa/5GBqQCSvei
 KrAnRqTOn37mNdg7u+4Q2J/u+rbDZLE1uvjkLpIGDnruZ965x7j3bmjpiovEgnaJVmP9
 gzm3x5gsHzmqZKg/oGbqIxivwSwqU/U/hpfuIV59zC7ShY+hM1OtIdbZoW7HiezH8Gu9
 lDaD2N7U5QGeLhyb1nG49yEPBixmfYM2oz2DrKV/2ld1WDHbSr4W+zqltcJwAT8GgexZ
 bm1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVabqAgxzOp7snkmOsLCKGUYsDCIqQBjL+cKg+q4Ej1WylhDbV/uFTh/W84NnxA5fLJ1DKag90I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJP3xwdf2HuWoEH25Rf19g1XKK3t6BLrqiiRUtVs48wTS56GTi
 gwUsIGMyuk9rneJyRiC5rdtXRppZCIXG2Sebg2xH0Pnoxx1uKPi+GLUz
X-Gm-Gg: ATEYQzzyI2N3GUxE+e/2fQsOKpwePwPaL91PeHU+OxYcuBhd7i3bwjeLL01V9KzMgWt
 3wY35PUP5ghOBTz++onHwPY3M/Edl2mLzabeF/KD640+NdeYo3EzgsUgHMgyQdTscJ0RHgItKZN
 XNArA4Gci3al9q/jxxwhBeqLxmP3st7SFsy/9/2qew1a3wwmn6TVbOA1gmdIgItF0qV2LFZMHfN
 JuazT8CbTtIja4hkgvOqvheiI03k4Rldyu0NRDy+Y7DpVkLVzoH6P/jcJrHzpvJbNwg2To40flk
 iaXq8IszqKh67xRZlJ4oGh4Jax0x3QQxQlMLLaPUnyJTjIKLVGTsfmaopo/DnmZnN1AvfqtlAdq
 Sj+RpxEsxwWSLAtq/PLX07oK3E3/6Fq3Gd/DQD/+TZMjcjtJcy6eUEo9Qvq6S2qMvJx7FmdD/pZ
 xPMYsifQJmqT/z8YsJrDxL514bf9cTfkFoSGZd0/kjlj3NTDksx4Bb3RdO8bk=
X-Received: by 2002:a05:6808:6d84:b0:466:f57b:2ae5 with SMTP id
 5614622812f47-4675742c896mr1590777b6e.47.1773408287937; 
 Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:24:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com,
 louis.chauvet@bootlin.com, skhan@linuxfoundation.org, pmladek@suse.com,
 ukaszb@chromium.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 53/65] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Fri, 13 Mar 2026 07:20:18 -0600
Message-ID: <20260313132103.2529746-54-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Mar 2026 16:51:10 +0000
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:airlied@redhat.com,m:sean@poorly.run,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jim.cromie@gmail.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:louis.chauvet@bootlin.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:intel-gfx@lists.freedesktop.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,redhat.com,poorly.run,suse.de,linux.intel.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linux.intel.com,amd.com,bootlin.com,linuxfoundation.org,suse.com,chromium.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD20C287807
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 08a0e9480d70..58fea20a1e81 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -21,6 +21,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.53.0

