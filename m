Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231F48EB0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE75898EA;
	Mon, 17 Jun 2019 19:27:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6B898A3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so12167439qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQRxusud29XIegZJfGo4AGHRwURYiPCt7EiyQ8STaro=;
 b=cCJc3ePcgl50lq44LXWKoORfoZuI2f/OKkPPYyN0YqqI6lyjxtyTnguvwXzKiYMtrF
 cgYPoEd0vezBXqXMpfRZPlzaelebOcc+WnK3cP5XXWgq07Ef5I20PvI1wy8pouxvkJN/
 vWDHC4rf1OhBQiKxxQtkKMe/q3kudzVaj/pZanTGv1SSITcJ3gpHOgHB8u0Wkhd/OdTc
 mf+/sKY/rT1nthPI09q9uHL8QxycWIdbRbsJrwukHYVDEpdHX3nPkDmcQ8qfO6T71pvC
 jW7cbOgzLk/tHXCIGzEX9dBPoKttTnmgK4BP/V1aZhjoCSLM6XUaEGa481jdXigAfVt/
 S3ZQ==
X-Gm-Message-State: APjAAAUVJ/7kE3NrCGyONfWQ8RPX3GguXyMpSz7JY/KRvMfVBvFEEm/x
 HQdNBUbt+KUbx9EJj0pgVDH5cjBRWBA=
X-Google-Smtp-Source: APXvYqwvo0sxAx9RWdCrJSlc0X1Knvtu6gVr9FHyYbm+Jrw5kCQG1l5LyicGyYUaUxr/HYLUqVq6nQ==
X-Received: by 2002:a0c:95af:: with SMTP id s44mr22030703qvs.162.1560799650709; 
 Mon, 17 Jun 2019 12:27:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 120/459] drm/amdgpu/mes: add definitions of ip callback
 function
Date: Mon, 17 Jun 2019 14:25:45 -0500
Message-Id: <20190617192704.18038-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQRxusud29XIegZJfGo4AGHRwURYiPCt7EiyQ8STaro=;
 b=twWEdHqeHKG9gR7S4mNllSj0VHTJ9yk/3K7vJrXbxrdxB3hfKkzisaLtIjMcTvdBgk
 oxYsdywQVyg0mZCz6U5CHAlNq8vyIuranodsKk6L/S/SLUsc26GyGljz2yILrJPJEaKC
 qJ593YNoGCxF5TL+mv8n1k6ddiRK7gPs/b1J+7mHwZkOQCBZ6qCw3x/sbzN1en7lpT05
 76oPmllNexnWwRnH6HAdUazdUZsF2XsjTTVw57GUcHRaRHVpeafkSmKTMMc1xkId+6d+
 LaeelJbfv/oCW6UR9CYgocdyqczQ0Trg0MORSaBsNDIl5n4tZYi+TBEWY/yXCg7FLWln
 TGBA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFic3RyYWN0IG1lcyBpcCBpbmRl
cGVuZGVudCBmdW5jdGlvbiBsYXllci4KCkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmggfCA1NCArKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaAppbmRleCA2MjFlZjhhN2YwNzQu
Ljc4ODA4NDMxMGRkNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X21lcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaApA
QCAtMjQsOCArMjQsNjIgQEAKICNpZm5kZWYgX19BTURHUFVfTUVTX0hfXwogI2RlZmluZSBfX0FN
REdQVV9NRVNfSF9fCiAKK3N0cnVjdCBhbWRncHVfbWVzX2Z1bmNzOworCiBzdHJ1Y3QgYW1kZ3B1
X21lcyB7CisJc3RydWN0IGFtZGdwdV9hZGV2ICphZGV2OworCisJLyogaXAgc3BlY2lmaWMgZnVu
Y3Rpb25zICovCisJc3RydWN0IGFtZGdwdV9tZXNfZnVuY3MgKmZ1bmNzOworfTsKKworc3RydWN0
IG1lc19hZGRfcXVldWVfaW5wdXQgeworCXVpbnQzMl90CXByb2Nlc3NfaWQ7CisJdWludDY0X3QJ
cGFnZV90YWJsZV9iYXNlX2FkZHI7CisJdWludDY0X3QJcHJvY2Vzc192YV9zdGFydDsKKwl1aW50
NjRfdAlwcm9jZXNzX3ZhX2VuZDsKKwl1aW50NjRfdAlwcm9jZXNzX3F1YW50dW07CisJdWludDY0
X3QJcHJvY2Vzc19jb250ZXh0X2FkZHI7CisJdWludDY0X3QJZ2FuZ19xdWFudHVtOworCXVpbnQ2
NF90CWdhbmdfY29udGV4dF9hZGRyOworCXVpbnQzMl90CWlucHJvY2Vzc19nYW5nX3ByaW9yaXR5
OworCXVpbnQzMl90CWdhbmdfZ2xvYmFsX3ByaW9yaXR5X2xldmVsOworCXVpbnQzMl90CWRvb3Ji
ZWxsX29mZnNldDsKKwl1aW50NjRfdAltcWRfYWRkcjsKKwl1aW50NjRfdAl3cHRyX2FkZHI7CisJ
dWludDMyX3QJcXVldWVfdHlwZTsKKwl1aW50MzJfdAlwYWdpbmc7Cit9OworCitzdHJ1Y3QgbWVz
X3JlbW92ZV9xdWV1ZV9pbnB1dCB7CisJdWludDMyX3QJZG9vcmJlbGxfb2Zmc2V0OworCXVpbnQ2
NF90CWdhbmdfY29udGV4dF9hZGRyOworfTsKKworc3RydWN0IG1lc19zdXNwZW5kX2dhbmdfaW5w
dXQgeworCWJvb2wJCXN1c3BlbmRfYWxsX2dhbmdzOworCXVpbnQ2NF90CWdhbmdfY29udGV4dF9h
ZGRyOworCXVpbnQ2NF90CXN1c3BlbmRfZmVuY2VfYWRkcjsKKwl1aW50MzJfdAlzdXNwZW5kX2Zl
bmNlX3ZhbHVlOworfTsKKworc3RydWN0IG1lc19yZXN1bWVfZ2FuZ19pbnB1dCB7CisJYm9vbAkJ
cmVzdW1lX2FsbF9nYW5nczsKKwl1aW50NjRfdAlnYW5nX2NvbnRleHRfYWRkcjsKK307CisKK3N0
cnVjdCBhbWRncHVfbWVzX2Z1bmNzIHsKKwlpbnQgKCphZGRfaHdfcXVldWUpKHN0cnVjdCBhbWRn
cHVfbWVzICptZXMsCisJCQkgICAgc3RydWN0IG1lc19hZGRfcXVldWVfaW5wdXQgKmlucHV0KTsK
KworCWludCAoKnJlbW92ZV9od19xdWV1ZSkoc3RydWN0IGFtZGdwdV9tZXMgKm1lcywKKwkJCSAg
ICAgICBzdHJ1Y3QgbWVzX3JlbW92ZV9xdWV1ZV9pbnB1dCAqaW5wdXQpOworCisJaW50ICgqc3Vz
cGVuZF9nYW5nKShzdHJ1Y3QgYW1kZ3B1X21lcyAqbWVzLAorCQkJICAgIHN0cnVjdCBtZXNfc3Vz
cGVuZF9nYW5nX2lucHV0ICppbnB1dCk7CiAKKwlpbnQgKCpyZXN1bWVfZ2FuZykoc3RydWN0IGFt
ZGdwdV9tZXMgKm1lcywKKwkJCSAgIHN0cnVjdCBtZXNfcmVzdW1lX2dhbmdfaW5wdXQgKmlucHV0
KTsKIH07CiAKICNlbmRpZiAvKiBfX0FNREdQVV9NRVNfSF9fICovCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
