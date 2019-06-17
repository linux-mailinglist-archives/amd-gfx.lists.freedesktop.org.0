Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AED48ED2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736B4899DE;
	Mon, 17 Jun 2019 19:28:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB13689996
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:00 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so12255454qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=II7jUZeAnv1SYarQgsX/qiEM6k+BqwEm9LpaYqpBI2Q=;
 b=gdZJAZQPoudgTPlYzvoQo3mlPF6zMxRbbXVcK1C/+gaZpNIxATXQN+OjdpWsK+IGVJ
 xVZhHCjvdnXaRbBtDUEIB2eqCEDlKQZJ2HOocV5+g/h9u7DdCU358gSoE13M366OHDMs
 7nN2kIf3fkriFN7stM7eNt1aTnYsINhvR/sF+CggfHAcve5JUlE5nisBsxKBsUsDFEvD
 krsq8Xil0wXcJywF7jqojMJ3h+OiKVbyr6K/MYZRYSPx2oAyt5WE/U/cn9TwF3Vkk/QD
 K2VOasFAqObLTGWaFZToVrhO1hBMQH+b9nS3SZfs6OwHrkMmYJjg50hdaqevmaUnuhgO
 dgbg==
X-Gm-Message-State: APjAAAUlkvyoDnBmMDLQ2Mg5wz6GxesbEVuR1oic2/8l6V5sHWeAuULP
 9o0OVyftsueAzSKsOJNoUzVPzV7SpCE=
X-Google-Smtp-Source: APXvYqwImxOpUclXgBdE+WAMRVTibCBqCMoiTEaTHFUpRL416M7Zng2D2oRQsYYaKJt/+oZ4xW4teQ==
X-Received: by 2002:a0c:874b:: with SMTP id 11mr9035341qvi.141.1560799679815; 
 Mon, 17 Jun 2019 12:27:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 150/459] drm/amdgpu: bump smc firmware header version to v2
 (v2)
Date: Mon, 17 Jun 2019 14:26:15 -0500
Message-Id: <20190617192704.18038-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=II7jUZeAnv1SYarQgsX/qiEM6k+BqwEm9LpaYqpBI2Q=;
 b=XauY2OZBqardRpAifC79yLyU4Sy2heDpa1kMlwNAh+pK532QNZEk2CGoy9UrzpK1cv
 Yd7LbpFkHrvS3qDl1GoPwxxHTliG9qg+17ZVVsGZk1IvkPIrhhkn/CUGdzbwoEieHlXN
 iomO24Foyts6rhHr+q3P2Qs48B6RbypytqJ3aLjRBj0RknQHY9mpMf6FtA/Q35yyk1a2
 TTAKx65YSPSLjWE+sQnsZGcGSASbcMGnseYIYzI4YGTPrriv7K5XuapRG0eAmUI76FMV
 dd4UB7F7vF87ox3pnyVhK0dXxfWQ7y4UqkWmF4u1+GkriXpT5cWtiSwaGGtXvpsqTDp2
 EsGw==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYnVtcHMgc21j
IGZpcm13YXJlIGhlYWRlciB2ZXJzaW9uIHRvIHYyIGZvciBzdG9yaW5nIHNvZnQgcHB0YWJsZS4K
CnYyOiBmaXggdGhlIHR5cG8sIGFuZCBhZGQgcHJpbnRzIGZvciB2MiBoZWFkZXIKClNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdWNvZGUuYyB8IDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91Y29kZS5oIHwgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Vjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwppbmRl
eCAwOWYzODRjZThjZDcuLjcwODFhZDlmOTNlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Vjb2RlLmMKQEAgLTc3LDYgKzc3LDE0IEBAIHZvaWQgYW1kZ3B1X3Vjb2RlX3By
aW50X3NtY19oZHIoY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKmhkcikKIAkJ
CWNvbnRhaW5lcl9vZihoZHIsIHN0cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVyX3YxXzAsIGhlYWRl
cik7CiAKIAkJRFJNX0RFQlVHKCJ1Y29kZV9zdGFydF9hZGRyOiAldVxuIiwgbGUzMl90b19jcHUo
c21jX2hkci0+dWNvZGVfc3RhcnRfYWRkcikpOworCX0gZWxzZSBpZiAodmVyc2lvbl9tYWpvciA9
PSAyKSB7CisJCWNvbnN0IHN0cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVyX3YxXzAgKnYxX2hkciA9
CisJCQljb250YWluZXJfb2YoaGRyLCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92MV8wLCBo
ZWFkZXIpOworCQljb25zdCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92Ml8wICp2Ml9oZHIg
PQorCQkJY29udGFpbmVyX29mKHYxX2hkciwgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJfdjJf
MCwgdjFfMCk7CisKKwkJRFJNX0lORk8oInBwdF9vZmZzZXRfYnl0ZXM6ICV1XG4iLCBsZTMyX3Rv
X2NwdSh2Ml9oZHItPnBwdF9vZmZzZXRfYnl0ZXMpKTsKKwkJRFJNX0lORk8oInBwdF9zaXplX2J5
dGVzOiAldVxuIiwgbGUzMl90b19jcHUodjJfaGRyLT5wcHRfc2l6ZV9ieXRlcykpOwogCX0gZWxz
ZSB7CiAJCURSTV9FUlJPUigiVW5rbm93biBTTUMgdWNvZGUgdmVyc2lvbjogJXUuJXVcbiIsIHZl
cnNpb25fbWFqb3IsIHZlcnNpb25fbWlub3IpOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Vjb2RlLmgKaW5kZXggMzgwNmE3OTU3YzZmLi45YjA5NjIyOGEwMmYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCkBAIC00OSw2ICs0OSwxMyBA
QCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92MV8wIHsKIAl1aW50MzJfdCB1Y29kZV9zdGFy
dF9hZGRyOwogfTsKIAorLyogdmVyc2lvbl9tYWpvcj0yLCB2ZXJzaW9uX21pbm9yPTAgKi8KK3N0
cnVjdCBzbWNfZmlybXdhcmVfaGVhZGVyX3YyXzAgeworCXN0cnVjdCBzbWNfZmlybXdhcmVfaGVh
ZGVyX3YxXzAgdjFfMDsKKwl1aW50MzJfdCBwcHRfb2Zmc2V0X2J5dGVzOyAvKiBzb2Z0IHBwdGFi
bGUgb2Zmc2V0ICovCisJdWludDMyX3QgcHB0X3NpemVfYnl0ZXM7IC8qIHNvZnQgcHB0YWJsZSBz
aXplICovCit9OworCiAvKiB2ZXJzaW9uX21ham9yPTEsIHZlcnNpb25fbWlub3I9MCAqLwogc3Ry
dWN0IHBzcF9maXJtd2FyZV9oZWFkZXJfdjFfMCB7CiAJc3RydWN0IGNvbW1vbl9maXJtd2FyZV9o
ZWFkZXIgaGVhZGVyOwpAQCAtMTk0LDYgKzIwMSw3IEBAIHVuaW9uIGFtZGdwdV9maXJtd2FyZV9o
ZWFkZXIgewogCXN0cnVjdCBjb21tb25fZmlybXdhcmVfaGVhZGVyIGNvbW1vbjsKIAlzdHJ1Y3Qg
bWNfZmlybXdhcmVfaGVhZGVyX3YxXzAgbWM7CiAJc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJf
djFfMCBzbWM7CisJc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJfdjJfMCBzbWNfdjJfMDsKIAlz
dHJ1Y3QgcHNwX2Zpcm13YXJlX2hlYWRlcl92MV8wIHBzcDsKIAlzdHJ1Y3QgcHNwX2Zpcm13YXJl
X2hlYWRlcl92MV8xIHBzcF92MV8xOwogCXN0cnVjdCB0YV9maXJtd2FyZV9oZWFkZXJfdjFfMCB0
YTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
