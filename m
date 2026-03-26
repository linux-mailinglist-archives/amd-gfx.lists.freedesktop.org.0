Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMeDAwx7xmmjKwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:48 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824963446C7
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CAC10EE1B;
	Fri, 27 Mar 2026 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NSOxAFem";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D1810EBF2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 18:56:03 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-417571c6083so747201fac.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774551362; x=1775156162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=NSOxAFem8i/tNrxRVVawg4jU9Uf13f0Z2Qm9vNtf7kHjMlfEC+xyPWqX821hK/un0d
 wDj3avjCg9P9AHkuwwbRWUZfd3Aro6fWdmzDbV+I+fO1/mI41spiSvROI/p+czSHW0FB
 4c9Um57AnLdRjIfsNIkGyNNGdglUKDkruRTelDdrmXp28zrckfezrguWx8ZBGabJzcw1
 AXkVvj8zYYrvkzk2NbFxNyPscCjvOcnoy9hJ58ivJ0aQ43bHZEfLWhA+RyEQxN19MN9i
 OR+7XAKiWsBAx7GguBakMFLFOxmwyTvYGmrO80rvPkeJBH1/j6km4xEqd8yX/qaDdpTn
 M3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774551362; x=1775156162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hVWjZWuErU/TT0M/gLtU2+Pv2Hf/DF/3aPzw5cJbYqU=;
 b=quwLMpNPzwqRfrRQmbmJcoLp3M6y+RAcImENIc95KyTxdlYWFFR39jCJaDPHqf4tnL
 Zzb1A97KrA3ccLY4FS8i4G55w7IDdcLIhkUkZlYFntSfSKFsFMSl6Iw7ofC8l8Nq7AuP
 Qhi+Ggr7IJzkTXmicnpkGx5NpbgboBkMODL9orE3qDfH8VfZX8ndwGUMOOtrMvjo42mK
 C53sQA95Y7J1dW3LDf7uEUxCHjnsQqnFoZXXQveitt2v0mvI3MaFMkVYUs1LsBhUhLB0
 OWyqMrur5ovKHTriUev8/SnfinuofvIcqOCjaWEwEnn0qUfAB9CfVD7NVF/ghavMhuyu
 vz8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCkbXdc3T8PaElKpw2MslHoV2AkJwCQ2N+Dd1xab18GlsoEfVWDooHaWwh4wqk3zPCDTr4AJi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtEtCaRGUc3rFXGEkVN35KOdpiZQUUFmrH+qgbYM95CpBPyyeG
 SHYkDNBURB8DXgLk5F7dojbMqGzeH1JYOmtZf2gH6PhrjMkOcB6d3HGz
X-Gm-Gg: ATEYQzwea/D4hn9GxqLlQrFQ1eSrzeP6cTDyOAfv8+9OBbDLvv8S/ZPNYWJA4R7p28+
 IBFsRLx9M2NAAPBjyXYRQ8Q628Bubn4voyal1+jyxIcxbCyp9bKQr0rR3oNQF1nEBrX2vHinDVF
 g6/0BEDoj6+KFQhSNhMYdY2137xwzPxMLFT6xxIkJ2G4qN11+nGfFaL+FlGQqroDnIdBC8CuhdP
 MdYUza4NJQIt7b+jC6/wnb+uIVidrjzATWsXMy7KN2Snfrnb7vrRFzzS8VHuC3cWWo/0LTyg18O
 ntYfqmKvIh8UbwL1hVEzxrBZFl2EwcL9broP4YLYQ7p0ZpVYbZbI40YSFY2wW71lTLhOe9RDabv
 4zY3+tZ/8aqUhyNqKDQu3dM/TGnXjThh7EtwnQbqtcD9cPPpDUb+jkwyJVAj77ZNAaMLyM2Tnx1
 VVqHM1ja4rc/C9r7CAm0TMJ1EetKVHpFa1jKAzkMExblyhE+y0
X-Received: by 2002:a05:6870:6486:b0:416:414:bbd7 with SMTP id
 586e51a60fabf-41ca6e689c4mr4624024fac.21.1774551362660; 
 Thu, 26 Mar 2026 11:56:02 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 11:56:02 -0700 (PDT)
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
Subject: [PATCH v12 60/69] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Thu, 26 Mar 2026 12:54:04 -0600
Message-ID: <20260326185413.1205870-61-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: 824963446C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index a32be27c39e8..02a703e5de80 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -28,6 +28,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.53.0

