Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4EC49024
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83589F82;
	Mon, 17 Jun 2019 19:47:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32789F3C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:09 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12257829qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzZrtbLKIZ84XvCNI9umciVb3PSRQcsg0uGZ+rSOycY=;
 b=F0AxVZ6HmypjARUzLMVmI2xVVNZXJNFiz7cAFBIkbH74VhNpYWHbKXJ+EadXRVdYsr
 1T38u0ZtJH8a3opHdbJhATCmjLTaiV7spgDfaeS6spFI8iS64HL7cU7BAETUVafXiMHN
 B3w/ae26FKujECrObLxGu0dkn2pfWpO+4CHcQoq8KMcfnMXO1drbQ7lHEc2WiMxZ3BNY
 AYbdrVYmERBMCLTX0BkNUfDJ7f6iIu1yUcELUIeJCx782rLGGNiA+JmYx5hYpS6vhl+0
 xR6s2nA1hnRNgNMi29srDKAtPOejDxVzWgvsx3cvzHXOa8Yy3nqNkUIwIU2DADGoBBs4
 vasw==
X-Gm-Message-State: APjAAAUautLvQeTpWQyKVvAc9PKFeHLMh7NB7uOyBSC4Lhuf06glWXK9
 jc7++L5bmv8fNPARO5zYQJisD6//6k96yA==
X-Google-Smtp-Source: APXvYqxNOecZ5qnwGrTl66qZywNUCX5pNm0Hovfi6Ln472IMgMKtyCSbOvMsymirwYiqk5KHhVRvrg==
X-Received: by 2002:a0c:c3c7:: with SMTP id p7mr21553956qvi.125.1560800828766; 
 Mon, 17 Jun 2019 12:47:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 372/459] drm/amd/display: remove target_dpp hack for dsc
Date: Mon, 17 Jun 2019 14:45:13 -0500
Message-Id: <20190617194540.18497-73-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzZrtbLKIZ84XvCNI9umciVb3PSRQcsg0uGZ+rSOycY=;
 b=uo3oRwHTAeEaqFuZ7XDYFvTlXr4aEZGhzewHNZAEYVq9UOg8l/0hxUouRu6JiX+GAN
 vCk3SvrIGCWcLmYTIrkcpSMKacyRcuu13aLMiFSdAPmEb3XpytJByiEGWyBFBN4og1sH
 GpGsWknc9I/OVYf5Y6lq94B7Z5nBjADZuPQDkAfVjA5i+I0OD3WEP3cwT1GgGvZFVteH
 AbNInEigHbrFC3Udvs0cqvhMy+2E0ZFE/fVE6xGNsyvEoS2Ww7wyYpCuhdFln2f4ZVFK
 iR6GiNxJyn64VXdLNawITF/Wjv54hTA1wP9tcDIzaj5bNOPqZDE4+K2vMB5X3d/lOFqk
 gTtQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+CgpSZW1vdmUgZGNfZHNjIGhh
Y2sgZm9yIE1TVCBwb2xpY3kKClNpZ25lZC1vZmYtYnk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxp
dUBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmlrb2xhIENvcm5paiA8Tmlrb2xhLkNvcm5pakBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jIHwgMjcg
KysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZHNjL2RjX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19k
c2MuYwppbmRleCBmZTYzYWY4MzZmMWUuLmU3MTE5N2QzNWQ3OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCkBAIC00OTAsNyArNDkwLDcgQEAgc3RhdGlj
IGludCBmaXRfbnVtX3NsaWNlc191cCh1bmlvbiBkc2NfZW5jX3NsaWNlX2NhcHMgc2xpY2VfY2Fw
cywgaW50IG51bV9zbGljZXMKICAqIGRzY19lbmNfY2FwcyAgICAgICAgLSBEU0MgZW5jb2RlciBj
YXBhYmlsaXRpZXMKICAqCiAgKiB0YXJnZXRfYmFuZHdpZHRoICAgIC0gVGFyZ2V0IGJhbmR3aWR0
aCB0byBmaXQgdGhlIHN0cmVhbSBpbnRvLgotICogICAgICAgICAgICAgICAgICAgICAgIElmIDAs
IHVzZSBtYXhpbXVtIGNvbXByZXNzaW9uIGFzIHBlciBEU0MgcG9saWN5LgorICogICAgICAgICAg
ICAgICAgICAgICAgIElmIDAsIGRvIG5vdCBjYWxjdWxhdGUgdGFyZ2V0IGJwcC4KICAqCiAgKiB0
aW1pbmcgICAgICAgICAgICAgIC0gVGhlIHN0cmVhbSB0aW1pbmcgdG8gZml0IGludG8gJ3Rhcmdl
dF9iYW5kd2lkdGgnIG9yIGFwcGx5CiAgKiAgICAgICAgICAgICAgICAgICAgICAgbWF4aW11bSBj
b21wcmVzc2lvbiB0bywgaWYgJ3RhcmdldF9iYWR3aWR0aCA9PSAwJwpAQCAtNTE3LDcgKzUxNyw2
IEBAIHN0YXRpYyBib29sIHNldHVwX2RzY19jb25maWcoCiAJaW50IHNsaWNlX3dpZHRoOwogCWlu
dCB0YXJnZXRfYnBwOwogCWludCBzaW5rX3Blcl9zbGljZV90aHJvdWdocHV0OwotCS8vIFRPRE8g
RFNDOiBTZWUgaWYgaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIDIuNCUgZm9yIFNTVAogCWJvb2wgaXNf
ZHNjX3Bvc3NpYmxlID0gZmFsc2U7CiAJaW50IG51bV9zbGljZXNfdjsKIAlpbnQgcGljX2hlaWdo
dDsKQEAgLTUzNCwyMCArNTMzLDExIEBAIHN0YXRpYyBib29sIHNldHVwX2RzY19jb25maWcoCiAK
IAlpZiAodGFyZ2V0X2JhbmR3aWR0aCA+IDApIHsKIAkJaXNfZHNjX3Bvc3NpYmxlID0gZGVjaWRl
X2RzY190YXJnZXRfYnBwX3gxNigmZHNjX3BvbGljeSwgJmRzY19jb21tb25fY2FwcywgdGFyZ2V0
X2JhbmR3aWR0aCwgdGltaW5nLCAmdGFyZ2V0X2JwcCk7Ci0JfSBlbHNlIGlmICh0aW1pbmctPnBp
eF9jbGtfMTAwaHogKiAxMiA8PSBkY19iYW5kd2lkdGhfaW5fa2Jwc19mcm9tX3RpbWluZyh0aW1p
bmcpICogMTApIHsKLQkJLyogdXNlIDEyIHRhcmdldCBicHAgZm9yIE1TVCBkaXNwbGF5Ci0JCSAq
IFRPRE86IGltcGxlbWVudCBuZXcgTVNUIERTQyB0YXJnZXQgYnBwIHBvbGljeSAqLwotCQl0YXJn
ZXRfYnBwID0gMTYqMTI7Ci0JCWlzX2RzY19wb3NzaWJsZSA9IHRydWU7Ci0JfSBlbHNlIHsKLQkJ
aXNfZHNjX3Bvc3NpYmxlID0gZmFsc2U7CisJCWRzY19jZmctPmJpdHNfcGVyX3BpeGVsID0gdGFy
Z2V0X2JwcDsKIAl9Ci0KIAlpZiAoIWlzX2RzY19wb3NzaWJsZSkKIAkJZ290byBkb25lOwogCi0J
ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwgPSB0YXJnZXRfYnBwOwotCiAJc2lua19wZXJfc2xpY2Vf
dGhyb3VnaHB1dCA9IDA7CiAKIAkvLyBWYWxpZGF0ZSBhdmFpbGFibGUgRFNDIHNldHRpbmdzIGFn
YWluc3QgdGhlIG1vZGUgdGltaW5nCkBAIC03NzMsMTggKzc2MywxMyBAQCBib29sIGRjX2RzY19j
b21wdXRlX2NvbmZpZygKIAkJc3RydWN0IGRjX2RzY19jb25maWcgKmRzY19jZmcpCiB7CiAJYm9v
bCBpc19kc2NfcG9zc2libGUgPSBmYWxzZTsKLQogCXN0cnVjdCBkc2NfZW5jX2NhcHMgZHNjX2Vu
Y19jYXBzOwotCXN0cnVjdCBkc2NfZW5jX2NhcHMgZHNjX2NvbW1vbl9jYXBzOwogCiAJZ2V0X2Rz
Y19lbmNfY2FwcyhkYywgJmRzY19lbmNfY2FwcywgdGltaW5nLT5waXhfY2xrXzEwMGh6KTsKLQlp
c19kc2NfcG9zc2libGUgPSBkY19pbnRlcnNlY3RfZHNjX2NhcHMoZHNjX3NpbmtfY2FwcywgJmRz
Y19lbmNfY2FwcywKLQkJCXRpbWluZy0+cGl4ZWxfZW5jb2RpbmcsICZkc2NfY29tbW9uX2NhcHMp
OwotCWlmIChpc19kc2NfcG9zc2libGUpCi0JCWlzX2RzY19wb3NzaWJsZSA9IHNldHVwX2RzY19j
b25maWcoZHNjX3NpbmtfY2FwcywKLQkJCQkmZHNjX2VuY19jYXBzLAotCQkJCXRhcmdldF9iYW5k
d2lkdGgsCi0JCQkJdGltaW5nLCBkc2NfY2ZnKTsKKwlpc19kc2NfcG9zc2libGUgPSBzZXR1cF9k
c2NfY29uZmlnKGRzY19zaW5rX2NhcHMsCisJCQkmZHNjX2VuY19jYXBzLAorCQkJdGFyZ2V0X2Jh
bmR3aWR0aCwKKwkJCXRpbWluZywgZHNjX2NmZyk7CiAJcmV0dXJuIGlzX2RzY19wb3NzaWJsZTsK
IH0KICNlbmRpZiAvKiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCAqLwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
