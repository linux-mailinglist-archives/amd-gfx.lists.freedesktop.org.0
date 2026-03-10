Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOOUC2vVr2kfcgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 09:25:15 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE5247459
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 09:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4310E677;
	Tue, 10 Mar 2026 08:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="BrHblYvC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3FF10E1E0
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 04:25:09 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-1271195d2a7so547111c88.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Mar 2026 21:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1773116708; x=1773721508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hPa4uc736wUZG7p1hT7+UQGgiHHzlxFbUs+tG5i8A9g=;
 b=BrHblYvCrGiQ+N8sf235pJQDsA800Z9iX46a0K/bjhX2cD5lV5J7jXgTNyF5CLyBBr
 WmlPamjuMD16IGecT1QRNgVG3jiVkQqH5B9ybftqVPa4cFK1ih9SJZiAoHNSqzVwAnHa
 7gPuLdlSHHC64RJJHG4zMWkc1MlZ27GDfX70ftFYh/fWQ1gdBuEfiX4m97zLD81qkt99
 hFjsRQ/YTxqPhxEzjwPBKsBZCeu20AdwUfwH/yuIR4fwVsKJiBzcBlOlx8seDjXNSwrh
 Ntmbii2AyFeGzPOd0UxvTy1TeoZ6uHODucT5i5ZrVkHE2x901aSLSRePVar+goeESadB
 J/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773116708; x=1773721508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPa4uc736wUZG7p1hT7+UQGgiHHzlxFbUs+tG5i8A9g=;
 b=dPQAHyOAhh0CUcjhaTheR7y7deA11zR9lhVmwdMMMECoi5KjW5GbS9X0oIXdJhK7OY
 5XJ9ZpXoaA1h4cgY6S3ri2Eu4zIEv9K4D1o4TYaYytZrCW3YkhcpiFuC6dyOdsoKWpzP
 vts7NnyEQguSgrLqsTMhbt9TU23JKwm3z8sjrcdZKYMWZzNOFNp720D6w1jUEJahMpqQ
 4y+wT1lG8vzKpwuwGqxpqbzreS66OZ8fIzSEI/hpSpTMNUzr5JvO3tvg5BEj+R6fjmJ0
 ugMRlG7Rr41NIqYMSGMGcLq+13u4McvGosOFKGDS8OyC/Ez34PVr0jnn3t19QZPxtmsY
 E+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdF30F1mYNHh/l2o1lu9z2W+lSfY8Z3TfDLnQrMFUz57azI6ooRXNTdGPqzhDjuoQZKQ69RM+M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX5OA0MwtetKYB8oHBX0nW4qGNA4SDQpCiE1soIiM5XkD+Ffbc
 yaLQSlcDwc6RiV8DW1v1P/2M4v0L+SSZt9O1hWSTCMPeRL9gZTKg0i1xnkDsm+rOWHw=
X-Gm-Gg: ATEYQzyijYzoTxzUql16e/4LWLPX2ZXbphGdlhaitDgiItNbnwifpqKUQk3Q0Qz18Tk
 5jT+gf3qZKeMIUZqFEvnCMzyJsBg/L+kRvmmilGqKn/ftvf0Ltij6ah5GIpMpxcgt/JjT8xosG9
 CT+puu49XvY0NEuQxqquSLy4uB/qMUI9RIstTyPMIxudfG1juyYDJNvq3yeutSPiz5Tx3ul3WU3
 KZFPSQ09T0j+zogaK2QtKFOwPnZK6rOwN+OQq2Bln1Q4LlYIWf9FQEidL7tr7J1B0MuROHNbJ8U
 eoJF38BihW8Yd8fmbFIxtUQAeNmeOLGdoWgTUeXghvHIfE9YKNyL5xRlHaew5w7D8uPi3/Muxtv
 uMJJ4ZewJLBHDBnKW2kaaYzGrpMThGTPU6GEVPZ4HT5714gjSHsHumqLGNpDlDzqHtIv7nauKZW
 qSa7Ou/ObeSKs0pKHh3OTBm07/QA==
X-Received: by 2002:a05:7022:6081:b0:128:dbbf:fd35 with SMTP id
 a92af1059eb24-128dbbffee6mr1751213c88.28.1773116708236; 
 Mon, 09 Mar 2026 21:25:08 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:eea6:1f6d:5163:10ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f984cf5sm12925551eec.33.2026.03.09.21.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 21:25:07 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Charlene Liu <charlene.liu@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 llvm@lists.linux.dev
Subject: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable which
 breaks full LTO
Date: Mon,  9 Mar 2026 21:24:57 -0700
Message-ID: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Mar 2026 08:25:11 +0000
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
X-Rspamd-Queue-Id: A5FE5247459
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[wbinvd.org:s=wbinvd];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[calvin@wbinvd.org,amd-gfx-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[wbinvd.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:charlene.liu@amd.com,m:ovidiu.bunea@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,gmail.com,ffwll.ch,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[calvin@wbinvd.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wbinvd.org:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

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

Fix by using the old value for region_params.bss_data_size in place of
the uninitialized reference, which makes amdgpu work with LTO again.

Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3d6f2cd8ab6..e69e61163ae9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2554,7 +2554,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
 					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					    PSP_HEADER_BYTES_256;
-	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
+	fw_meta_info_params.fw_bss_data = le32_to_cpu(hdr->bss_data_bytes) ? adev->dm.dmub_fw->data +
 					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
 	fw_meta_info_params.custom_psp_footer_size = 0;
-- 
2.47.3

