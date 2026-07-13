Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 42XfE3vzVWoGwwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA5752666
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="kwek/o7T";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35710EC6A;
	Tue, 14 Jul 2026 08:29:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2EA10E642
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 19:33:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493f45e206dso1189885e9.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 12:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783971230; x=1784576030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XPD6fU3GpiZG8+MeQeemIO9L/5IYTOlYLtljr//p+4s=;
 b=kwek/o7T7xBbFnQP0j7B9ma8t7ShW39C41bMxwvARaapmq0GXglOuLzia7dMN50olF
 zIEd/EeJLLRKwROFphEydNmOF1fHHV4dRGFsVjCdjYylvXL1wpS/aoTvtUUVfBMHt0Z+
 A8qQZVDfY/y25gwrPbGqSmENfLVF+6um5oMh+rrnn2RcxDU+X2Ko5cPBoWsqqGNkNiuc
 nGrboeTnq046SSj4011cff1lE0QKdU9XVX/ti6cFPcEkEClVzWT12BMgbPn7FtG3eIws
 gRsDSPBQpduOHKynSFspWY/Q2XbaJlsSe/ubsQr5emjMdo/yzgZGE7B+aHCNTOkeSd9v
 GNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783971230; x=1784576030;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XPD6fU3GpiZG8+MeQeemIO9L/5IYTOlYLtljr//p+4s=;
 b=pZgmFikt3310HEPh7kURCdTgNPDs3ACxp+MSDM70H+/Rm/zDoWv+qiZDm5xh6w2ngP
 0UHvo6aNHaFBVukKnXBlak2jTaDKIP7p9CmGbizTsraEJ2Ib9cklKOboUeFPsE/4v1Ao
 Zt0AUJIt2siYseOMEioBCyKNzqPmw8zdCgSO2ArIh/a8pORBI3FQmH24/lrClXhAP/ON
 /mERDpQza/plNFqi8bSXfDw77wREBKj+6PAcPUYEoDKUz61Q6aZHcWRiwjRzP5xkQ8n+
 fNdbqDXi9IrBM7QyqtCqB6Uq5XOD2YV7vlVKD9qZNfXAygz8L+qEx0kzXoEnHnHDLogr
 r+NQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHrqN81KAlmSWFmT3JOWUidDXkxdIXe0qevYkipsoRt1YZIV9qhjd5xo2z+kJZIJP6wvvCDrUw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrKZ4G9qe4LmXO0VYaMPjK/xqjx0vuRVICaGuIa6jLdj3bMG5b
 77tEHHptb9y5VgBsG6uCF1Vg0S2PMASpBAAHIAoDWOupKZ62mmjPoUiT
X-Gm-Gg: AfdE7ckwBMTImZ4Jj7JyjHQiobsPr7aE8NcT7DOvnhb2kKHvgza2Mv9mAQtHLte8JM+
 Y+FLprV6bnFyo5tkmLVQ2nZ4eP89UoUB8emGa5YD1XdiKQxLhgk08dpNg8oIpI9n0IPBAxw0LjZ
 c1Hsq8ifnk+zWzdixc1PvkA5zQcqiX3h/yywLXf409Vxi9O9W4zxsGjPLeqZDzTQEp4ktIE937g
 oSV8/PSZ1leZNUIwiMWqaU3eVBpdaE6Qvt49N3A7K4/0jQWUG3gdxDledoSyCPoV5xN9Oq1oFMi
 laZxw4GYiw46befS83cuezM7FGqHPvPpfQiT/0XiNX00OtwyCbZz6mGLsRdv1gHEmUpsLi1Xiha
 LzDlVIf/Vts1dwPz9yJwTvSqpu9iPT8792iWi6kjyPEcYxaxjvItbnSnHKdY8v3Vdv8HDwcFjNl
 Nu17aohWd9LEQbn3UoeVmVhe1cgQRZ
X-Received: by 2002:a05:6000:70a:b0:478:3df9:5d8c with SMTP id
 ffacd0b85a97d-47eee0f414cmr17935458f8f.2.1783971229706; 
 Mon, 13 Jul 2026 12:33:49 -0700 (PDT)
Received: from timo-z13.fritz.box ([193.30.163.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4634e0d9sm1912993f8f.2.2026.07.13.12.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 12:33:49 -0700 (PDT)
From: =?UTF-8?q?Timo=20Pr=C3=B6mer?= <timo.proemer04@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Timo=20Pr=C3=B6mer?= <timo.proemer04@gmail.com>
Subject: [PATCH v2 0/2] drm/amd/display: Fix missing HF-EEODB blocks in EDID
 copies
Date: Mon, 13 Jul 2026 21:32:35 +0200
Message-ID: <20260713193237.2639-1-timo.proemer04@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Jul 2026 08:29:45 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timo.proemer04@gmail.com,m:timoproemer04@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[timoproemer04@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[igalia.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timoproemer04@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7FA5752666

Fix an issue in amd/display where devices with HF-EEODB blocks would 
be missing these additional blocks during EDID reads.

The driver previously used `edid->extensions + 1` to calculate the 
number of blocks to copy, but the base extension flag does not include 
HF-EEODB blocks.

Use drm_edid_block_count() directly to get the true number of blocks, 
ensuring that HF-EEODB blocks are properly copied.

Changes in v2:
- Fixed a bug in patch 2 where the bounds check still used the old
  extension count.
- Patch 1 remains unchanged.

Timo Prömer (2):
  drm/edid: Export drm_edid_block_count()
  drm/amd/display: Use drm_edid_block_count() instead of raw extensions

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 11 ++++++++---
 drivers/gpu/drm/drm_edid.c                            |  3 ++-
 include/drm/drm_edid.h                                |  1 +
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.55.0

