Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432D3556B
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 04:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27018919D;
	Wed,  5 Jun 2019 02:49:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7288919D
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 02:49:54 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m24so5695608ioo.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Jun 2019 19:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7p21o5uxTLtaFxszgJas+mgtw3OFAPov+wiXSfsIKg=;
 b=QCOVWeNbNSrmXZ7/W3VgOFsgDw5d9VxwLMWnPyfiaWzU2SFJ/Oz3py9nC+WjwUWrjD
 /rP9hmrZ8caBKRBeGYNWUs0IUiXZIgK+pQUVbIBDdu1M11vszMwq/26m7D0NH4bEtAhK
 n0M97i6PQxEbST9JxC4ZAZIkeXdRnOp5lmT1btCfytf6NXeA0OykJDoFDCfLVntvYlBY
 7d2bYZMd2uioQjq7PmYuYeyM+pzKxWOs9R4hHCPw0LVJ+OjTAf8LSD4Rr36lQi0gS5nH
 DN0OzRqBdSM5fBtqbvkRmF9ZqrLvsZgH89kVsx4UQn9Zw/2fSN5lOQXZH7OFeVqg2iYE
 kvXQ==
X-Gm-Message-State: APjAAAV13wZeEohAXCxP/Zj8+2qmlcEPeFWWgNmuY4MXXLwjCTgdK59o
 rObRjsHvqQikiISP0TCfR//w/cie
X-Google-Smtp-Source: APXvYqxBIVl+f+EJ7CCVItP817HiUE6fMLffByFFuuwYki98/jSHu3hKkOO4LeneLHn1Y/pf3LBaaQ==
X-Received: by 2002:a05:6602:44:: with SMTP id
 z4mr2030074ioz.180.1559702993547; 
 Tue, 04 Jun 2019 19:49:53 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id s6sm6351193ioo.31.2019.06.04.19.49.52
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 19:49:53 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: bump the DRM version for GDS ENOMEM fixes
Date: Tue,  4 Jun 2019 22:49:49 -0400
Message-Id: <20190605024949.14748-1-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i7p21o5uxTLtaFxszgJas+mgtw3OFAPov+wiXSfsIKg=;
 b=pooWYTLAh1yGI7GkVIad862wt0i5dahytdAq2aLP67ZacVsYtE+KuSBHdxCIxW7oBZ
 yuQd/zS4H9mXFT+IQkVkQYZFmm+PBFNGzzHUdyw7bdCbLkK0AGlLSv+Y5eqDyZAliEp5
 vlRm/qpd9WRFcQU1QOFq4eITLFpcFFqaYXDEGQ7YZuQe/MMaVQel6sgVJ6NZDmoKKifg
 bifQqCWX9viVXIC59ISdPEtHKb9X1eNLgYcUuEphbABExv5ITDnLw3+hYwo7yNqHMEKB
 embxJet8GNIEMcSiVU6HRkXK0olLY+qYLWWHGG6ugDgsy0P2IfWibf/6hH+X/NHtqNhd
 oKww==
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

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggMWYzOGQ2
ZmMxZmUzLi43ZGFhMmE4ZjFjMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKQEAgLTY5LDIwICs2OSwyMSBAQAogICogLSAzLjIzLjAgLSBBZGQgcXVlcnkgZm9yIFZS
QU0gbG9zdCBjb3VudGVyCiAgKiAtIDMuMjQuMCAtIEFkZCBoaWdoIHByaW9yaXR5IGNvbXB1dGUg
c3VwcG9ydCBmb3IgZ2Z4OQogICogLSAzLjI1LjAgLSBBZGQgc3VwcG9ydCBmb3Igc2Vuc29yIHF1
ZXJ5IGluZm8gKHN0YWJsZSBwc3RhdGUgc2Nsay9tY2xrKS4KICAqIC0gMy4yNi4wIC0gR0ZYOTog
UHJvY2VzcyBBTURHUFVfSUJfRkxBR19UQ19XQl9OT1RfSU5WQUxJREFURS4KICAqIC0gMy4yNy4w
IC0gQWRkIG5ldyBjaHVuayB0byB0byBBTURHUFVfQ1MgdG8gZW5hYmxlIEJPX0xJU1QgY3JlYXRp
b24uCiAgKiAtIDMuMjguMCAtIEFkZCBBTURHUFVfQ0hVTktfSURfU0NIRURVTEVEX0RFUEVOREVO
Q0lFUwogICogLSAzLjI5LjAgLSBBZGQgQU1ER1BVX0lCX0ZMQUdfUkVTRVRfR0RTX01BWF9XQVZF
X0lECiAgKiAtIDMuMzAuMCAtIEFkZCBBTURHUFVfU0NIRURfT1BfQ09OVEVYVF9QUklPUklUWV9P
VkVSUklERS4KICAqIC0gMy4zMS4wIC0gQWRkIHN1cHBvcnQgZm9yIHBlci1mbGlwIHRpbGluZyBh
dHRyaWJ1dGUgY2hhbmdlcyB3aXRoIERDCiAgKiAtIDMuMzIuMCAtIEFkZCBzeW5jb2JqIHRpbWVs
aW5lIHN1cHBvcnQgdG8gQU1ER1BVX0NTLgorICogLSAzLjMzLjAgLSBGaXhlcyBmb3IgR0RTIEVO
T01FTSBmYWlsdXJlcyBpbiBBTURHUFVfQ1MuCiAgKi8KICNkZWZpbmUgS01TX0RSSVZFUl9NQUpP
UgkzCiAjZGVmaW5lIEtNU19EUklWRVJfTUlOT1IJMzIKICNkZWZpbmUgS01TX0RSSVZFUl9QQVRD
SExFVkVMCTAKIAogI2RlZmluZSBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEgJMjU2CiAK
IGludCBhbWRncHVfdnJhbV9saW1pdCA9IDA7CiBpbnQgYW1kZ3B1X3Zpc192cmFtX2xpbWl0ID0g
MDsKIGludCBhbWRncHVfZ2FydF9zaXplID0gLTE7IC8qIGF1dG8gKi8KLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
