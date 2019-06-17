Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2448E22
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618AD89700;
	Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AD89700
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so12202191qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pK7KyTz7YO29XFhvDWow2h6Dg1P4aR/pO8uXcdGJim0=;
 b=sp3o5vfZFDlNlDBx23JmlxhVJ/z3/XYgZWCJFeczWsftjsmFNmEqjGLNRc6oGOFu6t
 91fjRtSDi+81qmQ0RRjPkFZus3ZxHTr0bjU5KR/k8srB0/alu5fkuBt7DJdKlNxw0Ytw
 ZZgAGYxcAay5fLfj7jsD6kowuskdsVDQA76Tf6Hp4uVizCsdf0VDOX6wrJ9n19QR4PM4
 ytow8Aq/uODmTMdFoa611E7VrqVPY587Mju898n6HjaHVK59PwgYSGGU1XmeZkO36hwm
 obPY99UrFIJ/hyDx/yC0nDQTwWcYFZiXlQnFyzUmpc4JS7UBeg+eiVCp6ePB2xLSaO0+
 WwsA==
X-Gm-Message-State: APjAAAUHkui3xH/BeYrhWaQZuwuwf+TZjCx6Hcqf/C5IfzwSK9KbVFRH
 Uqs18PJ7cvn24ddxzwwSofthFDFxhXs=
X-Google-Smtp-Source: APXvYqyrLv48OPHMvyiZFhm0YUevJnD6+BS13XkesSMwvNhuFd7DRJdMl/G4WI7Zi4qfcGz2H48meA==
X-Received: by 2002:ac8:319d:: with SMTP id h29mr14154685qte.6.1560799116357; 
 Mon, 17 Jun 2019 12:18:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 099/459] drm/amdgpu/discovery: update definitions of
 table_info and binary_header
Date: Mon, 17 Jun 2019 14:11:00 -0500
Message-Id: <20190617191700.17899-88-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pK7KyTz7YO29XFhvDWow2h6Dg1P4aR/pO8uXcdGJim0=;
 b=LJC5SHiz7DU1qu4l23kCdg+Y3A63G4pRqEYIdA068/W+2xghyB8n95WkhXt8fQCu5u
 O0/2CH2sFwj4zLtU9hhLe5r9MjSq8r5cGapzaCntt/uEjMG2ll6zXSlhJ3TygXofcUJk
 hxCb6szpxJHi0zwuLXQGVuxw2dIZvORMSqvx1j62zz5f6NR7ltV+Mjo+RLM3mikOC3PB
 ZEHzJHWIrL44V7+tnaWqBTJxYmyXMs8O2R+kSGpqdh1NSIoczQjycyLQSHaUvPQKwbU7
 YBfg86NQd/xa4Bsq0yQQu0xW7lxNDL0umi+7PcYV0aCbX2GfepOkf7jM6IQFzbLu6wt7
 J61g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rp
c2NvdmVyeS5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oCmluZGV4IDdjYzkyMWEyOGY1MS4uOTNh
OGFlMGFhY2RhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvZGlzY292
ZXJ5LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oCkBAIC00
NiwxMiArNDYsMTYgQEAgdHlwZWRlZiBzdHJ1Y3QgdGFibGVfaW5mbwogewogCXVpbnQxNl90IG9m
ZnNldDsgICAvKiBCeXRlIG9mZnNldCAqLwogCXVpbnQxNl90IGNoZWNrc3VtOyAvKiBCeXRlIHN1
bSBvZiB0aGUgdGFibGUgKi8KKwl1aW50MTZfdCBzaXplOyAgICAgLyogVGFibGUgc2l6ZSAqLwor
CXVpbnQxNl90IHBhZGRpbmc7CiB9IHRhYmxlX2luZm87CiAKIHR5cGVkZWYgc3RydWN0IGJpbmFy
eV9oZWFkZXIKIHsKIAkvKiBwc3Agc3RydWN0dXJlIHNob3VsZCBnbyBhdCB0aGUgdG9wIG9mIHRo
aXMgc3RydWN0dXJlICovCiAJdWludDMyX3QgYmluYXJ5X3NpZ25hdHVyZTsgLyogMHg3LCAweDE0
LCAweDIxLCAweDI4ICovCisJdWludDE2X3QgdmVyc2lvbl9tYWpvcjsKKwl1aW50MTZfdCB2ZXJz
aW9uX21pbm9yOwogCXVpbnQxNl90IGJpbmFyeV9jaGVja3N1bTsgIC8qIEJ5dGUgc3VtIG9mIHRo
ZSBiaW5hcnkgYWZ0ZXIgdGhpcyBmaWVsZCAqLwogCXVpbnQxNl90IGJpbmFyeV9zaXplOyAgICAg
IC8qIEJpbmFyeSBTaXplKi8KIAl0YWJsZV9pbmZvIHRhYmxlX2xpc3RbVE9UQUxfVEFCTEVTXTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
