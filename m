Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9548EF5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954BC89AFF;
	Mon, 17 Jun 2019 19:28:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39E489A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:33 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so6965061qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lin6JJwuex0L7LeZJRLMXoJIGylgp9j71iTZhMkNLyk=;
 b=ZmIDR7lyrN4NitliWL8d55SDekdFX/Yx9iU2GmihUz3um5jIl8Elfft9F376khNY5x
 BwIuIZpoeWFSGXjQXsuCBSYBuzoFLT18HeYsFUvypW0t7Wf4IK9nE0tDpndEXKFxbE3b
 RROj4yrIpk5pP0RIpfmYHNrMLs1ep8hMLl1SaLzr0kT91NkzJAoABNOUEKeYpKT7xPr3
 THdfLCxp/qdOCA0/QJqc4zsb3DKWI2fqVnAMmVUkQxwyVYgoSJMfPI/BHpWVg098D6yB
 VZ810/5NVjdYsLdQ61dbMlSyUZAT3oUSSbmOft3P9h/JyVGUyFtp2pn05IY2ZRqkPe3E
 1xQg==
X-Gm-Message-State: APjAAAWmNiVQQSTKPqDGB+g1ETLRr4lrDvFbr2xBU9wy86qe72UMfB+N
 2j43HJ0rmmHLw9ODJCiwAMrn31syAz4=
X-Google-Smtp-Source: APXvYqyH9zTwr6Vzvi/KO0h7GBAPSfy9/psww2ihjnnlUOQCWXQnfYknkcfIg+zb4HfN7qPe92083g==
X-Received: by 2002:a37:8081:: with SMTP id b123mr20953358qkd.62.1560799712883; 
 Mon, 17 Jun 2019 12:28:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 186/459] drm/amd/powerplay: fix the incorrect type of pptable
Date: Mon, 17 Jun 2019 14:26:51 -0500
Message-Id: <20190617192704.18038-87-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lin6JJwuex0L7LeZJRLMXoJIGylgp9j71iTZhMkNLyk=;
 b=Vs7feOr33992fA66glseqMtzG+JBXGSKBo4jmc09MysPqrzpY7++glXNkVTlilN37J
 18+6EyR66RkvCoOpGdgyHn+PFA0ORl8er+B+yiSb1IaL9wGR8ZVjOQO5XS8MyWUl/INk
 uA/KJzqj+IcgGEsFxHKDCadsxVGV1IL6Pcf8413MMSpcdmNHJ2qBr8tgtPFMkoTm8baT
 9sEvFmqEs72EFP0lXiFVq6PPKOmwLZTlrpn3MQFK5BTfAGG3mjOzL2E4x7DUtxPCH97V
 6ZcRso4MAQtUz607V2MDBU/YaAvPnk+1Z/uoYY56ulO16ptZ7oE3BEM4kuVQ4in8G95F
 +YcQ==
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
 Kenneth Feng <Kenneth.Feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggaXMg
dG8gZml4IHRoZSBpbmNvcnJlY3QgdHlwZSBvZiBwcHRhYmxlLCBvdGhlcndpc2UsIHRoZSBkYXRh
IHdpbGwgYmUKdG90YWxseSB3cm9uZyBpbiBwYXJzaW5nIHBoYXNlLgoKU2lnbmVkLW9mZi1ieTog
S2VubmV0aCBGZW5nIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogSHVhbmcg
UnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tp
bmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9z
bXVfdjExXzBfcHB0YWJsZS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL3NtdV92MTFfMF9wcHRhYmxlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvc211X3YxMV8wX3BwdGFibGUuaAppbmRleCA5MmM2NWI4MGJkZTIuLjg2Y2RjMzM5M2Vh
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92MTFf
MF9wcHRhYmxlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV92
MTFfMF9wcHRhYmxlLmgKQEAgLTEyMSw3ICsxMjEsNyBAQCBzdHJ1Y3Qgc211XzExXzBfcG93ZXJw
bGF5X3RhYmxlCiB7CiAgICAgICBzdHJ1Y3QgYXRvbV9jb21tb25fdGFibGVfaGVhZGVyIGhlYWRl
cjsKICAgICAgIHVpbnQ4X3QgIHRhYmxlX3JldmlzaW9uOwotICAgICAgdWludDMyX3QgdGFibGVf
c2l6ZTsgICAgICAgICAgICAgICAgICAgICAgICAgIC8vRHJpdmVyIHBvcnRpb24gdGFibGUgc2l6
ZS4gVGhlIG9mZnNldCB0byBzbWNfcHB0YWJsZSBpbmNsdWRpbmcgaGVhZGVyIHNpemUKKyAgICAg
IHVpbnQxNl90IHRhYmxlX3NpemU7ICAgICAgICAgICAgICAgICAgICAgICAgICAvL0RyaXZlciBw
b3J0aW9uIHRhYmxlIHNpemUuIFRoZSBvZmZzZXQgdG8gc21jX3BwdGFibGUgaW5jbHVkaW5nIGhl
YWRlciBzaXplCiAgICAgICB1aW50MzJfdCBnb2xkZW5fcHBfaWQ7CiAgICAgICB1aW50MzJfdCBn
b2xkZW5fcmV2aXNpb247CiAgICAgICB1aW50MTZfdCBmb3JtYXRfaWQ7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
