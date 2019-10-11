Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16750D4982
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 22:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D2F6EC93;
	Fri, 11 Oct 2019 20:52:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40106EC93
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 20:52:13 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y189so10172885qkc.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AHjo1JdwMEt529iQAsGKi1SPv7ed5EJ1SmbxEjsqRH8=;
 b=fmR2RQCxBs2eOjF2PbQ1luttnNLX2nKZYTqSO73boML30KhG7P758UREgv39Lxh090
 cHPzLVVIcH+Nf2aWe0+cQEH92Csjg+yYMvMH5hsjV2dF5ZhPNd6Vf/iyPMYyZ+UcpVwA
 z1kj03HydwnnH2ZdVDlMUXwwA85SJnoGNKBt+759venALnJV/2+1cliCs3ee4X7HN2z5
 NJ6Bpk6fTOyzHxRGnN91e5i19F8bC3URlZMef1Z8AXnM3qi1TgVB/wGR/oZngOnIMcT4
 TR46/Fyziu8zuNnCe9VCAQlem/fp/fxSRM45CIJmh/nYdVz+L7qxJq9p9l1bjHnHWROH
 IKXw==
X-Gm-Message-State: APjAAAWyb1CERiRvPtNxiyvPbdk3NAWYIg1oLV3ivBVd280ex598Z4R1
 oit7W7RnA5OEtvVPlRqlHLSFlUeL
X-Google-Smtp-Source: APXvYqyhGos1FdJK0/xSsGijYKD+orG1KkzAqunoxmKv/ploF+8E3EIUrOssiIRujZfmo1yaTBpzkQ==
X-Received: by 2002:a37:5d0:: with SMTP id 199mr18477754qkf.146.1570827132778; 
 Fri, 11 Oct 2019 13:52:12 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id o38sm5785621qtc.39.2019.10.11.13.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 13:52:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: add NULL checks for clock manager pointer
Date: Fri, 11 Oct 2019 15:51:54 -0500
Message-Id: <20191011205154.21075-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AHjo1JdwMEt529iQAsGKi1SPv7ed5EJ1SmbxEjsqRH8=;
 b=onjrCtlpppc4OB6fIuQE5yYtUns7LsP4yODVBxyo29K6QHhK7bJZKx2Pjq393Ma3VO
 JAYouXtEZzT53LyokGidRr2QjW9xayEJhX/KYhI2aETKhtXE7UUAOb6NB2d8e61el6r2
 OcTpIbgl6iGvlhQ8KTHX/33nX24eABTMyy4XLyF1bhTIlLiSnbYq1wShrVCKEPOrlDFt
 cTEDmrZ2eHi4CPm7QdGsiqG7AVCZ4ZtDAULaLuchzBszP/8sdWAgVaUZhKLrEzS+w6mO
 XvXKXyEGh8ePHSmM/t8ExCzrQJ106zLfxpcFbKdu8xgN4+qU4svBA4rH1iezFt3rW6wv
 QgKQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+CgpUaGlzIGZpeGVzIGtlcm5lbCBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2VzIG9uIHNodXRkb3duOgpSSVA6IDAwMTA6YnVpbGRfYXVkaW9fb3V0
cHV0LmlzcmEuMCsweDk3LzB4MTEwIFthbWRncHVdClJJUDogMDAxMDplbmFibGVfbGlua19kcCsw
eDE4Ni8weDMwMCBbYW1kZ3B1XQoKU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgICAg
ICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX2h3X3NlcXVlbmNlci5jIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IDE1MmM1NjRhODM0NC4uOGI1OGNmYTNlOThlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC0xNTEw
LDcgKzE1MTAsNyBAQCBzdGF0aWMgZW51bSBkY19zdGF0dXMgZW5hYmxlX2xpbmtfZHAoCiAKIAlw
aXBlX2N0eC0+c3RyZWFtX3Jlcy5waXhfY2xrX3BhcmFtcy5yZXF1ZXN0ZWRfc3ltX2NsayA9CiAJ
CQlsaW5rX3NldHRpbmdzLmxpbmtfcmF0ZSAqIExJTktfUkFURV9SRUZfRlJFUV9JTl9LSFo7Ci0J
aWYgKCFhcHBseV9zZWFtbGVzc19ib290X29wdGltaXphdGlvbikKKwlpZiAoc3RhdGUtPmNsa19t
Z3IgJiYgIWFwcGx5X3NlYW1sZXNzX2Jvb3Rfb3B0aW1pemF0aW9uKQogCQlzdGF0ZS0+Y2xrX21n
ci0+ZnVuY3MtPnVwZGF0ZV9jbG9ja3Moc3RhdGUtPmNsa19tZ3IsIHN0YXRlLCBmYWxzZSk7CiAK
IAlkcF9lbmFibGVfbGlua19waHkoCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IGY4YzFiNGYx
Yjk4Ny4uOGQ4ZmExMGI1ZDg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwpAQCAtMTE2MSw4ICsx
MTYxLDkgQEAgc3RhdGljIHZvaWQgYnVpbGRfYXVkaW9fb3V0cHV0KAogCQl9CiAJfQogCi0JaWYg
KHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQgfHwK
LQkJCXBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlRf
TVNUKSB7CisJaWYgKHN0YXRlLT5jbGtfbWdyICYmCisJCShwaXBlX2N0eC0+c3RyZWFtLT5zaWdu
YWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUIHx8CisJCQlwaXBlX2N0eC0+c3RyZWFtLT5z
aWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUX01TVCkpIHsKIAkJYXVkaW9fb3V0cHV0
LT5wbGxfaW5mby5kcF9kdG9fc291cmNlX2Nsb2NrX2luX2toeiA9CiAJCQkJc3RhdGUtPmNsa19t
Z3ItPmZ1bmNzLT5nZXRfZHBfcmVmX2Nsa19mcmVxdWVuY3koCiAJCQkJCQlzdGF0ZS0+Y2xrX21n
cik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
