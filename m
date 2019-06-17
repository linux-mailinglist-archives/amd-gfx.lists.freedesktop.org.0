Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8648FFE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725C89E26;
	Mon, 17 Jun 2019 19:46:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2024689E26
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so6974191qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jm51RpQpWsH9ZfqHujNhlyAVma0X8KuOW0UWsPXH+M=;
 b=Flmx62Xv7cucDU9Zw8TQILkXuEDmT0ycoiThHsdX+txTXnx7FaCm31WicgHLZDMrUj
 jh/RAhm9s14J/EfGfuNxMdKTDZW0t5HSzonZdTaE0QVBK8lmGVKz1srlbNTN/+l5Kxff
 2xfCV2FIQ5bXshR4pUu972yVhOpRMSW/JZZrIzzSDWx7cCEBUGmsuXIfhj3OGok8GOfK
 1hF+BJmzVHsFvwAYac0JzJSK3SX9cXxB3nvsyDO3HP25O8bwcLAxAtXUspecpuDm3sqD
 P1Jx1IoxBdYPheZsx2DtSJe6+qkeMi9MdABD+WwbdPtF2Fw5ezJ+bibCQzX2xW8IHP1g
 KDOQ==
X-Gm-Message-State: APjAAAWc2REU8bbiMv3h7TXGrN1KPtz7VfSH701avl5g+P559+nWwAAE
 ATU5J9gnyP2aEAQejvqnUK2vgbUWo/A=
X-Google-Smtp-Source: APXvYqxfIfqN/OuG66ZRYp80QZsjx6vNJdyLikAeowiKPE0HgYoXJSYNkxhplXJh5byDI3ikK7RQcQ==
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr68890204qkd.106.1560800794039; 
 Mon, 17 Jun 2019 12:46:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 338/459] drm/amd/display: add fast_validate parameter to
 dcn20_validate_bandwidth
Date: Mon, 17 Jun 2019 14:44:39 -0500
Message-Id: <20190617194540.18497-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jm51RpQpWsH9ZfqHujNhlyAVma0X8KuOW0UWsPXH+M=;
 b=o0PW+3pSvLHYcaiAi+CikjiJzz8rHnTUnKdK720Q6Ios0eWJfIG5kR8YqfXwutw+oZ
 YwlUovCx2zzrpd3xHjG3W8tM6bDDE41J+nqbytbtvgDcRoXxWA7jaPNhuGMHx9P7Qvb8
 Vxd/TvhNPxWTK2r1GJDEFZ/pqIf4t+2rGUBavvbUdbrGGL5RxvC/RIw0EdYG2P4HWXle
 g9olOlyXnjB9NG0TpqX/cOckYwZG3VYDs2QO1m31rRIX1kr+PoVwFUm+kPEyRuxVwbUM
 UGaNIrCTUI+uRpAUvABV0hBuBJ60nK6R8Fz6YhEJ4cx/ssOsp5uskFHirF6Gw71VLOcl
 p+Pw==
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

VG8gZGVhbCB3aXRoIGNoYW5nZXMgZnJvbSByZWJhc2luZy4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDQgKysrLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmggfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmlu
ZGV4IDUyMmI4NWE1ZGIzMy4uMTZiZTIyYTIwOTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMTcwNSw3ICsx
NzA1LDkgQEAgdm9pZCBkY24yMF9zZXRfbWNpZl9hcmJfcGFyYW1zKAogCX0KIH0KIAotYm9vbCBk
Y24yMF92YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpj
b250ZXh0KQorYm9vbCBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywKKwkJ
CSAgICAgIHN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCwKKwkJCSAgICAgIGJvb2wgZmFzdF92YWxp
ZGF0ZSkKIHsKIAlpbnQgcGlwZV9jbnQsIGksIHBpcGVfaWR4LCB2bGV2ZWwsIHZsZXZlbF91bnNw
bGl0OwogCWludCBwaXBlX3NwbGl0X2Zyb21bTUFYX1BJUEVTXTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgKaW5kZXggYWI5
ZGIxNmY1MTY1Li5jNWYxNzZmYjY1NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oCkBAIC0xMTUsNyArMTE1LDcgQEAg
dm9pZCBkY24yMF9zZXRfbWNpZl9hcmJfcGFyYW1zKAogCQlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRl
eHQsCiAJCWRpc3BsYXlfZTJlX3BpcGVfcGFyYW1zX3N0ICpwaXBlcywKIAkJaW50IHBpcGVfY250
KTsKLWJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBk
Y19zdGF0ZSAqY29udGV4dCk7Citib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3Qg
ZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsIGJvb2wgZmFzdF92YWxpZGF0ZSk7CiAK
IGVudW0gZGNfc3RhdHVzIGRjbjIwX2J1aWxkX21hcHBlZF9yZXNvdXJjZShjb25zdCBzdHJ1Y3Qg
ZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUg
KnN0cmVhbSk7CiBlbnVtIGRjX3N0YXR1cyBkY24yMF92YWxpZGF0ZV9nbG9iYWwoc3RydWN0IGRj
ICpkYywJc3RydWN0IGRjX3N0YXRlICpuZXdfY3R4KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
