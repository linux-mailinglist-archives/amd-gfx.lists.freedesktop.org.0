Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA145101B
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668789C29;
	Mon, 24 Jun 2019 15:15:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9A8996F
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y198so10355562lfa.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qke3dLrqP/BMRIPdBhnpzodw2GfR9NeBsFjgqyZl4UM=;
 b=Al9b/wA41PP0BTIvjrrJ8YXo7kmkNpNwjC8oxMU+EB4EsNEz4bT+x06U93ky0PdqTW
 lR3n632Nb9BEv5CyOXFq1JPXKPeVOqViewjpdTxOqBZkl0ZzyQokFA28zAqe7cHhpvZb
 kpExzY5X3hTFi7KhctdtFpysF3EGjAOZAac+jCxw6CrbK2fVZ5pzhwGPCt2wWbYIlMq+
 U7mouSNNMnxqZe5Yw8OsEhP6L8IqN1xA5tNcKhaTszks/BndM9yxwZ0kQrnMWftx9RCu
 PhUwDqtEsxRQH8D+mugxFxsdxptXOM/6MpTrklUucUHZbRE77OMT2cjbxEjF/IlIeaGz
 h67A==
X-Gm-Message-State: APjAAAUi1rfaYkzDxJBvq4PHgIVwB8LTgyuRl428dEJueUXCrxn/kK5V
 bWB8c6POty2l0JfCPATlyl4GV8EAvDU=
X-Google-Smtp-Source: APXvYqw3I8CdELJK5J/gcRyMv8qinP/SIloYdOA0uDh3Qa9bvK6dqT9xV+RtaTKgQk6swA4rsvVufw==
X-Received: by 2002:ac2:5382:: with SMTP id g2mr20131188lfh.92.1561389352712; 
 Mon, 24 Jun 2019 08:15:52 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.51
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:51 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/amd/amdgpu: Indent AMD_IS_APU properly
Date: Mon, 24 Jun 2019 17:15:39 +0200
Message-Id: <20190624151544.13934-1-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qke3dLrqP/BMRIPdBhnpzodw2GfR9NeBsFjgqyZl4UM=;
 b=U+kDAz7slPqU+ezBJD1brIAILROmYXMZgVBoSgO0Jf/MLtvD8E+BupTjXPimhG9bvH
 t3qwHBb/nuSYl8uHO9aeXeyvOIMp8mzJzVZuP4UQEqqnVZfENp3UKZkBEG45771/Extr
 i1+E8zMqz3DxgZiY+5HdVUkorfvbDSI0jsE7R7T3fVEsMcczETdG92GKQ4eDL9rhuF+f
 LOCTZ4ThPZlYoEGSqyJA4uKQn2Tlz2Ad9NVyt/rGlvEnTtWH73iuMreMtSjh6XcvkbQ5
 bRW3UxVGWZZc6MJjGdnPIdJtsvuME5UDmajK2h0TTaNbmrPd/pLcmTsLdJziHVFQ3aZq
 w9yQ==
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
YW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGZhOWMyN2Q2MzUwNC4uMWU0MjRkOTE4MzM0IDEwMDY0
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
