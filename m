Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20848F2F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287489B9A;
	Mon, 17 Jun 2019 19:31:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A240E89B83
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:18 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c70so6945255qkg.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJ3of/PVHj5vdrrLYOVRbuw7mpbppi/zzXYpLqsKFt0=;
 b=i5TgJqf5z1Cau6FK5PbfQNXihmsis0wTa157kmgpWdD1izlJoY8/TllqW9E50YOOII
 46Gvftp1b5ZWeO9DtlvaiWxmPp/0iI8FMxC88F7xdK6uBQg8GfPYrkRw/Cio+WG7mPcD
 VSQ5zRvzDg28WTE+KqsymZxzIlY1j9ezC+CyZ5C64RfGXkd92xNCZDWjUR8rMoaLWvPV
 qltWI8nb0gkQ/0Jqbtfnprd1/i+QNAnYBf1ta9FYReI3otHzgyqLW2b9W5tLX1cVKQAN
 DzcwKuMDhgfig8F7FUhAAR0MPu9xUTaYXwKglIdYLIVx2cJ1OmZRmUsGhxX7ThmVbMzv
 IHVQ==
X-Gm-Message-State: APjAAAV5DIBUwsM5TQWt+bvHxOuR25HRaubyjpoV82eN4bkUCc8P1vgP
 0LhB3VlhRAAVc6/T1e0BMcozbHsyz6Y=
X-Google-Smtp-Source: APXvYqysNqaw2X7w6PpOJ+HCQ6Cy6LhSnvlM9xGHcUqct0RmwtyYrIOarUU1KJjjW/nndziiFvn2hw==
X-Received: by 2002:a37:4243:: with SMTP id p64mr8147028qka.9.1560799877640;
 Mon, 17 Jun 2019 12:31:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 204/459] drm/amdgpu/sdma5: fix a sdma potential hang in
 VK_Examples test
Date: Mon, 17 Jun 2019 14:29:31 -0500
Message-Id: <20190617193106.18231-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJ3of/PVHj5vdrrLYOVRbuw7mpbppi/zzXYpLqsKFt0=;
 b=VYMvVqpe9ihQhr+9U10Gk455pooJZC8i6vMTdx9LzG6UtRKRjaaMjGBrrw95rhsAns
 5HGu/JoTFbneW+vfi6KkSUYnxQg/S2rwvh4kscCNfsPUgz4nvjjZMtD8qDWdD+eEBNkd
 PzQHn2swuHH6xc5lx5Vvm9Eq0OoFt7/PfEr0U1ZFTtvBS7ZcYTU92t926kkoMYR3QJQ7
 PNvbr0/C1Tx3u9xAXssJHBfGWirCGsVWQGq2vtINYpR/EjOaCJ+a3aOo7XJxKYOht7Sg
 kEB1KScnkTrnOyNpccZn2dL/KfLhWTsaYn2O//6dtZ7VqYa6A+/IygaVpsKmRZxIIQjG
 pkkg==
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
 tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClt3aHldCldoZW4gcGFnZSBmYXVs
dCBoYXBwZW5zLCBpdCBjb3VsZCBsZWFkIHRvIHNkbWEgaGFuZyBpcyBSRVNQX01PREUgPQowIGZv
ciBub24tUFJUIGNhc2UuCgpbaG93XQpTZXR0aW5nICBTRE1BeF9VVENMMV9DTlRMLlJFU1BfTU9E
RSB0byAwYjAxMSB0byBhdm9pZCBTRE1BIGhhbHQuCgpSZXZpZXdlZC1ieTogSmFjayBYaWFvIDxK
YWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCmluZGV4IDA4M2Y4MTYxMWUyNC4uMzJiNDhjOWNh
MDUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpAQCAtNjU4LDcgKzY1
OCw4IEBAIHN0YXRpYyBpbnQgc2RtYV92NV8wX2dmeF9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAKIAkJLyogU2V0IHVwIFJFU1BfTU9ERSB0byBub24tY29weSBhZGRyZXNzZXMg
Ki8KIAkJdGVtcCA9IFJSRUczMihzZG1hX3Y1XzBfZ2V0X3JlZ19vZmZzZXQoYWRldiwgaSwgbW1T
RE1BMF9VVENMMV9DTlRMKSk7Ci0JCXRlbXAgPSBSRUdfU0VUX0ZJRUxEKHRlbXAsIFNETUEwX1VU
Q0wxX0NOVEwsIFJFU1BfTU9ERSwgMik7CisJCXRlbXAgPSBSRUdfU0VUX0ZJRUxEKHRlbXAsIFNE
TUEwX1VUQ0wxX0NOVEwsIFJFU1BfTU9ERSwgMyk7CisJCXRlbXAgPSBSRUdfU0VUX0ZJRUxEKHRl
bXAsIFNETUEwX1VUQ0wxX0NOVEwsIFJFRE9fREVMQVksIDkpOwogCQlXUkVHMzIoc2RtYV92NV8w
X2dldF9yZWdfb2Zmc2V0KGFkZXYsIGksIG1tU0RNQTBfVVRDTDFfQ05UTCksIHRlbXApOwogCiAJ
CS8qIHByb2dyYW0gZGVmYXVsdCBjYWNoZSByZWFkIGFuZCB3cml0ZSBwb2xpY3kgKi8KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
