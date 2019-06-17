Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1B48E35
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676BA897E3;
	Mon, 17 Jun 2019 19:18:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524E897C5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x47so12140965qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x63fQhLXuTW7/PmZrxZxZFcIQBAlyxcrY0j60H4UIrw=;
 b=MmrnSsnsk9fZvp+N/BiqTGEsRj206/0etGfRpQKIKeCHcuNGl3tejqzmMNowJp0ma4
 Lf1bZi9+527NKCGspGxmfLz9pRzU3A5Pg5gXZ5jSjOtJJr2vzyTIu5guVM/KbmsJ7aAC
 qpBoBCVVvGBH58vNVhhyQXlwUMrpSc8CC0UM+iHHVr7WJJLJxrfuSu9GJj2N0h1QxhPS
 lJeb53CDhKZyljN54EFfKoVHh87TvifpOZ7hFWaOePX4xxcZkOFFMjFW0p0eQ9oMrK8+
 fgBfCTpI9IiTjsyCw9bAhpPVQXpk/KqqOUpAoKtOwDztFleqO0sUSlL2r93frMeFmEe6
 Tu0Q==
X-Gm-Message-State: APjAAAUk4E6m/Lpqwlj+9nVUmDtajKnZzyU2RqjBQwLUfjsoCHlYO3A8
 Z0mc//lVvWaku4xoKx/hvIPQIEUi/40=
X-Google-Smtp-Source: APXvYqy0+FJfg3HbyRUV5c/n8hFm+AjDielIQbzdT91xrAPad3TBVv/lYaWKY2ivE1rLmcecQ0JYmQ==
X-Received: by 2002:ac8:2f96:: with SMTP id l22mr47201190qta.188.1560799131208; 
 Mon, 17 Jun 2019 12:18:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 116/459] drm/amdgpu: add JPEG2.0 decode ring ib test
Date: Mon, 17 Jun 2019 14:11:17 -0500
Message-Id: <20190617191700.17899-105-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x63fQhLXuTW7/PmZrxZxZFcIQBAlyxcrY0j60H4UIrw=;
 b=UH8+PQO8QD4A3XOZAgsHIHmnz7ephToL+9Tm4f8JtCo/yRMcA+fzZeH8XG4E4Lskww
 GS8yP0oExjjDD3dUXYdW1dIQUil5QhRay9A6n2AjZFtX7LMs7PeAxLKQFGQT9H+LgkV4
 f/upryfahoAxsuq5GYDFGtr2RnqV1BUoBBwVXHh6spaRTRGGXIJtPaxpMNXiDbXvvQ4Q
 lOLVbmnQdpQD7/7qclM5kugQxopZb/hcD6vDerbBN7fascxhpGXW+MQAZjnURTXQGO11
 cZ/BpZIxoh0dxS6PEdI8w/AyyJ70xESp/6IwJe9ejufEL+FP7XlV+310UnUwYjogsDKq
 YYXw==
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
ZnNldCBmb3IgcmVnaXN0ZXJzIGludm9sdmluZyBpbiBpYiB0ZXN0cwoKU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCBl
ZjJiN2E5MzU2ZWYuLjZhNzRmNTQ5OWVmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uYwpAQCAtNjY5LDcgKzY2OSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zjbl9qcGVn
X3NldF9yZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsCiAKIAlp
YiA9ICZqb2ItPmlic1swXTsKIAotCWliLT5wdHJbMF0gPSBQQUNLRVRKKFNPQzE1X1JFR19PRkZT
RVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSksIDAsIDAsIFBBQ0tFVEpfVFlQRTApOworCWliLT5w
dHJbMF0gPSBQQUNLRVRKKGFkZXYtPnZjbi5pbnRlcm5hbC5qcGVnX3BpdGNoLCAwLCAwLCBQQUNL
RVRKX1RZUEUwKTsKIAlpYi0+cHRyWzFdID0gMHhERUFEQkVFRjsKIAlmb3IgKGkgPSAyOyBpIDwg
MTY7IGkgKz0gMikgewogCQlpYi0+cHRyW2ldID0gUEFDS0VUSigwLCAwLCAwLCBQQUNLRVRKX1RZ
UEU2KTsKQEAgLTcxNSw3ICs3MTUsNyBAQCBpbnQgYW1kZ3B1X3Zjbl9qcGVnX3JpbmdfdGVzdF9p
YihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKIAl9CiAKIAlmb3IgKGkg
PSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKLQkJdG1wID0gUlJFRzMyKFNPQzE1
X1JFR19PRkZTRVQoVVZELCAwLCBtbVVWRF9TQ1JBVENIOSkpOworCQl0bXAgPSBSUkVHMzIoYWRl
di0+dmNuLmV4dGVybmFsLmpwZWdfcGl0Y2gpOwogCQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJ
CQlicmVhazsKIAkJRFJNX1VERUxBWSgxKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
