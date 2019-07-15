Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5D69E21
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA189ECD;
	Mon, 15 Jul 2019 21:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908D389EB8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x22so12361259qtp.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+pvKyHqXnRP3uNS/lFAa5IMGz2FcODTWHtTtGcblad4=;
 b=Fp1qsfaUvFAu7S3cSJOrNEDa4TwvKZIlHU31lFK8kQe5N1JnmPNwpBqgwM2dU4V0OG
 ClFJz8Auax6hgYstRfNAKs4RB5tO+ogICkaT7Syu3etmD+zOcPOSgLACjlXnPWQ+tksl
 yROByWhbpYvt7bmua+WpyfGGD2FWekfwR2ZeBZVNLwWGxxyw0AJc4WnUGBnEw4+vztZx
 bXa3dxZ4yXIW6Z9hMyZqTSKQ8W1qI/zrjS0nTZoQaAYMxU4KYNszDjJNHLxE3RaS4R2r
 emgwiGl2bGQxjDmXSHv5YjzeX66zzMq/m55AqiTt/2qT+PfMYpJWy4ogGxYFzKdR8Jym
 Mpgw==
X-Gm-Message-State: APjAAAU3atxAR48WVUfyjyhwF7A17qC2f6stF2m3rfC3KaN13F3qGgTM
 MHwpRj224f1wYuy698WRDn0+oa+Y
X-Google-Smtp-Source: APXvYqyxuAq987Cu1bWVBBnJHPtC3BcvI0+y/Qq5jBrsVYG6WmJhzwMEP2ujw0MeQo863bw7u1IHDA==
X-Received: by 2002:aed:3742:: with SMTP id i60mr19680928qtb.376.1563225927531; 
 Mon, 15 Jul 2019 14:25:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 048/102] drm/amdkfd: Fix sdma_bitmap overflow issue
Date: Mon, 15 Jul 2019 16:23:43 -0500
Message-Id: <20190715212437.31793-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+pvKyHqXnRP3uNS/lFAa5IMGz2FcODTWHtTtGcblad4=;
 b=LBABThwJYp7UVqlFW6V/YvxmueBbFUgb5ml0gtC7wiDiA85x6WKtruPUvCRY46OI0m
 1I3eqv09JxZ3iO49n1evhj/4B1iO8CBWia6IpdpOWqzRyGFDGKIXUIPgE/7+TrqMHvZR
 C0jduQJBQYqrEnHw9iB+535XzrQcZlf1EALWpuWXfN/3/EnQdrqzkET3LNwqeL5Lzkhh
 3IuEULFBsIadXC/m13zJdrsRKDoI8oZfIqjLOYzofRf42sAG8ISB29okwyRVLPKKQOxn
 wj50p5nb+OMQ31JsIvZ08GThD1aws7NAzY/o5VvysDMOlEBhdWlrxeaq3WkPVDNtXiHx
 KHtg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpJbiB0aGUgb3JpZ2luYWwgZm9ybXVs
YSwgd2hlbiBzZG1hIHF1ZXVlIG51bWJlciBpcyA2NCwKdGhlIGxlZnQgc2hpZnQgb3ZlcmZsb3dz
LiBVc2UgYW4gZXF1aXZhbGVuY2UgdGhhdCB3b24ndApvdmVyZmxvdy4KClNpZ25lZC1vZmYtYnk6
IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKaW5kZXggNTg3MzYy
YmI5MTJiLi45N2VmNTUyODJjMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jCkBAIC04ODAsOCArODgwLDggQEAgc3Rh
dGljIGludCBpbml0aWFsaXplX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0pCiAJfQogCiAJZHFtLT52bWlkX2JpdG1hcCA9ICgxIDw8IGRxbS0+ZGV2LT52bV9pbmZvLnZt
aWRfbnVtX2tmZCkgLSAxOwotCWRxbS0+c2RtYV9iaXRtYXAgPSAoMVVMTCA8PCBnZXRfbnVtX3Nk
bWFfcXVldWVzKGRxbSkpIC0gMTsKLQlkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPSAoMVVMTCA8PCBn
ZXRfbnVtX3hnbWlfc2RtYV9xdWV1ZXMoZHFtKSkgLSAxOworCWRxbS0+c2RtYV9iaXRtYXAgPSB+
MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3NkbWFfcXVldWVzKGRxbSkpOworCWRxbS0+eGdtaV9zZG1h
X2JpdG1hcCA9IH4wVUxMID4+ICg2NCAtIGdldF9udW1feGdtaV9zZG1hX3F1ZXVlcyhkcW0pKTsK
IAogCXJldHVybiAwOwogfQpAQCAtMTAxOSw4ICsxMDE5LDggQEAgc3RhdGljIGludCBpbml0aWFs
aXplX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQogCWRxbS0+c2RtYV9x
dWV1ZV9jb3VudCA9IDA7CiAJZHFtLT54Z21pX3NkbWFfcXVldWVfY291bnQgPSAwOwogCWRxbS0+
YWN0aXZlX3J1bmxpc3QgPSBmYWxzZTsKLQlkcW0tPnNkbWFfYml0bWFwID0gKDFVTEwgPDwgZ2V0
X251bV9zZG1hX3F1ZXVlcyhkcW0pKSAtIDE7Ci0JZHFtLT54Z21pX3NkbWFfYml0bWFwID0gKDFV
TEwgPDwgZ2V0X251bV94Z21pX3NkbWFfcXVldWVzKGRxbSkpIC0gMTsKKwlkcW0tPnNkbWFfYml0
bWFwID0gfjBVTEwgPj4gKDY0IC0gZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKTsKKwlkcW0tPnhn
bWlfc2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3hnbWlfc2RtYV9xdWV1ZXMo
ZHFtKSk7CiAKIAlJTklUX1dPUksoJmRxbS0+aHdfZXhjZXB0aW9uX3dvcmssIGtmZF9wcm9jZXNz
X2h3X2V4Y2VwdGlvbik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
