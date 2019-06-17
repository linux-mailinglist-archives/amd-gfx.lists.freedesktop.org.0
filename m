Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02048E0A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB79089581;
	Mon, 17 Jun 2019 19:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29989518
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so12200814qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgiA8RfmWgZfAx0Bqu6vffVsu8v1u7k8NnKcws6vq2M=;
 b=ksmu6OuGMV3+hb+cMj4tCeFVBUJJxjRJXXi+yQNoLIvoDZw9L3psdsbHzrNAyXkrg0
 d4En7HRe+LCOW/m+h9uMuN0vhiaTgUQYZRgC4RYEIsGBWQvXhwUMbVu/EkGvH/+nEzzD
 X0q16lRQBBrC+lO39eK8UA58yQkOfdotMZPlalRgwwGi0goNBTN1bp/GyOK+//Cc5cDj
 3NkPp3vwF0vnPcPqyevZOjXPmDR5vGPrjVNkEjkJScs6jpvc41DliOZyTe1GAEeJTHWH
 zqKnkVxYri1MBIFD7maNo6bAwxnkASESyE+hMoQ1s/OJsCmFO22YHMcuyrcCG7wsV2tv
 Yelg==
X-Gm-Message-State: APjAAAVNO638du93KmxvLaaL04qC8FKuel+25DM83zeplErF8S8pBFSa
 3cpsK8X8ULC1aceKwHG3zO45LAI7IkM=
X-Google-Smtp-Source: APXvYqxsdPYHSySuSwpOVVBbUv4l1rEffBiJ2jjAxusJjkEFjO4dl8cNV+ZEKfUkuTDhSF19hkOm3A==
X-Received: by 2002:ac8:319d:: with SMTP id h29mr14152845qte.6.1560799095780; 
 Mon, 17 Jun 2019 12:18:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 076/459] drm/amdgpu/psp: switch to use sos_offset_bytes member
 as sys_bin_size
Date: Mon, 17 Jun 2019 14:10:37 -0500
Message-Id: <20190617191700.17899-65-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgiA8RfmWgZfAx0Bqu6vffVsu8v1u7k8NnKcws6vq2M=;
 b=dXw5vytwE/qAcySLunCf4ttXjaSGAs8xEXXXIi3+KcX7YO15zeDq1Y3pKsOuVZVEC1
 +ybE+xMZOVMjLy7+RBf3zXxv/Rn5H/Eom20jEwA5c2jXKUE853d7LVFq1X5redkFqiRK
 Vbyw6gabEc1k5EEBsU67JwbdEyIukW9hwCWzLr4OGcILK8myd2s1ugzhBRDoFHvKWQ1G
 KpY4FCxOyWA9YMtBC2dSakKc0MvAcOBU1YlVLq1MaqPnWJwua229IW3nqaD2qNaOjfKO
 hLDckAh60bJbeg/0HvmEpnYyknlwvZk2Pmp6tD5f99dHfrT4x6k771UCXV0uCzSzrAuO
 6yCQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKTmF2aTEwIHdpbGwg
aGF2ZSB0b2MgYnVpbHQtaW4gc29zIGJpbmFyeSBzbyB0aGF0IHVzaW5nIGhlYWRlci51Y29kZV9z
aXplX2J5dGVzCm1pbnVzIHNvc19zaXplX2J5dGVzIGFjdHVhbGx5IGlzIG5vdCBzeXNfYmluX3Np
emUuCgpVc2luZyBzb3Nfb2Zmc2V0X2J5dGVzIHdvcmtzIGZvciBib3RoIHZlZ2EyMCAocHNwX2Zp
cm13YXJlX2hlYWRlcl92MV8wKSBhbmQKbmF2aTEwIChwc3BfZmlybXdhcmVfaGVhZGVyX3YxXzEp
CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+CkFj
a2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9wc3BfdjExXzAuYwppbmRleCA0MzJiODFiYWY1ZmUuLjRkNmYwN2Y0YzkxYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKQEAgLTkwLDggKzkwLDcgQEAgc3RhdGljIGlu
dCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJCWFk
ZXYtPnBzcC5zb3NfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KHNvc19oZHItPmhlYWRlci51Y29k
ZV92ZXJzaW9uKTsKIAkJYWRldi0+cHNwLnNvc19mZWF0dXJlX3ZlcnNpb24gPSBsZTMyX3RvX2Nw
dShzb3NfaGRyLT51Y29kZV9mZWF0dXJlX3ZlcnNpb24pOwogCQlhZGV2LT5wc3Auc29zX2Jpbl9z
aXplID0gbGUzMl90b19jcHUoc29zX2hkci0+c29zX3NpemVfYnl0ZXMpOwotCQlhZGV2LT5wc3Au
c3lzX2Jpbl9zaXplID0gbGUzMl90b19jcHUoc29zX2hkci0+aGVhZGVyLnVjb2RlX3NpemVfYnl0
ZXMpIC0KLQkJCQlsZTMyX3RvX2NwdShzb3NfaGRyLT5zb3Nfc2l6ZV9ieXRlcyk7CisJCWFkZXYt
PnBzcC5zeXNfYmluX3NpemUgPSBsZTMyX3RvX2NwdShzb3NfaGRyLT5zb3Nfb2Zmc2V0X2J5dGVz
KTsKIAkJYWRldi0+cHNwLnN5c19zdGFydF9hZGRyID0gKHVpbnQ4X3QgKilzb3NfaGRyICsKIAkJ
CQlsZTMyX3RvX2NwdShzb3NfaGRyLT5oZWFkZXIudWNvZGVfYXJyYXlfb2Zmc2V0X2J5dGVzKTsK
IAkJYWRldi0+cHNwLnNvc19zdGFydF9hZGRyID0gKHVpbnQ4X3QgKilhZGV2LT5wc3Auc3lzX3N0
YXJ0X2FkZHIgKwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
