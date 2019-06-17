Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D648F40
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D189BAE;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3269689BA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so6934676qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=th3lWd6wO/HryPrJIucszX3IGQyh+A4KjF75UmJ3hzc=;
 b=iFCFxUBUOCz25HicWNVgTw4RLLSNMjbjxCaWYbCG8Q5MgOCLjFmP8uMbpwgPSylfUo
 cBopuyC4L4A6fIAQr529ZCx1taq7F6/hDQq+zhzOQQ3OXS7LWs17sdyN8vCo9uvoRMj0
 xfHmFTxReL0HDD4cJFZ6LbHTnH4I65eMN9Iylk1Ru4RWOn3YlhKNjbltAcq0fBIA5znA
 LJyaepGlLoT8IzhpoCYJ+l+YzK3eX6nNe//1QE8SfsOUdVTfNMHGPI+RxO/T3/UrNqYM
 ef9x4SvusmaXokRk/hhMRPh+kYeZ4/LeVDrTTRv1pDPPo9nQ0RzWCWhDy6nZ2DLQLLGN
 SRCg==
X-Gm-Message-State: APjAAAUpmyIaBRj/vGbdhDS2hukRuYUEdhbfPNtU/4Uw7c6m7x6qRqmQ
 B6x82GdoWkFRKdJ15utVxUoN3MPxWWs=
X-Google-Smtp-Source: APXvYqwh6ASeLkr7+0zWsi3GkU57iBWv+MSEEuPx5ctDH4cf5eo2FUSSpKlg+pOGjZaA4XscxyYPQg==
X-Received: by 2002:a37:9a50:: with SMTP id c77mr90373739qke.12.1560799888209; 
 Mon, 17 Jun 2019 12:31:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 216/459] drm/amdgpu/mes10.1: enable mes FW backdoor loading
Date: Mon, 17 Jun 2019 14:29:43 -0500
Message-Id: <20190617193106.18231-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=th3lWd6wO/HryPrJIucszX3IGQyh+A4KjF75UmJ3hzc=;
 b=V/cNJgi+jY/cfArhIIAXO5UVzHfRdDwGThS0QJfyjS/ji4slNYAd45zqowixv6zQ0n
 /n9c3Y/KDM117loHfkdQzQRw+ZzS1CWKNuxnkni9Htq61HZ/dhSpoN7em9XcGeHc/mnt
 dewbtoonCJSQLzgzsWxTfOvgpYC73neUdz95q2sndCxz6V4V2liuEB06EJbu5Dckr/wv
 s/SFI1IEnG6h9QUQaf3wykH6X5c13hfQwRKpsItiYh0Ufq7yEmHCpB4yyiLeJ3TCzClL
 cSL//y7j7AiWNYMFV/g+S9Imfzenb5eKKMeHC9Km0wCGIcdlIJCQFJdeLivK+L7gg4R5
 3J/w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IGVuYWJsZXMgTUVTIEZXIGJh
Y2tkb29yIGxvYWRpbmcgaW4gaXAgYmxvY2sgZnVuY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogSmFj
ayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192
MTBfMS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAz
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bWVzX3YxMF8xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYwppbmRl
eCAwNjQ0Y2EwZWYzNTMuLjBkOTJiODhhODViOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bWVzX3YxMF8xLmMKQEAgLTIzNSw2ICsyMzUsOCBAQCBzdGF0aWMgaW50IG1lc192MTBfMV9sb2Fk
X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJuIHI7CiAJfQog
CisJbWVzX3YxMF8xX2VuYWJsZShhZGV2LCBmYWxzZSk7CisKIAlXUkVHMzJfU09DMTUoR0MsIDAs
IG1tQ1BfTUVTX0lDX0JBU0VfQ05UTCwgMCk7CiAKIAltdXRleF9sb2NrKCZhZGV2LT5zcmJtX211
dGV4KTsKQEAgLTI4MiwyMSArMjg0LDU1IEBAIHN0YXRpYyBpbnQgbWVzX3YxMF8xX2xvYWRfbWlj
cm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiBzdGF0aWMgaW50IG1lc192MTBf
MV9zd19pbml0KHZvaWQgKmhhbmRsZSkKIHsKKwlpbnQgcjsKKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKKworCXIgPSBtZXNfdjEw
XzFfaW5pdF9taWNyb2NvZGUoYWRldik7CisJaWYgKHIpCisJCXJldHVybiByOworCiAJcmV0dXJu
IDA7CiB9CiAKIHN0YXRpYyBpbnQgbWVzX3YxMF8xX3N3X2Zpbmkodm9pZCAqaGFuZGxlKQogewor
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFu
ZGxlOworCisJbWVzX3YxMF8xX2ZyZWVfbWljcm9jb2RlKGFkZXYpOworCiAJcmV0dXJuIDA7CiB9
CiAKIHN0YXRpYyBpbnQgbWVzX3YxMF8xX2h3X2luaXQodm9pZCAqaGFuZGxlKQogeworCWludCBy
OworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICop
aGFuZGxlOworCisJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9B
RF9ESVJFQ1QpIHsKKwkJciA9IG1lc192MTBfMV9sb2FkX21pY3JvY29kZShhZGV2KTsKKwkJaWYg
KHIpIHsKKwkJCURSTV9FUlJPUigiZmFpbGVkIHRvIE1FUyBmdywgcj0lZFxuIiwgcik7CisJCQly
ZXR1cm4gcjsKKwkJfQorCX0gZWxzZSB7CisJCURSTV9FUlJPUigib25seSBzdXBwb3J0IGRpcmVj
dCBmdyBsb2FkaW5nIG9uIE1FU1xuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCW1lc192
MTBfMV9lbmFibGUoYWRldiwgdHJ1ZSk7CisKIAlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBt
ZXNfdjEwXzFfaHdfZmluaSh2b2lkICpoYW5kbGUpCiB7CisJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CisKKwltZXNfdjEwXzFfZW5h
YmxlKGFkZXYsIGZhbHNlKTsKKworCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1E
R1BVX0ZXX0xPQURfRElSRUNUKQorCQltZXNfdjEwXzFfZnJlZV91Y29kZV9idWZmZXJzKGFkZXYp
OworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
