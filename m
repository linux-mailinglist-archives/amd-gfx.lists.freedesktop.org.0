Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1B49074
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126F6E06E;
	Mon, 17 Jun 2019 19:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1406E062
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:41 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so12271436qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFcMqC7U+xoWJZH6+p7gw66qcGp9NWdcc66Puowm+gY=;
 b=ZG5JvJUWscq5cnf0pkR5ctpc9K/QkYdMIB0ORBra49n47ik9Ape3N+1OnG4/TcrOfs
 WmMEJSu3mNrPW3MM6hEqvMpq26G+6Y9AXbUGGe+4p3QRBSAA025/OILEMj+P5mTJDHo6
 cRIIOmPyNBbT40NjQTQJFOwAxLpydEu/vFew+P9QX9i26pt0TPtc4nL5gw4bKxskFCoF
 caMzmdZbTzSWEsmFas/dLli10wJ4XV93lIAuyEbiaft6e7qbedSTaEYo2KIHrWSfE1LJ
 lHi25bZY+Z5ejgyGe16ZYYFEN4FVghsMmEkmzLWMwivEXh/s1mmRiy+8HeVt8t1LONtK
 TkUg==
X-Gm-Message-State: APjAAAUcLCA6qgzAKYWZ1m3AAKk/P8FGJLQtmToVuWMOn09UwRrIReRb
 /Tj/yRU1QcR3B0wztimlSo1ZT9jJ1t5Z8g==
X-Google-Smtp-Source: APXvYqytAxiol1Pr77VU/bMxUDSDJiWWZcTiCOjJ9gVLvEH/bJYTn3NjE16Y0lceNpptbSq7DtrJdg==
X-Received: by 2002:aed:3f10:: with SMTP id p16mr31300986qtf.110.1560801040100; 
 Mon, 17 Jun 2019 12:50:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 444/459] drm/amd/display: update dsc max_target_bpp to 16 bpp
Date: Mon, 17 Jun 2019 14:49:33 -0500
Message-Id: <20190617194948.18667-45-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFcMqC7U+xoWJZH6+p7gw66qcGp9NWdcc66Puowm+gY=;
 b=LdglIHGJuorIqsjEDq9JpKtPQ4NiJNy2fakBKkoRUkyE3DqqDjdZ21KMl2yLBIlCDL
 tepLjf8HsL9dqyEwuF96mXl6aNWcOLlZV1DtXck5ozGgzN9zozMPnTjrOKENEQWzPz+s
 bhAeqxIo9HLT7NZe1eBlXEvFu3sR/hM/3U5seAVWydrrgxcmI+RJwbtBYvivQndaEIqA
 gjLiUM+f0TwYHGqcglHaoLj/jFW226BKbi39WSZlp3C8m7jFqhddXfN11GJwKuDI3Btc
 wAGQPalyzecOyJZ9OJe/xwhxHFOCEerSFCfvk7HlehQkeFvqNKA0/3Bl20kVGyyWF3F9
 0YWA==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+Cgpbd2h5XQpBY2NvcmRpbmcg
dG8gdGhlIGxhdGVzdCBzcGVjcywgdGhlIG1heF90YXJnZXQgYnBwIHNpbmsKY2FuIHN1cHBvcnQg
aXMgMTYgYnBwLgoKW2hvd10KdXBkYXRlIGRzYyBtYXhfdGFyZ2V0X2JwcCB0byAxNgoKU2lnbmVk
LW9mZi1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBK
dW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhh
d2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kc2MvZGNfZHNjLmMgfCA5ICstLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kc2MvZGNfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNj
L2RjX2RzYy5jCmluZGV4IDk2YjE4YmIzYjFjYy4uNzdlN2EwZjhhNTI3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMKQEAgLTI0Miw5ICsyNDIsNiBAQCBz
dGF0aWMgYm9vbCBpbnRlcnNlY3RfZHNjX2NhcHMoCiB9CiAKIHN0cnVjdCBkY19kc2NfcG9saWN5
IHsKLQlmbG9hdCBtYXhfY29tcHJlc3Npb25fcmF0aW9fbGVnYWN5OwotCWZsb2F0IHNzdF9jb21w
cmVzc2lvbl9sZWdhY3k7IC8vIE1heGltdW0gcXVhbGl0eSBpZiAwLjAKLQlmbG9hdCBtc3RfY29t
cHJlc3Npb25fbGVnYWN5OwogCWJvb2wgdXNlX21pbl9zbGljZXNfaDsKIAlpbnQgbWF4X3NsaWNl
c19oOyAvLyBNYXhpbXVtIGF2YWlsYWJsZSBpZiAwCiAJaW50IG51bV9zbGljZXNfdjsKQEAgLTI3
NCwxOCArMjcxLDE0IEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgY2FsY19kc2NfYnBwX3gxNih1
aW50MzJfdCBzdHJlYW1fYmFuZHdpZHRoX2ticHMsIHVpbnQzMl90CiB9CiAKIGNvbnN0IHN0cnVj
dCBkY19kc2NfcG9saWN5IGRzY19wb2xpY3kgPSB7Ci0JLm1heF9jb21wcmVzc2lvbl9yYXRpb19s
ZWdhY3kgPSAzLjBmLCAvLyBEU0MgUG9saWN5OiBMaW1pdCBjb21wcmVzc2lvbiB0byAzOjEgYXQg
bW9zdCBpbiBhbGwgY2FzZXMKLQkuc3N0X2NvbXByZXNzaW9uX2xlZ2FjeSA9IDAuMGYsIC8vIERT
QyBQb2xpY3k6IFNTVCAtIE1heGltdW0gcXVhbGl0eSAoMC4wKQotCS5tc3RfY29tcHJlc3Npb25f
bGVnYWN5ID0gMy4wZiwgLy8gRFNDIFBvbGljeTogTVNUIC0gYWx3YXlzIDM6MSBjb21wcmVzc2lv
bgogCS51c2VfbWluX3NsaWNlc19oID0gdHJ1ZSwgLy8gRFNDIFBvbGljeTogVXNlIG1pbmltdW0g
bnVtYmVyIG9mIHNsaWNlcyB0aGF0IGZpdHMgdGhlIHBpeGVsIGNsb2NrCiAJLm1heF9zbGljZXNf
aCA9IDAsIC8vIERTQyBQb2xpY3k6IFVzZSBtYXggYXZhaWxhYmxlIHNsaWNlcyAoaW4gb3VyIGNh
c2UgNCBmb3Igb3IgOCwgZGVwZW5kaW5nIG9uIHRoZSBtb2RlKQotCiAJLyogRFNDIFBvbGljeTog
TnVtYmVyIG9mIHZlcnRpY2FsIHNsaWNlcyBzZXQgdG8gMiBmb3Igbm8gcGFydGljdWxhciByZWFz
b24uCiAJICogU2VlbXMgc21hbGwgZW5vdWdoIHRvIG5vdCBhZmZlY3QgdGhlIHF1YWxpdHkgdG9v
IG11Y2gsIHdoaWxlIHN0aWxsIHByb3ZpZGluZyBzb21lIGVycm9yCiAJICogcHJvcGFnYXRpb24g
Y29udHJvbCAod2hpY2ggbWF5IGFsc28gaGVscCBkZWJ1Z2dpbmcpLgogCSAqLwogCS5udW1fc2xp
Y2VzX3YgPSAxNiwKLQkubWF4X3RhcmdldF9icHAgPSAyNCwKKwkubWF4X3RhcmdldF9icHAgPSAx
NiwKIAkubWluX3RhcmdldF9icHAgPSA4LAogfTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
