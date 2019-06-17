Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626B48F9C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F7889D60;
	Mon, 17 Jun 2019 19:33:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFABC89D44
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:41 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12259471qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TsT78sMGXNhtQp+tsMxGWvu2rdjkDbNL69Wzsmvh/E=;
 b=WUCP/1J+kucXIrdeuNwjXhqEO2XAX7EQjGY3XFmK6hNrgQ9R24WZTTTi74O9UP2KC+
 8l+GU4iLz4NMummVPI2yI1duG9u5bpijgGnp+0pDswUuWH8B9MTYHG23yCx1sKiRKMlh
 WOHb7vFqsGTrZSsQ8pzxBUyytRVwZ31U7DOLYfpEZgcjnkFNa6rU7apvCsRK/o/g2bCE
 kLEMhDdrOO8ZQvsAlThWFtFerv1PNYqhIfw494BuloB2pLPsf8cSTqx/frgKmOZEyTn+
 4n+Iik22UzeXfXUgvWxVbsq1+22JsStj+EQjVhxNs4DceljTK/dnmE+yCy/31Wsb+rx1
 F6Bw==
X-Gm-Message-State: APjAAAUYaxtPltZODrIKECOPDv784nx4SsEEoY65dvXgJRo55zeZFuB6
 wWFXqAdAhMgJYwyYKYUfBNl0C62W/ow=
X-Google-Smtp-Source: APXvYqyOBRlIcSGHpIB0qJwYkhRPVU9FjqquxyfoFT7ERnk05ylZmGShxDhmGjRW6HG+pBVAf19RNQ==
X-Received: by 2002:a0c:d4eb:: with SMTP id y40mr22817889qvh.30.1560799960043; 
 Mon, 17 Jun 2019 12:32:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 296/459] drm/amdgpu/psp: add new psp interface for vcn
 updating sram
Date: Mon, 17 Jun 2019 14:31:03 -0500
Message-Id: <20190617193106.18231-97-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TsT78sMGXNhtQp+tsMxGWvu2rdjkDbNL69Wzsmvh/E=;
 b=FhIB59QfF38DfxGUKDK+zz8h6ngU5SAibrkURM2KWMDeIz9/3FEdKbqPR9oji2jg5s
 oBMYc33fgkVvoxA891CIKk9cMb0tsF4VeNckRxBvU+VNXaiR8f1zpZJulQrVviXNwwjD
 jq1nWNsif6juvbnaDQCKqy339dejJxb307+S1+HIadTl80mBPypDIQCpE/BKEhrt1bdL
 CnYorgLi5sxoTPHJYbBDgeubY89SvlyY7GOCAPicNwHaevQTF/aTfYpjBPqFYvvS0c1T
 hK0O+RXj8ZXYfP64T8Fj9jGIzAyvZIhUINP5iMw+5mLCz2beWnTrKrIFKCSGcKXlUuoh
 mnvA==
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
