Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293D3AC3B
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 00:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253289167;
	Sun,  9 Jun 2019 22:08:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AAE89167;
 Sun,  9 Jun 2019 22:08:30 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id p24so5239925lfo.6;
 Sun, 09 Jun 2019 15:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T75jWP+SB3oggHEn1Rb1CXVkDFsSJf10OxQNrTF6TUY=;
 b=I1uVodSGqpPYO5nfTevOZQveVS5pojP5RXVux9Vm83NuSoxXKIJCObnArqpPaAJZ1M
 dcY8N+KQgadIgYsoUSMzS3svQ9VYGXQF4ojADijyMPIq1i8RCsCb/btl1dloC9uKQgfH
 47opgwKQg/mg0POcB+SPZLTlKustLPn/VHSVEigXUv+JLQMCcvsL8W4SvlHw5FbMgtpj
 Horju3pSoG5hm827+gt4SdX0S1o+hIzsftvYSG8xPIJjO/SjU7LI635Jo6zmMMvOXUjd
 erNxc2vIcGOThJl3yRlaqFXpj0Y6T3nD2TBC2EpLJ115Wq6cFcsQoCrVG9OTd1S7b2FJ
 +aAg==
X-Gm-Message-State: APjAAAW1MzNZzPX5n6/eyHmFnR+yqhiIdcX9yckukfkLzJxpdCiy153e
 0onEOgoVWecNQr7yy8yPJV6qwjfhNDs=
X-Google-Smtp-Source: APXvYqzF6elDJZFBxaw3tZG6Oo+7omsuh4CDZ2yZOKBApbC703RoknCjwjPkcl8vEeP2GrjMxkqZ0w==
X-Received: by 2002:ac2:5324:: with SMTP id f4mr15516486lfh.156.1560118108570; 
 Sun, 09 Jun 2019 15:08:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v12sm225476ljk.22.2019.06.09.15.08.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:08:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 03/10] drm/amd: drop use of drmp.h in os_types.h
Date: Mon, 10 Jun 2019 00:07:50 +0200
Message-Id: <20190609220757.10862-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190609220757.10862-1-sam@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T75jWP+SB3oggHEn1Rb1CXVkDFsSJf10OxQNrTF6TUY=;
 b=IqeKcY+3MbEy2NDz10dXaxV6uyHAYA2MFtWt2VvNuoRBQObKTiKXaa+zR+dxju7rGk
 FZXaejA0o9p+wukR2UOGKVEuJNnuMcv9Qc+DSsaRU6UxnyGA6myh05U6Goe1L9YLrcUL
 JGQDwKHggO1Fz7JW5L2lH39E+2k9cn3TMn+jsxV/YA4Pl5erqNuybsjCOshS/ZvYnARA
 WCoMnL70LpBz7BfB7xfk/DkfiRed+M9M7ewKbeWhH4pr4bnJBce6M7ilTvAV1gOZcWPV
 oAWM+op360sU5GkAvSahBJue8dtiBLIRXHFWWSp5unBEmAgdMaYnZ6/nLE5BjnWwUwO1
 1/4A==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGZyb20gZGlzcGxheS9kYy9vc190eXBl
cy5oCgpGaXggYWxsIGZhbGxvdXQgYWZ0ZXIgdGhpcyBjaGFuZ2UuCk1vc3Qgb2YgdGhlIGZpeGVz
IHdhcyBhZGRpbmcgYSBtaXNzaW5nIGluY2x1ZGUgb2Ygdm1hbGxvYy5oLgoKU2lnbmVkLW9mZi1i
eTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQxLlpob3VA
YW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvYmFzaWNzL3ZlY3Rvci5jICAgICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIuYyAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgICAgICAgICAgfCAyICsrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jICAgICAgICAgICAgICAgICAg
fCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5j
ICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19y
ZXNvdXJjZS5jICAgICAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfc2luay5jICAgICAgICAgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNlLmMgICAgICAgICAgfCAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jICAgICAgICAgICAgfCAy
ICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyAgICAgICAg
ICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19t
Z3IuYyAgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2Uv
ZGNlX2Nsb2NrX3NvdXJjZS5jICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2RtY3UuYyAgICAgICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfaXBwLmMgICAgICAgICAgICAgIHwgMiArKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmMgICAgIHwgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYyAgICAgICAgICAgICAg
fCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNv
dXJjZS5jICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfY29tcHJlc3Nvci5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTEyL2RjZTExMl9jb21wcmVzc29yLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgICB8IDIgKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgICB8IDIg
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5j
ICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9j
bGtfbWdyLmMgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9pcHAuYyAgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9saW5rX2VuY29kZXIuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wcC5jICAgICAgICAgIHwgMiArKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgICAgIHwgMiArKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19iYXNlLmMgICAgICAgICAg
IHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19zZXJ2aWNl
LmMgICAgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdf
ZGRjLmMgICAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Z3Bpby9od19mYWN0b3J5LmMgICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZ3Bpby9od19ocGQuYyAgICAgICAgICAgICAgfCAyICsrCiAuLi4vZHJtL2FtZC9k
aXNwbGF5L2RjL2lycS9kY2UxMTAvaXJxX3NlcnZpY2VfZGNlMTEwLmMgICAgfCAyICsrCiAuLi4v
ZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9kY2UxMjAvaXJxX3NlcnZpY2VfZGNlMTIwLmMgICAgfCAy
ICsrCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNlODAvaXJxX3NlcnZpY2VfZGNl
ODAuYyAgfCAyICsrCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMTAvaXJxX3Nl
cnZpY2VfZGNuMTAuYyAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJx
L2lycV9zZXJ2aWNlLmMgICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvb3NfdHlwZXMuaCAgICAgICAgICAgICAgICAgfCA4ICsrKysrLS0tCiAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy92aXJ0dWFsL3ZpcnR1YWxfbGlua19lbmNvZGVyLmMgfCAyICsrCiAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL3ZpcnR1YWwvdmlydHVhbF9zdHJlYW1fZW5jb2Rlci5jICAg
fCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9n
YW1tYS5jICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvZnJl
ZXN5bmMvZnJlZXN5bmMuYyAgIHwgMiArKwogNDQgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmFzaWNzL3ZlY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jhc2ljcy92ZWN0b3IuYwppbmRleCBkMjhlOWNmMGU5NjEuLjhmOTNkMjVmOTFlZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy92ZWN0b3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL3ZlY3Rvci5jCkBAIC0yMyw2
ICsyMyw4IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRl
ICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1ZGUgImluY2x1ZGUvdmVjdG9yLmgiCiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmMKaW5kZXgg
ZmQ1MjY2YTU4Mjk3Li41ZTFiODQ5Njg0YTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jCkBAIC0yMyw2ICsyMyw4IEBACiAgKgog
ICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5o
IgogCiAjaW5jbHVkZSAiT2JqZWN0SUQuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwppbmRleCBmM2FhN2I1M2QyYWEuLjcxMDhkNTFhOWM1
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9j
YWxjcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2Fs
Y3MuYwpAQCAtMjMsNiArMjMsOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5o
PgorCiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNsdWRlICJkY2VfY2FsY3MuaCIKICNp
bmNsdWRlICJkYy5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5k
ZXggMThjNzc1YTk1MGNjLi4wM2RlYzQwZGUzNjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGMuYwpAQCAtMjIsNiArMjIsOCBAQAogICogQXV0aG9yczogQU1ECiAgKi8K
IAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAK
ICNpbmNsdWRlICJkYy5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19kZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmtfZGRjLmMKaW5kZXggZjAyMDkyYTBkYzc2Li5lZWNjNjMxY2E0ZjggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYwpA
QCAtMjMsNiArMjMsOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAj
aW5jbHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCiAjaW5jbHVk
ZSAiZ3Bpb19zZXJ2aWNlX2ludGVyZmFjZS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXggZWFjNzE4NmU0ZjA4Li41YWQxYzYy
ZTllNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
cmVzb3VyY2UuYwpAQCAtMjIsNiArMjIsOSBAQAogICogQXV0aG9yczogQU1ECiAgKgogICovCisK
KyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCiAj
aW5jbHVkZSAicmVzb3VyY2UuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3NpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3NpbmsuYwppbmRleCA5OTcxYjUxNWMzZWIuLjVjYmZkZjFjNGIxMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc2luay5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3NpbmsuYwpAQCAtMjMsNiArMjMs
OCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAjaW5jbHVkZSAiZG1f
c2VydmljZXMuaCIKICNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCiAjaW5jbHVkZSAiY29yZV90eXBl
cy5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
c3RyZWFtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0u
YwppbmRleCAxZGMzNDkyZjAyYTEuLjdhNDZjYzQ0MTRkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKQEAgLTI0LDYgKzI0LDcgQEAKICAq
LwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAK
ICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1ZGUgImRjLmgiCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNlLmMKaW5kZXggYTVlODZmOWIx
NDhmLi44N2IzYjAzYzM1NTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX3N1cmZhY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19zdXJmYWNlLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1
ZGUgPGxpbnV4L21tLmg+CisKIC8qIERDIGludGVyZmFjZSAocHVibGljKSAqLwogI2luY2x1ZGUg
ImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVkZSAiZGMuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9hdWRpby5jCmluZGV4IDdmNmQ3MjQ2ODZmMS4uOWIwNzhhNzFk
ZTJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
dWRpby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1ZGlv
LmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
KwogI2luY2x1ZGUgInJlZ19oZWxwZXIuaCIKICNpbmNsdWRlICJkY2VfYXVkaW8uaCIKICNpbmNs
dWRlICJkY2UvZGNlXzExXzBfZC5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9hdXguYwppbmRleCAwODYzNzE5YjBjODUuLmYyMjk1ZTc4MDAzMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMKQEAgLTI0LDYgKzI0LDcg
QEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+CiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1ZGUgImNvcmVfdHlwZXMuaCIK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19t
Z3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19tZ3IuYwpp
bmRleCA5NjM2ODYzODA3MzguLjI5ZDY5ZGZjOTg0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsa19tZ3IuYwpAQCAtMjMsNiArMjMsOCBAQAogICoK
ICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAjaW5jbHVkZSAiZGNlX2Nsa19tZ3Iu
aCIKIAogI2luY2x1ZGUgInJlZ19oZWxwZXIuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMKaW5kZXggZjcwNDM3YWFlOGUw
Li41ODg2NGZjYTNkYTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCkBAIC0yMyw2ICsyMyw4IEBACiAgKgogICovCiAK
KyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2RtY3UuYwppbmRleCBh
OGMyY2YyNjBjODQuLjljNzAxYWIyZGJmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfZG1jdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX2RtY3UuYwpAQCAtMjQsNiArMjQsNyBAQAogICovCiAKICNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAogI2luY2x1ZGUgImNv
cmVfdHlwZXMuaCIKICNpbmNsdWRlICJsaW5rX2VuY29kZXIuaCIKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2lwcC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaXBwLmMKaW5kZXggNWQ5NTA2YjNkNDZiLi5jZTMwZGJm
NTc5ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNl
X2lwcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2lwcC5j
CkBAIC0yMyw2ICsyMyw4IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisK
ICNpbmNsdWRlICJkY2VfaXBwLmgiCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgogI2luY2x1ZGUg
ImRtX3NlcnZpY2VzLmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9saW5rX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2xpbmtfZW5jb2Rlci5jCmluZGV4IDEwMzdkMmE3MmYzZi4uODUyN2NjZTgxYzZm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9saW5r
X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9s
aW5rX2VuY29kZXIuYwpAQCAtMjQsNiArMjQsNyBAQAogICovCiAKICNpbmNsdWRlIDxsaW51eC9k
ZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAogI2luY2x1ZGUgInJlZ19oZWxwZXIu
aCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
b3BwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9vcHAuYwppbmRl
eCA4NzA5Mzg5NGVhOWUuLjUxMDgxZDlhZTNmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfb3BwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2Vfb3BwLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVk
ZSAiYmFzaWNzL2NvbnZlcnNpb24uaCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKaW5kZXggZTkzOGJmOTk4NmQz
Li44NzBiZGE1N2RjMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYwpAQCAtMjIsNiArMjIsOSBAQAogICogQXV0
aG9yczogQU1ECiAgKgogICovCisKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRl
ICJkbV9zZXJ2aWNlcy5oIgogCiAjaW5jbHVkZSAibGlua19lbmNvZGVyLmgiCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29y
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVz
c29yLmMKaW5kZXggMTIwODNiYjhlZjAyLi43MmI1ODBhNGViODUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNzb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9jb21wcmVzc29y
LmMKQEAgLTI0LDYgKzI0LDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNv
dXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVz
b3VyY2UuYwppbmRleCBkY2QwNGU5ZWE3NmIuLjRkOWYyMTk3MzhiYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5j
CkBAIC0yMyw2ICsyMyw4IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisK
ICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCiAjaW5jbHVkZSAibGlua19lbmNvZGVyLmgiCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9j
b21wcmVzc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTEx
Ml9jb21wcmVzc29yLmMKaW5kZXggZjk4MTlkZjFkM2UyLi41MWNiNDVkOGI5YWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX2NvbXByZXNz
b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9j
b21wcmVzc29yLmMKQEAgLTI0LDYgKzI0LDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZGVs
YXkuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5o
IgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2Rj
ZTExMl9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMi9k
Y2UxMTJfcmVzb3VyY2UuYwppbmRleCBhNDgwYjE1ZjY4ODUuLjFiZmZmNDQwZTgwNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9y
ZXNvdXJjZS5jCkBAIC0yMyw2ICsyMyw4IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCiAjaW5jbHVkZSAibGlua19lbmNv
ZGVyLmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIw
L2RjZTEyMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEy
MC9kY2UxMjBfcmVzb3VyY2UuYwppbmRleCA2ZDQ5YzcxNDNjNjcuLmMyZmFlNTE1MGJjYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVz
b3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEy
MF9yZXNvdXJjZS5jCkBAIC0yNCw2ICsyNCw4IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMKaW5kZXgg
MjdkMGNjMzk0OTYzLi44M2M0Y2M4NTE2YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCkBAIC0yMyw2ICsyMyw4IEBA
CiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkY2UvZGNl
XzhfMF9kLmgiCiAjaW5jbHVkZSAiZGNlL2RjZV84XzBfc2hfbWFzay5oIgogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY2xrX21nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2Nsa19tZ3IuYwppbmRl
eCAyYjJkZTFkOTEzYzkuLjk4MDI4ZmJmNjdmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY2xrX21nci5jCkBAIC0yMyw2ICsyMyw4IEBA
CiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkY24xMF9j
bGtfbWdyLmgiCiAKICNpbmNsdWRlICJyZWdfaGVscGVyLmgiCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaXBwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaXBwLmMKaW5kZXggMDhkYjFlNmI1MTY2Li4w
ZTBjNjg1MDI0N2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9pcHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaXBwLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVkZSAiZGNuMTBf
aXBwLmgiCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCmluZGV4IDEw
MmQ5NjhhOGNkMy4uMGRmNzI5NDkyZGIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfbGlua19lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCkBAIC0yNCw2ICsy
NCw3IEBACiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CisjaW5jbHVkZSA8bGludXgv
c2xhYi5oPgogCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmMKaW5kZXggYWI5NThjZmYzYjc2Li5j
ZWM2OWNlY2Y1MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9vcHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfb3BwLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVkZSAiZGNuMTBf
b3BwLmgiCiAjaW5jbHVkZSAicmVnX2hlbHBlci5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYwppbmRleCA3ZWNjYjU0YzQy
MWQuLjZiOTdkNDVjNmViZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8K
IAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAj
aW5jbHVkZSAiZGMuaCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2dwaW8vZ3Bpb19iYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bp
by9ncGlvX2Jhc2UuYwppbmRleCBjZjc2ZWEyZDlmNWEuLmQwM2IzOGU4MGQ5YiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19iYXNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19iYXNlLmMKQEAgLTI3LDYg
KzI3LDggQEAKICAqIFByZS1yZXF1aXNpdGVzOiBoZWFkZXJzIHJlcXVpcmVkIGJ5IGhlYWRlciBv
ZiB0aGlzIHVuaXQKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAjaW5jbHVkZSAi
ZG1fc2VydmljZXMuaCIKIAogI2luY2x1ZGUgImluY2x1ZGUvZ3Bpb19pbnRlcmZhY2UuaCIKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2Vydmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19zZXJ2aWNlLmMK
aW5kZXggM2M2M2EzYzA0ZGJiLi5hN2ZhYjQ0ZjY2YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jCkBAIC0yNyw2ICsyNyw4IEBA
CiAgKiBQcmUtcmVxdWlzaXRlczogaGVhZGVycyByZXF1aXJlZCBieSBoZWFkZXIgb2YgdGhpcyB1
bml0CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZp
Y2VzLmgiCiAjaW5jbHVkZSAiaW5jbHVkZS9ncGlvX2ludGVyZmFjZS5oIgogI2luY2x1ZGUgImlu
Y2x1ZGUvZ3Bpb19zZXJ2aWNlX2ludGVyZmFjZS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZ3Bpby9od19kZGMuYwppbmRleCA4ZWJlYWJhZDdiYjcuLjI0MGNkZDhkOTY4OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZGRjLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZGRjLmMKQEAgLTI0
LDYgKzI0LDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRlIDxs
aW51eC9zbGFiLmg+CiAKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19mYWN0b3J5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19mYWN0b3J5LmMKaW5kZXggYzIwMjhjNDc0
NGE2Li5hOTc5NzJlYmQ0YjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9ncGlvL2h3X2ZhY3RvcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZ3Bpby9od19mYWN0b3J5LmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAKIC8qCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19ocGQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2h3X2hwZC5jCmluZGV4IDc4NGZlY2Nj
NTg1My4uNWUxMWQ3NDhlNmYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZ3Bpby9od19ocGQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Z3Bpby9od19ocGQuYwpAQCAtMjMsNiArMjMsOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgorCiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKIAogI2luY2x1ZGUgImluY2x1
ZGUvZ3Bpb190eXBlcy5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2lycS9kY2UxMTAvaXJxX3NlcnZpY2VfZGNlMTEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaXJxL2RjZTExMC9pcnFfc2VydmljZV9kY2UxMTAuYwppbmRleCA4Njk4N2Y1
ZThiZDUuLjFhNTgxYzQ2NDM0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2lycS9kY2UxMTAvaXJxX3NlcnZpY2VfZGNlMTEwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9kY2UxMTAvaXJxX3NlcnZpY2VfZGNlMTEwLmMKQEAgLTIz
LDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1
ZGUgImRtX3NlcnZpY2VzLmgiCiAKICNpbmNsdWRlICJpbmNsdWRlL2xvZ2dlcl9pbnRlcmZhY2Uu
aCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNlMTIw
L2lycV9zZXJ2aWNlX2RjZTEyMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2ly
cS9kY2UxMjAvaXJxX3NlcnZpY2VfZGNlMTIwLmMKaW5kZXggNzUwYmEwYWI0MTA2Li4xNTM4MDMz
NmNiNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNl
MTIwL2lycV9zZXJ2aWNlX2RjZTEyMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pcnEvZGNlMTIwL2lycV9zZXJ2aWNlX2RjZTEyMC5jCkBAIC0yMyw2ICsyMyw4IEBACiAg
KgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNl
cy5oIgogCiAjaW5jbHVkZSAiaW5jbHVkZS9sb2dnZXJfaW50ZXJmYWNlLmgiCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2RjZTgwL2lycV9zZXJ2aWNlX2Rj
ZTgwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2RjZTgwL2lycV9zZXJ2
aWNlX2RjZTgwLmMKaW5kZXggZGUyMThmZTg0YTQzLi4yODFmZWU4YWQxZTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNlODAvaXJxX3NlcnZpY2VfZGNl
ODAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2RjZTgwL2lycV9z
ZXJ2aWNlX2RjZTgwLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAKICNpbmNsdWRlICJpbmNs
dWRlL2xvZ2dlcl9pbnRlcmZhY2UuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9pcnEvZGNuMTAvaXJxX3NlcnZpY2VfZGNuMTAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMTAvaXJxX3NlcnZpY2VfZGNuMTAuYwppbmRleCAxMGFj
NmRlZmY1ZmYuLmViZjQ4M2UzZjA5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2lycS9kY24xMC9pcnFfc2VydmljZV9kY24xMC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMTAvaXJxX3NlcnZpY2VfZGNuMTAuYwpAQCAtMjMs
NiArMjMsOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAjaW5jbHVk
ZSAiZG1fc2VydmljZXMuaCIKIAogI2luY2x1ZGUgImluY2x1ZGUvbG9nZ2VyX2ludGVyZmFjZS5o
IgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9pcnFfc2Vy
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9pcnFfc2VydmljZS5j
CmluZGV4IDYwNGJlYTAxZmMxMy4uMDg3ODU1MGE4MTc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaXJxL2lycV9zZXJ2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9pcnFfc2VydmljZS5jCkBAIC0yMyw2ICsyMyw4IEBACiAg
KgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKICNpbmNsdWRlICJkbV9zZXJ2aWNl
cy5oIgogCiAjaW5jbHVkZSAiaW5jbHVkZS9pcnFfc2VydmljZV9pbnRlcmZhY2UuaCIKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9vc190eXBlcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL29zX3R5cGVzLmgKaW5kZXggYzBkOWYzMzJiYWVkLi4z
MGVjODBhYzZmYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9v
c190eXBlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9vc190eXBlcy5o
CkBAIC0yNiwxMSArMjYsMTMgQEAKICNpZm5kZWYgX09TX1RZUEVTX0hfCiAjZGVmaW5lIF9PU19U
WVBFU19IXwogCi0jaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgorI2luY2x1ZGUgPGxpbnV4L2tn
ZGIuaD4KKyNpbmNsdWRlIDxsaW51eC9rcmVmLmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4K
LSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogCi0jaW5jbHVkZSA8bGludXgva3JlZi5oPgorI2luY2x1
ZGUgPGFzbS9ieXRlb3JkZXIuaD4KKworI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIAogI2lu
Y2x1ZGUgImNnc19jb21tb24uaCIKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL3ZpcnR1YWwvdmlydHVhbF9saW5rX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy92aXJ0dWFsL3ZpcnR1YWxfbGlua19lbmNvZGVyLmMKaW5kZXggMWMw
NzliYTM3YzMwLi4zNDY0YjJkNWI4OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy92aXJ0dWFsL3ZpcnR1YWxfbGlua19lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL3ZpcnR1YWwvdmlydHVhbF9saW5rX2VuY29kZXIuYwpAQCAt
MjMsNiArMjMsOCBAQAogICoKICAqLwogCisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgorCiAjaW5j
bHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNsdWRlICJkbV9zZXJ2aWNlc190eXBlcy5oIgogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvdmlydHVhbC92aXJ0dWFs
X3N0cmVhbV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvdmlydHVh
bC92aXJ0dWFsX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggZmRjZjllNjZkODUyLi40ODQwNDcxNTVh
YWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy92aXJ0dWFsL3Zp
cnR1YWxfc3RyZWFtX2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvdmlydHVhbC92aXJ0dWFsX3N0cmVhbV9lbmNvZGVyLmMKQEAgLTIzLDYgKzIzLDggQEAKICAq
CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2Vz
LmgiCiAjaW5jbHVkZSAidmlydHVhbF9zdHJlYW1fZW5jb2Rlci5oIgogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYwpp
bmRleCBhMTA1NTQxM2JhZGUuLjY3MDAxZmNhNjg4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCkBAIC0yMyw2
ICsyMyw5IEBACiAgKgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9tbS5oPgorI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRjLmgiCiAjaW5jbHVkZSAib3BwLmgiCiAjaW5jbHVk
ZSAiY29sb3JfZ2FtbWEuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jCmluZGV4IDE5YjFlYWViZTQ4NC4uN2MyMDE3
MWEzYjZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9m
cmVlc3luYy9mcmVlc3luYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMKQEAgLTIzLDYgKzIzLDggQEAKICAqCiAgKi8KIAorI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4KKwogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVk
ZSAiZGMuaCIKICNpbmNsdWRlICJtb2RfZnJlZXN5bmMuaCIKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
