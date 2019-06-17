Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E748F22
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDC8897E7;
	Mon, 17 Jun 2019 19:30:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0BA897DC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so12226506qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4kon6c0vfs5K8RfNuPGeDEU0ZLMB5QTM9GeYwBDe6lo=;
 b=K2S9wd0dH1bUTsdiUVHPtRELhIj8edu5Pt1q2+mUeRTvjFbpor8Oxt6h452Zr31Rb8
 mMiXNsbMzzeriuJ8Ezi0qgJKRN0j0USpEM1ydNZ9/Ey2hkeJJ6t04BuGypA4++Aaz8Dq
 GLmA0m9TnAVWZljrjOwxfvvYt+OebanmPMo3pvUVDUcue1KRXLenUmr9JwjaEE4uwg6G
 vbXvalZ/PGrCQo1G5wZEnOu6wiFmArRlBP8gIXfEZQ1Vfdtq6dXHmIzcAZFi0LBi4HkX
 Ft2gIfRQXT/dIxUpFNm5weN/Dp8CUJ5J53Y4/EhhJmck8Y4HumeHSrJWTixVIGLym4nn
 jAzA==
X-Gm-Message-State: APjAAAWZ3PQCN/+O5t4xpx9iS1nOS+rgmPl+FxdbrkaV8FF8uuB2QVpC
 wTvHaBWi/IfJynqqiohCDNUoDoM6+z4=
X-Google-Smtp-Source: APXvYqzcJqSNJHx5JweyEAgbqmHgmMxvxcahATQeE4SfOYqgUtnC6PsFsMWzbP1URo2WGXRoDclc6A==
X-Received: by 2002:aed:2063:: with SMTP id 90mr56916283qta.307.1560799851433; 
 Mon, 17 Jun 2019 12:30:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 195/459] drm/amdgpu/vcn2: notify SMU power up/down VCN
Date: Mon, 17 Jun 2019 14:30:38 -0500
Message-Id: <20190617193042.18183-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4kon6c0vfs5K8RfNuPGeDEU0ZLMB5QTM9GeYwBDe6lo=;
 b=fWu7LQyF4R9QJ3HjQ3QUTjMdFHkSqm80Xom+2Jk6Slzr3lVbEfm7eJO6iwCfr6K/Qf
 rJmz3w2HU+60Ty+e6/mg/jRK7MjgbT0hOXWJy8CHkxKJXrAkHb0+Yxc1jXzeb6wzovJt
 4baUN6mBnndG/RxWqHwluEYiyfZ1twQ+ETT8Mx+83V9GMRPDHjuxnws5asyp6sErROny
 SE5wcdisNHJbprx8C7O4JQ7CxPfrhKQLaxtHWX5DSki0OoHZo0ro265NhNaPg9GOmpw3
 xIpZtO+xR8hb5sSrGkTp+IuNiFu9YKFyHqI5crHYfViG88YYa/peYUhFzkXI+TN0f9zz
 Mv2w==
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
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkZvciBzdyBjb250cm9sIHBvd2Vy
IGdhdGluZywgaXQgbmVlZHMgbm90aWZ5IFNNVSB0byBwb3dlciB1cC9kb3duIFZDTgp3aGVuIGVu
dGVyL2V4aXQgd29ya2luZyBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5Y
aWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyB8IDcgKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jCmluZGV4IDFiOTc3MGNiNjUwYi4uNzYwOWU2M2U1OWJjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTI3LDYgKzI3LDcgQEAKICNpbmNsdWRlICJhbWRncHVfdmNu
LmgiCiAjaW5jbHVkZSAic29jMTUuaCIKICNpbmNsdWRlICJzb2MxNWQuaCIKKyNpbmNsdWRlICJh
bWRncHVfcG0uaCIKIAogI2luY2x1ZGUgInZjbi92Y25fMl8wXzBfb2Zmc2V0LmgiCiAjaW5jbHVk
ZSAidmNuL3Zjbl8yXzBfMF9zaF9tYXNrLmgiCkBAIC03NzksNiArNzgwLDkgQEAgc3RhdGljIGlu
dCB2Y25fdjJfMF9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl1aW50MzJfdCBs
bWlfc3dhcF9jbnRsOwogCWludCBpLCBqLCByOwogCisJaWYgKGFkZXYtPnBtLmRwbV9lbmFibGVk
KQorCQlhbWRncHVfZHBtX2VuYWJsZV91dmQoYWRldiwgdHJ1ZSk7CisKIAl2Y25fdjJfMF9kaXNh
YmxlX3N0YXRpY19wb3dlcl9nYXRpbmcoYWRldik7CiAKIAkvKiBzZXQgdXZkIHN0YXR1cyBidXN5
ICovCkBAIC05OTEsNiArOTk1LDkgQEAgc3RhdGljIGludCB2Y25fdjJfMF9zdG9wKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCXZjbl92Ml8wX2VuYWJsZV9jbG9ja19nYXRpbmcoYWRldik7
CiAJdmNuX3YyXzBfZW5hYmxlX3N0YXRpY19wb3dlcl9nYXRpbmcoYWRldik7CiAKKwlpZiAoYWRl
di0+cG0uZHBtX2VuYWJsZWQpCisJCWFtZGdwdV9kcG1fZW5hYmxlX3V2ZChhZGV2LCBmYWxzZSk7
CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
