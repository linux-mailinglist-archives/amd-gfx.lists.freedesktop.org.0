Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49524B8AA
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 14:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3356E3A4;
	Wed, 19 Jun 2019 12:34:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB166E3A6
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 12:34:17 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Computer111.attlocal.net ([99.116.190.167]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N95iR-1iiaVJ3xsF-0165zN; Wed, 19 Jun 2019 14:29:07 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Removing unnecessary initialization of drm_plane struct
 type
Date: Wed, 19 Jun 2019 07:28:53 -0500
Message-Id: <20190619122857.12603-1-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:XfU2EhZhIx16NCdKxHS79Rb2+uVJnZJlw/Im95PrF8/+dVN/mGd
 M5cB7s1w3cx+bjc4riO4cMYv+3QiuqYbRXFdOWOAU4U3GIJmO5CTziL1qnPveVs6ahQiifF
 XfP49FkxGIDGjqcIPAvH3s7oS+sa+f2mzae6WQry3ZJX+B05lCl7p5f9DhIzBKWrF9TNRF+
 Sj4k2FxpbH6Y8IX867iwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ppHRBbOcl0c=:8CkxXNKL/SsIjS5qwpkCIq
 6K4Y78pGMzButgfYZDqT+5adyUVKyNbCXUKG7KL9bCYjGjMovSrPLqWqM+bQm3Fg4ZLIDmoEI
 ZRfe4yoNKJno/0Wzvh80+Z9m1/rSkqSuEQ5vNddFxjj/b3uKL2UOScEdFKbrxgPmNywcKRDpC
 yqbddXxro/JsVpFPfGHoI1T/ZAw9uyRY2iPaWbMHQ87DjqDC5qIDD8ujAGRN1CnjDe3aZFE3p
 Fu+a6h5PFq2vTWi38vAGHfxothdUnD7atM35PpvuZfpvGyu/GpY8tGJvH6Ty4tLSCehDFpjMY
 nWBvBmVmBXp7oWpUx136Ie5bUUtuMspD5AB6APNHyIFf9ENnXjcXm0c6DdyjvoUdderlSBGsJ
 u68Wag0xe2LI6OlPq64s47Eu7dYsjSl3WV8HeMQrjb514HTN/D26HON56+yAcLpi+xV8KIRbm
 mfDvd8Ba7qNTar7pGTmDLic/7Z1/u+GfAx011ax8wU221WBvIPZIw1/25NrzEexCc5lAvJ+G5
 kTvDEBNlPjYHnf/kzXzafmrAgoIKUhBD++mwYiPgEG1gDbIsojuz2EwHcQ4udlldOr/Fc5DUC
 bxIyjVAlsnxAzpsQW+IdESF3GfO0stcGwxl0l2R//Ede6abBnonRxKwOX53ez+ejGRA3pXYI8
 Or+wPr8DDHpkCQSD5GxkkwR5D7iAjM9h03Q982qFMR9LNC0gxQ6VTJsS45EkT4FHZSfHg4YfJ
 3YdIAyulu4Qt9qWJGd51ixUV9nT3SQgYHdcwJDWa7BjLty/zaBkeyNiwhtTxOzDPz0SuV2RST
 Ss2krVAkCF8sKI26LDkPp9cewNre/h4fNAMwqIkhhqgia7EKkdg/sPV784V8DFxCuDky8ke74
 VpFWcOaiCBAL2DVvtHqj92TmYU6bM3gaa/p8S6NN48+KNrn5oIYXdkFmWD3dggCTh4U7BnHeB
 aemPa0MwJ78LugJRQttE1+Ad+lAWxEGM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560947656;
 bh=r+iaUhXYBGYF5Vj/PywvKX5VE+SPkVAT6pAPeJfg3CQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MXIf2cSf+/Spcrf7Lkbpw0lYFWfwSmELVuK1autBWGzXEH+ly+EeBC0gdHNl+WLRu
 3b9Mnp20D2D4yxY3Rd3eWsL0KCrceIrchT6NacWb87H0Y/OBGHzCCGr8D9u0d6F138
 zn0p5od93ORZf9hHJMMhaJskKs7gm4jjNJ8FfwBw=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+CgpQYXRj
aCAxIGlzIHRvIHVzZSB1aW50MzJfdCB0eXBlIGZvciBwb3NzaWJsZV9jcnRjcy4gIFBhdGNoIDIg
dGhyb3VnaCA0CnJlbW92ZXMgdW5uZWNlc3Nhcnkgd3JpdGUgdG8gdHlwZSBmaWVsZCBvZiBkcm1f
cGxhbmUgc3RydWN0Lgpkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoKSBpbml0aWFsaXplcyB0eXBl
IGZpZWxkLCBzbyBpbml0aWFsaXppbmcgaXQKb3V0c2lkZSBvZiBEUk0gY29yZSBpcyB1bm5lY2Vz
c2FyeS4gIEkgaGF2ZSBub3QgdGVzdGVkIHRoZSBwYXRjaGVzCm15c2VsZiBzaW5jZSBJIGRvIG5v
dCBoYXZlIHRoZSBlcXVpcG1lbnQgc2V0IHVwIHRvIHJ1biBBTURHUFUgRFJNLgpJIGhvcGUgc29t
ZW9uZSBmcm9tIEFNRCBjYW4gdGVzdCB0aGUgcGF0Y2hlcy4gIFBhdGNoIDIgdGhyb3VnaCA0IGRv
CmRlcGVuZCBvbiBwYXRjaCAxLgoKLS0KS2V2aW4gQnJhY2UgKDQpOgogIGRybS9hbWRncHU6IHVp
bnQzMl90IGZvciBhbWRncHVfZG1fcGxhbmVfaW5pdCgpIHBvc3NpYmxlX2NydGNzCiAgICBwYXJh
bWV0ZXIKICBkcm0vYW1kZ3B1OiBSZW5hbWUgcGxhbmVfdHlwZSBwYXJhbWV0ZXIgb2YgaW5pdGlh
bGl6ZV9wbGFuZSgpIHRvIHR5cGUKICBkcm0vYW1kZ3B1OiBBZGQgdHlwZSBwYXJhbWV0ZXIgdG8g
YW1kZ3B1X2RtX3BsYW5lX2luaXQoKQogIGRybS9hbWRncHU6IFJlbW92ZSB1bm5lY2Vzc2FyeSB3
cml0ZSB0byB0eXBlIGZpZWxkIG9mIGRybV9wbGFuZSBzdHJ1Y3QKCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
