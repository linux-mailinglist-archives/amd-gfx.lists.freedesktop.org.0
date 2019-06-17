Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F948F48
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28E589BC2;
	Mon, 17 Jun 2019 19:31:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9089BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r6so6988957qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UMucLq9M8T/HQrI6IaZOXlgoL3ksmnYT660DXk31wg=;
 b=sFFZ1x0Pz3g3ALPBbbPnfu1YQMVYUIspPyoYq+V7HwXWyIEqtdzkZezanQGoXvX+Wo
 ZZvlcW6OlqhdgqMxby+h0IiXx3of7VsE4gQDO89p1C4JTqFatatxI7axWVeQIY1YR+I6
 8schlyg41a4KyfSZg83OYCj0w2Y6OLORUrqF1a9gOKY/lrlbyNEJbGacu0JzVfCVA92e
 UiPlU/TIeuGtMui9S8IQQGZaBuNrSuB22gK+J6VzPH4qmntvDf9QcyqtlamW8d7LpEjC
 zEffzZdLKP+M8Bh7srPCeotfAZY/xT0gk6UOp2nQVCfUCwG4x+8VFeryQ44n5rh/jJOd
 QkEg==
X-Gm-Message-State: APjAAAXK2QopI5B/OVEzPqubiXVPhZf9v0y3K7gn/P4c3KFatZFRJO1D
 aYbuQRMTW18tXdBJ+OSDu22jrquTDmc=
X-Google-Smtp-Source: APXvYqw8RQs0AXg3reV2QL5R1moqDiYhCiytNuOMExN3gHpCC3wqQGYx5IWHQnSRJ16A//8H+oEZKw==
X-Received: by 2002:a37:5c8:: with SMTP id 191mr77855506qkf.188.1560799890691; 
 Mon, 17 Jun 2019 12:31:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 219/459] amd/powerplay: fix the issue of uclk dpm
Date: Mon, 17 Jun 2019 14:29:46 -0500
Message-Id: <20190617193106.18231-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UMucLq9M8T/HQrI6IaZOXlgoL3ksmnYT660DXk31wg=;
 b=crv0dOsEgdmNv+vH5aX5ZiTTsDDO4DmgQbXwxMsH6lc4Co5porxvHsUZhZ+drCbMCt
 ViShVRn2nSPp5VWLULp3fBmyCGn3pL9Dp6QLLQoeB/SEUIHEAu2YDkxrEwhNdaWrcOQz
 hOKISRLiywlWFiOFZbPhlwlcNuSW9qsJyBwiY+VYYj/dbGNCTvO/hTZ2rwcLVtlqqORB
 cF9WeIU5RBjoJtbuIGvqTLGlGSzjg6ym6QHk/TyDZh1O0UC22SFLvXYSqMyN0Zcftk8w
 pyGrTg+r2qQKsN65LTqYyZ3vZRoU8XD4yiO+abnQCQMe4xlYu77Xt3iKhkKfX9M/EH2Q
 AGwg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KClBQU01DX01TR19TZXRV
Y2xrRmFzdFN3aXRjaCBtZXNzYWdlIGNhbiBiZSBhcHBsaWVkIG9uIHZlZ2EyMCwKYnV0IGNhbid0
IG9uIG5hdmkxMC4gVGhpcyBpcyB0aGUgcHJlcmVxdWlzaXRlIG9mIHVjbGsgZHBtIG9uCm5hdmkx
MC4KClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDU2NGI2MWFmNmMzMC4uNWQyZTgyZWYyNTBkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMzI3LDcgKzMyNyw2
IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldHVwX3BwdGFibGUoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpCiAJaGRyID0gKGNvbnN0IHN0cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVyX3YxXzAgKikg
YWRldi0+cG0uZnctPmRhdGE7CiAJdmVyc2lvbl9tYWpvciA9IGxlMTZfdG9fY3B1KGhkci0+aGVh
ZGVyLmhlYWRlcl92ZXJzaW9uX21ham9yKTsKIAl2ZXJzaW9uX21pbm9yID0gbGUxNl90b19jcHUo
aGRyLT5oZWFkZXIuaGVhZGVyX3ZlcnNpb25fbWlub3IpOwotCiAJaWYgKHZlcnNpb25fbWFqb3Ig
PT0gMiAmJiBzbXUtPnNtdV90YWJsZS5ib290X3ZhbHVlcy5wcF90YWJsZV9pZCA+IDApIHsKIAkJ
c3dpdGNoICh2ZXJzaW9uX21pbm9yKSB7CiAJCWNhc2UgMDoKQEAgLTkwMCw4ICs4OTksOSBAQCBz
dGF0aWMgaW50IHNtdV92MTFfMF9ub3RpZnlfZGlzcGxheV9jaGFuZ2Uoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCiAKIAlpZiAoIXNtdS0+cG1fZW5hYmxlZCkKIAkJcmV0dXJuIHJldDsKLQlpZiAo
c211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpCi0J
ICAgIHJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfU2V0VWNs
a0Zhc3RTd2l0Y2gsIDEpOworCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZF
QVRVUkVfRFBNX1VDTEtfQklUKSAmJgorCSAgICBzbXUtPmFkZXYtPmdtYy52cmFtX3R5cGUgPT0g
QU1ER1BVX1ZSQU1fVFlQRV9IQk0pCisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJh
bShzbXUsIFNNVV9NU0dfU2V0VWNsa0Zhc3RTd2l0Y2gsIDEpOwogCiAJcmV0dXJuIHJldDsKIH0K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
