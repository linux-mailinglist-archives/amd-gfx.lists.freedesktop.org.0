Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BE48E9B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF4189870;
	Mon, 17 Jun 2019 19:27:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242A389862
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:25 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id i125so6947516qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWDiNHgYRpoUo1E7Cf8BedG2BLg2ty/5FV0R9tFruTg=;
 b=WKo7XfrcuiXvQSJvHpuMMfbGB/3Nht3+8OQvXM/6pv2kxC+Qgn/hHEFgC6PdANLL4W
 UpbaCwc1DI4awx4530J89WD1uA19LTBdHBLH6ArrSa3jtLCw5hJ7B4C/8vwVjqDSpd8a
 aJ6czHVA4TxPNHRlhE5e1vH8KsONk598WQzpFBPejB3w67hKr+ZURpz1F8opAgu3oDkQ
 j46YlljrMewBLO8qIwBCw33zM2UNSSq2QkTi6/udrfYUTqZvnnCfdnW3kgN8VrBrxfmH
 NI1Hf0ORx/cU8NLZB9HgXU77+Ci+bJDZVR1DHi51vF40224iHRqfSULvyQPpJWLdQc2U
 Fc4Q==
X-Gm-Message-State: APjAAAUUT/nvBb80nPJFhzFBpVE5cfB+JMmOLEIKGd2rx2soEilSO/SV
 G0winQ0qNcexrjWP0gPRNjaJG/GTGjQ=
X-Google-Smtp-Source: APXvYqyvlZ5Ro/tHNY3tiuL1DwVQfy6sEoA0tF7bZbNJDEyho62RVlj3PUK7RT/oOeucTQgTHbYSzQ==
X-Received: by 2002:a37:a24f:: with SMTP id l76mr50291937qke.252.1560799644008; 
 Mon, 17 Jun 2019 12:27:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 113/459] drm/amdgpu: add VCN2.0 decode ring test
Date: Mon, 17 Jun 2019 14:25:38 -0500
Message-Id: <20190617192704.18038-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWDiNHgYRpoUo1E7Cf8BedG2BLg2ty/5FV0R9tFruTg=;
 b=nt0MnTOwpr4SGyrRBgtkESdOt7cF73l1M/j0zj52b8mCszVoTz5nhg+RYwAyGPmRrt
 TPS2w89PUoBCzD5MvoPfNZXE0ch2tp3W232q79nM52/7L+/VpaesCyseNAbREhCEeJl0
 hRhX8Su8PdSH6Gg1P38Ha1bdMtGMtOzEG64U5d5aG79fNniDBsUDHyAESF5iJGVOZQyN
 eHtHLelJdjMijcONJBqcdytmaXsihT5pcbW+Bdz57vryMAqDQ8n1Ul/kPW2hxqpXxq/y
 fvRnvK8WD0V80ps8/QUj5acfO4OM8zgTbITn/Pr1DKRu35pkwxq25fjExQnnKEdypFQW
 ibiQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIGludGVybmFsIHJlZ2lzdGVyIG9m
ZnNldCBmb3IgcmVnaXN0ZXJzIGludm9sdmluZyBpbiByaW5nIHRlc3RzCgpTaWduZWQtb2ZmLWJ5
OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNuLmMgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmggfCA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5j
ICAgfCAzICsrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA4ZWNlNDI3
YjYwMTkuLjVkYmQ5NzViYWMwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y24uYwpAQCAtMzEyLDE3ICszMTIsMTUgQEAgaW50IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9y
aW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAl1bnNpZ25lZCBpOwogCWludCByOwogCi0J
V1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSksIDB4Q0FGRURF
QUQpOworCVdSRUczMihhZGV2LT52Y24uZXh0ZXJuYWwuc2NyYXRjaDksIDB4Q0FGRURFQUQpOwog
CXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAzKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7Ci0K
LQlhbWRncHVfcmluZ193cml0ZShyaW5nLAotCQlQQUNLRVQwKFNPQzE1X1JFR19PRkZTRVQoVVZE
LCAwLCBtbVVWRF9TQ1JBVENIOSksIDApKTsKKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNL
RVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5zY3JhdGNoOSwgMCkpOwogCWFtZGdwdV9yaW5nX3dyaXRl
KHJpbmcsIDB4REVBREJFRUYpOwogCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsKIAlmb3IgKGkg
PSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKLQkJdG1wID0gUlJFRzMyKFNPQzE1
X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSkpOworCQl0bXAgPSBSUkVHMzIoYWRl
di0+dmNuLmV4dGVybmFsLnNjcmF0Y2g5KTsKIAkJaWYgKHRtcCA9PSAweERFQURCRUVGKQogCQkJ
YnJlYWs7CiAJCURSTV9VREVMQVkoMSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNuLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmgKaW5kZXggYTFlZTE5MjUxYWFlLi5iODBmYzEzOWViN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKQEAgLTg3LDYgKzg3LDEwIEBAIHN0cnVjdCBkcGdfcGF1
c2Vfc3RhdGUgewogCWVudW0gaW50ZXJuYWxfZHBnX3N0YXRlIGpwZWc7CiB9OwogCitzdHJ1Y3Qg
YW1kZ3B1X3Zjbl9yZWd7CisJdW5zaWduZWQJc2NyYXRjaDk7Cit9OworCiBzdHJ1Y3QgYW1kZ3B1
X3ZjbiB7CiAJc3RydWN0IGFtZGdwdV9ibwkqdmNwdV9ibzsKIAl2b2lkCQkJKmNwdV9hZGRyOwpA
QCAtMTAyLDYgKzEwNiw3IEBAIHN0cnVjdCBhbWRncHVfdmNuIHsKIAl1bnNpZ25lZAkJbnVtX2Vu
Y19yaW5nczsKIAllbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBjdXJfc3RhdGU7CiAJc3RydWN0
IGRwZ19wYXVzZV9zdGF0ZSBwYXVzZV9zdGF0ZTsKKwlzdHJ1Y3QgYW1kZ3B1X3Zjbl9yZWcJaW50
ZXJuYWwsIGV4dGVybmFsOwogCWludCAoKnBhdXNlX2RwZ19tb2RlKShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJc3RydWN0IGRwZ19wYXVzZV9zdGF0ZSAqbmV3X3N0YXRlKTsKIH07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwppbmRleCBiYjQ3ZjViMjRiZTUuLmJhYjkw
MDY1M2EwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCkBAIC0xMjgsNiAr
MTI4LDkgQEAgc3RhdGljIGludCB2Y25fdjFfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlpZiAo
cikKIAkJcmV0dXJuIHI7CiAKKwlhZGV2LT52Y24uaW50ZXJuYWwuc2NyYXRjaDkgPSBhZGV2LT52
Y24uZXh0ZXJuYWwuc2NyYXRjaDkgPQorCQlTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgMCwgbW1VVkRf
U0NSQVRDSDkpOworCiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyAr
K2kpIHsKIAkJcmluZyA9ICZhZGV2LT52Y24ucmluZ19lbmNbaV07CiAJCXNwcmludGYocmluZy0+
bmFtZSwgInZjbl9lbmMlZCIsIGkpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
