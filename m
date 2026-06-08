Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9y5Ix6GJmpMYAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 08 Jun 2026 11:06:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30EC654612
	for <lists+amd-gfx@lfdr.de>; Mon, 08 Jun 2026 11:06:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K5T+YC7D;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B21410EFEB;
	Mon,  8 Jun 2026 09:06:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4810ED8E
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2026 06:36:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-8423f869421so2955659b3a.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 07 Jun 2026 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780900604; x=1781505404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7oVk9np2C8rowcJJ6cLLZoIRh76RsaPNf2tnKfd50h0=;
 b=K5T+YC7D7pHquz66+qpB8xbQUyu2YAGG6o5CnOeHCxs8gIA5Nl/WnapFiY5+NPYcT0
 EvkuJkmsiF+qvndvDkkM57K0xFaQJKFXM4qhm4qjWrvsIuarTJQf/MMLJHR+pSa2KKMR
 WuydrJFGJll1lQwe85G/sH5EwMHAsfn1ckJUOaa83ODhj2OImWXGLf0tJAczYzClgTsr
 Ho8hECByp4EwyxEYMlr3TELEGQydpANhYYNNRdozhAyy5XdB6y0cmasjV40RqFl01UJ3
 a0HDQ4ETu3gnRx04UZvCU8A6D43FRGkcmNSjj7gURiy+WtihsIHbDc4B21qScrRCDIvn
 aQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780900604; x=1781505404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oVk9np2C8rowcJJ6cLLZoIRh76RsaPNf2tnKfd50h0=;
 b=nzfvd/h5xqCVGgpS63ZaxELZY3ggWwSxYSgs8mRo+J9o2lGEoueoR7+LX4incGCh6z
 kxnXVgrTjWw4zSKqYGOAUptk91lP7eiNVOIqr/ZU8CAxC8La3HU1IMiyHGNBnHPUVoyu
 COKVqDP+M+5hq4Z824EyKesRR1c4/43GNdNCPetjIzLHr1Yn8h+tMsg8NBKZumEA3Oma
 vuWfnd2QHJIFkAgFqyF08J1AV2EC2bjSUc+3RVqKeucrYOFj8hQ3SLNUop020NtVRVhd
 rdtEa0xYg3MBmyDLbbycRoUbsoXHfO1sSUUR/gh1ZgN0WCN6cTVkgLaAAgbuMZN5KSxr
 x1gg==
X-Forwarded-Encrypted: i=1;
 AFNElJ93vSewyRs9GDqwLfwpniqD+Z9hmt7j2l4czDHTVHCBt0+KkK5G/XR/uXx07vjpdWMLRc37opzy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwywRH0YjUhbnQzz6/Izgf4VT22gxJetsSCXpuzrxdMisyD10xw
 dEulw52tt3YRXG+UsNJ6QfIeS5YTefhRLPacKG8lz8wzobK8+F4RbC2j
X-Gm-Gg: Acq92OGbI5fs5KW7MMEVjEiQOH2JuMptJsLNGwNfYFsQeVqIEzXcS0NaS4WWfoK8yRL
 Zf+vG9234AXbynDN5XYpifWPAEWyqIfmPezyQ7xfaoJcQKZAwyvvGWQIyTlLmu3/v84SF4QCnxi
 t1KIrBJbKTa1IMI3krg8rou6OzTobGDKb/Gsv+LRsE1zG/ye07bfiHmNRYTQk+pl5oDAf0CTmQd
 XQ/IgqPEmHTPmCp3gXy47NMmbrr32IMl4DBQwxcZs5T8NGp6AkxRaC6vgms8sa0KTNdgwddhqWg
 nU6dLdK3ozaGRa7917seWIiGGRA2pekoCc0AjaTlU1RjUQiYNntBGoMJREQa4D5HGak2US6Zmi2
 y7HJJ/X9SViWX2zgg58ymvY2X0yNZgSgG4YT9jJMHIukIJAlMpIbjaM1NXTb2URxuBwVWN9Zk17
 eulRozXCfhOqO3HwjJiivM0N7GK/Fnjhu92dTUqoGizerkdS5teqk8WXgOCTyK/og=
X-Received: by 2002:a05:6a00:929e:b0:83f:250d:59c with SMTP id
 d2e1a72fcca58-842b0fa5602mr14958894b3a.39.1780900604162; 
 Sun, 07 Jun 2026 23:36:44 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-842823512b0sm17743127b3a.15.2026.06.07.23.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 23:36:43 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/radeon: avoid double free in r600 DPM cleanup
Date: Mon,  8 Jun 2026 14:36:38 +0800
Message-ID: <20260608063638.24-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jun 2026 09:06:35 +0000
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
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F30EC654612

r600_parse_extended_power_table() uses manual kfree() calls for some
early allocation failures, but the freed pointers are left in the
dynamic power-management state. If device teardown later calls
r600_free_extended_power_table(), those stale pointers can be freed
again.

Use the common extended power table cleanup helper for those early
failure paths as well, and clear each pointer after freeing it so
repeated cleanup stays safe.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/radeon/r600_dpm.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
index 83f1ae31cbdbc..9755e717ca8bb 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -932,7 +932,7 @@ int r600_parse_extended_power_table(struct radeon_device *rdev)
 			ret = r600_parse_clk_voltage_dep_table(&rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk,
 							       dep_table);
 			if (ret) {
-				kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk.entries);
+				r600_free_extended_power_table(rdev);
 				return ret;
 			}
 		}
@@ -943,8 +943,7 @@ int r600_parse_extended_power_table(struct radeon_device *rdev)
 			ret = r600_parse_clk_voltage_dep_table(&rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk,
 							       dep_table);
 			if (ret) {
-				kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk.entries);
-				kfree(rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk.entries);
+				r600_free_extended_power_table(rdev);
 				return ret;
 			}
 		}
@@ -955,9 +954,7 @@ int r600_parse_extended_power_table(struct radeon_device *rdev)
 			ret = r600_parse_clk_voltage_dep_table(&rdev->pm.dpm.dyn_state.mvdd_dependency_on_mclk,
 							       dep_table);
 			if (ret) {
-				kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk.entries);
-				kfree(rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk.entries);
-				kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk.entries);
+				r600_free_extended_power_table(rdev);
 				return ret;
 			}
 		}
@@ -1296,17 +1293,29 @@ void r600_free_extended_power_table(struct radeon_device *rdev)
 	struct radeon_dpm_dynamic_state *dyn_state = &rdev->pm.dpm.dyn_state;
 
 	kfree(dyn_state->vddc_dependency_on_sclk.entries);
+	dyn_state->vddc_dependency_on_sclk.entries = NULL;
 	kfree(dyn_state->vddci_dependency_on_mclk.entries);
+	dyn_state->vddci_dependency_on_mclk.entries = NULL;
 	kfree(dyn_state->vddc_dependency_on_mclk.entries);
+	dyn_state->vddc_dependency_on_mclk.entries = NULL;
 	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
+	dyn_state->mvdd_dependency_on_mclk.entries = NULL;
 	kfree(dyn_state->cac_leakage_table.entries);
+	dyn_state->cac_leakage_table.entries = NULL;
 	kfree(dyn_state->phase_shedding_limits_table.entries);
+	dyn_state->phase_shedding_limits_table.entries = NULL;
 	kfree(dyn_state->ppm_table);
+	dyn_state->ppm_table = NULL;
 	kfree(dyn_state->cac_tdp_table);
+	dyn_state->cac_tdp_table = NULL;
 	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
+	dyn_state->vce_clock_voltage_dependency_table.entries = NULL;
 	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
+	dyn_state->uvd_clock_voltage_dependency_table.entries = NULL;
 	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
+	dyn_state->samu_clock_voltage_dependency_table.entries = NULL;
 	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
+	dyn_state->acp_clock_voltage_dependency_table.entries = NULL;
 }
 
 enum radeon_pcie_gen r600_get_pcie_gen_support(struct radeon_device *rdev,
-- 
2.51.0

