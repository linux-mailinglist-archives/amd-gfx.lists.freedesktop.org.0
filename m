Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0BF9A012
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4AF6EA83;
	Thu, 22 Aug 2019 19:31:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56536EA83
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:31:03 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id q4so9029177qtp.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCIJ0FFLVz9LDhGNJ3sGHu8JOliYuE1arv53/kdqxi4=;
 b=KWLu/a2piCgcSxuUj0oxNm93o3+Im1LUJfg4rMwD/3RrLmdItov8egvz9TjHXzOE1J
 amC1+oxczgK9uIlZXBygI/+Nhs9AyJu5guTn+SSdL3vajGniTM7T9OSlAd+NTgDpwJTp
 n86wwx8ic+/OZUQMIJ8d4CE0sjOBtZhIy5sq8rOq/oH2XyQw+bJQZH1MU/qMq3WW1/zV
 CDfIkKA9nyM2Ym/7nLqiK55aD3mr5JhRLvuQi4SOogcVBuEaQTvWJr/dI/VxQbWyndSv
 VyUt2xQujRw6RF2DAJGT/uJtpPHb/tVuLodOq41ZYegxtH7VTbE3TzgE+Pe0ohicNNhR
 tCfA==
X-Gm-Message-State: APjAAAVNXyA29SJBAKZlSA5zWRO382hTyWwOpAyJpjVMDUCYt1nmRZVV
 hc6krOzY8KBCgXEb+zWTrU3ILYLy
X-Google-Smtp-Source: APXvYqwTroh8XjNPtZoUndx5O0OePBWcuBkULJNsVDOtxnnD147HKOmf/Gm9DaeC5CqT2gsNurhw7w==
X-Received: by 2002:a0c:da11:: with SMTP id x17mr953035qvj.197.1566502262698; 
 Thu, 22 Aug 2019 12:31:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h1sm337140qkh.101.2019.08.22.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 12:31:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu/powerplay/vega10: enable mclk switching if
 monitors are synced
Date: Thu, 22 Aug 2019 14:30:48 -0500
Message-Id: <20190822193050.3107-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822193050.3107-1-alexander.deucher@amd.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCIJ0FFLVz9LDhGNJ3sGHu8JOliYuE1arv53/kdqxi4=;
 b=jnzNdbEJ5AxD5pHuBDfvo8Ux/jJvFxR+v7M7TF+Go2iRhXuEj5E0Ars2MIDuhsBxZp
 Yc7PcuEcDCE8n2d56SQAlJztcAvIzlwA+pz9mPovw1k9BJ6drX00kQMKDdat8cTT+cV0
 s2vFFok8pMV0IesuvR0ARYzZpVLcp18RnH9iqFfbl3OL4gy10RJckBp3EAiTclPksGGT
 PLtU8+OTRHb0d7nD5cstfJrBhNGOCpGKikvrlWz3+aeKPP3C7YJ9Dayj3BsNg7aLViLL
 16THNU409GScc238FAVfF67bnilGPZ0n3rn8Ijo2R1im09UYm9EcgMc8UtDeSrFeLe8v
 3sig==
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

SWYgREMgaGFzIHN5bmNlZCB0aGUgZGlzcGxheXMsIHdlIGNhbiBlbmFibGUgbWNsayBzd2l0Y2hp
bmcgdG8Kc2F2ZSBwb3dlci4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci92ZWdhMTBfaHdtZ3IuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYwppbmRleCA5NDhjNTRjYjljNWQuLmQwODQ5M2I2N2I2NyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmMKQEAgLTMyMjAsNyArMzIyMCw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX2FwcGx5X3N0YXRlX2Fk
anVzdF9ydWxlcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCWlmIChod21nci0+ZGlzcGxheV9j
b25maWctPm51bV9kaXNwbGF5ID09IDApCiAJCWRpc2FibGVfbWNsa19zd2l0Y2hpbmcgPSBmYWxz
ZTsKIAllbHNlCi0JCWRpc2FibGVfbWNsa19zd2l0Y2hpbmcgPSAoaHdtZ3ItPmRpc3BsYXlfY29u
ZmlnLT5udW1fZGlzcGxheSA+IDEpIHx8CisJCWRpc2FibGVfbWNsa19zd2l0Y2hpbmcgPSAoKDEg
PCBod21nci0+ZGlzcGxheV9jb25maWctPm51bV9kaXNwbGF5KSAmJgorCQkJCQkgICFod21nci0+
ZGlzcGxheV9jb25maWctPm11bHRpX21vbml0b3JfaW5fc3luYykgfHwKIAkJCWRpc2FibGVfbWNs
a19zd2l0Y2hpbmdfZm9yX2ZyYW1lX2xvY2sgfHwKIAkJCWRpc2FibGVfbWNsa19zd2l0Y2hpbmdf
Zm9yX3ZyIHx8CiAJCQlmb3JjZV9tY2xrX2hpZ2g7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
