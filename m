Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADD60ACB
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 19:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E446E2E1;
	Fri,  5 Jul 2019 17:12:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80C6E2E1
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 17:12:36 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i125so8370836qkd.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 10:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBU6SQcZ21nzmqW3viM5WlE3pi6Y5VRqe7fqvcC0sk4=;
 b=n951qGQi6gUtm/6WHDWwhQxg+yCxEnIPV9d3232VhBwiR07w8M4j70++FJjxqPvDc3
 f0IGKwpN23Gh+pGb12KGVyEu1cAEoTlTFaltRhcjlwpWXD3kFs7MtE03iQBtQCJw4zAu
 YQ5/IB6nx1MNnh0TaiNPR4yxvWO0w8brtFgFsAPnavhJwQ24o/vjeMMTwENW0C+AZUd+
 ehxlfQSDXdy9hME1jKBfRL3Wq1mI4Wk70qsBwWyNTpP3mt0mRaCKYjH79KuOhQgXjSaF
 ZEDiOOe9X+bCmK4KPVH5LcGIB7eVUW17RI0sqC+EB6hhZXCwSqGFP8v8vw0hNO4M9n7W
 atqw==
X-Gm-Message-State: APjAAAXXkNTKM/X79zxljdNoquHLQHwQPJXAtq7Qb52Hxc7NQ+UVapXn
 JwrSYL7Xi7EYhhsj8RXc3qXZvaxH
X-Google-Smtp-Source: APXvYqyCS9ZhLVU1lorGSGgzMPnKJPMTNssYQwX73a7g03/t4hr58XPX+gqJN+RQtBrbtf2OxgncSg==
X-Received: by 2002:a37:4d16:: with SMTP id a22mr4074578qkb.103.1562346755170; 
 Fri, 05 Jul 2019 10:12:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id y42sm5754529qtc.66.2019.07.05.10.12.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 10:12:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/ttm: make some functions static
Date: Fri,  5 Jul 2019 12:12:27 -0500
Message-Id: <20190705171227.21009-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBU6SQcZ21nzmqW3viM5WlE3pi6Y5VRqe7fqvcC0sk4=;
 b=RRn9b3aMMlwTU+iOEg+coWRc0cS1LC9nYW/DqYStS0pUDEDqHt/JhwEX2Ff4ZPYeeP
 yBuBZoGkKxJxxn8e1EtXrwkUCmTU/4JRAWXx64otsdNLcsAQY5zMJHTtUSi/4yOSCHPW
 N6FNr8T9AAGYr8pdyhhN+/U2uGkBHq56UmGzC50TNsvBGNdGTb5SY3QhTZ23blNzrm2e
 td8te/yiYObFYX4xjGwfH/MJO5TxKEiPpBfCufwRyt37LiSl0rqYD2a//kXt/YT25NgX
 dsBEXOPquH2k6AD6YcibF7IFQsObp0/i6W8NOsDlhQ24oVmcQxh2IE6Kq74dhGGUu/x6
 325Q==
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

Tm90aWNlZCB3aGlsZSByZXZpZXdpbmcgdGhlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTQgKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCB8ICA2IC0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwppbmRleCBjOWZhYTY5Y2Q2NzcuLmQwOTAxMDZlZjIzYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtMjk5LDEyICsyOTksMTIgQEAgc3Rh
dGljIHN0cnVjdCBkcm1fbW1fbm9kZSAqYW1kZ3B1X2ZpbmRfbW1fbm9kZShzdHJ1Y3QgdHRtX21l
bV9yZWcgKm1lbSwKICAqCiAgKiBAZjogUmV0dXJucyB0aGUgbGFzdCBmZW5jZSBpZiBtdWx0aXBs
ZSBqb2JzIGFyZSBzdWJtaXR0ZWQuCiAgKi8KLWludCBhbWRncHVfdHRtX2NvcHlfbWVtX3RvX21l
bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2Nv
cHlfbWVtICpzcmMsCi0JCQkgICAgICAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqZHN0LAotCQkJ
ICAgICAgIHVpbnQ2NF90IHNpemUsCi0JCQkgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVj
dCAqcmVzdiwKLQkJCSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZikKK3N0YXRpYyBpbnQgYW1k
Z3B1X3R0bV9jb3B5X21lbV90b19tZW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJ
ICAgICAgc3RydWN0IGFtZGdwdV9jb3B5X21lbSAqc3JjLAorCQkJCSAgICAgIHN0cnVjdCBhbWRn
cHVfY29weV9tZW0gKmRzdCwKKwkJCQkgICAgICB1aW50NjRfdCBzaXplLAorCQkJCSAgICAgIHN0
cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJlc3YsCisJCQkJICAgICAgc3RydWN0IGRtYV9mZW5j
ZSAqKmYpCiB7CiAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gYWRldi0+bW1hbi5idWZmZXJf
ZnVuY3NfcmluZzsKIAlzdHJ1Y3QgZHJtX21tX25vZGUgKnNyY19tbSwgKmRzdF9tbTsKQEAgLTk0
OSw3ICs5NDksNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdHRtX3R0X3VucGluX3VzZXJwdHIoc3Ry
dWN0IHR0bV90dCAqdHRtKQogI2VuZGlmCiB9CiAKLWludCBhbWRncHVfdHRtX2dhcnRfYmluZChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKK3N0YXRpYyBpbnQgYW1kZ3B1X3R0bV9nYXJ0X2Jp
bmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICp0Ym8sCiAJCQkJdWludDY0X3QgZmxhZ3MpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmgKaW5kZXggYzJiNzY2OTAwNGJhLi5kZTg5YzIxOGRiMjYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKQEAgLTg2LDEyICs4Niw2IEBAIGludCBh
bWRncHVfY29weV9idWZmZXIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50NjRfdCBzcmNf
b2Zmc2V0LAogCQkgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwKIAkJICAg
ICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSwgYm9vbCBkaXJlY3Rfc3VibWl0LAogCQkgICAg
ICAgYm9vbCB2bV9uZWVkc19mbHVzaCk7Ci1pbnQgYW1kZ3B1X3R0bV9jb3B5X21lbV90b19tZW0o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkgICAgICAgc3RydWN0IGFtZGdwdV9jb3B5
X21lbSAqc3JjLAotCQkJICAgICAgIHN0cnVjdCBhbWRncHVfY29weV9tZW0gKmRzdCwKLQkJCSAg
ICAgICB1aW50NjRfdCBzaXplLAotCQkJICAgICAgIHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3Qg
KnJlc3YsCi0JCQkgICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmYpOwogaW50IGFtZGdwdV9maWxs
X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2JvICpibywKIAkJCXVpbnQzMl90IHNyY19kYXRhLAogCQkJ
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
