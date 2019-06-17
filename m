Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4032B48FC7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725F89D73;
	Mon, 17 Jun 2019 19:45:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55589D73
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12280429qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5TsT78sMGXNhtQp+tsMxGWvu2rdjkDbNL69Wzsmvh/E=;
 b=lNqDbHGkKe0YqNXWWqp7JOGq9hKPmCI8waiUjqGhTqjrzNF48oSGP9DH16WHLyrgP0
 /WRavTZFwZ0haCL10vwgCWpR5TXg1k8ztn4cp9F/UFD7QiLMC+tkAZuo+upkgC7i/5zB
 GacJ7A6atk5KKR8xRc92OgHvJ6TueL/D7YaZ+Gg1XdrZ7eUSdMfyGmz74ag0M+C9cxnt
 qRLPmh4dnJ3VZbQLnJD7E2fc/2szMEeTd43q9Sz+h88uC53Ns/cPBI86Bj8rFU2UvASh
 +Rqvlhhu3Be0ajHEA6HhFIldIEnE2FZcHxn7P312ABqcuq9H9Pq3Wb8JfWgid+wcxkI+
 AKBA==
X-Gm-Message-State: APjAAAUbmnZokQ1OgTDnccsCIynx8KuhVa1FJ0CRWhZOCK7bZHO+iJW+
 b8qE362hB9GWyEK0AinZehSET/ijULs=
X-Google-Smtp-Source: APXvYqxrb6Ojmw3n5gST93BqQxTFKvy9NEtKyudc4dFb7vuIRReU+Xc4Op5DOIRgXXQ3huW10tXaNw==
X-Received: by 2002:a0c:b036:: with SMTP id k51mr23880920qvc.103.1560800727954; 
 Mon, 17 Jun 2019 12:45:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u63sm1490547qkh.85.2019.06.17.12.45.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 296/459] drm/amdgpu/psp: add new psp interface for vcn
 updating sram
Date: Mon, 17 Jun 2019 14:45:17 -0500
Message-Id: <20190617194520.18449-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5TsT78sMGXNhtQp+tsMxGWvu2rdjkDbNL69Wzsmvh/E=;
 b=H3pNk08G0AKL6j+VNJAXUYmxw2dgTtbPGi18VsPwILksPq1HG1Az5E6gFrnwP8V8Oe
 bLqzuvV9/YM6yVybVZ5g8/ejMa3bX38KeRSE+Ir8LhrVHNnZytvE/oG0OCK2Nz192zZv
 ZUcabo5zniYkxdc9QGIzG6ZpB04MlSAe+QRE5vne2qxvz3HE0jhmNhMe4vGSyXe5Ngzr
 jz3ATCyYjZ53Hl0OVfqQhb7voJwR8wQixvnWdTtE/93pJlBxSNt9gEVr2n3TMMeSUZNt
 6gIzQ8cab8fS92pEdolebWGcqCDLkwWEZhCli6PO9vUjI8L/3NlTwqxVGCPDAMgbpPIb
 dIPg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClBTUCBsZXZlcmFnZXMgdGhlIGV4
aXN0aW5nIGZ3IGxvYWRpbmcgZnVuY3Rpb24gZm9yIHZjbiB1cGRhdGluZyBzcmFtLgoKU2lnbmVk
LW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmlu
ZGV4IGU5Nzk0ZTNjMzkzNi4uM2MwOGU1YzQ4M2YyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5jCkBAIC0xMjE0LDYgKzEyMTQsMTkgQEAgaW50IHBzcF9ybGNfYXV0b2xv
YWRfc3RhcnQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJcmV0dXJuIHJldDsKIH0KIAoraW50
IHBzcF91cGRhdGVfdmNuX3NyYW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBpbnN0
X2lkeCwKKwkJCXVpbnQ2NF90IGNtZF9ncHVfYWRkciwgaW50IGNtZF9zaXplKQoreworCXN0cnVj
dCBhbWRncHVfZmlybXdhcmVfaW5mbyB1Y29kZSA9IHswfTsKKworCXVjb2RlLnVjb2RlX2lkID0g
aW5zdF9pZHggPyBBTURHUFVfVUNPREVfSURfVkNOMV9SQU0gOgorCQlBTURHUFVfVUNPREVfSURf
VkNOMF9SQU07CisJdWNvZGUubWNfYWRkciA9IGNtZF9ncHVfYWRkcjsKKwl1Y29kZS51Y29kZV9z
aXplID0gY21kX3NpemU7CisKKwlyZXR1cm4gcHNwX2V4ZWN1dGVfbnBfZndfbG9hZCgmYWRldi0+
cHNwLCAmdWNvZGUpOworfQorCiBzdGF0aWMgYm9vbCBwc3BfY2hlY2tfZndfbG9hZGluZ19zdGF0
dXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCWVudW0gQU1ER1BVX1VDT0RFX0lE
IHVjb2RlX3R5cGUpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKaW5k
ZXggYWE1NjY4ZGYwM2I2Li42MDM5YWNjODQzNDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmgKQEAgLTI2MCw2ICsyNjAsOSBAQCBleHRlcm4gaW50IHBzcF93YWl0X2Zv
cihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgcmVnX2luZGV4LAogZXh0ZXJuIGNv
bnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbiBwc3BfdjEwXzBfaXBfYmxvY2s7CiAK
IGludCBwc3BfZ3B1X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKK2ludCBwc3Bf
dXBkYXRlX3Zjbl9zcmFtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgaW5zdF9pZHgs
CisJCQl1aW50NjRfdCBjbWRfZ3B1X2FkZHIsIGludCBjbWRfc2l6ZSk7CisKIGludCBwc3BfeGdt
aV9pbnZva2Uoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsIHVpbnQzMl90IHRhX2NtZF9pZCk7CiAK
IGludCBwc3BfcmFzX2ludm9rZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgdGFf
Y21kX2lkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
