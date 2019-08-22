Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5C99845
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 17:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E36EB7F;
	Thu, 22 Aug 2019 15:36:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B266EB39
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 15:36:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u34so8230577qte.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCIJ0FFLVz9LDhGNJ3sGHu8JOliYuE1arv53/kdqxi4=;
 b=eeAs5Umerk6HwdJlK67juefcGGMHsOyf98VF/8//buyT+1TdilIYbVdZ82VC+9rf0A
 3E3zZm/Ixa+ehX3jfJegO7R4Jy6BkWfijFgp4pSRkUvGaiyZkvlgDbH4C+dMdGX1dW5J
 4C4jKjTEYZQKK5nbKrUQgtoF4Z+KiOAfOasCwtypHEudRAGgMZhshIKLPPXmC7Gq5Ste
 NXy8GSlipCwIJ7lfIs3dOC1BG69pv8akq4CRBeF6MAtHrqIt14VScU/XbvnSQhwE5Zma
 G0rtrr2W0A3PHSTMobuLHwun93hd5Tc5JfRgc49Cmco6f0ojJpwsai7DiB24LpodxQmf
 Fe4g==
X-Gm-Message-State: APjAAAW7HQLa1Cp7+hUG/PDW8BVd9vLcaEgjVPci5EbnkCMMoun7hvye
 JWK5oLj11n4KXmg08kX48oF5HO5/
X-Google-Smtp-Source: APXvYqwKE7RJhQ3L044gqAiaZJvia9ixdvWoTjlE8kZFHqBfMi+fWOLTNvdKqZXaXT4Q4XsIyUYxVQ==
X-Received: by 2002:a0c:e1cd:: with SMTP id v13mr21865492qvl.245.1566488214495; 
 Thu, 22 Aug 2019 08:36:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id x3sm7958qkl.71.2019.08.22.08.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 08:36:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/powerplay/vega10: enable mclk switching if
 monitors are synced
Date: Thu, 22 Aug 2019 10:36:44 -0500
Message-Id: <20190822153645.3296-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822153645.3296-1-alexander.deucher@amd.com>
References: <20190822153645.3296-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCIJ0FFLVz9LDhGNJ3sGHu8JOliYuE1arv53/kdqxi4=;
 b=MnXt/NFujucatkAPZOXKEshUJA8GZKD1K2si1d4RCzIRzmz3awv3gJa1J8tpVZhw+s
 kT6vI5VKY0gzJeZBPe0f1LtoEgbX2aurX9PTg5TQyI3TnJyQkJduevOVuq4Ek4L+6W4/
 Ycf8SHDzbJRsyuMADRhnIFX4E+fQZmTlc95uxUNixhI3pOYRPeNU1CbDtk4GdHgOCFR3
 XOA2bhfVIH5rG1xObcqOQz4By4uY8uuX5UhhUYjkPhN/3d6v1jm6zVWwmgkMtC6k/n1d
 uiT9r4HOOx9IXpLtuLW4owIgsfOuO/oRruRQqXrLLCdVb1kEXppW8ms+IjRk7je0oQpL
 +ORw==
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
