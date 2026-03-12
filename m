Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDjzARfRs2ncbAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:55:51 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3D280079
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEAF10EB53;
	Fri, 13 Mar 2026 08:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="CzTEz6iN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5295B10EA7F
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 17:13:38 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-12732e6a123so128463c88.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1773335617; x=1773940417; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P2G1AlBOtI0pVNQJ415mQN+VxqBlOoCSVpFjY0Duwoo=;
 b=CzTEz6iNgR4+UeF4zGvZBnFkWDA4goliYp1MeBontdJ+rK7kErUfGJPGnDPQ5xoo3L
 nPDgZMngmQlpoVgKq1uxqLWekIv1EQ4+WWIASbIC2h/4V2qDWY9eoYQ2dlsyAsHPZATp
 beO3lYkppahbX5D7xRIeNiXDMo8Rx7bAdhzkQIAHjUHiwqjnaDLFECDJUCD25QwPPrT3
 NzKt578DgZeq2wBWK32fBNWBNEj01pW0OvI6iVHyh+cT+bvzcgR+87o/b7oYmYvr1fXa
 X3JFn9lUVLs6oRQ1MzztulbWJGSz4jEC0i7QLzUK8ncn2U4idAyB+lg+cHf8e0Ni2wzu
 a0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773335617; x=1773940417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2G1AlBOtI0pVNQJ415mQN+VxqBlOoCSVpFjY0Duwoo=;
 b=X1W2cqSppJN6WvO8g75UhEKDjBjgjbQEVHJcmL+fOWnvrgQJAia8X6TTP5pMxqV/7l
 5ekhNKXoqHjhFg6pvT/SPcDSScHFr3J+R1kT2r7SflP/Lh9yWt6GM+HQyLtUHofgnNSu
 BB7RxwB/N5twWXTZRT12Uj9cM6tLmHEPquMYhsh8XGuAR4UeDsxVWZz6qxbl5715K9aF
 YZuB3fEOFj47Y662i66lqXF9WeTRHz5dfVaGLFp34tlIuireLk5dWV3QFqu+81ArO5Ju
 +2vDXZSZ0bY1A2XGkJDY7d16LQeTdL+FBiqG0nPP/cqOJaDqZ1gffOLb3i3JCEQXQ4Sc
 OoDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7g4hlbZvjWSJ4j2NoKmfWxW4snCT6stoIZOF7Eu6IQGEH+3Pa8ZFpeTchjw8utepvAdtmPkpq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJo6kLhIpjpW77mUQxADcLecGg3Gc96wtsB4f4b2ZeUt11wuAl
 gCRZQOzWlMOeyf1SOIMlXVQ7GzurcmIP67rSS6JAm5R7W2g/ls+LLgwKYEDAYYY2ewE=
X-Gm-Gg: ATEYQzxwtXvvj36QObbyd4rte1yK9+oje/QIXgZmkVloPOK7uJFdJ1mOtmDfMXiHS/O
 1GM6p0xiAhhlEQAg+4pn8Ri64mz4uVCVfpQad6G6I3PB1S/4/MyVn4MzN73Ac2W9fA+ugA6c+Yb
 OQelpFlzgrPdQcTY4QZmzmtniD0gqtFfXfYctIbDktD0Hio7AKyhvSdvkroEHAAqLvfourLbTon
 obQ5BVrtKG2w/+PYyiNjlqyGPQczY9jYaZNGpfXOCeJQmXOwiW/zeBd23v2JJEqWwByyDn1J7J5
 2TjTqpW9moKKa4qpPYTDskQheqko6yb5Z57FzVjwZqkeuWZR0IgtF/5/yW2dkmLMAPPC0wB8VoR
 uKeFDnWJ1MZZNL6BX9+nRM+wEPD6cND6/wDSyh0XDYMUuk54IqgPCzOh4yciBXUewHL7M7Z5tGF
 Y46QJETHJmpN/yHUxpYiYLq9Ae
X-Received: by 2002:a05:7022:4397:b0:127:345c:439c with SMTP id
 a92af1059eb24-128f3e29d9dmr154759c88.45.1773335617192; 
 Thu, 12 Mar 2026 10:13:37 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:b160:d8b0:a73a:3f1])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128e7ce52aasm9466780c88.15.2026.03.12.10.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 10:13:36 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:13:34 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Charlene Liu <charlene.liu@amd.com>,
 Ovidiu Bunea <ovidiu.bunea@amd.com>, Alex Hung <alex.hung@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 llvm@lists.linux.dev
Subject: [PATCH v2] drm/amd/display: Fix uninitialized variable use which
 breaks full LTO
Message-ID: <abL0PlD1FDnfrX4o@mozart.vkv.me>
References: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
X-Mailman-Approved-At: Fri, 13 Mar 2026 08:55:39 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[wbinvd.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[wbinvd.org:s=wbinvd];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:charlene.liu@amd.com,m:ovidiu.bunea@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[calvin@wbinvd.org,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,gmail.com,ffwll.ch,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[calvin@wbinvd.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wbinvd.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAE3D280079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
footer size") introduced a use of an uninitialized stack variable
in dm_dmub_sw_init() (region_params.bss_data_size).

Interestingly, this seems to cause no issue on normal kernels. But when
full LTO is enabled, it causes the compiler to "optimize" out huge
swaths of amdgpu initialization code, and the driver is unusable:

    amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
    amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
    amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
    amdgpu 0000:03:00.0: Fatal error during GPU init

It surprises me that neither gcc nor clang emit a warning about this: I
only found it by bisecting the LTO breakage.

Fix by using the bss_data_size field from fw_meta_info_params, as was
presumably intended.

Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
Changes in v2:
* Use fw_meta_info_params.bss_data_size instead of repeating the load
  from the payload header field [Nathan]

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3d6f2cd8ab6..0d1c772ef713 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2553,9 +2553,9 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	fw_meta_info_params.bss_data_size = le32_to_cpu(hdr->bss_data_bytes);
 	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
 					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					    PSP_HEADER_BYTES_256;
-	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
+	fw_meta_info_params.fw_bss_data = fw_meta_info_params.bss_data_size ? adev->dm.dmub_fw->data +
 					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
 	fw_meta_info_params.custom_psp_footer_size = 0;
 
-- 
2.47.3

