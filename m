Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF79A010
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCAF6EA85;
	Thu, 22 Aug 2019 19:31:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2826EA83
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:31:04 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v38so9062514qtb.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0kXZH7GD72bOdd2Db12StbxzxKXoReE7l2G4nzyKyE=;
 b=iDhYj315eGb0Sxy5zf/WJaIFjQsQyR89ZOTMfoogYlcuUFJat5lclNFU8mG9P5jTJn
 m2UrjDa8NZddOCP1emUQcZ3n0eBa3wulHK7o6dmihFEvLWCat6uzu65hpHUW6BKiOkZv
 WG6NyB+jAE/+Cqf3YgL0UWfKrW/C6LaONhvb9+j4o+LM/dlK8F2mfg0xgI7aHB9ArhX0
 uyvBUbcNVTZnXsL+pYvQb6vUbJGYOF6Ea39maSDAggcnYEQ2kHODFDIgr6Cl1Nhdpmrf
 UqbiDU5SlOyQPdw5GLy5HG6bELrKqOwsAmR44dnG+HC+grSW+Hk3zDcbZUre/YTI9Kqs
 hBBQ==
X-Gm-Message-State: APjAAAVxA37bqcTsGvI2bIv2LMkSxKirjTrqUdrD6k9WT4kaR9OilUwy
 K/zrK+vLR6j02cZ/jOr7ZEn8BOeP
X-Google-Smtp-Source: APXvYqwdbRRlRPXtg1uqoAZV0UkGi/Vh/Ef50VYCh5igmzDE3CKi/S1ug+rp7wiQ8eu6Q2p/qx6jSQ==
X-Received: by 2002:a0c:9d4a:: with SMTP id n10mr912804qvf.219.1566502263682; 
 Thu, 22 Aug 2019 12:31:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h1sm337140qkh.101.2019.08.22.12.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 12:31:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amd/display: update bw_calcs to take pipe sync into
 account (v3)
Date: Thu, 22 Aug 2019 14:30:49 -0500
Message-Id: <20190822193050.3107-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822193050.3107-1-alexander.deucher@amd.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0kXZH7GD72bOdd2Db12StbxzxKXoReE7l2G4nzyKyE=;
 b=UuH/NM4NvsT/AeWtJsrFLsGqTWZDa+zvcYDJpRPhz8xDLVZiX0gfm2o6V9B3AGxuVX
 BUQiskC/5/QEiOKjJvUymcabUlp1B3JCiJ7jaTcYowgNzv35PTgngt6oRFruQxdyV7jM
 NipYTIQLi5+NWddFM+TvLI/RT1FlGNHs833MApQHp9dP/g53kH8UA/aQ96hsEhoh77fi
 IsO8304s0ed55nXM9WIk0gj+fYxJ/4zC3IoJIP+P3z+yp8UKfoxCRGAkF1DTUf+W6pjV
 BNrae7dMXw53NOdaaOmhTSL3MxCAh++No2dtQz9EylqDCItll8g0jMSjz8nA5RO+Mvws
 MKGw==
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

UHJvcGVybHkgc2V0IGFsbF9kaXNwbGF5c19pbl9zeW5jIHNvIHRoYXQgd2hlbiB0aGUgZGF0YSBp
cwpwcm9wYWdhdGVkIHRvIHBvd2VycGxheSwgaXQncyBzZXQgcHJvcGVybHkgYW5kIHdlIGNhbiBl
bmFibGUKbWNsayBzd2l0Y2hpbmcgd2hlbiBhbGwgbW9uaXRvcnMgYXJlIGluIHN5bmMuCgp2Mjog
Zml4IGxvZ2ljLCBjbGVhbiB1cAp2MzogY2hlY2sgZm9yIGJsZW5kaW5nIGNoYWlucywgc2ltcGxp
ZnkgbG9naWMKClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3Mu
YyAgfCAzMCArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNlX2NhbGNzLmMKaW5kZXggOWYxMmUyMWY4YjliLi5lY2E2ODFkOWQ3ZjUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3Mu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMK
QEAgLTI1LDYgKzI1LDcgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAorI2luY2x1ZGUg
InJlc291cmNlLmgiCiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNsdWRlICJkY2VfY2Fs
Y3MuaCIKICNpbmNsdWRlICJkYy5oIgpAQCAtMjk3Nyw2ICsyOTc4LDMyIEBAIHN0YXRpYyB2b2lk
IHBvcHVsYXRlX2luaXRpYWxfZGF0YSgKIAlkYXRhLT5udW1iZXJfb2ZfZGlzcGxheXMgPSBudW1f
ZGlzcGxheXM7CiB9CiAKK3N0YXRpYyBib29sIGFsbF9kaXNwbGF5c19pbl9zeW5jKGNvbnN0IHN0
cnVjdCBwaXBlX2N0eCBwaXBlW10sCisJCQkJIGludCBwaXBlX2NvdW50KQoreworCWNvbnN0IHN0
cnVjdCBwaXBlX2N0eCAqYWN0aXZlX3BpcGVzW01BWF9QSVBFU107CisJaW50IGksIG51bV9hY3Rp
dmVfcGlwZXMgPSAwOworCisJZm9yIChpID0gMDsgaSA8IHBpcGVfY291bnQ7IGkrKykgeworCQlp
ZiAoIXBpcGVbaV0uc3RyZWFtIHx8IHBpcGVbaV0udG9wX3BpcGUpCisJCQljb250aW51ZTsKKwor
CQlhY3RpdmVfcGlwZXNbbnVtX2FjdGl2ZV9waXBlcysrXSA9ICZwaXBlW2ldOworCX0KKworCWlm
ICghbnVtX2FjdGl2ZV9waXBlcykKKwkJcmV0dXJuIGZhbHNlOworCisJZm9yIChpID0gMTsgaSA8
IG51bV9hY3RpdmVfcGlwZXM7ICsraSkgeworCQlpZiAoIXJlc291cmNlX2FyZV9zdHJlYW1zX3Rp
bWluZ19zeW5jaHJvbml6YWJsZSgKKwkJCSAgICBhY3RpdmVfcGlwZXNbMF0tPnN0cmVhbSwgYWN0
aXZlX3BpcGVzW2ldLT5zdHJlYW0pKSB7CisJCQlyZXR1cm4gZmFsc2U7CisJCX0KKwl9CisKKwly
ZXR1cm4gdHJ1ZTsKK30KKwogLyoqCiAgKiBSZXR1cm46CiAgKgl0cnVlIC0JRGlzcGxheShzKSBj
b25maWd1cmF0aW9uIHN1cHBvcnRlZC4KQEAgLTI5OTgsOCArMzAyNSw3IEBAIGJvb2wgYndfY2Fs
Y3Moc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKIAogCXBvcHVsYXRlX2luaXRpYWxfZGF0YShwaXBl
LCBwaXBlX2NvdW50LCBkYXRhKTsKIAotCS8qVE9ETzogdGhpcyBzaG91bGQgYmUgdGFrZW4gb3V0
IGNhbGNzIG91dHB1dCBhbmQgYXNzaWduZWQgZHVyaW5nIHRpbWluZyBzeW5jIGZvciBwcGxpYiB1
c2UqLwotCWNhbGNzX291dHB1dC0+YWxsX2Rpc3BsYXlzX2luX3N5bmMgPSBmYWxzZTsKKwljYWxj
c19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9zeW5jID0gYWxsX2Rpc3BsYXlzX2luX3N5bmMocGlw
ZSwgcGlwZV9jb3VudCk7CiAKIAlpZiAoZGF0YS0+bnVtYmVyX29mX2Rpc3BsYXlzICE9IDApIHsK
IAkJdWludDhfdCB5Y2xrX2x2bCwgc2Nsa19sdmw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
