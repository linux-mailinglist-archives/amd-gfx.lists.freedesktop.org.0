Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37AA49059
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67416E04A;
	Mon, 17 Jun 2019 19:50:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6986E053
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:14 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so6981851qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpo4uY+9omuLKMwQQaIAklqgenVG9tYcNFDegnvcIME=;
 b=TJRMj1BrKXjjBh0Qdxv4gzhCj5rs76NeSErhJ569l62GQ7jVhozV5wHfWKiD7WV6KS
 nTy2bNtiNcWCMrNcoNLPVJPndJlzb47wyaUi+jSa0nDl93flOcJwGos6r1WavnIK0TTQ
 a4C3LikTdnjqLWjium8Mo88UGr+81E9HO6E64OBv6FV7lSo1LpGn2lXaociIMp3dzKfo
 WrC+1z7Q5rdkTajrZf6pvidn/oTCuXGunSo76y62BWUwvCGVjt7LHB73WmjIDnXPX4Fo
 H17v+ZU0I8lshKUkIezaE+2QOJi2WV6U3UtBYsBONiTNiErobfPdwzReeH69rRd0jk6B
 XRQw==
X-Gm-Message-State: APjAAAX6ZUa1ltiEbTGLkGsdldplWbhyDeud2kv8F5iBXjcaTlsASt4w
 wUC6CDwB9tgKtqkN9qC4qq5z8NnRFSi7iQ==
X-Google-Smtp-Source: APXvYqySZ+yRPJAFCt6bkYFi7Tt4F3mwSnDkipzdxxGTg7RdUemrbnaupHB1ZTVtwBWgyjNaDhwEFQ==
X-Received: by 2002:a37:5f82:: with SMTP id
 t124mr23819638qkb.180.1560801013370; 
 Mon, 17 Jun 2019 12:50:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 416/459] drm/amd/display: fix odm mpo disable
Date: Mon, 17 Jun 2019 14:49:05 -0500
Message-Id: <20190617194948.18667-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpo4uY+9omuLKMwQQaIAklqgenVG9tYcNFDegnvcIME=;
 b=Orp09qgPmttYHKNY/DUjJmVy87R5mZZ8i7H7q2y4f7X+h+O5hJgUY58iYub6Cc9DKG
 mH3F6cvak74PmqK2Olgb1F8DrBj12zdZrdgLkCt5q0FQzQiPN8/TF7WvYRGtVhIKJ/yZ
 EXzO4zaB3DTnQaiZKxHv17kInszQ4joGgrTLhHSftR/WPTNKtaxlrDMPQUI4HaifkRYU
 2BPsS84W/GTpvdqTiL+Eq1sxLTN3w+MJYi9Pw2XlgKfa8zo2LIITdPfeKQgCTQ2/IV2e
 /UqNVDcMyjdAA9afNsYd6Lmo2/apU0VXWeL2JwxGtYTW0heNPIbnNiUzdIMASlLyJr3P
 Au+Q==
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
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkl0
IGxvb2tzIGxpa2UgbXBvIGlzbid0IHByb3Blcmx5IGRpc2FibGVkIGR1cmluZyBvZG0sIHRoaXMg
Y2hhbmdlIGlzCm1lYW50IHRvIGZpeCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5
dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pa29sYSBD
b3JuaWogPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IDQ2
ZTdmNzZhNjU1My4uMWRhZjQwMjliNTY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjE1Myw2ICsyMTUzLDEx
IEBAIGJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBk
Y19zdGF0ZSAqY29udGV4dCwKIAkJfSBlbHNlCiAJCQluZWVkX3NwbGl0ID0gY29udGV4dC0+Yndf
Y3R4LmRtbC52YmEuTm9PZkRQUFt2bGV2ZWxdW2NvbnRleHQtPmJ3X2N0eC5kbWwudmJhLm1heE1w
Y0NvbWJdW3BpcGVfaWR4XSA9PSAyOwogCisJCS8qIFdlIGRvIG5vdCBzdXBwb3J0IG1wbyArIG9k
bSBhdCB0aGUgbW9tZW50ICovCisJCWlmIChoc3BsaXRfcGlwZSAmJiBoc3BsaXRfcGlwZS0+cGxh
bmVfc3RhdGUgIT0gcGlwZS0+cGxhbmVfc3RhdGUKKwkJCQkmJiBjb250ZXh0LT5id19jdHguZG1s
LnZiYS5PRE1Db21iaW5lRW5hYmxlZFtwaXBlX2lkeF0pCisJCQlnb3RvIHZhbGlkYXRlX2ZhaWw7
CisKIAkJaWYgKG5lZWRfc3BsaXQzZCB8fCBuZWVkX3NwbGl0IHx8IGZvcmNlX3NwbGl0KSB7CiAJ
CQlpZiAoIWhzcGxpdF9waXBlIHx8IGhzcGxpdF9waXBlLT5wbGFuZV9zdGF0ZSAhPSBwaXBlLT5w
bGFuZV9zdGF0ZSkgewogCQkJCS8qIHBpcGUgbm90IHNwbGl0IHByZXZpb3VzbHkgbmVlZHMgc3Bs
aXQgKi8KQEAgLTIxNjgsMTEgKzIxNzMsNyBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0
aChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAJCQkJCWdvdG8gdmFs
aWRhdGVfZmFpbDsKIAkJCQlwaXBlX3NwbGl0X2Zyb21baHNwbGl0X3BpcGUtPnBpcGVfaWR4XSA9
IHBpcGVfaWR4OwogCQkJfQotCQl9IGVsc2UgaWYgKGhzcGxpdF9waXBlICYmIGhzcGxpdF9waXBl
LT5wbGFuZV9zdGF0ZSAhPSBwaXBlLT5wbGFuZV9zdGF0ZSkgewotCQkJLyogV2UgZG8gbm90IHN1
cHBvcnQgbXBvICsgb2RtIGF0IHRoZSBtb21lbnQgKi8KLQkJCWlmIChjb250ZXh0LT5id19jdHgu
ZG1sLnZiYS5PRE1Db21iaW5lRW5hYmxlZFtwaXBlX2lkeF0pCi0JCQkJZ290byB2YWxpZGF0ZV9m
YWlsOwotCQl9IGVsc2UgaWYgKGhzcGxpdF9waXBlKSB7CisJCX0gZWxzZSBpZiAoaHNwbGl0X3Bp
cGUgJiYgaHNwbGl0X3BpcGUtPnBsYW5lX3N0YXRlID09IHBpcGUtPnBsYW5lX3N0YXRlKSB7CiAJ
CQkvKiBtZXJnZSBzaG91bGQgYWxyZWFkeSBoYXZlIGJlZW4gZG9uZSAqLwogCQkJQVNTRVJUKDAp
OwogCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
