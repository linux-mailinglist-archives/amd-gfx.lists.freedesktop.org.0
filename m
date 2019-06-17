Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989A49025
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79F689FBC;
	Mon, 17 Jun 2019 19:47:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB6889F5F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:11 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12250001qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BczmkWuOehxseUx2SjLWMUNXvyIBdgL1fvbxACvb3JQ=;
 b=RWxAN+At7k0LierT15E4WqFvdcdrtreZN2/aTuQDxdPWdaUBFx9jVnyUHhhcSjNuU4
 rm7Pmz5XDB5KSemNYAP3E47NkGgVRO/No23BfrXdQzh5C+UCXFCg6b2O/ELimqfvEfh/
 GCfdST/90AolJdwYg9Wom7NbGODVM+M+DNwJAsQVT5sCmw+EkBmFOn6MWR/7TmJMXnGB
 2fLaFU/IdHTxWzcid+EFWj/KX382kB0AitBRbJWGCFBvtG/xJl8ZmynQ2637VPBU9Ot1
 +rlR2go5GIfwyn0eizu9JtW6qImoJPzB6GpfP8jBv1krfogw6iB59Y5xap9eGFPjRZa9
 A2JA==
X-Gm-Message-State: APjAAAUhlTNCGiTLcH125Cb+j7jZEIisIW5QMKmlaXG2u+AAGlRlngox
 vef4qb+oe2d8/8FM63KpIesz0Jcox9G+Rg==
X-Google-Smtp-Source: APXvYqy9nA9wxQoEBTL9A5lXw3Nbzs5//9s4onxyvuouiVdF5rfCaYWHFrgpenp6D7BkAz2+tk0S7g==
X-Received: by 2002:ac8:2cd1:: with SMTP id 17mr93467308qtx.356.1560800830655; 
 Mon, 17 Jun 2019 12:47:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 374/459] drm/amd/display: move dsc clock from plane_resource
 to stream_resource
Date: Mon, 17 Jun 2019 14:45:15 -0500
Message-Id: <20190617194540.18497-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BczmkWuOehxseUx2SjLWMUNXvyIBdgL1fvbxACvb3JQ=;
 b=pl6WAZG6sTsF8jwApUx8QzKkJNCHZhbx4zgTqfp6xRGfA5FkD+qup+LG4ndIHTIb8D
 c8PruEwWXpzky2aGRjV16sIbV57OaeWfbeWwtbUpbZkAvY6xPS0nepBm9NcJhwS9MmBY
 8U1EM+p+2nFTigxOIu14LgYTSiFZoCxJzRfTh6O6zCPQoaa7+vIFxqNq0np1nDLq2qF4
 aHfX7QCHYxF/V0y3QuXATbJ7N3MxgcPmbqlNGXHeLo0D/ckuMTRy1lE2Sof5wton3342
 fRUaaM5EmaJsP6bRfqENo9XzB8q22aUIZALSghxC7yiMjR2R9Fd13jwZ51Va5YlnlLIx
 XUFw==
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
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <tony.cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVG9ueSBDaGVuZyA8dG9ueS5jaGVuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1ieTogVG9u
eSBDaGVuZyA8dG9ueS5jaGVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNo
a2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExh
a2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaCAgICAgICB8IDUgKystLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXgg
MzNmMWExZDk3MmE5Li5hYTA0ZGY2NDUyMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yMjA0LDcgKzIyMDQs
NyBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLAogCQljb250
ZXh0LT5yZXNfY3R4LnBpcGVfY3R4W2ldLnBsYW5lX3Jlcy5idy5kcHBjbGtfa2h6ID0KIAkJCQkJ
CXBpcGVzW3BpcGVfaWR4XS5jbGtzX2NmZy5kcHBjbGtfbWh6ICogMTAwMDsKICNpZmRlZiBDT05G
SUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAotCQljb250ZXh0LT5yZXNfY3R4LnBpcGVfY3R4W2ld
LnBsYW5lX3Jlcy5idy5kc2NjbGtfa2h6ID0KKwkJY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtp
XS5zdHJlYW1fcmVzLmRzY2Nsa19raHogPQogCQkJCWNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLkRT
Q0NMS19jYWxjdWxhdGVkW3BpcGVfaWR4XSAqIDEwMDA7CiAjZW5kaWYKIAkJY29udGV4dC0+cmVz
X2N0eC5waXBlX2N0eFtpXS5waXBlX2RsZ19wYXJhbSA9IHBpcGVzW3BpcGVfaWR4XS5waXBlLmRl
c3Q7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVf
dHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5o
CmluZGV4IDJkNTUxYTY4NDhmNS4uZTk0ZjNjMTgwMTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaApAQCAtMjIyLDE1ICsyMjIsMTQgQEAg
c3RydWN0IHJlc291cmNlX3Bvb2wgewogCiBzdHJ1Y3QgZGNuX2ZlX2JhbmR3aWR0aCB7CiAJaW50
IGRwcGNsa19raHo7Ci0jaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKLQlpbnQg
ZHNjY2xrX2toejsKLSNlbmRpZgorCiB9OwogCiBzdHJ1Y3Qgc3RyZWFtX3Jlc291cmNlIHsKIAlz
dHJ1Y3Qgb3V0cHV0X3BpeGVsX3Byb2Nlc3NvciAqb3BwOwogI2lmZGVmIENPTkZJR19EUk1fQU1E
X0RDX0RTQ19TVVBQT1JUCiAJc3RydWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3IgKmRzYzsK
KwlpbnQgZHNjY2xrX2toejsKICNlbmRpZgogCXN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZzsK
IAlzdHJ1Y3Qgc3RyZWFtX2VuY29kZXIgKnN0cmVhbV9lbmM7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
