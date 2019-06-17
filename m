Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661C48EA6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2C0898A3;
	Mon, 17 Jun 2019 19:27:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE9C89895
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:28 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so6960886qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x63fQhLXuTW7/PmZrxZxZFcIQBAlyxcrY0j60H4UIrw=;
 b=R6EaqdgFfdkDzqxT1Ylw+0+FANlwAnATl/aiTPE77R6STpHVOiujm34LqU96TMgbQO
 PYMuoVpkb6S7p3hG8juVbj/qAhBJoEzofoePIg9ykNMSg0QZAc/lQqxiw/OejaN6u7bt
 GYlMebNjKdBjL3++5Q2FuFns3wDEwW9y3ETPTF6lT2vt84Fjeb/uXtp0UwFD7dZFvNia
 TnKgnvcuHZh0PC+SrRcBn/WZKecTO8thURmiFMVHbU9Ua2BGNmMYNW9a4sV5k3rxd93Z
 OhhocoCSklcsArEIN/Hns7rQL2Q4JWUlAqVhzhMuxzp3IXbhu3FIKW+xNTcd3FW2SxU9
 Z2+Q==
X-Gm-Message-State: APjAAAVqjI/i88ubczy+EiKNE3EerkmYstaFc4sBLlLVz4sCytctYjni
 jlfsWdARyAwyXth5YoGx834pnRgUods=
X-Google-Smtp-Source: APXvYqzMXSqWmbqIS2E1JjDbA26Jsia0bAFYFDZ21XnQjLlZxzZk+C48T7Wu4FqU89/O6L1hbpMVCw==
X-Received: by 2002:a37:a86:: with SMTP id 128mr69274051qkk.169.1560799646491; 
 Mon, 17 Jun 2019 12:27:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 116/459] drm/amdgpu: add JPEG2.0 decode ring ib test
Date: Mon, 17 Jun 2019 14:25:41 -0500
Message-Id: <20190617192704.18038-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x63fQhLXuTW7/PmZrxZxZFcIQBAlyxcrY0j60H4UIrw=;
 b=OotD42oecQUbgUtv+sNBdYE4Y9y8QVPB8M9nc+yflDOjBSTQzMmXbptIzCO/iLecjN
 /678iffc17ZRWZ7teXmlRvEyDl3CzSuMtDwUM+7f4FOSnj/ScgiklPUuAr1nDo1IuEuo
 DDlTJvc5GM7IJlQnrl8sLA+KpOnm7JD9r/Myo3u9l03kFgr43B8RMIP6G+jtkXjQZh2g
 KCFVFoTTm/W2gq6wqEoLcNSSw+vK9jejsQ7Sb1WwvZHnYwvc6sRztP7MyxdeUcg1I7iW
 RF9eU6LVHmIHk9uoXq2MHjn1NfZtN7WYh4S1r58qV78YSDA9MteULY0NkVLEbuG+dM4V
 mjFA==
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
