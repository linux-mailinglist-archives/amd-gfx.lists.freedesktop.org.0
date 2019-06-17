Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2955548F73
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027DC89C93;
	Mon, 17 Jun 2019 19:32:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD8C89C52
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so6959497qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fYwcDNIg9at52gwWEyREfrSv0a6nNEVGl05W2Db2O+o=;
 b=rhdLWWXbbaXvw6MKgQQiLOH59rb8CSxjX+pIK37FkRx1tNjJhdFpDsJh3jAvmLXcOb
 ZaQmuI73a0Y6837zNUmuzhP92ZdToHaorxW2QkFRcjiXIR9Sa6DtiHxVSQxPhACYUgLX
 DtCDQr2vIPx+FuaFnjld2oiF12+EzYNMH8JVBkSn3JWiemF0TlgTasNO7lCp5sGFuyf4
 0sx2KB1Mpd1GrmXHJNcaTRpEfeidYd5BbZYBbtq3EJwjNLZpG0qBhiEEFIVHVU7HF2t3
 oR/P+sk0R3BYdTrJ9DU9iIpB0Ji0gwEM+9BRSL+nL29QgpdYwmk+mj3YAhlJces5KXHQ
 VPsA==
X-Gm-Message-State: APjAAAWEF9KRu2KIHYAZ1deLNtytyGPqilPB4hBK5b22Rgb6un6LoD+L
 VMqXpdJaRllMYGC/l3lUpUBzc/cQ7HU=
X-Google-Smtp-Source: APXvYqyJPfvBynI/Mkic6Ht5sAgX+be2gN2EpAsW7E1eGcXViix8eTbRhd40v6ssPGHey5PDZF7C/w==
X-Received: by 2002:a05:620a:136d:: with SMTP id
 d13mr65775755qkl.22.1560799920954; 
 Mon, 17 Jun 2019 12:32:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 252/459] drm/amd/powerplay: add function set_watermarks_table
 function for navi10
Date: Mon, 17 Jun 2019 14:30:19 -0500
Message-Id: <20190617193106.18231-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYwcDNIg9at52gwWEyREfrSv0a6nNEVGl05W2Db2O+o=;
 b=iRkxS8OK6jvUbxqs2dSefuPq0F8Z+z8AbDJfdhSOgCVXqWe8NB0Aer0dnfEm8EApI8
 oQThMXKRlq3E6Tou6MOqWpW0iAJ7x7PSxI6e4q8Znt8E5hWcaZXs/85oeAwnAI5HKGgN
 tcq50tkduYkBZOzVQlgN5wX+SHn82c7QqrSvKKuouw9JiIJJi97lEvXMeDNLyMYdIuCu
 WvgDvdO+zPPuV2n7dBEQ2zjp9J3beRyCLD+o6ojoX3lEabzbDZ0Y5fNc4nBlr7/tfm8B
 QH0mQQ0z7HiwQeK+Ry+nkcOodKQpzGSt7GWv5mbkdqox0CdsdG2PgxWJY+3MKSI3z9Er
 U4Rw==
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
dGlvbiBzZXRfd2F0ZXJtYXJrc190YWJsZSBmb3IgbmF2aTEwIGFzaWMKClNpZ25lZC1vZmYtYnk6
IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMKaW5kZXggZGNhMTZlYjRhYzRkLi5lYWZkNmM2NTMxNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTExMTAsNiArMTExMCw2NiBAQCBzdGF0aWMg
aW50IG5hdmkxMF9ub3RpZnlfc21jX2Rpc3BhbHlfY29uZmlnKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9zZXRfd2F0ZXJtYXJrc190
YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkgICAgICAgdm9pZCAqd2F0ZXJtYXJr
cywgc3RydWN0CisJCQkJICAgICAgIGRtX3BwX3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXNfc29j
MTUKKwkJCQkgICAgICAgKmNsb2NrX3JhbmdlcykKK3sKKwlpbnQgaTsKKwlXYXRlcm1hcmtzX3Qg
KnRhYmxlID0gd2F0ZXJtYXJrczsKKworCWlmICghdGFibGUgfHwgIWNsb2NrX3JhbmdlcykKKwkJ
cmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoY2xvY2tfcmFuZ2VzLT5udW1fd21fZG1pZl9zZXRzID4g
NCB8fAorCSAgICBjbG9ja19yYW5nZXMtPm51bV93bV9tY2lmX3NldHMgPiA0KQorICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOworCisgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjbG9ja19y
YW5nZXMtPm51bV93bV9kbWlmX3NldHM7IGkrKykgeworCQl0YWJsZS0+V2F0ZXJtYXJrUm93WzFd
W2ldLk1pbkNsb2NrID0KKwkJCWNwdV90b19sZTE2KCh1aW50MTZfdCkKKwkJCShjbG9ja19yYW5n
ZXMtPndtX2RtaWZfY2xvY2tzX3Jhbmdlc1tpXS53bV9taW5fZGNmY2xrX2Nsa19pbl9raHogLwor
CQkJMTAwMCkpOworCQl0YWJsZS0+V2F0ZXJtYXJrUm93WzFdW2ldLk1heENsb2NrID0KKwkJCWNw
dV90b19sZTE2KCh1aW50MTZfdCkKKwkJCShjbG9ja19yYW5nZXMtPndtX2RtaWZfY2xvY2tzX3Jh
bmdlc1tpXS53bV9tYXhfZGNmY2xrX2Nsa19pbl9raHogLworCQkJMTAwMCkpOworCQl0YWJsZS0+
V2F0ZXJtYXJrUm93WzFdW2ldLk1pblVjbGsgPQorCQkJY3B1X3RvX2xlMTYoKHVpbnQxNl90KQor
CQkJKGNsb2NrX3Jhbmdlcy0+d21fZG1pZl9jbG9ja3NfcmFuZ2VzW2ldLndtX21pbl9tZW1fY2xr
X2luX2toeiAvCisJCQkxMDAwKSk7CisJCXRhYmxlLT5XYXRlcm1hcmtSb3dbMV1baV0uTWF4VWNs
ayA9CisJCQljcHVfdG9fbGUxNigodWludDE2X3QpCisJCQkoY2xvY2tfcmFuZ2VzLT53bV9kbWlm
X2Nsb2Nrc19yYW5nZXNbaV0ud21fbWF4X21lbV9jbGtfaW5fa2h6IC8KKwkJCTEwMDApKTsKKwkJ
dGFibGUtPldhdGVybWFya1Jvd1sxXVtpXS5XbVNldHRpbmcgPSAodWludDhfdCkKKwkJCQljbG9j
a19yYW5nZXMtPndtX2RtaWZfY2xvY2tzX3Jhbmdlc1tpXS53bV9zZXRfaWQ7CisgICAgICAgIH0K
KworCWZvciAoaSA9IDA7IGkgPCBjbG9ja19yYW5nZXMtPm51bV93bV9tY2lmX3NldHM7IGkrKykg
eworCQl0YWJsZS0+V2F0ZXJtYXJrUm93WzBdW2ldLk1pbkNsb2NrID0KKwkJCWNwdV90b19sZTE2
KCh1aW50MTZfdCkKKwkJCShjbG9ja19yYW5nZXMtPndtX21jaWZfY2xvY2tzX3Jhbmdlc1tpXS53
bV9taW5fc29jY2xrX2Nsa19pbl9raHogLworCQkJMTAwMCkpOworCQl0YWJsZS0+V2F0ZXJtYXJr
Um93WzBdW2ldLk1heENsb2NrID0KKwkJCWNwdV90b19sZTE2KCh1aW50MTZfdCkKKwkJCShjbG9j
a19yYW5nZXMtPndtX21jaWZfY2xvY2tzX3Jhbmdlc1tpXS53bV9tYXhfc29jY2xrX2Nsa19pbl9r
aHogLworCQkJMTAwMCkpOworCQl0YWJsZS0+V2F0ZXJtYXJrUm93WzBdW2ldLk1pblVjbGsgPQor
CQkJY3B1X3RvX2xlMTYoKHVpbnQxNl90KQorCQkJKGNsb2NrX3Jhbmdlcy0+d21fbWNpZl9jbG9j
a3NfcmFuZ2VzW2ldLndtX21pbl9tZW1fY2xrX2luX2toeiAvCisJCQkxMDAwKSk7CisJCXRhYmxl
LT5XYXRlcm1hcmtSb3dbMF1baV0uTWF4VWNsayA9CisJCQljcHVfdG9fbGUxNigodWludDE2X3Qp
CisJCQkoY2xvY2tfcmFuZ2VzLT53bV9tY2lmX2Nsb2Nrc19yYW5nZXNbaV0ud21fbWF4X21lbV9j
bGtfaW5fa2h6IC8KKwkJCTEwMDApKTsKKwkJdGFibGUtPldhdGVybWFya1Jvd1swXVtpXS5XbVNl
dHRpbmcgPSAodWludDhfdCkKKwkJCQljbG9ja19yYW5nZXMtPndtX21jaWZfY2xvY2tzX3Jhbmdl
c1tpXS53bV9zZXRfaWQ7CisgICAgICAgIH0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkudGFibGVzX2lu
aXQgPSBuYXZpMTBfdGFibGVzX2luaXQsCiAJLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2aTEwX2Fs
bG9jYXRlX2RwbV9jb250ZXh0LApAQCAtMTE0Myw2ICsxMjAzLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLmdldF9wb3dlcl9wcm9m
aWxlX21vZGUgPSBuYXZpMTBfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKIAkuc2V0X3Bvd2VyX3By
b2ZpbGVfbW9kZSA9IG5hdmkxMF9zZXRfcG93ZXJfcHJvZmlsZV9tb2RlLAogCS5nZXRfcHJvZmls
aW5nX2Nsa19tYXNrID0gbmF2aTEwX2dldF9wcm9maWxpbmdfY2xrX21hc2ssCisJLnNldF93YXRl
cm1hcmtzX3RhYmxlID0gbmF2aTEwX3NldF93YXRlcm1hcmtzX3RhYmxlLAogfTsKIAogdm9pZCBu
YXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
