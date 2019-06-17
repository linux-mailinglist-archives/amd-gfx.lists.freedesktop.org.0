Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F148F5D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFC689C48;
	Mon, 17 Jun 2019 19:31:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5A489C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x2so12275782qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJz04+gOU3EhxPtEAFf7CHrtZcNJjdz487tylgPDzo4=;
 b=AaFBhSvsKOeiV1dzr7Ygzm3/oaf4UFBPuCPXYjtgiFk5PSxdAvwKIWt/AFxjqKIKIi
 3zQB4zk4taGZoDi5lO04dOt2qGQF00/edSS4AQVflP1vbW7L23UwKGTBKYRS5tUCCr1m
 cxMcdD116lHd8RC8ASHVLDbBBVOZdnR5LQoU5giYnZ5gA9WtRzQCJeZSrFGtGsaCXvIf
 UCaHuqg+xza3MDmGUw3CNX8vo9KrT2tDq5X4jEooYEjQ/duGKGII5WqRejyEp9qlzXI/
 554Oh5M97y7fZueNsNF/NHAXRXGRyPhQ6oVG9H0Nvgb9EtSkjT+qF65sPhZG6jypc546
 1UYg==
X-Gm-Message-State: APjAAAVuzA6+fssWyRO2GiNCqO2tHpWgKMjcKihA6z07PBubG/JYI9cJ
 /Pv+MV58/IMwtATjKb5k5cb20egDOrg=
X-Google-Smtp-Source: APXvYqyBYpvnIlKTyd9Axs1TdkOHPYvfy8cddg9f+68Y45BdsKSdhxV0l9G/wFyENDp/OJv8Yire2w==
X-Received: by 2002:ac8:4601:: with SMTP id p1mr96152735qtn.181.1560799911370; 
 Mon, 17 Jun 2019 12:31:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 241/459] drm/amd/powerplay: add function
 get_current_activity_percent for navi10
Date: Mon, 17 Jun 2019 14:30:08 -0500
Message-Id: <20190617193106.18231-42-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJz04+gOU3EhxPtEAFf7CHrtZcNJjdz487tylgPDzo4=;
 b=TTkJLyl35aFAFBlbS3/xfPJZhgMomyc3zsGa56nEi7HVrXjwOm4wke9tJVKtGYkVA+
 8jpie2MSxX7GPLm9UxvsUuFj425dqoNsEj9XY6L39DItUyKtWWX/OrHsr6hPtXRtD7Lk
 2rpe6gwalQraHzmQzq5pNlbc/EE/+rhLmsNCS23nDZIDJfKQZMH4hEykCeYDGs/Jr30r
 SK6O3AqdnoQ0eOHolxswyf5P7PpFhKHrVQ/xd96GZk9LsRpn836fyc9lSinArPPt/D2Y
 UF7h+1WZff0GdD2auKcJysp+S+f9XPgT9g1UNbttt8RadOD7vuHr4apNU3VkFvBd8d89
 242w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBnZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50IGZvciBuYXZpMTAgYXNpYwoKU2lnbmVk
LW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1
YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKaW5kZXggZTIxYTFlYWVlOGI5Li43MTFkYTA0YzMwYTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTc2Nyw2ICs3NjcsMjUgQEAgc3Rh
dGljIGludCBuYXZpMTBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWlu
dDMyX3QgKnZhbHVlKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9nZXRfY3Vy
cmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAorCQkJCQkgICAg
ICAgdWludDMyX3QgKnZhbHVlKQoreworCWludCByZXQgPSAwOworCVNtdU1ldHJpY3NfdCBtZXRy
aWNzOworCisJaWYgKCF2YWx1ZSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXQgPSBzbXVfdXBk
YXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLAorCQkJICAgICAgICh2b2lkICop
Jm1ldHJpY3MsIGZhbHNlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJKnZhbHVlID0g
bWV0cmljcy5BdmVyYWdlR2Z4QWN0aXZpdHk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNv
bnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxlc19p
bml0ID0gbmF2aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9h
bGxvY2F0ZV9kcG1fY29udGV4dCwKQEAgLTc5MSw2ICs4MTAsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkuZm9yY2VfZHBtX2xpbWl0
X3ZhbHVlID0gbmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZSwKIAkudW5mb3JjZV9kcG1fbGV2
ZWxzID0gbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscywKIAkuZ2V0X2dwdV9wb3dlciA9IG5hdmkx
MF9nZXRfZ3B1X3Bvd2VyLAorCS5nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50ID0gbmF2aTEw
X2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQsCiB9OwogCiB2b2lkIG5hdmkxMF9zZXRfcHB0
X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
