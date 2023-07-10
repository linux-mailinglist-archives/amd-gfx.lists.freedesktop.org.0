Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335B74D70D
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jul 2023 15:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FACC10E297;
	Mon, 10 Jul 2023 13:09:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0710E23F
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jul 2023 09:05:59 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzylm0pqxzBHXhB
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jul 2023 17:05:56 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688979955; x=1691571956; bh=Q7yjvxrMTbuX88XtUMgBQdXnOJS
 T6lyZeot0NWWwG5Q=; b=B4u4PenjrUsJtkWHhha/jWwYdFHk6Y+OmJOgGPZJYIQ
 v3OIJhq/3OIfaCvIpeU7YTSLEsoaCwQre8Zj7dXpC/aw4g93nz8JtMaJ0auiO41L
 5XKG/izwnKyGd1kZ3b8cGJbRvKEwEDz5c8dHoat8ts/Ne0Y9yB8rTFD8WanSbeI2
 lj19tkk7On3grN4H2r/nTG1iZXSzpBoWh+IglrUoQ8HKizKQEpOHdmvOO9zkfdS0
 JlT635SOWTEN0klQu1GGih5IoArNaHv7pIfCe3U6YvMZroHfAAFJuFTzdY1ojFah
 ITXWJ3ZszvmPYbOgOmKGSWx0FIzEs1yUFApal4QilLA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gt9nexPvWQCc for <amd-gfx@lists.freedesktop.org>;
 Mon, 10 Jul 2023 17:05:55 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzyll5nZLzBHXR1;
 Mon, 10 Jul 2023 17:05:55 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 17:05:55 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: that open brace { should be on the
 previous line
In-Reply-To: <20230710090421.61623-1-xujianghui@cdjrlc.com>
References: <20230710090421.61623-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <77876ef2908eda36cb7f843145ec8cec@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 13:09:18 +0000
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

Fix eleven occurrences of the checkpatch.pl error:
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/rv770.c | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv770.c 
b/drivers/gpu/drm/radeon/rv770.c
index a5ce59d4a485..9ce12fa3c356 100644
--- a/drivers/gpu/drm/radeon/rv770.c
+++ b/drivers/gpu/drm/radeon/rv770.c
@@ -136,7 +136,7 @@ int rv770_set_uvd_clocks(struct radeon_device *rdev, 
u32 vclk, u32 dclk)
      return 0;
  }

-static const u32 r7xx_golden_registers[] ={
+static const u32 r7xx_golden_registers[] = {
      0x8d00, 0xffffffff, 0x0e0e0074,
      0x8d04, 0xffffffff, 0x013a2b34,
      0x9508, 0xffffffff, 0x00000002,
@@ -151,7 +151,7 @@ static const u32 r7xx_golden_registers[] ={
      0x7300, 0xffffffff, 0x001000f0
  };

-static const u32 r7xx_golden_dyn_gpr_registers[] ={
+static const u32 r7xx_golden_dyn_gpr_registers[] = {
      0x8db0, 0xffffffff, 0x98989898,
      0x8db4, 0xffffffff, 0x98989898,
      0x8db8, 0xffffffff, 0x98989898,
@@ -163,7 +163,7 @@ static const u32 r7xx_golden_dyn_gpr_registers[] ={
      0x88c4, 0xffffffff, 0x00000082
  };

-static const u32 rv770_golden_registers[] ={
+static const u32 rv770_golden_registers[] = {
      0x562c, 0xffffffff, 0,
      0x3f90, 0xffffffff, 0,
      0x9148, 0xffffffff, 0,
@@ -172,7 +172,7 @@ static const u32 rv770_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv770ce_golden_registers[] ={
+static const u32 rv770ce_golden_registers[] = {
      0x562c, 0xffffffff, 0,
      0x3f90, 0xffffffff, 0x00cc0000,
      0x9148, 0xffffffff, 0x00cc0000,
@@ -183,7 +183,7 @@ static const u32 rv770ce_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv770_mgcg_init[] ={
+static const u32 rv770_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x130300f9,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -340,7 +340,7 @@ static const u32 rv770_mgcg_init[] ={
      0x92a4, 0xffffffff, 0x00080007
  };

-static const u32 rv710_golden_registers[] ={
+static const u32 rv710_golden_registers[] = {
      0x3f90, 0x00ff0000, 0x00fc0000,
      0x9148, 0x00ff0000, 0x00fc0000,
      0x3f94, 0x00ff0000, 0x00fc0000,
@@ -349,7 +349,7 @@ static const u32 rv710_golden_registers[] ={
      0xa180, 0xffffffff, 0x00003f3f
  };

-static const u32 rv710_mgcg_init[] ={
+static const u32 rv710_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x13030040,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -407,7 +407,7 @@ static const u32 rv710_mgcg_init[] ={
      0x9150, 0xffffffff, 0x4d940000
  };

-static const u32 rv730_golden_registers[] ={
+static const u32 rv730_golden_registers[] = {
      0x3f90, 0x00ff0000, 0x00f00000,
      0x9148, 0x00ff0000, 0x00f00000,
      0x3f94, 0x00ff0000, 0x00f00000,
@@ -417,7 +417,7 @@ static const u32 rv730_golden_registers[] ={
      0xa180, 0xffffffff, 0x00003f3f
  };

-static const u32 rv730_mgcg_init[] ={
+static const u32 rv730_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x130300f9,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -538,7 +538,7 @@ static const u32 rv730_mgcg_init[] ={
      0x92a4, 0xffffffff, 0x00000005
  };

-static const u32 rv740_golden_registers[] ={
+static const u32 rv740_golden_registers[] = {
      0x88c4, 0xffffffff, 0x00000082,
      0x28a50, 0xfffffffc, 0x00000004,
      0x2650, 0x00040000, 0,
@@ -574,7 +574,7 @@ static const u32 rv740_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv740_mgcg_init[] ={
+static const u32 rv740_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x13030100,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
