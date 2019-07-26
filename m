Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87275D5A
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F03D6E870;
	Fri, 26 Jul 2019 03:22:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADD06E86A
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:08 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so12412473qka.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AksSqprkkn2SoJhht1J0Xmd1zLdqye+T5xzeESgijI=;
 b=cLP1E5VYB0bsGw8Apyn0wBMiK5RWYiF0H8OSH1FPbcMn9Os8ZdI6MttJT70WojESB4
 WRXUTlCaApVLDgV7VKkp866z9F7YgFjbC7MOu9w198M1f/8aG0Jvj+PeriG1xVQktpC7
 IaFjAle30HEKpzbryQgvuvUldoPH0CsQ4HY2k/Q2PFA8GJt+VNkvfJLDKghVEaBzl1iP
 wNd6vVNQYUGukgsH6Qsug1IPoRtcXkYrs9R/rD+rZLd+ybkkuYHE2vkV6rAnFr9s3BKe
 qG3UZeVM+DfzHbdTT2kQFonnWOsZ0YUVOCQMagX3XaNCAhNd4a72FsU1hgVwBZXlkNeo
 yhpQ==
X-Gm-Message-State: APjAAAWz0rp2gKYyS1FEmAS4XPnFHwHpg3agCahRZADanXel4CpKHFX/
 URUmYSbtSoIBnAH0BxRq/I2Q1Phj
X-Google-Smtp-Source: APXvYqx0MLiuP0KbuV6HZTxeC/elUN5PhBD6xmFRn16Kghar0FAoZ4gjKSY4ce9ZBtFJoiPrKXvhRA==
X-Received: by 2002:a37:ad12:: with SMTP id f18mr16468606qkm.3.1564111327011; 
 Thu, 25 Jul 2019 20:22:07 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/11] drm/amdgpu/powerplay: add set_mp1_state for vega12
Date: Thu, 25 Jul 2019 22:21:45 -0500
Message-Id: <20190726032146.3187-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AksSqprkkn2SoJhht1J0Xmd1zLdqye+T5xzeESgijI=;
 b=TFqJfVssIviXbhomWLVYUWqpMaM2vudwwIRlkdZOHidMfX0jIZkA67NzDZwxYHJHsT
 fzyz60LU6eXIL0nFu2HdVniCbuIXlhPDn+9rmoJTA+PsXW/nTTpR4TVNcfYQ6V+qPB2e
 32BA/oeCFTt1weTraetc8TA5kxLNWbw+1EoqkaRx4MyOL6bb50OjjqSXatB5sT2duyzf
 nkhpD2BQu70NcTU0pzCyXdR6dvtE/mR9fQGY1MkjlhUPF6aZMBlAWpZD7P8LW8F/Go4x
 j3YxtZpcFEPI0N/imRFgLGGtEJygE8mlGcKpyB6s3mFPOXF2TTJkTGwnZQtyeqOAAqXX
 TT3A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZXRzIHRoZSBTTVUgaW50byB0aGUgcHJvcGVyIHN0YXRlIGZvciB2YXJpb3VzCm9wZXJh
dGlvbnMgKHNodXRkb3duLCB1bmxvYWQsIEdQVSByZXNldCwgZXRjLikuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTJfaHdtZ3IuYyAgICB8IDI2ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwppbmRleCBlZmI2ZDM3
NjJmZWIuLjdhZjlhZDQ1MGFjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMKQEAgLTI2MzksNiArMjYzOSwzMCBAQCBzdGF0aWMg
aW50IHZlZ2ExMl9nZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwg
Y29uc3Qgc3RydWN0IHBwXwogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHZlZ2ExMl9zZXRf
bXAxX3N0YXRlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCisJCQkJZW51bSBwcF9tcDFfc3RhdGUg
bXAxX3N0YXRlKQoreworCXVpbnQxNl90IG1zZzsKKwlpbnQgcmV0OworCisJc3dpdGNoIChtcDFf
c3RhdGUpIHsKKwljYXNlIFBQX01QMV9TVEFURV9VTkxPQUQ6CisJCW1zZyA9IFBQU01DX01TR19Q
cmVwYXJlTXAxRm9yVW5sb2FkOworCQlicmVhazsKKwljYXNlIFBQX01QMV9TVEFURV9TSFVURE9X
TjoKKwljYXNlIFBQX01QMV9TVEFURV9SRVNFVDoKKwljYXNlIFBQX01QMV9TVEFURV9OT05FOgor
CWRlZmF1bHQ6CisJCXJldHVybiAwOworCX0KKworCVBQX0FTU0VSVF9XSVRIX0NPREUoKHJldCA9
IHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLCBtc2cpKSA9PSAwLAorCQkJICAgICJbUHJlcGFy
ZU1wMV0gRmFpbGVkISIsCisJCQkgICAgcmV0dXJuIHJldCk7CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBwcF9od21ncl9mdW5jIHZlZ2ExMl9od21ncl9mdW5jcyA9IHsK
IAkuYmFja2VuZF9pbml0ID0gdmVnYTEyX2h3bWdyX2JhY2tlbmRfaW5pdCwKIAkuYmFja2VuZF9m
aW5pID0gdmVnYTEyX2h3bWdyX2JhY2tlbmRfZmluaSwKQEAgLTI2OTUsNyArMjcxOSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHBfaHdtZ3JfZnVuYyB2ZWdhMTJfaHdtZ3JfZnVuY3MgPSB7CiAJ
LnNldF9hc2ljX2JhY29fc3RhdGUgPSB2ZWdhMTJfYmFjb19zZXRfc3RhdGUsCiAJLmdldF9wcGZl
YXR1cmVfc3RhdHVzID0gdmVnYTEyX2dldF9wcGZlYXR1cmVfc3RhdHVzLAogCS5zZXRfcHBmZWF0
dXJlX3N0YXR1cyA9IHZlZ2ExMl9zZXRfcHBmZWF0dXJlX3N0YXR1cywKLQorCS5zZXRfbXAxX3N0
YXRlID0gdmVnYTEyX3NldF9tcDFfc3RhdGUsCiB9OwogCiBpbnQgdmVnYTEyX2h3bWdyX2luaXQo
c3RydWN0IHBwX2h3bWdyICpod21ncikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
