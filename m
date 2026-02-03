Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OEwNfH+gmmagQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:25 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEBE2EFC
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Feb 2026 09:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7489410E4CD;
	Wed,  4 Feb 2026 08:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFBDU7au";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97210E73F
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:32 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b8de2b5a122so71327566b.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144991; x=1770749791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFFQv92IMIK5Ovyc69Ri5XGSLTL2jrRhS/990idFLW0=;
 b=BFBDU7auDGw2qSCmDVbQjGjodq2Qal3xaSPQOOiC+9AIE+BYlMElQ+PF1Zi/l6QSPI
 vc722EjMahI8sKS03J2PaiJpf/s/EfeLxyxxDJJKdiKSu3BykwkfyS+IcVMkL9hdH5e9
 HWRkPYoOwRGe8uVkkkHDbyzrFw5qm7dDuPHcclNWAbqONayMce33f0590IgKDZEqGnJB
 9n9dmJHHiN9q10ddzAzu5bOTFc4cODHHXbb2caqRlM2l6aFGORPMPvhCDGfUkSdpwF9i
 w2KVc4c749npjOxC0RfltwbPi6PII4CepKsZguzclvLikQmYO9PZZ5HliLS+eezO0V75
 r0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144991; x=1770749791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hFFQv92IMIK5Ovyc69Ri5XGSLTL2jrRhS/990idFLW0=;
 b=ICWIbdxt4vIkp7YSQgky/uyOKxNcgT0lU5i0cSWItxLedCItYJpcPWe1gU5yKTQ83K
 XCkn/o7d6J8p56eq1USV2XNKH+/nQOK/rwf0bJRsUMO9ptnuRZJmKIc1bdXuf3rArPkn
 d5nUaS+G9XkyZ+cQiXshyTw7yXFzWn/OihOtY5QE0cdMnBMs4NCxlRwEb3xM+FFS2tUN
 CqiB60oUu6KPEg6HfIBej0w8gwJkbE5infvBxk6LZW9zpavw0e8WyfH5RcFPDdUlzlMj
 AXWPNJX+oigwWD+062Sva96gCs5VVEKk8ZzZ6UFhr6VadHQH9ebz5ltBKm7KA5xFQmi8
 VakA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3CIBhd6jzKAkXp3OV+lOxFVuBOg6BVeyDwfV0YqscJfrApN97uN0Sk35q+Fp1tvDnM3ZKhwez@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz1MmSHa/Cd7QImB/wlZkr1jznJwYRnspxmB00L95QXci/OrKL
 O8NfazboT3889Aon9z262OGeslLIwkhXE92aLyP75VAUOa6kW8lUjmEV
X-Gm-Gg: AZuq6aJPWVqJx9aSukBe1X1JdJxOOZDoMzMVD8lpKRStj6GOzJopSm48OwR9csaOMGl
 5hkZeMhKAxGM+Czx/TWUXIQBrsB1yL5QCGgMMnwej7gHUXz0z73TkEQ+DLf7dSEW5wex0wBfBpp
 ivmb+gw2vv7jKGFRqq0WGdVS8nMVOrg7acCD73z439tkD4z54PbmVLoDlQDSWRmqIAoEC9qYIVg
 UztTJk25sXwulKOZ2zFc9M900wF4avsa8rBhHHF9S+WwQT8YEa1N99MH/oAiL9Ox0VoZ0ZYDilT
 D9CX8AFno3hioJoVg+Cp9h4Tjb9ELRrruNeYRktLSQLKYsaPjhYEgHNHwZIxbN0RWxUoTluRKpX
 7eK+/DSdqneatqHEGPqU7ajctAdb8hH+6wguK498ispOPS84YmQTRJtn5Dou693IengPt3hDqJ4
 HHbJaurSaMtCEyqgJpyu1vEVM9kwvVCeGmZIYuu4h4Vs5w+Nw2TIzIoT279sDdWERR
X-Received: by 2002:a17:907:1c90:b0:b87:106c:88eb with SMTP id
 a640c23a62f3a-b8e9ec16b5cmr23148266b.0.1770144990354; 
 Tue, 03 Feb 2026 10:56:30 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:30 -0800 (PST)
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
Subject: [PATCH v3 01/19] drm/amd/display: Return if DisplayID not found in
 parse_amd_vsdb()
Date: Tue,  3 Feb 2026 19:56:08 +0100
Message-ID: <20260203185626.55428-2-tomasz.pakula.oficjalny@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 86BEBE2EFC
X-Rspamd-Action: no action

[Why]
The function would continue to try to parse EDID even if DisplayID
extension block wasn't found. Sometimes it got lucky and found AMD vsdb
in CEA extension block which made debugging harder.

[How]
Add a return if DisplayID extension block wasn't found

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d8fac7e69181..29e4a047b455 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13136,6 +13136,9 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 			break;
 	}
 
+	if (i == edid->extensions)
+		return false;
+
 	while (j < EDID_LENGTH - sizeof(struct amd_vsdb_block)) {
 		struct amd_vsdb_block *amd_vsdb = (struct amd_vsdb_block *)&edid_ext[j];
 		unsigned int ieeeId = (amd_vsdb->ieee_id[2] << 16) | (amd_vsdb->ieee_id[1] << 8) | (amd_vsdb->ieee_id[0]);
-- 
2.52.0

