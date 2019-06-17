Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61D48EE9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4B89A9A;
	Mon, 17 Jun 2019 19:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CF589A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x18so6924862qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3oDwgTLS4yCGEksO4oYuYeBXUSTIIZfOqNIaLeVjQ8=;
 b=GLvDTwhz36ro2+NzHCHcO2LtnJkgcoDdNX2/c/vxhbRvqJcbqvhmw5+K260tAvlpkD
 mTxuTYPzJ/OSHVhkAIZ4QFKWDMojKrfa94rrKSqS9PC9BZjf5mdj7HpdIja21hqw80GO
 ypgPTu9czBho4v9oqliG2jVblDXuMW+O4BZx6085xMVlaR9xDxCgRACka4kfaCLbGoI7
 45tmo1hJO43D77C5AbxDPOsMFMAeq5gS0F+K0zXvvxKZd8M7qOv4eOFhPKfzhEqatDbb
 J8uikmt2SXTJC32By047/pKh7uVwCf7CttqTsE0QPsQ6iYCcX2oW3pgTANntKYB549ng
 +0MQ==
X-Gm-Message-State: APjAAAWd70UD1Bj9vXw54JpydHVK62Owqu0B3nDeip/bCMGyYuBwHjm+
 KUjpKWtJzysBSoHRB98cpKW98Z8lljE=
X-Google-Smtp-Source: APXvYqwmz5pRPDb1/wfT9bA+e2qGiXwfdjWfjw7LfeKO/9EiTqFQj6uvoVqgcj1K1R7wJ2sMsPcgxA==
X-Received: by 2002:ae9:c108:: with SMTP id z8mr30036336qki.57.1560799702580; 
 Mon, 17 Jun 2019 12:28:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 175/459] drm/amd/powerplay: init table_count for smu tables on
 asic level
Date: Mon, 17 Jun 2019 14:26:40 -0500
Message-Id: <20190617192704.18038-76-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3oDwgTLS4yCGEksO4oYuYeBXUSTIIZfOqNIaLeVjQ8=;
 b=ak9AtFeBukBksTUng5PBJ+oNev/TZSL/HqSkHql1bFdfkqwzheLautlcHznDasdvO5
 agR+CINNEcL836U3/w9kzoCkV0avjk32kNE2m9YU1gBPF0nzXh6PX+PIzoy04KxPo8Oc
 rGJhHoRvn4twnSXUZtehtxRMS2OpmzBY0jqxl/WoOua0BBqyFvA0j0EoLUycYYbDiHST
 PQ4cc0X69U9j5ltH8QCSKAfFFA/sdJJqyMhD77YZFbvBIP4V+ZC0y+f34WHkYovSeBZG
 4xv7Z6LXV5HXr35HYX29GAjqzgQ7ZTTnmPehv3mmCZgXJh635Y+OyUg1OpP46T3F9maT
 C8qA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRBQkxFX0NPVU5UIHNob3VsZCBi
ZSBpbml0ZWQgaW4gYXNpYyBsZXZlbC4gQmVjYXVzZSB0aGUgdmFsdWUgbWF5IGJlIGRpZmZlcmVu
dApvbiBlYWNoIGFzaWMgZXZlbiBvbiB0aGUgc2FtZSBpcC4KClNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEu
d2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMyAr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jICB8IDYgKysrLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgfCAzICsrKwogMyBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDdjNzgyNTFlZDk0NC4uNWFi
MzVmZmY4OGJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CkBAIC00NDcsNiArNDQ3LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5h
dmkxMF9wcHRfZnVuY3MgPSB7CiAKIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCiB7CisJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICpzbXVfdGFibGUg
PSAmc211LT5zbXVfdGFibGU7CisKIAlzbXUtPnBwdF9mdW5jcyA9ICZuYXZpMTBfcHB0X2Z1bmNz
OwogCXNtdS0+c21jX2lmX3ZlcnNpb24gPSBTTVUxMV9EUklWRVJfSUZfVkVSU0lPTjsKKwlzbXVf
dGFibGUtPnRhYmxlX2NvdW50ID0gVEFCTEVfQ09VTlQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IDhjNjBjZGNiYTRlZi4uZDA1ZTI2Mzg1OWEwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtNDAwLDE1ICs0
MDAsMTUgQEAgc3RhdGljIGludCBzbXVfdjExXzBfaW5pdF9zbWNfdGFibGVzKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211KQogCXN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcyA9IE5VTEw7CiAJaW50IHJl
dCA9IDA7CiAKLQlpZiAoc211X3RhYmxlLT50YWJsZXMgfHwgc211X3RhYmxlLT50YWJsZV9jb3Vu
dCAhPSAwKQorCWlmIChzbXVfdGFibGUtPnRhYmxlcyB8fCBzbXVfdGFibGUtPnRhYmxlX2NvdW50
ID09IDApCiAJCXJldHVybiAtRUlOVkFMOwogCi0JdGFibGVzID0ga2NhbGxvYyhUQUJMRV9DT1VO
VCwgc2l6ZW9mKHN0cnVjdCBzbXVfdGFibGUpLCBHRlBfS0VSTkVMKTsKKwl0YWJsZXMgPSBrY2Fs
bG9jKFNNVV9UQUJMRV9DT1VOVCwgc2l6ZW9mKHN0cnVjdCBzbXVfdGFibGUpLAorCQkJIEdGUF9L
RVJORUwpOwogCWlmICghdGFibGVzKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCXNtdV90YWJsZS0+
dGFibGVzID0gdGFibGVzOwotCXNtdV90YWJsZS0+dGFibGVfY291bnQgPSBUQUJMRV9DT1VOVDsK
IAogCVNNVV9UQUJMRV9JTklUKHRhYmxlcywgVEFCTEVfUFBUQUJMRSwgc2l6ZW9mKFBQVGFibGVf
dCksCiAJCSAgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDdjYWZiYzk0MmIyYS4u
MTdhOTU0YmQ1YWE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jCkBAIC0yOTg5LDYgKzI5ODksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVu
Y3MgdmVnYTIwX3BwdF9mdW5jcyA9IHsKIAogdm9pZCB2ZWdhMjBfc2V0X3BwdF9mdW5jcyhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSkKIHsKKwlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90
YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKKwogCXNtdS0+cHB0X2Z1bmNzID0gJnZlZ2EyMF9wcHRf
ZnVuY3M7CiAJc211LT5zbWNfaWZfdmVyc2lvbiA9IFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OOwor
CXNtdV90YWJsZS0+dGFibGVfY291bnQgPSBUQUJMRV9DT1VOVDsKIH0KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
