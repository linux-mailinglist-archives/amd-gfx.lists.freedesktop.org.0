Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F035669E51
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33076E038;
	Mon, 15 Jul 2019 21:26:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48336E02A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:06 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so12888543qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpV0YyEgUUxUEG2iBCa3O9ArM/NE0lUUjGzJ2QDIeSI=;
 b=JjBGOtuML7gdXI9yGGBJ8Cz7G9bwWLNijZgNKNqpPyt6riQYb1cJyzW98EDdg4iC0n
 nZbllpVOXAmfkjmD8kR37qpzY0jvQTiVePS7SekRwz6zWvILZbQtvDPsSNnzVGGSkM4p
 kbm2tBlND55pjqaI/Ze2aU5i7ho2acREmLoiaDmwvKFA78Cghxu9WgmCx9pZLmP8FPuF
 rD/mpp8CLNuY7AAe3OYLowx3Ww59hcBjvenXNnWUJZbfpF4ZNv62o4oIlTy4+nbY3tSR
 u/mC1nbV+Kkqej/5lk1efg95pddmmQY/qppMZ4D7ZnH1OCJzvaR4qK7yP0Fnbryf7lE4
 hkEg==
X-Gm-Message-State: APjAAAVKA321rktYJbmdGZK/GNBUmN/zBjLIukjSgc0xyQi05xa0fV2N
 XyybZ4esM2GeP4FdnDCHrYuSjId5
X-Google-Smtp-Source: APXvYqyuQreJPYKFPJgA6ZWRHPtKkCZdcfb+PyW3rx3v/QT5T031T1f9KlOhYFNsRGwFn6ZHJSws1w==
X-Received: by 2002:a37:86c4:: with SMTP id
 i187mr18680390qkd.464.1563225965722; 
 Mon, 15 Jul 2019 14:26:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 088/102] drm/amdgpu: keep stolen memory for arct
Date: Mon, 15 Jul 2019 16:24:23 -0500
Message-Id: <20190715212437.31793-86-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpV0YyEgUUxUEG2iBCa3O9ArM/NE0lUUjGzJ2QDIeSI=;
 b=iXRCf0j14mNu8Mvq0IzOx0cWgR2k0IXFXXIM+bql5Cd/mdEeoASU3TsOGa2bfjKFfs
 pfNS1c8p1ykTYHCuLWIuTk0n0lKALImZ7+ChoNdaqd8tfBWpoB4yOtkjEgPa7iyRhVxi
 fD6LPSdHZe0ycY+uCu9d5agdQSgGOZeKidyDPZS5XOfvLNLl688vp2POi9ZkpvFKcdsC
 DYPM1/ZNk4oeMnBMA1TYiOSRv2SXI3eChK5ZQkrvHqCtm5P1xpl9+K86llRF6DRws93H
 HZfgP/dcPWDIesjtXJufUzpqYjtkPm1EmyT+YiEu/j8ZoQzKDpnioXumJedMk3gKOLyx
 GOog==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKQW55IGRjZSByZWdp
c3RlciByZWFkIGJhY2sgZnJvbSBhcmN0IGlzIGludmFsaWQuIHVzZSBoYXJkIGNvZGUKc3RvbGVu
IG1lbW9yeSBmb3IgYXJjdCB1bnRpbCB3ZSB2YWxpZGF0ZSB0aGUgczMuCgpTaWduZWQtb2ZmLWJ5
OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZSBN
YSA8TGUuTWFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCAxMTk2OGZiZTBkNjAu
LjgyMGNjNmUwYjUxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC02
NDEsNiArNjQxLDcgQEAgc3RhdGljIGJvb2wgZ21jX3Y5XzBfa2VlcF9zdG9sZW5fbWVtb3J5KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJ
Y2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQX0FSQ1RVUlVT
OgogCQlyZXR1cm4gdHJ1ZTsKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6
CkBAIC05NDEsNyArOTQyLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIHN0YXRpYyB1bnNpZ25lZCBnbWNfdjlfMF9nZXRfdmJp
b3NfZmJfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQl1MzIgZDF2Z2FfY29u
dHJvbCA9IFJSRUczMl9TT0MxNShEQ0UsIDAsIG1tRDFWR0FfQ09OVFJPTCk7CisJdTMyIGQxdmdh
X2NvbnRyb2w7CiAJdW5zaWduZWQgc2l6ZTsKIAogCS8qCkBAIC05NTEsNiArOTUyLDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGdtY192OV8wX2dldF92Ymlvc19mYl9zaXplKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCWlmIChnbWNfdjlfMF9rZWVwX3N0b2xlbl9tZW1vcnkoYWRldikpCiAJCXJl
dHVybiA5ICogMTAyNCAqIDEwMjQ7CiAKKwlkMXZnYV9jb250cm9sID0gUlJFRzMyX1NPQzE1KERD
RSwgMCwgbW1EMVZHQV9DT05UUk9MKTsKIAlpZiAoUkVHX0dFVF9GSUVMRChkMXZnYV9jb250cm9s
LCBEMVZHQV9DT05UUk9MLCBEMVZHQV9NT0RFX0VOQUJMRSkpIHsKIAkJc2l6ZSA9IDkgKiAxMDI0
ICogMTAyNDsgLyogcmVzZXJ2ZSA4TUIgZm9yIHZnYSBlbXVsYXRvciBhbmQgMSBNQiBmb3IgRkIg
Ki8KIAl9IGVsc2UgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
