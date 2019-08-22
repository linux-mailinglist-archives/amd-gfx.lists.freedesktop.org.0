Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC79A011
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 21:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4536EA86;
	Thu, 22 Aug 2019 19:31:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3FA6EA83
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 19:31:05 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w18so6218758qki.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qw/SvZoTxRcvHWrthWjkoJa+/B2LyuiBG3PajZXz5Xc=;
 b=nPfR0qWYT+YzCXWU8C70gJZrHk0qw51lFzTQla2csv3SWdKZvz3yhkXr2R4acGP9Yc
 DARlAJFwVUoPH2iaKQAFkgm0TRC70JxsHHMsvyeDvURkAL3h+yXvbk+b51FCq9exbbzD
 GFuFWqLkQ02uyI7qhjHEEVy3cL9v49El/BzN464RJ66ch34KGXVmfDsN6ziE6j+EQKmj
 /jnpeugcI7nhKF1NnNJ/9X5hmtsYsO9er4euZkExgwPqr5RfvIePSHSqGo5vIxA3POMg
 DeD7U+MobNo0u9nS3AnVkQK5eP8hm3iDaLn6PT2ojiRwt3g6U7gJjp1PR06oUKQMEc7Q
 7HsA==
X-Gm-Message-State: APjAAAVs+K9+Oh+sKi6AA6bD6p0mVtrBnfYclvgRnb6K68fbBaCisQOr
 x1kupIOs+QS49K7q+dWXHIBE7zzK
X-Google-Smtp-Source: APXvYqyXU2yQp4wizcgf/Ps+eRtbjkirW9EZHs516PnNO/RAGccvV71rFSnWJZypXKnoQ2DKKBz9LQ==
X-Received: by 2002:ae9:f812:: with SMTP id x18mr665568qkh.290.1566502264570; 
 Thu, 22 Aug 2019 12:31:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h1sm337140qkh.101.2019.08.22.12.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 12:31:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu/display: add flag for multi-display mclk
 switching
Date: Thu, 22 Aug 2019 14:30:50 -0500
Message-Id: <20190822193050.3107-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822193050.3107-1-alexander.deucher@amd.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qw/SvZoTxRcvHWrthWjkoJa+/B2LyuiBG3PajZXz5Xc=;
 b=UXPcxXtpBckmITqPHIpQcIoJWJkiiBkeXPXIt+jTdAbl3Cin0NdlkI4ES/jGvMAZA3
 3SJeg60+Bf9RIfxB+O2ToEM4fg6PZ9My/YIHQxG0c8HvR3ZYWLGzKzcyi2wK8ApE8bot
 KEbw4pQ5vZ+XFgbWRWeMwlwbmnb5E7JTJn1tCKzr1yx/ntdFR+FlghRrfG7/sBOjn22D
 Dh9vTu/hOE6VNJ1ZB8gwdrvlUMt3o/pjhl/ktUd7MEcm75y7KvsvbglT8udLeeS3Sb08
 floC8FEUMIWQNAr3/KfiP+TIXPQQSRzHdA4LpBdPq4NrQcBwy5SY/m5vFa2rajKbU6l8
 rB4A==
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

QWRkIGEgZGNmZWF0dXJlbWFzayBmbGFnIGZvciBtY2xrIHN3aXRjaGluZy4gIERpc2FibGUgYnkg
ZGVmYXVsdDsKZW5hYmxlIG9uY2UgdGhlIGZlYXR1cmUgaGFzIHNlZW4gbW9yZSB0ZXN0aW5nLgoK
U2V0IGFtZGdwdS5kY2ZlYXR1cmVtYXNrPTIgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgaW4g
Z3J1Ygp0byBlbmFibGUgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jYWxjcy9kY2VfY2FsY3MuYyAgfCA1ICsrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGMuaCAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2FtZF9zaGFyZWQuaCAgICAgICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggNDUyOTgyNjk3NDRkLi5jYjg2Y2NmNDhi
ZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtNjk0LDYgKzY5NCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKGFtZGdwdV9kY19mZWF0dXJlX21hc2sgJiBE
Q19GQkNfTUFTSykKIAkJaW5pdF9kYXRhLmZsYWdzLmZiY19zdXBwb3J0ID0gdHJ1ZTsKIAorCWlm
IChhbWRncHVfZGNfZmVhdHVyZV9tYXNrICYgRENfTVVMVElfTU9OX1BQX01DTEtfU1dJVENIX01B
U0spCisJCWluaXRfZGF0YS5mbGFncy5tdWx0aV9tb25fcHBfbWNsa19zd2l0Y2ggPSB0cnVlOwor
CiAJaW5pdF9kYXRhLmZsYWdzLnBvd2VyX2Rvd25fZGlzcGxheV9vbl9ib290ID0gdHJ1ZTsKIAog
I2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCmluZGV4IGVjYTY4MWQ5ZDdmNS4uYTFkNDky
NTZmYWI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rj
ZV9jYWxjcy5jCkBAIC0zMDI1LDcgKzMwMjUsMTAgQEAgYm9vbCBid19jYWxjcyhzdHJ1Y3QgZGNf
Y29udGV4dCAqY3R4LAogCiAJcG9wdWxhdGVfaW5pdGlhbF9kYXRhKHBpcGUsIHBpcGVfY291bnQs
IGRhdGEpOwogCi0JY2FsY3Nfb3V0cHV0LT5hbGxfZGlzcGxheXNfaW5fc3luYyA9IGFsbF9kaXNw
bGF5c19pbl9zeW5jKHBpcGUsIHBpcGVfY291bnQpOworCWlmIChjdHgtPmRjLT5jb25maWcubXVs
dGlfbW9uX3BwX21jbGtfc3dpdGNoKQorCQljYWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9z
eW5jID0gYWxsX2Rpc3BsYXlzX2luX3N5bmMocGlwZSwgcGlwZV9jb3VudCk7CisJZWxzZQorCQlj
YWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9zeW5jID0gZmFsc2U7CiAKIAlpZiAoZGF0YS0+
bnVtYmVyX29mX2Rpc3BsYXlzICE9IDApIHsKIAkJdWludDhfdCB5Y2xrX2x2bCwgc2Nsa19sdmw7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCmluZGV4IDNlZjI2OWY4MjQ3OC4uNWQ0YTJh
OTIyOGYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMjIwLDcgKzIyMCw3
IEBAIHN0cnVjdCBkY19jb25maWcgewogCWJvb2wgcG93ZXJfZG93bl9kaXNwbGF5X29uX2Jvb3Q7
CiAJYm9vbCBlZHBfbm90X2Nvbm5lY3RlZDsKIAlib29sIGZvcmNlZF9jbG9ja3M7Ci0KKwlib29s
IG11bHRpX21vbl9wcF9tY2xrX3N3aXRjaDsKIH07CiAKIGVudW0gdmlzdWFsX2NvbmZpcm0gewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgKaW5kZXggYTBhNzIxMTQzOGYy
Li44ODg5YWFjZWVjNjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
bWRfc2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQu
aApAQCAtMTQyLDYgKzE0Miw3IEBAIGVudW0gUFBfRkVBVFVSRV9NQVNLIHsKIAogZW51bSBEQ19G
RUFUVVJFX01BU0sgewogCURDX0ZCQ19NQVNLID0gMHgxLAorCURDX01VTFRJX01PTl9QUF9NQ0xL
X1NXSVRDSF9NQVNLID0gMHgyLAogfTsKIAogZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbDsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
