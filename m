Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8548F64
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E8689C53;
	Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B2489C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:56 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12225331qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5PjhkyOcJ9xN2Gvt9Q5PCGxdsa9TUzmCVdQsDBVYYU=;
 b=tOz0U/PEKjuPH/QuYEOo2qoMCq+j2cOEkO0z8116KqPjSXIy3JMOspdeEK/iO1Mr3o
 XC9+TeWSe5zhluqDgEynupzGtUEVItEV98A/xzR0NEups7joXpylCVeeAfJ73K+ohbxr
 QoOFCwIydjurilBvWVGdYN8gtkw0dGY83PLUIougvxZ4wB8t43cWRhM8UaHGOSXoMM/k
 Gp+7G+UHfeHMEjfcFEzSW59smRYJ2mDWNpwNOU8KJ6y7MGhhFI7RLEICMDJ+ZfBWMsI1
 2Cxlb7VhIhP2/9IH5dFSXRfpVkgvRqK9F2ZPjjLw9h+Y9LmgsaL2/czdLAdUJBmIPibr
 3Vfw==
X-Gm-Message-State: APjAAAXmOeuoZOwbr7Rm95PG6Uwtph6ZHuf27wjhg3aIMjXw4OQtEhpT
 ntGYRXDwboRYCvnQOg9wUswWltCEsD8=
X-Google-Smtp-Source: APXvYqye9nY5LplYKk28q0lIljmsT9oAB0NvFmMZ8qJDS1Tl6aUKys8iYvx9+CCJnqylywXtN4Qtjg==
X-Received: by 2002:a0c:984b:: with SMTP id e11mr23342540qvd.174.1560799915773; 
 Mon, 17 Jun 2019 12:31:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 246/459] drm/amd/powerplay: remove upload_dpm_level function
 for vega20
Date: Mon, 17 Jun 2019 14:30:13 -0500
Message-Id: <20190617193106.18231-47-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5PjhkyOcJ9xN2Gvt9Q5PCGxdsa9TUzmCVdQsDBVYYU=;
 b=D51ZiUGGdOYpIRldzGMQNq59+E+Jpy5KpGVHILOpYTOQ3Ap86Kid6t/Ea1QF06QC/l
 UPX8Oo9XCZcSRGcXO6DYZp3ijVeUyn9x29tXM0U/q9eCAr4vRfgB8r142H1E6CuD3iD0
 RAvCwWRpP+5MHooe22ceUfYiwoacHDZd4Zyo4tTLXsqcdCLHZemp4NflCQTriZQJaXOU
 Znnstr3n7NwUr9UzbiHTRoHqoMfU4AIIK+9jgkWii9KXfDugcTTO/Ij64eFX3+M+lLLo
 S7RxXctshHssxz9/o4BNlR+MSR6l0qnTiWl+eBbvICiW/b0gNz6T7WzhjUZM2N/A1OCR
 w5+g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBmdW5jdGlvbiB1cGxv
YWRfZHBtX2xldmVsIGlzIGFuIGludGVybmFsIGZ1bmN0aW9uLApzbyByZW1vdmUgcHVibGljIGlu
dGVyZmFjZS4KClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDQgLS0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgICB8IDUgKystLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IGUwNWY0ZGQ5NmY0Yi4u
MDI3NWM0Yjk2YzlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9p
bmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmgKQEAgLTU3Niw4ICs1NzYsNiBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CiAJ
aW50ICgqbm90aWZ5X3NtY19kaXNwYWx5X2NvbmZpZykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUp
OwogCWludCAoKmZvcmNlX2RwbV9saW1pdF92YWx1ZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGJvb2wgaGlnaGVzdCk7CiAJaW50ICgqdW5mb3JjZV9kcG1fbGV2ZWxzKShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSk7Ci0JaW50ICgqdXBsb2FkX2RwbV9sZXZlbCkoc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUsIGJvb2wgbWF4LAotCQkJCXVpbnQzMl90IGZlYXR1cmVfbWFzayk7CiAJaW50ICgqZ2V0
X3Byb2ZpbGluZ19jbGtfbWFzaykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJICAgICAg
ZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCwKIAkJCQkgICAgICB1aW50MzJfdCAqc2Ns
a19tYXNrLApAQCAtODE0LDggKzgxMiw2IEBAIHN0cnVjdCBzbXVfZnVuY3MKIAkoKHNtdSktPnBw
dF9mdW5jcy0+Zm9yY2VfZHBtX2xpbWl0X3ZhbHVlID8gKHNtdSktPnBwdF9mdW5jcy0+Zm9yY2Vf
ZHBtX2xpbWl0X3ZhbHVlKChzbXUpLCAoaGlnaGVzdCkpIDogMCkKICNkZWZpbmUgc211X3VuZm9y
Y2VfZHBtX2xldmVscyhzbXUpIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+dW5mb3JjZV9kcG1fbGV2
ZWxzID8gKHNtdSktPnBwdF9mdW5jcy0+dW5mb3JjZV9kcG1fbGV2ZWxzKChzbXUpKSA6IDApCi0j
ZGVmaW5lIHNtdV91cGxvYWRfZHBtX2xldmVsKHNtdSwgbWF4LCBmZWF0dXJlX21hc2spIFwKLQko
KHNtdSktPnBwdF9mdW5jcy0+dXBsb2FkX2RwbV9sZXZlbCA/IChzbXUpLT5wcHRfZnVuY3MtPnVw
bG9hZF9kcG1fbGV2ZWwoKHNtdSksIChtYXgpLCAoZmVhdHVyZV9tYXNrKSkgOiAwKQogI2RlZmlu
ZSBzbXVfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayhzbXUsIGxldmVsLCBzY2xrX21hc2ssIG1jbGtf
bWFzaywgc29jX21hc2spIFwKIAkoKHNtdSktPnBwdF9mdW5jcy0+Z2V0X3Byb2ZpbGluZ19jbGtf
bWFzayA/IChzbXUpLT5wcHRfZnVuY3MtPmdldF9wcm9maWxpbmdfY2xrX21hc2soKHNtdSksIChs
ZXZlbCksIChzY2xrX21hc2spLCAobWNsa19tYXNrKSwgKHNvY19tYXNrKSkgOiAwKQogI2RlZmlu
ZSBzbXVfc2V0X2NwdV9wb3dlcl9zdGF0ZShzbXUpIFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3ZlZ2EyMF9wcHQuYwppbmRleCA5NDM3NDgyN2E4M2IuLjJmMzNmZWM0ZGE5OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwpAQCAtMjMyOSwxMyAr
MjMyOSwxMyBAQCBzdGF0aWMgaW50IHZlZ2EyMF91bmZvcmNlX2RwbV9sZXZlbHMoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCiAJZHBtX3RhYmxlLT5zb2NfdGFibGUuZHBtX3N0YXRlLnNvZnRfbWF4
X2xldmVsID0KIAkJZHBtX3RhYmxlLT5zb2NfdGFibGUuZHBtX2xldmVsc1tzb2Z0X21heF9sZXZl
bF0udmFsdWU7CiAKLQlyZXQgPSBzbXVfdXBsb2FkX2RwbV9sZXZlbChzbXUsIGZhbHNlLCAweEZG
RkZGRkZGKTsKKwlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9sZXZlbChzbXUsIGZhbHNlLCAweEZG
RkZGRkZGKTsKIAlpZiAocmV0KSB7CiAJCXByX2VycigiRmFpbGVkIHRvIHVwbG9hZCBEUE0gQm9v
dHVwIExldmVscyEiKTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlyZXQgPSBzbXVfdXBsb2FkX2Rw
bV9sZXZlbChzbXUsIHRydWUsIDB4RkZGRkZGRkYpOworCXJldCA9IHZlZ2EyMF91cGxvYWRfZHBt
X2xldmVsKHNtdSwgdHJ1ZSwgMHhGRkZGRkZGRik7CiAJaWYgKHJldCkgewogCQlwcl9lcnIoIkZh
aWxlZCB0byB1cGxvYWQgRFBNIE1heCBMZXZlbHMhIik7CiAJCXJldHVybiByZXQ7CkBAIC0zMTQy
LDcgKzMxNDIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIwX3Bw
dF9mdW5jcyA9IHsKIAkubm90aWZ5X3NtY19kaXNwYWx5X2NvbmZpZyA9IHZlZ2EyMF9ub3RpZnlf
c21jX2Rpc3BhbHlfY29uZmlnLAogCS5mb3JjZV9kcG1fbGltaXRfdmFsdWUgPSB2ZWdhMjBfZm9y
Y2VfZHBtX2xpbWl0X3ZhbHVlLAogCS51bmZvcmNlX2RwbV9sZXZlbHMgPSB2ZWdhMjBfdW5mb3Jj
ZV9kcG1fbGV2ZWxzLAotCS51cGxvYWRfZHBtX2xldmVsID0gdmVnYTIwX3VwbG9hZF9kcG1fbGV2
ZWwsCiAJLmdldF9wcm9maWxpbmdfY2xrX21hc2sgPSB2ZWdhMjBfZ2V0X3Byb2ZpbGluZ19jbGtf
bWFzaywKIAkuc2V0X3BwZmVhdHVyZV9zdGF0dXMgPSB2ZWdhMjBfc2V0X3BwZmVhdHVyZV9zdGF0
dXMsCiAJLmdldF9wcGZlYXR1cmVfc3RhdHVzID0gdmVnYTIwX2dldF9wcGZlYXR1cmVfc3RhdHVz
LAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
