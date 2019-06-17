Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623924947E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 23:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBBA89458;
	Mon, 17 Jun 2019 21:42:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826D892CF
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 21:42:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v18so10855642ljh.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 14:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FnkFRJD0nF799e9rZ+Pf1BQNho0o5mPQUk7wGe//D4Q=;
 b=p3yaWwrg3iGjzbKBDHJAw3V5D4Ux6iyaVVkmkZRk7+FazDt99sDJD7+m3k/LiRKHDe
 yJEBO5p5McU3MVVatdC6Ns4GFeZGEkBMAW5FbQJbXcByy62nrfudmhLTxysI8RXls8EE
 qyI0udbKJhaS3J/qCmM1I/F4s0UZzRZ29OS9itXWukzAlLfbdVzESjHyYFkxPssbZFmu
 1FMHcVYpVdCaRfXGdUoCHQ0p8uX7UsQ5/ERWQGMYkTcuo4YnRebdGn9AjejWaDVrEQcG
 xO7z+DvQnVnI15vpsvkpH1IgMr/8IM8gFL4UUaboLOSTVQPEISM/D6PwO4vRxrfLETh5
 RJ5g==
X-Gm-Message-State: APjAAAWfW1mdqGfe9uH2Zmb7ViJsWeFjktAgOhjBAsyE2NEiWUlUMzRa
 PCrRnOYQuR5MEd6I05h0ywIxuzNIpiQ=
X-Google-Smtp-Source: APXvYqw1axnOPOcHsS1NqM2htq+44Hr2Kbfp0QspjI+W/JyjjSNloir7+X0ZdomXsslQtnOPAghzdg==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr33253590ljs.54.1560807748883; 
 Mon, 17 Jun 2019 14:42:28 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id p29sm2274991ljp.87.2019.06.17.14.42.28
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 14:42:28 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/amdgpu: Indent AMD_IS_APU properly
Date: Mon, 17 Jun 2019 23:42:20 +0200
Message-Id: <20190617214220.25041-2-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617214220.25041-1-ernstp@gmail.com>
References: <20190617214220.25041-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FnkFRJD0nF799e9rZ+Pf1BQNho0o5mPQUk7wGe//D4Q=;
 b=V6ATdcR9fxaQPi6julZszF8nF0OmS9tQvfCHYHgHQvswjYBsx4ZSelZ6WoXdAis5M5
 NHxj7u03M4V7YACCSlExCfamSSPJLlpzelts2DmBIsZNcCO6bxAlKTRkveJnRIr2DjmQ
 OtIUwMymmisURkOQ7Z3dYSdr07FGRNpMbeoxrYrQxAF1tuiYsWqoi4MGiJ+aoKLXKiGj
 9tJCY0N+rBkPxyxExTouFd+pWmXWtZgCh361el+dkTuHc8HTam+nxAq0IKvl4+gwZAzy
 m5Ygai7K1CYyJbR+GpAMFH3gaJ7yZlKyP5zWTz/OnBh1An9vOldOQmeM8qqJ72D8X/Ao
 as8Q==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVwb3J0ZWQgYnkgc21hdGNoOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jOjcx
NSBzb2MxNV9nZXRfcGNpZV91c2FnZSgpIHdhcm46IGluY29uc2lzdGVudCBpbmRlbnRpbmcKQW5k
IGEgc2ltaWxhciBvbmUgaW4gc2kuYy4KClNpZ25lZC1vZmYtYnk6IEVybnN0IFNqw7ZzdHJhbmQg
PGVybnN0cEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYyAg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NpLmMKaW5kZXggNGZmOTMwYTQ3ZTEwLi40YjFlMGMxNmFjNDEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc2kuYwpAQCAtMTMzOSw4ICsxMzM5LDggQEAgc3RhdGljIHZvaWQgc2lfZ2V0
X3BjaWVfdXNhZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ2NF90ICpjb3VudDAs
CiAJLyogVGhpcyByZXBvcnRzIDAgb24gQVBVcywgc28gcmV0dXJuIHRvIGF2b2lkIHdyaXRpbmcv
cmVhZGluZyByZWdpc3RlcnMKIAkgKiB0aGF0IG1heSBvciBtYXkgbm90IGJlIGRpZmZlcmVudCBm
cm9tIHRoZWlyIEdQVSBjb3VudGVycGFydHMKIAkgKi8KLSAgICAgICAgaWYgKGFkZXYtPmZsYWdz
ICYgQU1EX0lTX0FQVSkKLSAgICAgICAgICAgICAgICByZXR1cm47CisJaWYgKGFkZXYtPmZsYWdz
ICYgQU1EX0lTX0FQVSkKKwkJcmV0dXJuOwogCiAJLyogU2V0IHRoZSAyIGV2ZW50cyB0aGF0IHdl
IHdpc2ggdG8gd2F0Y2gsIGRlZmluZWQgYWJvdmUgKi8KIAkvKiBSZWcgNDAgaXMgIyByZWNlaXZl
ZCBtc2dzLCBSZWcgMTA0IGlzICMgb2YgcG9zdGVkIHJlcXVlc3RzIHNlbnQgKi8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDlkZmJiYzY1ZWE2Ny4uODEyYTZjMTk4Y2ZlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTcxMiw4ICs3MTIsOCBAQCBzdGF0aWMgdm9p
ZCBzb2MxNV9nZXRfcGNpZV91c2FnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0
X3QgKmNvdW50MCwKIAkvKiBUaGlzIHJlcG9ydHMgMCBvbiBBUFVzLCBzbyByZXR1cm4gdG8gYXZv
aWQgd3JpdGluZy9yZWFkaW5nIHJlZ2lzdGVycwogCSAqIHRoYXQgbWF5IG9yIG1heSBub3QgYmUg
ZGlmZmVyZW50IGZyb20gdGhlaXIgR1BVIGNvdW50ZXJwYXJ0cwogCSAqLwotCSBpZiAoYWRldi0+
ZmxhZ3MgJiBBTURfSVNfQVBVKQotCQkgcmV0dXJuOworCWlmIChhZGV2LT5mbGFncyAmIEFNRF9J
U19BUFUpCisJCXJldHVybjsKIAogCS8qIFNldCB0aGUgMiBldmVudHMgdGhhdCB3ZSB3aXNoIHRv
IHdhdGNoLCBkZWZpbmVkIGFib3ZlICovCiAJLyogUmVnIDQwIGlzICMgcmVjZWl2ZWQgbXNncywg
UmVnIDEwNCBpcyAjIG9mIHBvc3RlZCByZXF1ZXN0cyBzZW50ICovCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
