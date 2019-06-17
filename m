Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28748E09
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A167F8951B;
	Mon, 17 Jun 2019 19:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488F8955D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:15 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7220251qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxqWEnXIT1lfSeYOUbeDCYOT7/Oa9wmVIO3hUuDJdUo=;
 b=H3PJDmanBgJdz2zz7zdL018anUUScveTnCb5LEqDD5AvAL/ixbFO0cbzhCLu1hXFXb
 oNHsuGEbJkqZGYviqr60LYlc/Dvvz+P8CJuXN7hj/ucr6JDUyUi2uqNqPFHhTDf3s1Ll
 Vq7p/q0422toI0XG3nFwIs3y6cD8Hb2TUER33NoARsCzybHM62XgtCtS/Fw9U8S+y7Hc
 yApsJwlu0GDRBxSInNrNFjCwvOHRG0/c1g4i/KRR9Cj56D7UETPFZtY9tFWQRwjIxu4w
 kwq/+XHbTuzMSZvk1OD9Q9L+rLMjK71uLicGnLqr9MPtUM+/0pO3MKmU8OEtAB4TR1jh
 hyoA==
X-Gm-Message-State: APjAAAUipKeE+zDr2LR22LA6p+PvnTOa/Y2SgEXJ1tJYCugb05DhidOL
 SBsMSuWEFutxsFoszHKcHjJ61grocWs=
X-Google-Smtp-Source: APXvYqxzOMluTJ6CUa//aR7pg0fZowGI0+jdNBLcvKcPcMnrbUHejDM71/6F6hc8jdvqTjMgpzixtg==
X-Received: by 2002:a0c:8af0:: with SMTP id 45mr23629486qvw.111.1560799093103; 
 Mon, 17 Jun 2019 12:18:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 073/459] drm/amdgpu/psp: add structure to support load toc in
 psp (v2)
Date: Mon, 17 Jun 2019 14:10:34 -0500
Message-Id: <20190617191700.17899-62-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxqWEnXIT1lfSeYOUbeDCYOT7/Oa9wmVIO3hUuDJdUo=;
 b=bGytwbNqLGoszIlPcQcN00vFeMBdRq0YFlWqzr4XaCGk2zotugVKjjFfW7Npm/tTOU
 wAAa5EbAs8QM2JGU5XYanMo1SNlDkEo0P8YqnjZe500KUhtt5j2MuZusKW5MOCFABlTP
 OSaRnRgOviKtcUhcC6W6T3DX55Pnn9dStRBbOP/X/J9dwgcSMwn5esDewNudXC4Tl8tt
 E4F/frOKCq8IAGYdw942O5f4tHz0N4XzLZsOEiZ7Ssjizz9m92T9iKXToIJGhMciBAPO
 p7kndb/gkgbEQxjgQKt5iPO+Sh4Pdb6u6K/4fOweS6t3W25J6UUEpeHocBY+zEjWCUlO
 BVdQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKdjI6IHJlYmFzZSAo
QWxleCkKCkZJWE1FOgpHRlhfQ01EX0lEX1BST0dfUkVHICAgICA9IDB4MDAwMDAwMEIsICAgLyog
cHJvZ3JhbSByZWdzICovCkdGWF9DTURfSURfTE9BRF9UT0MgICAgID0gMHgwMDAwMDAwQiwgICAv
KiBMb2FkIFRPQyBhbmQgb2J0YWluIFRNUiBzaXplICovCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF9nZnhfaWYuaCB8IDI0
ICsrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX2dmeF9pZi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX2dmeF9pZi5o
CmluZGV4IDdmOGVkYzY2ZGRmZi4uZjA5YTc2NTRkNTBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9wc3BfZ2Z4X2lmLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX2dmeF9pZi5oCkBAIC05NSw2ICs5NSw4IEBAIGVudW0gcHNwX2dmeF9jbWRfaWQK
ICAgICBHRlhfQ01EX0lEX1NFVFVQX1ZNUiAgICA9IDB4MDAwMDAwMDksICAgLyogc2V0dXAgVk1S
IHJlZ2lvbiAqLwogICAgIEdGWF9DTURfSURfREVTVFJPWV9WTVIgID0gMHgwMDAwMDAwQSwgICAv
KiBkZXN0cm95IFZNUiByZWdpb24gKi8KICAgICBHRlhfQ01EX0lEX1BST0dfUkVHICAgICA9IDB4
MDAwMDAwMEIsICAgLyogcHJvZ3JhbSByZWdzICovCisgICAgR0ZYX0NNRF9JRF9MT0FEX1RPQyAg
ICAgPSAweDAwMDAwMDBCLCAgIC8qIExvYWQgVE9DIGFuZCBvYnRhaW4gVE1SIHNpemUgKi8KKyAg
ICBHRlhfQ01EX0lEX0FVVE9MT0FEX1JMQyA9IDB4MDAwMDAwMEMsICAgLyogSW5kaWNhdGVzIGFs
bCBncmFwaGljcyBmdyBsb2FkZWQsIHN0YXJ0IFJMQyBhdXRvbG9hZCAqLwogfTsKIAogCkBAIC0y
MjQsNiArMjI2LDE0IEBAIHN0cnVjdCBwc3BfZ2Z4X2NtZF9yZWdfcHJvZyB7CiAJdWludDMyX3QJ
cmVnX2lkOwogfTsKIAorLyogQ29tbWFuZCB0byBsb2FkIFRPQyAqLworc3RydWN0IHBzcF9nZnhf
Y21kX2xvYWRfdG9jCit7CisgICAgdWludDMyX3QgICAgICAgIHRvY19waHlfYWRkcl9sbzsgICAg
ICAgIC8qIGJpdHMgWzMxOjBdIG9mIEdQVSBWaXJ0dWFsIGFkZHJlc3Mgb2YgRlcgbG9jYXRpb24g
KG11c3QgYmUgNCBLQiBhbGlnbmVkKSAqLworICAgIHVpbnQzMl90ICAgICAgICB0b2NfcGh5X2Fk
ZHJfaGk7ICAgICAgICAvKiBiaXRzIFs2MzozMl0gb2YgR1BVIFZpcnR1YWwgYWRkcmVzcyBvZiBG
VyBsb2NhdGlvbiAqLworICAgIHVpbnQzMl90ICAgICAgICB0b2Nfc2l6ZTsgICAgICAgICAgICAg
ICAvKiBGVyBidWZmZXIgc2l6ZSBpbiBieXRlcyAqLworfTsKKwogLyogQWxsIEdGWCByaW5nIGJ1
ZmZlciBjb21tYW5kcy4gKi8KIHVuaW9uIHBzcF9nZnhfY29tbWFuZHMKIHsKQEAgLTIzNCwyMSAr
MjQ0LDIzIEBAIHVuaW9uIHBzcF9nZnhfY29tbWFuZHMKICAgICBzdHJ1Y3QgcHNwX2dmeF9jbWRf
bG9hZF9pcF9mdyAgICAgICBjbWRfbG9hZF9pcF9mdzsKICAgICBzdHJ1Y3QgcHNwX2dmeF9jbWRf
c2F2ZV9yZXN0b3JlX2lwX2Z3IGNtZF9zYXZlX3Jlc3RvcmVfaXBfZnc7CiAgICAgc3RydWN0IHBz
cF9nZnhfY21kX3JlZ19wcm9nICAgICAgIGNtZF9zZXR1cF9yZWdfcHJvZzsKKyAgICBzdHJ1Y3Qg
cHNwX2dmeF9jbWRfc2V0dXBfdG1yICAgICAgICBjbWRfc2V0dXBfdm1yOworICAgIHN0cnVjdCBw
c3BfZ2Z4X2NtZF9sb2FkX3RvYyAgICAgICAgIGNtZF9sb2FkX3RvYzsKIH07CiAKLQogLyogU3Ry
dWN0dXJlIG9mIEdGWCBSZXNwb25zZSBidWZmZXIuCiAqIEZvciBHUENPTSBJL0YgaXQgaXMgcGFy
dCBvZiBHRlhfQ01EX1JFU1AgYnVmZmVyLCBmb3IgUkJJCiAqIGl0IGlzIHNlcGFyYXRlIGJ1ZmZl
ci4KICovCiBzdHJ1Y3QgcHNwX2dmeF9yZXNwCiB7Ci0gICAgdWludDMyX3QgICAgc3RhdHVzOyAg
ICAgICAgICAgICAvKiArMCAgc3RhdHVzIG9mIGNvbW1hbmQgZXhlY3V0aW9uICovCi0gICAgdWlu
dDMyX3QgICAgc2Vzc2lvbl9pZDsgICAgICAgICAvKiArNCAgc2Vzc2lvbiBJRCBpbiByZXNwb25z
ZSB0byBMb2FkVGEgY29tbWFuZCAqLwotICAgIHVpbnQzMl90ICAgIGZ3X2FkZHJfbG87ICAgICAg
ICAgLyogKzggIGJpdHMgWzMxOjBdIG9mIEZXIGFkZHJlc3Mgd2l0aGluIFRNUiAoaW4gcmVzcG9u
c2UgdG8gY21kX2xvYWRfaXBfZncgY29tbWFuZCkgKi8KLSAgICB1aW50MzJfdCAgICBmd19hZGRy
X2hpOyAgICAgICAgIC8qICsxMiBiaXRzIFs2MzozMl0gb2YgRlcgYWRkcmVzcyB3aXRoaW4gVE1S
IChpbiByZXNwb25zZSB0byBjbWRfbG9hZF9pcF9mdyBjb21tYW5kKSAqLworICAgIHVpbnQzMl90
CXN0YXR1czsJCS8qICswICBzdGF0dXMgb2YgY29tbWFuZCBleGVjdXRpb24gKi8KKyAgICB1aW50
MzJfdAlzZXNzaW9uX2lkOwkvKiArNCAgc2Vzc2lvbiBJRCBpbiByZXNwb25zZSB0byBMb2FkVGEg
Y29tbWFuZCAqLworICAgIHVpbnQzMl90CWZ3X2FkZHJfbG87CS8qICs4ICBiaXRzIFszMTowXSBv
ZiBGVyBhZGRyZXNzIHdpdGhpbiBUTVIgKGluIHJlc3BvbnNlIHRvIGNtZF9sb2FkX2lwX2Z3IGNv
bW1hbmQpICovCisgICAgdWludDMyX3QJZndfYWRkcl9oaTsJLyogKzEyIGJpdHMgWzYzOjMyXSBv
ZiBGVyBhZGRyZXNzIHdpdGhpbiBUTVIgKGluIHJlc3BvbnNlIHRvIGNtZF9sb2FkX2lwX2Z3IGNv
bW1hbmQpICovCisgICAgdWludDMyX3QJdG1yX3NpemU7CS8qICsxNiBzaXplIG9mIHRoZSBUTVIg
dG8gYmUgcmVzZXJ2ZWQgaW5jbHVkaW5nIE1NIGZ3IGFuZCBHZnggZncgaW4gcmVzcG9uc2UgdG8g
Y21kX2xvYWRfdG9jIGNvbW1hbmQgKi8KIAotICAgIHVpbnQzMl90ICAgIHJlc2VydmVkWzRdOwor
ICAgIHVpbnQzMl90CXJlc2VydmVkWzNdOwogCiAgICAgLyogdG90YWwgMzIgYnl0ZXMgKi8KIH07
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
