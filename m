Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF976BE5D
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 16:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41C36E0CC;
	Wed, 17 Jul 2019 14:35:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046B689E1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 14:35:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id k10so23606413qtq.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 07:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EJir1XGMurdZh+mwaVlFmXWhxC/iiZNjFRbl765yq0=;
 b=TvtQ8XmenmhkD6AiJW1MwjvTfjYRG9qerpD1VURMujKmKJ27mVLjc2N4+O15yTf07x
 EvfFKlXSCnx8xkNdzBuc9b9wUTDu5c44Rd4HgaPp3ko2RPPWJ8DE7E/ExNh2dyM6T2Wj
 klnBhzGnr1PEQlPhWxdqdJft6P6+gMcox93EZr64JUs+1rq/i/fLAFhOy5OUaN4d+2ia
 cV1FNtTzCNT4Bnt/Z+Zvts4wpCHP9d6Ez+1hdIvHIHQoGdheAvMcCEErLSXf6toTV1YK
 OckcOwTi7RXdFLjGwDg0oYjpEV/BBiy8mO56CKh1Imdx2bBihUzZst2A8FkW/Vl8xuYG
 houg==
X-Gm-Message-State: APjAAAX+oRMslheL2Dy/z3ZSpga68zmW5b5FcvDTWi4SpbfNLxxF3+ej
 /Sog8lZHakDI9Yq+NnBvWrCOB+0F
X-Google-Smtp-Source: APXvYqww9J4QPeWHxY6YyhNW3yWKbuUhP6aPg2wjT8IgU4yuxZM/h+SrE+V/0JdbTM3RibYtH22BLw==
X-Received: by 2002:a0c:f909:: with SMTP id v9mr29077157qvn.83.1563374153712; 
 Wed, 17 Jul 2019 07:35:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id l19sm14739828qtb.6.2019.07.17.07.35.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 07:35:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: add sclk/uclk sensor support for navi
Date: Wed, 17 Jul 2019 09:35:39 -0500
Message-Id: <20190717143540.30090-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5EJir1XGMurdZh+mwaVlFmXWhxC/iiZNjFRbl765yq0=;
 b=D0Q4yjWffvgqFEP36VFCLWI15jYxoJK8nryeGcv09A7IxDYuSv1k7FFHYbH/eNakRH
 CoTRBhJxXWOIwwTzrsF5dcoCP488PtSB3/ApE58B6UtEk/06kssq0WOUfUQCayt82swV
 vA2B6Int4SKsxl8IyjYnH4b3ctmxhV9h/NRB2eue2lqIWegyw33ND0cGNdaS4PvkK48D
 LFvXKP5+52PB/UkClApPhWozSRlzwwnFyjq7hB9GudZl90EBIkIDLoYE39iWLbynT1FT
 h7Am6fOC2WscrwR75LKTi0l05H6ANjdulW1NAmFHDIXutZGNd8M0bM9DARM02VYqCsqX
 TbtA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UXVlcnkgdGhlIG1ldHJpY3MgdGFibGUgdG8gZ2V0IHRoZSBhdmVyYWdlIHNjbGsgYW5kIHVjbGsu
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggN2YxMWM2NDFi
N2I4Li4xNDY0MTJjMDEyYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTEzMDMsNiArMTMwMywzNSBAQCBzdGF0aWMgaW50IG5hdmkxMF90aGVybWFs
X2dldF90ZW1wZXJhdHVyZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlyZXR1cm4gMDsKIH0K
IAorc3RhdGljIGludCBuYXZpMTBfZ2V0X2F2Z19jbG9ja3Moc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsCisJCQkJIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAorCQkJCSB1aW50MzJfdCAqdmFs
dWUpCit7CisJU211TWV0cmljc190IG1ldHJpY3M7CisJaW50IHJldCA9IDA7CisKKwlpZiAoIXZh
bHVlKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBT
TVVfVEFCTEVfU01VX01FVFJJQ1MsICh2b2lkICopJm1ldHJpY3MsIGZhbHNlKTsKKwlpZiAocmV0
KQorCQlyZXR1cm4gcmV0OworCisJc3dpdGNoIChzZW5zb3IpIHsKKwljYXNlIEFNREdQVV9QUF9T
RU5TT1JfR0ZYX1NDTEs6CisJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZUdmeGNsa0ZyZXF1ZW5j
eSAqIDEwMDsKKwkJYnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX0dGWF9NQ0xLOgorCQkq
dmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VVY2xrRnJlcXVlbmN5ICogMTAwOworCQlicmVhazsKKwlk
ZWZhdWx0OgorCQlwcl9lcnIoIkludmFsaWQgc2Vuc29yIGZvciByZXRyaWV2aW5nIGF2ZyBjbG9j
a1xuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMg
aW50IG5hdmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkgZW51
bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCiAJCQkJIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXpl
KQpAQCAtMTMzMSw2ICsxMzYwLDExIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAogCQlyZXQgPSBuYXZpMTBfdGhlcm1hbF9nZXRfdGVtcGVy
YXR1cmUoc211LCBzZW5zb3IsICh1aW50MzJfdCAqKWRhdGEpOwogCQkqc2l6ZSA9IDQ7CiAJCWJy
ZWFrOworCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HRlhfU0NMSzoKKwljYXNlIEFNREdQVV9QUF9T
RU5TT1JfR0ZYX01DTEs6CisJCXJldCA9IG5hdmkxMF9nZXRfYXZnX2Nsb2NrcyhzbXUsIHNlbnNv
ciwgKHVpbnQzMl90ICopZGF0YSk7CisJCSpzaXplID0gNDsKKwkJYnJlYWs7CiAJZGVmYXVsdDoK
IAkJcmV0dXJuIC1FSU5WQUw7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
