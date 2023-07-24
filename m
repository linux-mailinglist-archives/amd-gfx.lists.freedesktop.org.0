Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F175F77A
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jul 2023 14:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C9810E2FE;
	Mon, 24 Jul 2023 12:58:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45BD10E12E
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jul 2023 07:32:46 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8X1l60m2zBRx56
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jul 2023 15:32:43 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690183963; x=1692775964; bh=S9tFFcFdxC3EfuKS841EZfUjDnN
 6RZk4grIKnUJ88MA=; b=JNpDSiJfxvqunsECsmaImwqu58zbRVWQG1PQDcBUhmr
 UflbDfvmfrH7XhDSOSDAssxX8qJnNag8x57qDIdLQ5yxWBrWTvzVGiL9OZZVaTPD
 LEyzotFQztuGIJo21LLojjgtsSxjKJyGhFbGLWMmM6nwJ34hNLMdR6BKJ+a1avrL
 wGjP17Ppwk3/e8n01t73OKLhpUGaWqjpizx0gaSX+lVDCdguLAbcMg0BiG0yfxV5
 xgx3psQwmEskqN4t0tMCI09oW/J43nmdZxql6OhgXn2YuGK2nzAqOBrvvKzYw2js
 8N4X/VL7OYZZpR+hGq/CTFJy8AMUZVCV4CNyaJk4Qqg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qetSpfLjTaFU for <amd-gfx@lists.freedesktop.org>;
 Mon, 24 Jul 2023 15:32:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8X1l4TNBzBHBPw;
 Mon, 24 Jul 2023 15:32:43 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 15:32:43 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in arcturus_ppt.c
In-Reply-To: <20230724073153.9003-1-xujianghui@cdjrlc.com>
References: <20230724073153.9003-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <71605c0ae02fcfd1d044aa9e52088543@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 24 Jul 2023 12:58:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: spaces required around that '=' (ctx:VxW)
ERROR: spaces required around that '>=' (ctx:WxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c 
b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 3bb18396d2f9..c49f770c97b3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -598,7 +598,7 @@ static int arcturus_get_smu_metrics_data(struct 
smu_context *smu,
  					 MetricsMember_t member,
  					 uint32_t *value)
  {
-	struct smu_table_context *smu_table= &smu->smu_table;
+	struct smu_table_context *smu_table = &smu->smu_table;
  	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
  	int ret = 0;

@@ -1482,7 +1482,7 @@ static int arcturus_set_power_profile_mode(struct 
smu_context *smu,
  		return ret;

  	if ((profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) &&
-	     (smu_version >=0x360d00)) {
+	     (smu_version >= 0x360d00)) {
  		ret = smu_cmn_update_table(smu,
  				       SMU_TABLE_ACTIVITY_MONITOR_COEFF,
  				       WORKLOAD_PPLIB_CUSTOM_BIT,
