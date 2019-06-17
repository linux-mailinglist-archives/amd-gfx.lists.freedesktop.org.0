Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ECD48FD9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7146D89DA5;
	Mon, 17 Jun 2019 19:46:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA91589CB8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:00 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so6965432qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4SDrDEVyDg6pW/pS3SeNbZN20WpH76GAltOqVY313c=;
 b=aWjL4RiuS+qLROAEjYhEO/9pvC7b9V7XxxZ/WZRVPaosSu0RWrvKYjrhVo9mh8qBpT
 tknflzhRV8MLKZO6I6X6b2guFGxCT+s6YyrKtp6BSBeIST28erIRFROTg1A92Z+x+69E
 CG2nQJzyDZyk8YGA9jHX8yY3HqJA9yQP54auxkMa2w1m+44cJ3bTwa3Q8rFE4XHa+7vP
 wD/VufzuwZ5OKbfTvExDWJAV9G9cg22ID6Ye4rP51v9LmcOmgnFF/dwx3F+rkdQz0R52
 0KwOCFuDaNrBJTrFF0oC+gI7uY4oTxkfa7WxCpIKiIJS4BO/ZgRBR/Rqn66CzXjgc8UH
 IC/g==
X-Gm-Message-State: APjAAAVKGzrbMYNdqyTdNsOl9DpSHSzK9ZJ6W1uKmWvS+0yIXbRf7Vga
 bnFgSOyYM7Kqwk/eHAtykbO+j6sj7DA=
X-Google-Smtp-Source: APXvYqyhpIpYMGO+64rly36mKuyY8USZ1QuUU3mZ6L0Ikfx9xj7ai4U9Yz0Aq3cHH6loxpF9xXZhMg==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr77103126qkn.259.1560800759714; 
 Mon, 17 Jun 2019 12:45:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 309/459] drm/amdgpu: fix PA_SC_FIFO_SIZE for Navi10
Date: Mon, 17 Jun 2019 14:44:10 -0500
Message-Id: <20190617194540.18497-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4SDrDEVyDg6pW/pS3SeNbZN20WpH76GAltOqVY313c=;
 b=cmKPPjY8pyrR/d+STrZD/84ShkqyAXHgn3CdNrt1ZqxSp/uqnjViCogDEO/xHkwuuz
 gLLkxb574rlrZXRMCyclHSwHN3R7XpyqEp0Xtbz7U+IOHbC9aLhk0UMdVglKVtn+6RSa
 KpxQ9eCz8TSRoEFGZ8OhYO3LN3fL32QJ2xvfV6eINS0FqhQKerbr/RV/ldXwW9GIcFKt
 Mj8IXhUuuQ8QYBDpb+oBWRkLxhgv9gqdux7K3s20BfIOtll77qBuuVRlES/xph+GcxH0
 bWCgqvVS9Emo5vkWk/9gN2Oa7V0BmhucWk5FDRgl2wUzN/Rgq9okrOer+QSc2rpWGVGe
 mVVQ==
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
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+ClJldmlld2VkLWJ5OiBYaWFvamll
IFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgfCAyMSArKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jCmluZGV4IDc3OTU5N2E2ZjMzYS4uMDA5MGNiYTJkMjRkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtMTAxNyw3ICsxMDE3LDcgQEAgc3Rh
dGljIHZvaWQgZ2Z4X3YxMF8wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCQlhZGV2LT5nZnguY29uZmlnLm1heF9od19jb250ZXh0cyA9IDg7CiAJCWFkZXYtPmdm
eC5jb25maWcuc2NfcHJpbV9maWZvX3NpemVfZnJvbnRlbmQgPSAweDIwOwogCQlhZGV2LT5nZngu
Y29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2JhY2tlbmQgPSAweDEwMDsKLQkJYWRldi0+Z2Z4LmNv
bmZpZy5zY19oaXpfdGlsZV9maWZvX3NpemUgPSAweDMwOworCQlhZGV2LT5nZnguY29uZmlnLnNj
X2hpel90aWxlX2ZpZm9fc2l6ZSA9IDA7CiAJCWFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3Rp
bGVfZmlmb19zaXplID0gMHg0QzA7CiAJCWdiX2FkZHJfY29uZmlnID0gUlJFRzMyX1NPQzE1KEdD
LCAwLCBtbUdCX0FERFJfQ09ORklHKTsKIAkJYnJlYWs7CkBAIC0xNTUzLDE1ICsxNTUzLDE2IEBA
IHN0YXRpYyB2b2lkIGdmeF92MTBfMF9jb25zdGFudHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkgKi8KIAlnZnhfdjEwXzBfc2VsZWN0X3NlX3NoKGFkZXYsIDB4ZmZmZmZmZmYs
IDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYpOwogCi0JV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVBBX1ND
X0ZJRk9fU0laRSwKLQkJICAgKGFkZXYtPmdmeC5jb25maWcuc2NfcHJpbV9maWZvX3NpemVfZnJv
bnRlbmQgPDwKLQkJCVBBX1NDX0ZJRk9fU0laRV9fU0NfRlJPTlRFTkRfUFJJTV9GSUZPX1NJWkVf
X1NISUZUKSB8Ci0JCSAgIChhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2JhY2tl
bmQgPDwKLQkJCVBBX1NDX0ZJRk9fU0laRV9fU0NfQkFDS0VORF9QUklNX0ZJRk9fU0laRV9fU0hJ
RlQpIHwKLQkJICAgKGFkZXYtPmdmeC5jb25maWcuc2NfaGl6X3RpbGVfZmlmb19zaXplIDw8Ci0J
CQlQQV9TQ19GSUZPX1NJWkVfX1NDX0hJWl9USUxFX0ZJRk9fU0laRV9fU0hJRlQpIHwKLQkJICAg
KGFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3RpbGVfZmlmb19zaXplIDw8Ci0JCQlQQV9TQ19G
SUZPX1NJWkVfX1NDX0VBUkxZWl9USUxFX0ZJRk9fU0laRV9fU0hJRlQpKTsKKyAgICAgICB0bXAg
PSBSRUdfU0VUX0ZJRUxEKDAsIFBBX1NDX0ZJRk9fU0laRSwgU0NfRlJPTlRFTkRfUFJJTV9GSUZP
X1NJWkUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5nZnguY29uZmlnLnNjX3By
aW1fZmlmb19zaXplX2Zyb250ZW5kKTsKKyAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
UEFfU0NfRklGT19TSVpFLCBTQ19CQUNLRU5EX1BSSU1fRklGT19TSVpFLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmltX2ZpZm9fc2l6ZV9iYWNrZW5k
KTsKKyAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgUEFfU0NfRklGT19TSVpFLCBTQ19I
SVpfVElMRV9GSUZPX1NJWkUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5nZngu
Y29uZmlnLnNjX2hpel90aWxlX2ZpZm9fc2l6ZSk7CisgICAgICAgdG1wID0gUkVHX1NFVF9GSUVM
RCh0bXAsIFBBX1NDX0ZJRk9fU0laRSwgU0NfRUFSTFlaX1RJTEVfRklGT19TSVpFLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmNvbmZpZy5zY19lYXJseXpfdGlsZV9maWZv
X3NpemUpOworICAgICAgIFdSRUczMl9TT0MxNShHQywgMCwgbW1QQV9TQ19GSUZPX1NJWkUsIHRt
cCk7CisKIAltdXRleF91bmxvY2soJmFkZXYtPmdyYm1faWR4X211dGV4KTsKIH0KIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
