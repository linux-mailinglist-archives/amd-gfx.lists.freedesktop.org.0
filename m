Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA748E1C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4E8896DD;
	Mon, 17 Jun 2019 19:18:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE24689624
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:34 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so12129771qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/+QFGFqYzBm5pItBtezXQHM8hBXvsYf5yrrJS1Ed+g=;
 b=MbQRBCDTXlM7fXHXy8JiEpyuxWfHOI7mTxDlEmiTKJujBlqgPCFlyV9CkmrGrwLbPP
 ZSuZDvixx5ns8E4PdGwrirc3dwXhD7LXVXy+0XPjwl54ZEUcD6F0XpsYxu6U/yv2moYV
 hWCJi/pfqJ7HR6f4jsLIZkDmy3vLqamnfJKkhOV1sESiNGlggC+rI1nDaZRMeoC1FawY
 AyYPZxT2if6BCY6uIZesB7xwl1LmEu153dlLuU/IBIPfT4FiZAYRxFQaKENrAdW8fe61
 NhCP7Z9xhSCwjBL/5leDG++NBmifuQhAFE0qt+AKMr0JCGtTZBYc+6mTGexuJpVnoDOW
 CjHg==
X-Gm-Message-State: APjAAAVz5HlClDdmsXjaQlA34fuFX7L/iinQbyGI3G6vYYovZgb8HOOC
 Hy0Mth8adNGERZGY0bJopjSvlTOPEFg=
X-Google-Smtp-Source: APXvYqzC+wOv8tgpvlHjXTAsp5K58MEGr6w2eZyYeMnZ7jhHY/nu+CBF1AQwBgliLF4BLX3pHWNsHQ==
X-Received: by 2002:ac8:42d4:: with SMTP id g20mr96017160qtm.78.1560799113781; 
 Mon, 17 Jun 2019 12:18:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 096/459] drm/amdgpu: mark the partial job as preempted in mcbp
 unit test
Date: Mon, 17 Jun 2019 14:10:57 -0500
Message-Id: <20190617191700.17899-85-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/+QFGFqYzBm5pItBtezXQHM8hBXvsYf5yrrJS1Ed+g=;
 b=HyqxeVRzFqzg918DwwCnxYdM92YH8aQstwDlgQXvjQhJ5XMgk7qw7qKDFrdPcq07Wl
 qQrMMk+5r++pxVl2xot2id2snbf3a9HRawTguwUYbp5KiXOkk6FO+QLVZTDM2GP1x+YF
 AyXx6oAZPHvaE3vJM1oOJ9YAnaX0vJwQ7840LRFGUvhcNgKX7tHBLMUZuXgRJsqLuXid
 fpFOO95E8l7WXI8YbJsPcI6xLZfVWiVDdZIgEYe9fPDPJUDYPeeK4Siuzw5hDnlZvUXD
 M5UTIKFxsDNiM4SOX/4NW67BG5DiIBcf9OJpPjC9U6woQgmCTKSY7aYZI0kVhv9aO7nb
 ayeg==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkluIG1jYnAgdW5pdCB0ZXN0LCB0
aGUgdGVzdCBzaG91bGQgZGV0ZWN0IHRoZSBwcmVlbXB0ZWQgam9iIHdoaWNoIG1heQpiZSBhIHBh
cnRpYWwgZXhlY3V0aW9uIGliIGFuZCBtYXJrIGl0IGFzIHByZWVtcHRlZDsgc28gdGhhdCB0aGUg
Z2Z4CmJsb2NrIGNhbiBjb3JyZWN0bHkgZ2VuZXJhdGUgUE00IGZyYW1lLgoKUmV2aWV3ZWQtYnk6
IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFj
ayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA0NCArKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwppbmRleCBjMzAzOTZiOGE2NjQuLjI4NjE0ZGQw
NWY4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCkBA
IC05NzYsMTIgKzk3Niw0MCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfaWJfcHJlZW1wdF9qb2JfcmVj
b3Zlcnkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKIAlzcGluX3VubG9jaygmc2No
ZWQtPmpvYl9saXN0X2xvY2spOwogfQogCitzdGF0aWMgdm9pZCBhbWRncHVfaWJfcHJlZW1wdF9t
YXJrX3BhcnRpYWxfam9iKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKK3sKKwlzdHJ1Y3QgYW1k
Z3B1X2pvYiAqam9iOworCXN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYjsKKwl1aW50MzJfdCBw
cmVlbXB0X3NlcTsKKwlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgKipwdHI7CisJc3RydWN0IGFt
ZGdwdV9mZW5jZV9kcml2ZXIgKmRydiA9ICZyaW5nLT5mZW5jZV9kcnY7CisJc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCA9ICZyaW5nLT5zY2hlZDsKKworCWlmIChyaW5nLT5mdW5jcy0+
dHlwZSAhPSBBTURHUFVfUklOR19UWVBFX0dGWCkKKwkJcmV0dXJuOworCisJcHJlZW1wdF9zZXEg
PSBsZTMyX3RvX2NwdSgqKGRydi0+Y3B1X2FkZHIgKyAyKSk7CisJaWYgKHByZWVtcHRfc2VxIDw9
IGF0b21pY19yZWFkKCZkcnYtPmxhc3Rfc2VxKSkKKwkJcmV0dXJuOworCisJcHJlZW1wdF9zZXEg
Jj0gZHJ2LT5udW1fZmVuY2VzX21hc2s7CisJcHRyID0gJmRydi0+ZmVuY2VzW3ByZWVtcHRfc2Vx
XTsKKwlmZW5jZSA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQoKnB0ciwgMSk7CisKKwlzcGlu
X2xvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2NrKTsKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNfam9i
LCAmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsIG5vZGUpIHsKKwkJam9iID0gdG9fYW1kZ3B1X2pv
YihzX2pvYik7CisJCWlmIChqb2ItPmZlbmNlID09IGZlbmNlKQorCQkJLyogbWFyayB0aGUgam9i
IGFzIHByZWVtcHRlZCAqLworCQkJam9iLT5wcmVlbXB0aW9uX3N0YXR1cyB8PSBBTURHUFVfSUJf
UFJFRU1QVEVEOworCX0KKwlzcGluX3VubG9jaygmc2NoZWQtPmpvYl9saXN0X2xvY2spOworfQor
CiBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQodm9pZCAqZGF0YSwgdTY0IHZh
bCkKIHsKIAlpbnQgciwgcmVzY2hlZCwgbGVuZ3RoOwogCXN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZzsKLQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2I7Ci0Jc3RydWN0IGFtZGdwdV9qb2IgKmpv
YjsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2VzID0gTlVMTDsKIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWRhdGE7CiAKQEAgLTEwMjAsMjEg
KzEwNDgsMTMgQEAgc3RhdGljIGludCBhbWRncHVfZGVidWdmc19pYl9wcmVlbXB0KHZvaWQgKmRh
dGEsIHU2NCB2YWwpCiAJICAgIHJpbmctPmZlbmNlX2Rydi5zeW5jX3NlcSkgewogCQlEUk1fSU5G
TygicmluZyAlZCB3YXMgcHJlZW1wdGVkXG4iLCByaW5nLT5pZHgpOwogCisJCWFtZGdwdV9pYl9w
cmVlbXB0X21hcmtfcGFydGlhbF9qb2IocmluZyk7CisKIAkJLyogc3dhcCBvdXQgdGhlIG9sZCBm
ZW5jZXMgKi8KIAkJYW1kZ3B1X2liX3ByZWVtcHRfZmVuY2VzX3N3YXAocmluZywgZmVuY2VzKTsK
IAogCQlhbWRncHVfZmVuY2VfZHJpdmVyX2ZvcmNlX2NvbXBsZXRpb24ocmluZyk7CiAKLQkJc19q
b2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoCi0JCQkmcmluZy0+c2NoZWQucmluZ19taXJy
b3JfbGlzdCwKLQkJCXN0cnVjdCBkcm1fc2NoZWRfam9iLCBub2RlKTsKLQkJaWYgKHNfam9iKSB7
Ci0JCQlqb2IgPSB0b19hbWRncHVfam9iKHNfam9iKTsKLQkJCS8qIG1hcmsgdGhlIGpvYiBhcyBw
cmVlbXB0ZWQgKi8KLQkJCS8qIGpvYi0+cHJlZW1wdGlvbl9zdGF0dXMgfD0KLQkJCSAgIEFNREdQ
VV9JQl9QUkVFTVBURUQ7ICovCi0JCX0KLQogCQkvKiByZXN1Ym1pdCB1bmZpbmlzaGVkIGpvYnMg
Ki8KIAkJYW1kZ3B1X2liX3ByZWVtcHRfam9iX3JlY292ZXJ5KCZyaW5nLT5zY2hlZCk7CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
