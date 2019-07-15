Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E469E29
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA02889EFF;
	Mon, 15 Jul 2019 21:25:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D2289ED6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so12903305qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=voZvlb4H+nfjcNuv3L8N3D5+95yY+m83p84T5p1N0Yc=;
 b=oD594PDgTx/tNV3VoQgzyvF+AmRcgApqGUUI+iGXLk6rGs9+ScvBpibiXwk+NrIpHy
 2TYR1JtpM/Li5o8qj+hiFGIhoN+IcySpAnX9nx+71LSzHD5GTEyib2lT3Sbief7tMLyn
 5zcVOV+TBULPEmo7fvabXcLNT/Obi71Bm7dtyZTfcO1WmgTMMY402QhXlKdKzchfszy6
 fxaPnbNLCz2oFr6J3RxZp5qtJerHXqoCb8tCS5YGjEfVzQPtMDzgXZs/j+3WCYBX9e9s
 hPEZPm8FnS7wkHAcK4WPMkwT+NGiKxtN9E7HJ2mR4m7zrLM6pvRHIkZ0OLA6K0YJSZLO
 Gpdw==
X-Gm-Message-State: APjAAAXck+oGr0oYt+oBgHK7oEUiJ/Q0gd2h8szz4j1VCVrwlzY8J9SI
 42l39mmtZeeWSWYzR23wTA8+Wgv8
X-Google-Smtp-Source: APXvYqxPXuInlRVFNFOmTm7CAQZVk9+PusdQuc9DTzeV7X9SCK6xkyw9fd3M7r+IbSn/8raN04TYwQ==
X-Received: by 2002:a37:98c3:: with SMTP id
 a186mr18698830qke.498.1563225932895; 
 Mon, 15 Jul 2019 14:25:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 054/102] drm/amdgpu: Clear build undefined warning
Date: Mon, 15 Jul 2019 16:23:49 -0500
Message-Id: <20190715212437.31793-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=voZvlb4H+nfjcNuv3L8N3D5+95yY+m83p84T5p1N0Yc=;
 b=iwQOz8NCAicb01n7RuKi5XjYCz7ietstMF31WWF4My6J/Rlf8HyUdf7N13oxCHYJRQ
 g7+BufBV/m+D9b/KmH6vcegcrz20NdNSPXao+HPos8Xd5DfrJdJbeHiJ//+yPeENlM/d
 aUW9cT6C0q7D+O0e6kRTD2XMznX6fk2W2HmfJk3oXxb4NhcMWnOa2d4w0c4rSCcVZyse
 usW2VNyj8IffGRZQMQ5cR4gcffcO/jlu90rWaQuoOqvjylzo2CDYmUYtxOS1bt9469wd
 RArtcyavTmvg7ue42/Oqm9x4C+9jaUyHc3WxdgmNneJt86Gib9xOXcwiz31lKVKyudO2
 wCFQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 James Zhu <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCkFkZCBhbWRncHVfYW1ka2ZkX2Fy
Y3R1cnVzX2dldF9mdW5jdGlvbnMgc3R1YiB3aGVuCkNPTkZJR19IU0FfQU1EIGlzIHVuZGVmaW5k
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMK
aW5kZXggNzAyZDA1Y2UxZmE1Li5mMDUyYzcwZTQ2NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKQEAgLTcxOCw2ICs3MTgsMTEgQEAgc3RydWN0IGtmZDJr
Z2RfY2FsbHMgKmFtZGdwdV9hbWRrZmRfZ2Z4XzlfMF9nZXRfZnVuY3Rpb25zKHZvaWQpCiAJcmV0
dXJuIE5VTEw7CiB9CiAKK3N0cnVjdCBrZmQya2dkX2NhbGxzICphbWRncHVfYW1ka2ZkX2FyY3R1
cnVzX2dldF9mdW5jdGlvbnModm9pZCkKK3sKKwlyZXR1cm4gTlVMTDsKK30KKwogc3RydWN0IGtm
ZDJrZ2RfY2FsbHMgKmFtZGdwdV9hbWRrZmRfZ2Z4XzEwXzBfZ2V0X2Z1bmN0aW9ucyh2b2lkKQog
ewogCXJldHVybiBOVUxMOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
