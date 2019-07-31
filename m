Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B273C7C793
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 17:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D896F89F2A;
	Wed, 31 Jul 2019 15:52:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5189DF7;
 Wed, 31 Jul 2019 15:52:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id k10so67147860qtq.1;
 Wed, 31 Jul 2019 08:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3jr30uHX5GuaBAnJLptVszN+2CiQR2q9FKc7zTu4C4=;
 b=lbbLDkoQTpFn2g6LuY2xSrbv/MItnGHR/2BcBs6Vn5j3p15RTv0zUjZVcjcUt4hlkx
 wRE6wDgaWUBhgplnhldKK0ScxHXwU1ZztW4DqSi1E9F/CXy02VcpsyJ+anE7cg7uDIA9
 u7BmRLLAiI+rki7riiKJHkma9MRWuvX3CGwk9FIMYHiNhd90eDjx4HJMOB4tO8lOxK5/
 /jL3K6pvqOcd/pF0wk0XliLrOLZCYM26WICwlP9eAWrTtj9/uUJrOF8vndu7bhUc7wGV
 S3uKjJ7rPZr77IJLJ4wClUXfMJKXA5ZBg5c05qy9Oyg7WHSCba/hR1g11MxF9SbnFNye
 ZZ0Q==
X-Gm-Message-State: APjAAAV31+ADQrp4gNdnyuVh/gGH6wvS3dLc41L429YVYieFdhB4ynz4
 BbwhG2Hz9o331kN34uhoDRuvFvba
X-Google-Smtp-Source: APXvYqw+K5dWOSfysvgEz9KIMdM6P076rq9vI83Da3RYYR+KMhDP4WR6tWUz3Courh7opWwIoiJIYw==
X-Received: by 2002:ac8:2379:: with SMTP id b54mr87567187qtb.168.1564588374433; 
 Wed, 31 Jul 2019 08:52:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/amdgpu: drop drmP.h from amdgpu_amdkfd_gfx_v10.c
Date: Wed, 31 Jul 2019 10:52:40 -0500
Message-Id: <20190731155246.20603-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3jr30uHX5GuaBAnJLptVszN+2CiQR2q9FKc7zTu4C4=;
 b=AiqAPxNKvYEYICUAq6wcp5MBEc64DIsoU3C4X1mt+LIxrChtWNGjXsDd7aGMIjiqie
 RnK4GjyGT7ma/khflE1e/jOBCn9AOrYl5z/8joUXcjyeFc7f3tJutTyruoKakCkMM33b
 leMLZjdTfuT0MSQHk0PBJGmx0V1Kw95J0RWszwX/wbwn3PYAzSzoIBQNCCdfg+fOHM0h
 V+ZtowWt6LQleQqY4n8w4XRtQhPBzgMweRQagaxtCC615eCpQj5fgkrgu3SWYN17QXm+
 kW9KbF+ZTVbrH0WPCfUJgpIw0FTAsKaEl8G7OgXGq9XewWizX6VGHA6NzLgqyawzUHTA
 LUDA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW51c2VkLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4
X3YxMC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3YxMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKaW5kZXggMDcy
M2Y4MDBlODE1Li43YzAzYTdmY2QwMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3YxMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3YxMC5jCkBAIC0yNyw3ICsyNyw2IEBACiAjaW5jbHVk
ZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlLmg+CiAjaW5jbHVk
ZSA8bGludXgvbW11X2NvbnRleHQuaD4KLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUg
ImFtZGdwdS5oIgogI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCIKICNpbmNsdWRlICJhbWRncHVf
dWNvZGUuaCIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
