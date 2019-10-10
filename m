Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1097D2DAF
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AE46EB71;
	Thu, 10 Oct 2019 15:26:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A376EB71
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:36 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id u22so5937333qkk.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QacsuuPQA7FEhuUswjypqAfB6V0DovY6lzvnojq2qCE=;
 b=Cn4QDEoOk5vuya23G7o/MoVtjhGglS/Nn/4RT+lRd0AxgJ7WfOBkrbaBPY9TxRo8/z
 KmOba44da/mim53u5hc5PTOpAipUDNtgPa0/FsowfLayRybtvWU2cJOYqQMDDLbm0aZR
 8xeeUBX/kgh+nWE/GSePdUZnc2zuPzw78A05yEDWYcofePRerHOrERHulJpzWrZTYVb1
 SPOFQ58izX7aogKbnnZtfQIBHWvZbnidpYGO99k7C5vzv6q+OsCjZW214N5goK5KvQHW
 Bwm+puEnTKDMnpGCHyzZgGfdon7puS9k5kk5ej6t2XYTPFUqynsxPWkgSWVPvvRyVCWH
 YEBw==
X-Gm-Message-State: APjAAAXnTiYzFO0+tjRxlEMWJqGMjEf0/E/xd1b2qsD8miecW3qvjNG1
 NRWq7hr/cZPlnGZFgYnkUPUY5K6f
X-Google-Smtp-Source: APXvYqwb0r2/xG1NXtRGPWvVbUKTKOrl++EmUdd499qGcYAZMm1xUE3NC25WABJlu85bLNTXuWJ8uQ==
X-Received: by 2002:a37:4cd5:: with SMTP id
 z204mr10045335qka.153.1570721195479; 
 Thu, 10 Oct 2019 08:26:35 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/amdgpu: move gpu reset out of amdgpu_device_suspend
Date: Thu, 10 Oct 2019 10:26:16 -0500
Message-Id: <20191010152619.31011-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010152619.31011-1-alexander.deucher@amd.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QacsuuPQA7FEhuUswjypqAfB6V0DovY6lzvnojq2qCE=;
 b=XhHkggUWCPlZPbQ1XmbqfJxzzteSELMATwdUF2SDCag9lBJdN2eBraOwo+TZgFfzQC
 hS4mLptzXsICHsH8c54SQ35gUX6AH5yrJwplGdITyUWJ9ZOXkC2+9j8FrDd+mvCQUXqr
 vHJB46ax0RrWjucC8geSW5/Sof2tpFX+od3c9SFTZcaFa0Fl4QkqA1JYYu0PyAiBn/bk
 iZ8qFFVhzo/1BHChCUx+GXUk+sVT1XKs4PPe9S/Ger2O3bIVxKDu1iQbvm+ApVE+urjb
 UphLz3V2hNsfugd/QtMSuIfIERYZ1C/+qvPTZny3jb7+4g75Nk8AlfeD0e1UgmAlC/Ts
 ZKoA==
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

TW92ZSBpdCBpbnRvIHRoZSBjYWxsZXIuICBUaGVyZSBhcmUgY2FzZXMgd2VyZSB3ZSBkb24ndAp3
YW50IGl0LiAgV2UgbmVlZCBpdCBmb3IgaGliZXJuYXRpb24sIGJ1dCB3ZSBkb24ndCBuZWVkCml0
IGZvciBydW50aW1lIHBtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYyB8IDQgLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
ICAgIHwgNyArKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5k
ZXggOWI5YjE1MzYwMTk0Li45MWJkYjI0NmU0MDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTMxNzMsMTAgKzMxNzMsNiBAQCBpbnQgYW1kZ3B1X2Rl
dmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCwgYm9vbCBm
YmNvbikKIAkJLyogU2h1dCBkb3duIHRoZSBkZXZpY2UgKi8KIAkJcGNpX2Rpc2FibGVfZGV2aWNl
KGRldi0+cGRldik7CiAJCXBjaV9zZXRfcG93ZXJfc3RhdGUoZGV2LT5wZGV2LCBQQ0lfRDNob3Qp
OwotCX0gZWxzZSB7Ci0JCXIgPSBhbWRncHVfYXNpY19yZXNldChhZGV2KTsKLQkJaWYgKHIpCi0J
CQlEUk1fRVJST1IoImFtZGdwdSBhc2ljIHJlc2V0IGZhaWxlZFxuIik7CiAJfQogCiAJcmV0dXJu
IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggZDQzYzQ2ZGU3
ODA3Li42NDE0MTM4NmU2MDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKQEAgLTExMTgsOCArMTExOCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBhbWRncHVfcG1vcHNfZnJlZXplKHN0cnVj
dCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX2Rldi0+ZGV2
X3ByaXZhdGU7CisJaW50IHI7CiAKLQlyZXR1cm4gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9k
ZXYsIGZhbHNlLCB0cnVlKTsKKwlyID0gYW1kZ3B1X2RldmljZV9zdXNwZW5kKGRybV9kZXYsIGZh
bHNlLCB0cnVlKTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisJcmV0dXJuIGFtZGdwdV9hc2ljX3Jl
c2V0KGFkZXYpOwogfQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc190aGF3KHN0cnVjdCBkZXZp
Y2UgKmRldikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
