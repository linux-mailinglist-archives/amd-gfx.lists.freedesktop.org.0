Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120815F16
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FD89F47;
	Tue,  7 May 2019 08:15:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBC289F47
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:15:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c5so20936055wrs.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 01:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlO6zFuMFcd2jWkRBp06e9S3DEk7u9sAltlIY37QlZ4=;
 b=YfG+1xrILsFBey4VGrthIvBwyAKsftiaY6PnpQXsov2l5ns+WtkBRZwCNHzE5ZNvAw
 6rDt3LctwXtggIHZL5yfdCg4njt9YeRKTbh0PTN7ksvdGVJqZ5OhVeIk1fCNNFihY6Fa
 tg0wpgqjj4+VbxOqfpXpb6NnlawytZYhxQguutcmKXqly7E/yUzOomAv0Bcdg5dCcboC
 06G+4rt7AyRnu67f3161RNykQPQMz2Tboa2zXeV4WW9yqRifjlWzb5kF/RZVtyldjr+e
 Y4a02eN4fuT9+i+bOLRhE1qB3JDmidY4hYOLVYlbXg95ybIiedraYqOWfdaq5FtXxhc2
 SonA==
X-Gm-Message-State: APjAAAVi6de7tBruRup8r89WJiruJRibbRzqD0AOQv3gEDgk97SXF0lo
 +cBe3NnCEoLtyMSF8e+mIObrupGz
X-Google-Smtp-Source: APXvYqyTxQoFK6v+fmD324VujwAQApi4aufglevYJLvpSc1o70hjGDnimVCxujGaSK1jI1qaSaPZPg==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr22883183wrn.113.1557216914185; 
 Tue, 07 May 2019 01:15:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id v16sm15065476wru.76.2019.05.07.01.15.13
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:15:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] dma-buf: start caching of sg_table objects
Date: Tue,  7 May 2019 10:15:04 +0200
Message-Id: <20190507081512.2619-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlO6zFuMFcd2jWkRBp06e9S3DEk7u9sAltlIY37QlZ4=;
 b=KELHiVtSDzCNIataijcGmQl1FEmT8xLCeZ2uKKY6+kx+1BP74/MryqqlW90iUeAOf7
 uM6VALgvIAFutMXQu0nAa28j4FyaOBgKZ4DOIXS2P6Ixe/6l2s8L6pHN+yUzr1BOllY3
 BT5RBdbQ4lm+Rwu346a7mpzeg6Sc4+8q+tNDGn0g5y89BjXpyEfcWIe4dzB5My/2oi7/
 lfLTABn6mYtisk8wpNtZFUuzcIgWFrf9RgQfa89Kxfi2S/aqopOasfkVkAx61gs9YUCN
 +WWDsChWYH9/bZGF6H1rH8cs4NSecDTk00NWtF3p8oO/fDt9hXmYz0o0zmW2zJ5Ligyr
 gmew==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gYWxsb3cgYSBzbW9vdGggdHJhbnNpdGlvbiBmcm9tIHBpbm5pbmcgYnVmZmVyIG9iamVjdHMg
dG8gZHluYW1pYwppbnZhbGlkYXRpb24gd2UgZmlyc3Qgc3RhcnQgdG8gY2FjaGUgdGhlIHNnX3Rh
YmxlIGZvciBhbiBhdHRhY2htZW50LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMg
fCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAg
fCAxNCArKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMKaW5kZXggN2M4NTgwMjBkMTRiLi43NzVlMTNmNTQwODMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpA
QCAtNTczLDYgKzU3MywyMCBAQCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICpkbWFfYnVmX2F0
dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAogCWxpc3RfYWRkKCZhdHRhY2gtPm5vZGUsICZk
bWFidWYtPmF0dGFjaG1lbnRzKTsKIAogCW11dGV4X3VubG9jaygmZG1hYnVmLT5sb2NrKTsKKwor
CWlmICghZG1hX2J1Zl9pc19keW5hbWljKGRtYWJ1ZikpIHsKKwkJc3RydWN0IHNnX3RhYmxlICpz
Z3Q7CisKKwkJc2d0ID0gZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgRE1BX0JJRElS
RUNUSU9OQUwpOworCQlpZiAoIXNndCkKKwkJCXNndCA9IEVSUl9QVFIoLUVOT01FTSk7CisJCWlm
IChJU19FUlIoc2d0KSkgeworCQkJZG1hX2J1Zl9kZXRhY2goZG1hYnVmLCBhdHRhY2gpOworCQkJ
cmV0dXJuIEVSUl9DQVNUKHNndCk7CisJCX0KKwkJYXR0YWNoLT5zZ3QgPSBzZ3Q7CisJfQorCiAJ
cmV0dXJuIGF0dGFjaDsKIAogZXJyX2F0dGFjaDoKQEAgLTU5NSw2ICs2MDksMTAgQEAgdm9pZCBk
bWFfYnVmX2RldGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICphdHRhY2gpCiAJaWYgKFdBUk5fT04oIWRtYWJ1ZiB8fCAhYXR0YWNoKSkKIAkJcmV0
dXJuOwogCisJaWYgKGF0dGFjaC0+c2d0KQorCQlkbWFidWYtPm9wcy0+dW5tYXBfZG1hX2J1Zihh
dHRhY2gsIGF0dGFjaC0+c2d0LAorCQkJCQkgICBETUFfQklESVJFQ1RJT05BTCk7CisKIAltdXRl
eF9sb2NrKCZkbWFidWYtPmxvY2spOwogCWxpc3RfZGVsKCZhdHRhY2gtPm5vZGUpOwogCWlmIChk
bWFidWYtPm9wcy0+ZGV0YWNoKQpAQCAtNjMwLDYgKzY0OCw5IEBAIHN0cnVjdCBzZ190YWJsZSAq
ZG1hX2J1Zl9tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gs
CiAJaWYgKFdBUk5fT04oIWF0dGFjaCB8fCAhYXR0YWNoLT5kbWFidWYpKQogCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKIAorCWlmIChhdHRhY2gtPnNndCkKKwkJcmV0dXJuIGF0dGFjaC0+c2d0
OworCiAJc2dfdGFibGUgPSBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT5tYXBfZG1hX2J1ZihhdHRhY2gs
IGRpcmVjdGlvbik7CiAJaWYgKCFzZ190YWJsZSkKIAkJc2dfdGFibGUgPSBFUlJfUFRSKC1FTk9N
RU0pOwpAQCAtNjU3LDYgKzY3OCw5IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIAlpZiAoV0FSTl9PTighYXR0YWNoIHx8
ICFhdHRhY2gtPmRtYWJ1ZiB8fCAhc2dfdGFibGUpKQogCQlyZXR1cm47CiAKKwlpZiAoYXR0YWNo
LT5zZ3QgPT0gc2dfdGFibGUpCisJCXJldHVybjsKKwogCWF0dGFjaC0+ZG1hYnVmLT5vcHMtPnVu
bWFwX2RtYV9idWYoYXR0YWNoLCBzZ190YWJsZSwKIAkJCQkJCWRpcmVjdGlvbik7CiB9CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5o
CmluZGV4IDU4NzI1Zjg5MGI1Yi4uNTIwMzFmZGM3NWJiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2RtYS1idWYuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaApAQCAtMzIyLDYgKzMy
Miw3IEBAIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgewogCXN0cnVjdCBkbWFfYnVmICpkbWFi
dWY7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKKwlzdHJ1
Y3Qgc2dfdGFibGUgKnNndDsKIAl2b2lkICpwcml2OwogfTsKIApAQCAtMzczLDYgKzM3NCwxOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZ2V0X2RtYV9idWYoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikK
IAlnZXRfZmlsZShkbWFidWYtPmZpbGUpOwogfQogCisvKioKKyAqIGRtYV9idWZfaXNfZHluYW1p
YyAtIGNoZWNrIGlmIGEgRE1BLWJ1ZiB1c2VzIGR5bmFtaWMgbWFwcGluZ3MuCisgKiBAZG1hYnVm
OiB0aGUgRE1BLWJ1ZiB0byBjaGVjaworICoKKyAqIFJldHVybnMgdHJ1ZSBpZiBhIERNQS1idWYg
ZXhwb3J0ZXIgd2FudHMgdG8gY3JlYXRlIGR5bmFtaWMgc2cgdGFibGUgbWFwcGluZ3MKKyAqIGZv
ciBlYWNoIGF0dGFjaG1lbnQuIEZhbHNlIGlmIG9ubHkgYSBzaW5nbGUgc3RhdGljIHNnIHRhYmxl
IHNob3VsZCBiZSB1c2VkLgorICovCitzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2J1Zl9pc19keW5h
bWljKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCit7CisJLyogQWx3YXlzIHVzZSBhIHN0YXRpYyBt
YXBwaW5nIGZvciBub3cgKi8KKwlyZXR1cm4gZmFsc2U7Cit9CisKIHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCiAJCQkJCQkJ
c3RydWN0IGRldmljZSAqZGV2KTsKIHZvaWQgZG1hX2J1Zl9kZXRhY2goc3RydWN0IGRtYV9idWYg
KmRtYWJ1ZiwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
