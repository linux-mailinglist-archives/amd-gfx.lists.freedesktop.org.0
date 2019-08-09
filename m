Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA487E96
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB856EE41;
	Fri,  9 Aug 2019 15:53:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA8A6EE3D
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:19 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d79so71917053qke.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gxj8nA8i34uRO1WyUWowwYGGOjPdZIQzXRxW9TPZYA=;
 b=FdiJR8oXvXfCUcgSq7XPELS4R38QrE/GCt+TJLDUJSOr6mLkoJXAyPWtMj4MalRx0T
 X9nEfS1F8RHyQY9Inmzlj5rWESbG21J5KW1oyiXsa/L/4h6OtyllGm9SiaIfqQ0xiwbY
 9LZ4pjBjdK22gsF1+gI97VC35uMJ7dZJ6jH1vS4ZovmG+LxViAgVOxdwyVt1O0EEHGxW
 ghNZi87t6GWoN2u6Jx6xpgvQtaoRWH1vcot93FuPS5Y7jf3KrzzYZPp//px8aFTyLdNi
 OzkfrGgIReWKFZdtJwk1CUEtzqbYsmqo2H1mNLsB9f+HHROTCLVjpzPx/ElhDGCzkOqn
 x75w==
X-Gm-Message-State: APjAAAW+D1y3QZLTzZkjAKhecUypJ15tmZOKTtLr0FVyR4/opT4DdruB
 iUTHiHIFtoYsC6+ROok3q5PDZye5
X-Google-Smtp-Source: APXvYqydMbtF1gJvIS6cdwBNl3r0wicAnNFi3c7rnbP7+KxCz5YVq7/mSuqduoN1tzsubuiq7kOD3w==
X-Received: by 2002:a37:7083:: with SMTP id l125mr18346136qkc.71.1565365998586; 
 Fri, 09 Aug 2019 08:53:18 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/27] drm/amdgpu: add renoir pci id
Date: Fri,  9 Aug 2019 10:52:45 -0500
Message-Id: <20190809155302.4733-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gxj8nA8i34uRO1WyUWowwYGGOjPdZIQzXRxW9TPZYA=;
 b=ijZk3seNVMtA6/ylzOlnF57blzTcQATAXHMGx3d2mIyVq2mRTk+p2hXzBkZq7IsEtZ
 JHQmSBo3GOp6SuFPzKgNVHVvDLhZR3sJBYGzZ9PIQh1oLsm33SFHnoKUeXUI9X8201BY
 Wb6JcOmpLBI77gle99I+KaZHDxk3mGv6gDJg4QWKY/mKQfIuGeOMGyZq33K8to04uxPt
 NnD4diZkWz1r1veKTWJPoS+8qvRZdDoNxrtWsBzaTlH7MmYtD5lWQzzjURNQTWhmeAek
 aF+PwW6zcNMFQRbho7tmk3oG+WQo8KgQ+HU9EgxJsp8w0FDmr/jMHfZCtYOLUgWaGytQ
 wd0g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkFkZCBSZW5vaXIgUENJIGlkIHN1
cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZp
ZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
aW5kZXggNzllMjJjMjIxYjc3Li4wNjc0Y2E5MGM5NTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEwMTAsNiArMTAxMCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAkvKiBOYXZpMTQgKi8KIAl7MHgxMDAy
LCAweDczNDAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTE0fSwKIAor
CS8qIFJlbm9pciAqLworCXsweDEwMDIsIDB4MTYzNiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwg
MCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVX0sCisKIAl7MCwgMCwgMH0KIH07CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
