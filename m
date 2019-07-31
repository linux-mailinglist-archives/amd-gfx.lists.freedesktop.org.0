Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9407CDFC
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 22:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F005489AB5;
	Wed, 31 Jul 2019 20:14:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEEA89AB5
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 20:14:58 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id h6so13943795iom.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 13:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YluYmvdLagbA4r+4grFyKMtgYmT7KxrWWdqyQ7f1kTY=;
 b=ANNM8c4EsHczWIoV36GOCeJJ7XUXQqhyZqhoKN2sdVLZ8pMajXrIf2ftvrVJGIukzP
 ZQt88qkMez/HPMxLKfxt1tyLgAcGaBbQVLYhxdbTErf6SgGFD9UkGr9X5Aq8yLPk//50
 vNM4/ZW7x4vQ7y29O0K5gwH9rS3t6mhGTUGkaTBJnoY3s63NhxvNgdZThbWgAFnC0EWz
 Dp4yDpe2qnYilQ1wdXi/IC5K13vyxlDa/LYyVqoTVMuvG9jHQy65Mo4GsZ30tpk8tz3Y
 XdPrTITE8K77vLSMaQNNsq0ib0uBNeK3k7i9xJeCqoyV6CEMvFCIAAdHTsv28Eqlt0TZ
 qZCg==
X-Gm-Message-State: APjAAAVakZakvvvc7N9rFolT9LwSM1kGw/I1XLXGPHj9eleS3I9heoH/
 K2JrDNKoHG1Cl1U0TG5jMexWU+e3XSk=
X-Google-Smtp-Source: APXvYqxLPXzE+pm5XbJT3RKm411fTFZKP5j37AhQUfBKUf8VwxayNUnNAjaSpOARp8vulJKV5j1FTw==
X-Received: by 2002:a02:9f07:: with SMTP id z7mr7942835jal.29.1564604097866;
 Wed, 31 Jul 2019 13:14:57 -0700 (PDT)
Received: from localhost.localdomain ([2602:ae:1d04:ae00:6d4:c4ff:fe4a:ea6b])
 by smtp.gmail.com with ESMTPSA id
 t14sm56570423ioi.60.2019.07.31.13.14.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 13:14:57 -0700 (PDT)
From: Matt Coffin <mcoffin13@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: Allow changing of fan_control in smu_v11_0
Date: Wed, 31 Jul 2019 14:14:35 -0600
Message-Id: <20190731201435.10776-1-mcoffin13@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YluYmvdLagbA4r+4grFyKMtgYmT7KxrWWdqyQ7f1kTY=;
 b=F6JaDydqobEIW0BxiySQ7M1oxidr+x59wYc9ogN0uBjOOpcVt8uLaNQ/hv3gFFNfnG
 d+Tu22DAR1sYDcHn293i3x6r3zd101cmw76g7CqscvipGV/ZTUl8qkDC5PsDxHospOPr
 XaRUYmKL1lMrfVWoGQUfKbhbUh2tk11tTJjXRQsfIpA9AApK6f3ogHmO1nrSEewgwQS3
 SqWIki/ogCKp4bx+8f8A8l4NL9ueygNiM14rMhXmp2bjL8+jS0UJQXofaOhb5543UxOy
 61r9xEUeeymL0ElFM4G/KNwXb6gMEvZQ90A9JuUOSPSrwbKlu/9Xt9wlmNs+z2s8+hwK
 DEYw==
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
Cc: Matt Coffin <mcoffin13@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KQmVmb3JlIHRoaXMgY2hhbmdlLCB0aGUgZmFuIGNvbnRyb2wgc3RhdGUgb24gc211X3Yx
MSB3YXMgbm90IGFibGUgdG8gYmUKY2hhbmdlZCBiZWNhdXNlIHRoZSBjYXBhYmlsaXR5IGNoZWNr
IGZvciBjaGVja2luZyBpZiB0aGUgZmFuIGNvbnRyb2wKY2FwYWJpbGl0eSBleGlzdGVkIHdhcyBp
bnZlcnRlZC4KCltIb3ddClRoZSBjYXBhYmlsaXR5IGNoZWNrIGZvciBmYW4gY29udHJvbCBpbiBz
bXVfdjExXzBfYXV0b19mYW5fY29udHJvbCB3YXMKaW52ZXJ0ZWQsIHRvIGNvcnJlY3RseSBjaGVj
ayBmb3IgdGhlIGFic2VuY2UsIGluc3RlYWQgb2YgcHJlc2VuY2Ugb2YgZmFuCmNvbnRyb2wgY2Fw
YWJpbGl0aWVzLgoKU2lnbmVkLW9mZi1ieTogTWF0dCBDb2ZmaW4gPG1jb2ZmaW4xM0BnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDA1ODhkZDhjZDFiYS4uNDNm
Y2JkYmJhNjMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpA
QCAtMTM2MSw3ICsxMzYxLDcgQEAgc211X3YxMV8wX2F1dG9fZmFuX2NvbnRyb2woc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGJvb2wgYXV0b19mYW5fY29udHJvbCkKIHsKIAlpbnQgcmV0ID0gMDsK
IAotCWlmIChzbXVfZmVhdHVyZV9pc19zdXBwb3J0ZWQoc211LCBTTVVfRkVBVFVSRV9GQU5fQ09O
VFJPTF9CSVQpKQorCWlmICghc211X2ZlYXR1cmVfaXNfc3VwcG9ydGVkKHNtdSwgU01VX0ZFQVRV
UkVfRkFOX0NPTlRST0xfQklUKSkKIAkJcmV0dXJuIDA7CiAKIAlyZXQgPSBzbXVfZmVhdHVyZV9z
ZXRfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0ZBTl9DT05UUk9MX0JJVCwgYXV0b19mYW5fY29u
dHJvbCk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
