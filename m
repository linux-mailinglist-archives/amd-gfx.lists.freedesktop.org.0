Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E025D758
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538ED6E046;
	Tue,  2 Jul 2019 20:29:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2316E048
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:03 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i34so9405qta.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRRJs24VA5Kbbwg4iirJc1tY1/+KTIeujLVKBaqi46c=;
 b=I/top1ifaB2A8ccb9lyZXwMcexKUixkeAdP0U4FajOXQh3uR2SMFVfSWm0OXjD1tSJ
 Em17v5jivacgjH12PSBw4z5ONTCnlCNJImkLmprx66ZHEz+Mcz+ivWY0VJ7eVtfj9LqO
 xU7olFdgu9PBceCbKbzmjW3hJwzjLNgAtqiA7NRt630OdnOEC2t2P/vJB5dbEfy/TVtK
 izugVBwQ7fYLMFWVc7IT0txptjYBG4Y8up4bCFAzVZ/fBzRlSzOI9nxN+Woz4xybjsmD
 EKt1ufae+zM0s9+nOtojmXeWQFCYi16VS68ZyOssDXugpUyMk0NJ4Xqqf7cehL9Yy5LW
 i5MQ==
X-Gm-Message-State: APjAAAWdeQzt+Kprd8+zoEYkm/Ry6C0M4xYTHWizQO4DNqhnZDGlOD6z
 n6vE+2hNt0qr+xXFs2Cj8tlnqaA1L2I=
X-Google-Smtp-Source: APXvYqwFAsijONVEerOV1E9A+S1AOuoEcFa0UCMh6uvlyh4kueCDIL/tfExsYW5lB2qvY/0LLxH0mA==
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr28364198qvd.155.1562099342855; 
 Tue, 02 Jul 2019 13:29:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/53] drm/amdgpu/gmc10: add navi14 support
Date: Tue,  2 Jul 2019 15:27:59 -0500
Message-Id: <20190702202844.17001-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRRJs24VA5Kbbwg4iirJc1tY1/+KTIeujLVKBaqi46c=;
 b=mLqFw1U2YdM1AcKJcDOSu7Jph1hOP7g5NBH+AjZr0c4eJ3rK1sf2jr9zLFHQZKeUB6
 3kjZTTBvnIvZT7itrrt2d+4tU0evLQ+TN5briPCz41g3pRrFZGIS0utnWtJ7yPWG4cox
 15SywqWKqkyC3FQkRmiWtnWa+PFk+l2fyAmbz7yP4kRqG9io9aqv6bBGwUi18IB19Esp
 LeV9Zv04/+ku+ay7Kkj/l6Yr4SjiqUB29VhPKwO9oryqiu/nqEHQd2E2SLJMCs17KeoF
 4cO9C6dCipbyDpYZFxgeTAHbEuKAvAuBPIaCAys86CdOfDk8SPEEhftBCm7IKWMoHOkf
 knVg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
CgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192MTBfMC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8w
LmMKaW5kZXggYjQxMTY5MjYxZjdkLi5mY2ZkODUxYzZiYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192MTBfMC5jCkBAIC01MjIsNiArNTIyLDcgQEAgc3RhdGljIGludCBnbWNfdjEw
XzBfbWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAoYW1kZ3B1X2dhcnRf
c2l6ZSA9PSAtMSkgewogCQlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCQljYXNlIENISVBf
TkFWSTEwOgorCQljYXNlIENISVBfTkFWSTE0OgogCQlkZWZhdWx0OgogCQkJYWRldi0+Z21jLmdh
cnRfc2l6ZSA9IDUxMlVMTCA8PCAyMDsKIAkJCWJyZWFrOwpAQCAtNTk5LDkgKzYwMCwxMCBAQCBz
dGF0aWMgaW50IGdtY192MTBfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlhZGV2LT5nbWMudnJh
bV90eXBlID0gYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJhbV90eXBlKGFkZXYpOwogCXN3aXRj
aCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFW
STE0OgogCQkvKgogCQkgKiBUbyBmdWxmaWxsIDQtbGV2ZWwgcGFnZSBzdXBwb3J0LAotCQkgKiB2
bSBzaXplIGlzIDI1NlRCICg0OGJpdCksIG1heGltdW0gc2l6ZSBvZiBOYXZpMTAsCisJCSAqIHZt
IHNpemUgaXMgMjU2VEIgKDQ4Yml0KSwgbWF4aW11bSBzaXplIG9mIE5hdmkxMC9OYXZpMTQsCiAJ
CSAqIGJsb2NrIHNpemUgNTEyICg5Yml0KQogCQkgKi8KIAkJYW1kZ3B1X3ZtX2FkanVzdF9zaXpl
KGFkZXYsIDI1NiAqIDEwMjQsIDksIDMsIDQ4KTsKQEAgLTcxNSw2ICs3MTcsNyBAQCBzdGF0aWMg
dm9pZCBnbWNfdjEwXzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkx
MDoKKwljYXNlIENISVBfTkFWSTE0OgogCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
