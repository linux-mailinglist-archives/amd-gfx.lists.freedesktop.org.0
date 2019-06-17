Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A449008
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66989E7C;
	Mon, 17 Jun 2019 19:46:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA489E5B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:46 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so12332502qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OziMCS2ZIxIJyqQc+v+Hl+f/B1mK2RWSEQDrHHtBQE=;
 b=G69CAcevufmxsrMha8ajNCISpPwD9yY1baE+Ac9ChpnHEy6I1dUW4aMkkwYZJc81o2
 vWteN8ImrYnpE64XFdAgUpmJmbg/Q8zA7f2NHe4WgBWkgl1oYXsY9h+NrDhP3fxkOE6B
 w0o3RG3LfA1G6+si5XrhZOYQoFKNw8s1bAcDCCwz5Cc5MPiaIqJzknam7xE9BKrN54bV
 DdamCOn0CZ3gFf0eSgIQJDJCzsbP/FnGeNRGMnVP8zTSDtj+edO/qs/P0Cecx3JmDayN
 YhcYDGKtrEIsjKyQq5Bz5rCFyFgPFrOR1Kv3w4Lx8dtI36WK8j8ZK1xlTJq/gCMvQjDZ
 nXkg==
X-Gm-Message-State: APjAAAU2fmPUKnn0D3DRD2wTPp/1oaD3BbTE069vAe6gGvOoMnC3ZQe6
 /9Y5WusbqlSrIBY9i4fQtNRzKtcxlHA=
X-Google-Smtp-Source: APXvYqxl4J4n1RqrYizqa5/M9skDFakTfwp6GZVQuMO7lPjcvnicuwhPuImF/33W/+cnbOfpchPbDw==
X-Received: by 2002:a0c:929b:: with SMTP id b27mr22674291qvb.193.1560800805023; 
 Mon, 17 Jun 2019 12:46:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 347/459] drm/amd/display: disable PSR/ABM before destroy DMCU
 struct
Date: Mon, 17 Jun 2019 14:44:48 -0500
Message-Id: <20190617194540.18497-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OziMCS2ZIxIJyqQc+v+Hl+f/B1mK2RWSEQDrHHtBQE=;
 b=cx/VHocZEvZlIE8lWCcsEPB9MEhiQ3RuP+RibQXeJdjm/e/cHLnf658jn3xdtmWZCo
 PAgjCztlAx9PLJZfcD32TBp6mpJyGX3jyJHfg+tArAGzDUr4q/Jxbpns9FmMZF/KVMQb
 rin/6ORrtQUqmF6YfjfegmdHwvEDD28pOZ2F/O7nHu6Vzzb5pMAb6wvSIOKVMPwl96J3
 96tqPb2fLmN2eAsG9EXDa1gZNQ1RkV1FFLMfhwBFBtYAVIPQxPR+wipMBbFvJveFDWgY
 fYjSaDDiV0VrhXgYbUw2YZS1HWWf0bJh4Grnp36CZk4bhxGvV/ib01AV0I/WdDq58NeI
 OA8w==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBIc2llaCA8cGF1bC5oc2llaEBhbWQuY29tPgoKW1doeV0KMS4gRE1DVSBpcyBu
b3QgcnVubmluZyBvbiBzb21lIHBsYXRmb3JtIGJ1dCBkcml2ZXIgc3RpbGwgc2VuZCBBQk0KICAg
Y29tbWFuZC4gSXQgbWF5IGNhdXNlIGFzc2VydCBkdWUgdG8gRE1DVSBpcyBub3QgYWxpdmUuCjIu
IFRvIG1ha2Ugc3VyZSBQU1IgZGlzYWJsZSB3aGVuIGRyaXZlciBkaXNhYmxlCgpbSG93XQoxLiBB
ZGQgZG1jdV9pc19ydW5uaW5nIGluIEFCTSBzdHJ1Y3QsIGRyaXZlciBjYW4gY2hlY2sgdGhpcyBm
bGFnIHRvCiAgIGRldGVybWluZSBkcml2ZXIgc2hvdWxkIHNlbmQgQUJNIGNvbW1hbmQgb3Igbm90
LgoyLiBTZW5kIFBTUiBkaXNhYmxlIGNvbW1hbmQgd2hlbiBkZXN0cm95IFBTUgoKU2lnbmVkLW9m
Zi1ieTogUGF1bCBIc2llaCA8cGF1bC5oc2llaEBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9u
eSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4
IDViZWQ4OTU0NzQxMC4uMmEzNDQ0NzExMmU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtNjU3LDYgKzY1Nyw5IEBAIHN0
YXRpYyB2b2lkIGRjbjIwX2luaXRfaHcoc3RydWN0IGRjICpkYykKIAlpZiAoZG1jdSAhPSBOVUxM
KQogCQlkbWN1LT5mdW5jcy0+ZG1jdV9pbml0KGRtY3UpOwogCisJaWYgKGFibSAhPSBOVUxMICYm
IGRtY3UgIT0gTlVMTCkKKwkJYWJtLT5kbWN1X2lzX3J1bm5pbmcgPSBkbWN1LT5mdW5jcy0+aXNf
ZG1jdV9pbml0aWFsaXplZChkbWN1KTsKKwogCS8qIHBvd2VyIEFGTVQgSERNSSBtZW1vcnkgVE9E
TzogbWF5IG1vdmUgdG8gZGlzL2VuIG91dHB1dCBzYXZlIHBvd2VyKi8KIAlSRUdfV1JJVEUoRElP
X01FTV9QV1JfQ1RSTCwgMCk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
