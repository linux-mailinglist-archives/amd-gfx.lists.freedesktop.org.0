Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F848F8E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD6E89D40;
	Mon, 17 Jun 2019 19:32:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7589CD3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so12261040qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8bQj0OOm2Xv91l3HzAKA0SqBHG/+9kfD9urbHRk4bg=;
 b=jNMzy/dZHFVHcOmoTbMoIy1k0t8+U66491Sz2YJ2qKCX0qubM3Q80LasdiCLp+795z
 +/TuAZ5q/kSOh5HhW63OgDWtLXQ5Z695dCNfRj86MzUlnauBJ5VR7r1MYlPZ0x6c79Ex
 Jm0atXsegOYASFLWQq7ANnHhTGKiuAGJ8vvdjO/fs6RMPajmV5GoZYhl6eml+/+6o7Ro
 W6BmgyNM79+KlY6l5iJCJ2g1abBnzS3Rx5ompSiR43GRNI/hpMvcoRMX9HXjzn2ICba9
 qJRkVBCQVQOiBQAP7lnSKk1o5OKQkuiow+lgUshG1xAtiFUZtEE+4LwH+rwtLEuK1mWc
 BJFA==
X-Gm-Message-State: APjAAAUmNP82zMu2PPt0RNBIMykGa4dIdpRyzS0HGRdtM08rjHJqGJbb
 rik+IK6mkpBSS8sn3hVzs0ee749YztU=
X-Google-Smtp-Source: APXvYqzrrmItbHjsSPmii2z4l4kcfrOixqFc2f2Rw4OuCq3l9RiojWbdy3P5prg1ndnsasqczveZdw==
X-Received: by 2002:aed:2fa7:: with SMTP id m36mr69740674qtd.344.1560799947824; 
 Mon, 17 Jun 2019 12:32:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 282/459] drm/amd: the data retured from PRT is expected to be 0
Date: Mon, 17 Jun 2019 14:30:49 -0500
Message-Id: <20190617193106.18231-83-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8bQj0OOm2Xv91l3HzAKA0SqBHG/+9kfD9urbHRk4bg=;
 b=pn9/wvGqVkbExwF5KCw5vdn0JIEORxmMkx32rb4uf/J5wS8I6QGiiUoj6hEKQYNhg6
 N/tJUMkznt2rS8iUkjfMU5jn9SuF0iDR1DEhyjouSabp1fWW/SGcngK8ovJxLXrftE3c
 y48Ccplveu/a1cLc2ad5bwqhJKOwkdZGsb3qSGTZrmVS5EAFlVzsRa4K3FXufkqtvRZY
 AMZ3qspFmDl09LjISS+ydBhG2l+CSLIwwCEgEiogW20Xo21HK7I/pOdXKn+K5QEP6ZTc
 JwAmCqvbZgT32ZYtTviMPqG2RBKLRmoBXjlh7ggFOGUOFFrT/4W2O7r/c60cSo9GsgQl
 o5zw==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClRoZSBkdW1teSBwYWdlIGZvciBy
ZXR1cm5pbmcgZnJvbSBQUlQgcmVzaWRlcyBpbnNpZGUgc3lzdGVtIG1lbW9yeSwKbmVlZCBzZXQg
c3lzdGVtIGZsYWcgYml0IGluIFZNX0wyX0NOVEwuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8g
PEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAu
YyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgIHwgMiAr
KwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwppbmRleCAyMzFjNzdhZWQwMWIuLmI3
ZGU2MGExNTYyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHVi
X3YyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJfMC5jCkBA
IC0xMzUsNyArMTM1LDggQEAgc3RhdGljIHZvaWQgZ2Z4aHViX3YyXzBfaW5pdF9jYWNoZV9yZWdz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwg
bW1HQ1ZNX0wyX0NOVEwpOwogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBHQ1ZNX0wyX0NOVEws
IEVOQUJMRV9MMl9DQUNIRSwgMSk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fTDJf
Q05UTCwgRU5BQkxFX0wyX0ZSQUdNRU5UX1BST0NFU1NJTkcsIDApOwotCisJdG1wID0gUkVHX1NF
VF9GSUVMRCh0bXAsIEdDVk1fTDJfQ05UTCwKKwkJCSAgICBFTkFCTEVfREVGQVVMVF9QQUdFX09V
VF9UT19TWVNURU1fTUVNT1JZLCAxKTsKIAkvKiBYWFggZm9yIGVtdWxhdGlvbiwgUmVmZXIgdG8g
Y2xvc2VkIHNvdXJjZSBjb2RlLiovCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fTDJf
Q05UTCwKIAkJCSAgICBMMl9QREUwX0NBQ0hFX1RBR19HRU5FUkFUSU9OX01PREUsIDApOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jCmluZGV4IGY2NWI5YzgyNzk3MC4uMzdh
MWEzMThhZTYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jCkBAIC0x
MjEsNiArMTIxLDggQEAgc3RhdGljIHZvaWQgbW1odWJfdjJfMF9pbml0X2NhY2hlX3JlZ3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdG1wID0gUlJFRzMyX1NPQzE1KE1NSFVCLCAwLCBt
bU1NVk1fTDJfQ05UTCk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fTDJfQ05UTCwg
RU5BQkxFX0wyX0NBQ0hFLCAxKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgTU1WTV9MMl9D
TlRMLCBFTkFCTEVfTDJfRlJBR01FTlRfUFJPQ0VTU0lORywgMCk7CisJdG1wID0gUkVHX1NFVF9G
SUVMRCh0bXAsIE1NVk1fTDJfQ05UTCwKKwkJCSAgICBFTkFCTEVfREVGQVVMVF9QQUdFX09VVF9U
T19TWVNURU1fTUVNT1JZLCAxKTsKIAkvKiBYWFggZm9yIGVtdWxhdGlvbiwgUmVmZXIgdG8gY2xv
c2VkIHNvdXJjZSBjb2RlLiovCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fTDJfQ05U
TCwgTDJfUERFMF9DQUNIRV9UQUdfR0VORVJBVElPTl9NT0RFLAogCQkJICAgIDApOwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
