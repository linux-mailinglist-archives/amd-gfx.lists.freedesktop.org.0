Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1F49026
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19FD89FA9;
	Mon, 17 Jun 2019 19:47:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0358089FC3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:17 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p15so12317610qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6scEENNFj5knL87j2nA8kZhtiIKcQUypMfwE+4f8d08=;
 b=X+m6ruCJ79ShAdwrIpuUblzjSchSVSzRp0fXT664kMvUUysYdQiiuUATmQo5fj9jtZ
 G8NMt+iYj+gFAEbNmMlKRG9rEoPjc6zP6D9P/JCt22r7Cgk71L3Y8brcJBu1Q3NFnrhd
 f4Ccgw3fnFQ3WP2hKrPS/8OpzSyuGvP3UDFr83Dbj2vxWbFmXEnyaGsonGQynSfsgLJX
 Zda6/9TjpjQ003GB9GOCE1uj1P6a31TO0XvRCZaeOQ7wFM0JXWyqwffSCOcPV1ov+gQs
 sgxF7VbsJ6GsGxQotgSgRG/vn/nGcZHR5pv4m0kksjnEIr1+seCif+JXR9VRmakRaeRN
 IYhg==
X-Gm-Message-State: APjAAAUVVsBs5ri2AcmlRgEArXWbaN9kWEf8BrVZVKKBcx2Nm6uOo3rM
 +QEkWYqYqyFLOxXC0Ui51ErZ88//lyndBQ==
X-Google-Smtp-Source: APXvYqzwmIq/ZwFtbeemdsRArnDwE1cdqsIzCuQ2I90G//aaEvoZ/rEsWfSUVaqsDASSb4sjmr81Ew==
X-Received: by 2002:ac8:360d:: with SMTP id m13mr46621461qtb.105.1560800834589; 
 Mon, 17 Jun 2019 12:47:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 378/459] drm/amd/display: Make sure DSC slice height is
 divisible by 2 for 4:2:0 color format
Date: Mon, 17 Jun 2019 14:45:19 -0500
Message-Id: <20190617194540.18497-79-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6scEENNFj5knL87j2nA8kZhtiIKcQUypMfwE+4f8d08=;
 b=QFLzUmNiCgywxXb1KQhQZOINkJXfT1wLXNYbwfARGkSSXfm/8NvCxn2fzJ1JxCJleS
 sPi4uGqbIHV6nuTPAHcTayu4eElQo59xo+hZEAUn56ioG/rCYxCPWc+ec4XDu8UDjalo
 AzKZntc9VWKcjMwUecRHk2gT3mX5JR1n6zZdekeytveUDHIGmn9Hv0/D1t7zbCVMYO/P
 b1pTkBeix9u9UyESmv4uzgngpr0isyC+Np8AGavnvo9l1k699ZA4Zqi66inuNPg8paqP
 RJB7XyuxLT/acAyd3gvp979zcCP3uDWZit+ORQb6mhJlIlmiTfHH1YaJS9IE6NeP0+g0
 gmcg==
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
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0gRFNDIHNw
ZWMgcmVxdWlyZXMgdGhpcwoKU2lnbmVkLW9mZi1ieTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNv
cm5pakBhbWQuY29tPgpSZXZpZXdlZC1ieTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5j
b20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMgfCAxMyAr
KysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2Rj
X2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYwppbmRl
eCBjNjQ5ZjYyZDE4M2QuLjYzNTczMjVkM2M5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZHNjL2RjX2RzYy5jCkBAIC02NTgsMTQgKzY1OCwyMyBAQCBzdGF0aWMgYm9vbCBz
ZXR1cF9kc2NfY29uZmlnKAogCWRzY19jZmctPm51bV9zbGljZXNfaCA9IG51bV9zbGljZXNfaDsK
IAlzbGljZV93aWR0aCA9IHBpY193aWR0aCAvIG51bV9zbGljZXNfaDsKIAotCS8vIFZlcnRpY2Fs
IG51bWJlciBvZiBzbGljZXM6IHN0YXJ0IGZyb20gcG9saWN5IGFuZCBwaWNrIHRoZSBmaXJzdCBv
bmUgdGhhdCBoZWlnaHQgaXMgZGl2aXNpYmxlIGJ5CisJLy8gVmVydGljYWwgbnVtYmVyIG9mIHNs
aWNlczogc3RhcnQgZnJvbSBwb2xpY3kgYW5kIHBpY2sgdGhlIGZpcnN0IG9uZSB0aGF0IGhlaWdo
dCBpcyBkaXZpc2libGUgYnkuCisJLy8gRm9yIDQ6MjowIG1ha2Ugc3VyZSB0aGUgc2xpY2UgaGVp
Z2h0IGlzIGRpdmlzaWJsZSBieSAyIGFzIHdlbGwuCiAJcGljX2hlaWdodCA9IHRpbWluZy0+dl9h
ZGRyZXNzYWJsZSArIHRpbWluZy0+dl9ib3JkZXJfdG9wICsgdGltaW5nLT52X2JvcmRlcl9ib3R0
b207CiAJbnVtX3NsaWNlc192ID0gZHNjX3BvbGljeS5udW1fc2xpY2VzX3Y7CiAJaWYgKG51bV9z
bGljZXNfdiA8IDEpCiAJCW51bV9zbGljZXNfdiA9IDE7CiAKLQl3aGlsZSAobnVtX3NsaWNlc192
ID49IDEgJiYgKHBpY19oZWlnaHQgJSBudW1fc2xpY2VzX3YgIT0gMCkpCisJd2hpbGUgKG51bV9z
bGljZXNfdiA+PSAxKSB7CisJCWlmICh0aW1pbmctPnBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VO
Q09ESU5HX1lDQkNSNDIwKSB7CisJCQlpbnQgc2xpY2VfaGVpZ2h0ID0gcGljX2hlaWdodCAvIG51
bV9zbGljZXNfdjsKKwkJCWlmIChwaWNfaGVpZ2h0ICUgbnVtX3NsaWNlc192ID09IDAgJiYgc2xp
Y2VfaGVpZ2h0ICUgMiA9PSAwKQorCQkJCWJyZWFrOworCQl9IGVsc2UgaWYgKHBpY19oZWlnaHQg
JSBudW1fc2xpY2VzX3YgPT0gMCkKKwkJCWJyZWFrOworCiAJCW51bV9zbGljZXNfdi0tOworCX0K
IAogCWRzY19jZmctPm51bV9zbGljZXNfdiA9IG51bV9zbGljZXNfdjsKIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
