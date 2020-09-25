Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B048279165
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 21:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2CE6E0D1;
	Fri, 25 Sep 2020 19:24:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5243C88CFA
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 19:24:06 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n133so3913576qkn.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 12:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAu4/FEid332P1+RvSgDsrOw6hk9wgTzDw8z1sU09o0=;
 b=HiNuSu2jgEBzWQPkop60lVGTFA0QtYB6/tgnoaI150zQpTdouiEw3N6PRojccqcfcp
 46G9XTABuN8zhANEqW+cqbgfXrboxsjxhRN+tBjZOZYacl9UQ7JyQx7L1BT8cNiBv05Y
 GCp+lauqK2e2sH8SWGTr1Y7Zl6cyI4FSGg2c08FoKmxUOpT+snS945QD6v+qCq1xTmIt
 muWX5NvBNBDOo6oCDPK4E/DWaW+2A17JeI7aR7HKqwZF9c5/jMaN3bSY7zT2aE9kb1o4
 AAUKT/J90enqDbRhRJwXF2tHLPr7jiZt7EKsuf+ZMmesgUJ44eR65IOXMshgy4GMN2ts
 6TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAu4/FEid332P1+RvSgDsrOw6hk9wgTzDw8z1sU09o0=;
 b=bq6W503NuxudzTgd/D8YWOyWwBYQBumC6ymLVEttjGkZD58hmOwF4mOt1n3EFeNVNS
 59yngfRQyLo/9kxJdp4F8yOfFgtd6tGsfptx7YLNvhsywfgp+uc7S+qngKBGVZUjVBK4
 x7QQVZPEkOBHLWe9jtGrbMb2Pa7KFGaPXn1KdF7BaAHzRtEZtQs4EoS8qVXx33SOZQ0n
 zY7aBVXBfADaLJmisiMMEVI7CqZRjSf3fhosv6ykH21Dkwwql4IRw9VEHW+O2oFH11iA
 2tUaxDsEV5ex2OzqDbRxn+omK777gLS8Nx/9KXI8O+Wmiw8ig2gpn1hEF1lAeSoyr1TR
 fLbw==
X-Gm-Message-State: AOAM530g7H1eoOnKC8E3tZIZaHQLJM17uSxPbWdmggxfOD6agQsD8gFp
 lO077pDdJZpPryO2Aa89vSyTValJvQg=
X-Google-Smtp-Source: ABdhPJzYuLVMj0fhrJpPgpLmHRG7i0DUocr4/piDaxsW1PNGJWemV1UQdp7vhTi3uwub4URFscNjuQ==
X-Received: by 2002:a37:65c8:: with SMTP id z191mr1633301qkb.161.1601061844990; 
 Fri, 25 Sep 2020 12:24:04 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id 8sm2275270qkc.100.2020.09.25.12.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 12:24:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix a warning in amdgpu_ras.c (v2)
Date: Fri, 25 Sep 2020 15:23:57 -0400
Message-Id: <20200925192357.1635290-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOiBJbiBmdW5jdGlvbiDigJhh
bWRncHVfcmFzX2ZzX2luaXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYzoxMjg0OjI6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhzeXNmc19j
cmVhdGVfZ3JvdXDigJksIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIHdhcm5fdW51c2VkX3Jlc3Vs
dCBbLVd1bnVzZWQtcmVzdWx0XQogMTI4NCB8ICBzeXNmc19jcmVhdGVfZ3JvdXAoJmFkZXYtPmRl
di0+a29iaiwgJmdyb3VwKTsKICAgICAgfCAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KCnYyOiBqdXN0IHByaW50IGFuIGVycm9yIGZvciBzeXNmcyBncm91cCBj
cmVhdGlvbiBmYWlsdXJlCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA0OWQxMDMz
MGJmNjQuLjhiZjZhN2MwNTZiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYwpAQCAtMTI2Niw2ICsxMjY2LDcgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2ZzX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCU5VTEwsCiAJCU5VTEwsCiAJfTsKKwlpbnQg
cjsKIAogCS8qIGFkZCBmZWF0dXJlcyBlbnRyeSAqLwogCWNvbi0+ZmVhdHVyZXNfYXR0ciA9IGRl
dl9hdHRyX2ZlYXR1cmVzOwpAQCAtMTI4MSw3ICsxMjgyLDkgQEAgc3RhdGljIGludCBhbWRncHVf
cmFzX2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXN5c2ZzX2Jpbl9hdHRy
X2luaXQoYmluX2F0dHJzWzBdKTsKIAl9CiAKLQlzeXNmc19jcmVhdGVfZ3JvdXAoJmFkZXYtPmRl
di0+a29iaiwgJmdyb3VwKTsKKwlyID0gc3lzZnNfY3JlYXRlX2dyb3VwKCZhZGV2LT5kZXYtPmtv
YmosICZncm91cCk7CisJaWYgKHIpCisJCWRldl9lcnIoYWRldi0+ZGV2LCAiRmFpbGVkIHRvIGNy
ZWF0ZSBSQVMgc3lzZnMgZ3JvdXAhIik7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjUuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
