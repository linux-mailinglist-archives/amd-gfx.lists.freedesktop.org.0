Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD248F3E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382F89BAC;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDE989B96
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:27 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so12193293qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+lqp2RnD3Yxjx7KMCmJ4oPJ3fQRUH/h45r8zdxwCXQ=;
 b=sxxjtz6er0NH7dmGGmkKBTft9KA2NYvW95g7sAuhFUB3yezwvNkV+KFa0EWbQnAPeS
 21FLyhD+HZ3834jTFcJ/hlFYeBbcFxRHLLtcoc3VBaPdPe5yFAVZyow4t/MCj160Jg5T
 T2+aOIfd1PobraiNIM7cnerFX7+67NNK2CMo/aN3ZnqYe7zY9VCNLZG1TvB+2LExRqCT
 oF3WgVbgkd7q5caEdqm9EEhYlWMMuQRZ0h1gV+1ltIaWVgOf3pZUbKBTI8QLBDr8XdTn
 oI9hjk20/aS0NYTUBcUY4q46Bjiezd+vQl9mdI+LozeCmgSJGd8SnCLjN0UWFX0oox/Y
 GSug==
X-Gm-Message-State: APjAAAUxmPbNhBC0K8kiOr1JMinIgHRZNHJYQkAz7K7hNylNEUyTjiex
 4bdu7DEgmRtPpJ1apl9PqPbRK4Q9qdA=
X-Google-Smtp-Source: APXvYqx//V0R1YFLGkosgIxXmM6qd+inGQfIK3TZWA3y953teiWt+B8moRZm4I/vDtpTLC1LFq79xw==
X-Received: by 2002:ac8:303c:: with SMTP id f57mr96344741qte.294.1560799886549; 
 Mon, 17 Jun 2019 12:31:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 214/459] drm/amdgpu/mes10.1: implement MES firmware backdoor
 loading
Date: Mon, 17 Jun 2019 14:29:41 -0500
Message-Id: <20190617193106.18231-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+lqp2RnD3Yxjx7KMCmJ4oPJ3fQRUH/h45r8zdxwCXQ=;
 b=Z12a37Jmc1HANalbK7AXvP1aK1C/8FcJ+E4fOyXTBVRrYx6/IsW8zqWQIXMM32QTIP
 Cltfe9DERHE/SeDdiG1qpjTrLRGO+eYW1rnqhDvDavNiCyr0aAqAGC7eDn/2d0cMxc8k
 sW8jNwVBsuEz5Qt7tre/4wAD9WNnICh7WjeMsazicEQgO2XXAntDkXAAKMVBahM2ze1+
 WGouaV3PXXdE0WMF1bkaNyBRJcv6NLoy3gRC49b+2WXUlvAdsEjfAu3KcdRjXh+YCUuO
 uP/+XpNotX0IhIngXudEkWsazp/MZI1IAEackuJUg9A5I+Ur0Kqjq9sDFYhC5tW/mzuB
 /Ohw==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IGltcGxlbWVudHMgTUVTIGZp
cm13YXJlIGJhY2tkb29yIGxvYWRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2su
WGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMgfCA2NyAr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCmluZGV4IGVkZjFmYmMxZDAy
ZC4uNWM1ZDI3Y2QxMDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
ZXNfdjEwXzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYwpA
QCAtMjQsNiArMjQsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlLmg+CiAjaW5jbHVkZSAi
YW1kZ3B1LmgiCiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCisjaW5jbHVkZSAibnYuaCIKKyNp
bmNsdWRlICJnYy9nY18xMF8xXzBfb2Zmc2V0LmgiCisjaW5jbHVkZSAiZ2MvZ2NfMTBfMV8wX3No
X21hc2suaCIKIAogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX21lcy5iaW4iKTsKIApA
QCAtMTgwLDYgKzE4Myw3MCBAQCBzdGF0aWMgdm9pZCBtZXNfdjEwXzFfZnJlZV91Y29kZV9idWZm
ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJICAgICAgKHZvaWQgKiopJmFkZXYt
Pm1lcy51Y29kZV9md19wdHIpOwogfQogCisvKiBUaGlzIGZ1bmN0aW9uIGlzIGZvciBiYWNrZG9v
ciBNRVMgZmlybXdhcmUgKi8KK3N0YXRpYyBpbnQgbWVzX3YxMF8xX2xvYWRfbWljcm9jb2RlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWludCByOworCXVpbnQzMl90IGRhdGE7CisK
KwlpZiAoIWFkZXYtPm1lcy5mdykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyID0gbWVzX3YxMF8x
X2FsbG9jYXRlX3Vjb2RlX2J1ZmZlcihhZGV2KTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisKKwly
ID0gbWVzX3YxMF8xX2FsbG9jYXRlX3Vjb2RlX2RhdGFfYnVmZmVyKGFkZXYpOworCWlmIChyKSB7
CisJCW1lc192MTBfMV9mcmVlX3Vjb2RlX2J1ZmZlcnMoYWRldik7CisJCXJldHVybiByOworCX0K
KworCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9NRVNfSUNfQkFTRV9DTlRMLCAwKTsKKworCW11
dGV4X2xvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOworCS8qIG1lPTMsIHBpcGU9MCwgcXVldWU9MCAq
LworCW52X2dyYm1fc2VsZWN0KGFkZXYsIDMsIDAsIDAsIDApOworCisJLyogc2V0IHVjb2RlIHN0
YXJ0IGFkZHJlc3MgKi8KKwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfTUVTX1BSR1JNX0NOVFJf
U1RBUlQsCisJCSAgICAgKHVpbnQzMl90KShhZGV2LT5tZXMudWNfc3RhcnRfYWRkcikgPj4gMik7
CisKKwkvKiBzZXQgdWNvZGUgZmltcndhcmUgYWRkcmVzcyAqLworCVdSRUczMl9TT0MxNShHQywg
MCwgbW1DUF9NRVNfSUNfQkFTRV9MTywKKwkJICAgICBsb3dlcl8zMl9iaXRzKGFkZXYtPm1lcy51
Y29kZV9md19ncHVfYWRkcikpOworCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9NRVNfSUNfQkFT
RV9ISSwKKwkJICAgICB1cHBlcl8zMl9iaXRzKGFkZXYtPm1lcy51Y29kZV9md19ncHVfYWRkcikp
OworCisJLyogc2V0IHVjb2RlIGluc3RydWN0aW9uIGNhY2hlIGJvdW5kYXJ5IHRvIDJNLTEgKi8K
KwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfTUVTX01JQk9VTkRfTE8sIDB4MUZGRkZGKTsKKwor
CS8qIHNldCB1Y29kZSBkYXRhIGZpcm13YXJlIGFkZHJlc3MgKi8KKwlXUkVHMzJfU09DMTUoR0Ms
IDAsIG1tQ1BfTUVTX01EQkFTRV9MTywKKwkJICAgICBsb3dlcl8zMl9iaXRzKGFkZXYtPm1lcy5k
YXRhX2Z3X2dwdV9hZGRyKSk7CisJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19NREJBU0Vf
SEksCisJCSAgICAgdXBwZXJfMzJfYml0cyhhZGV2LT5tZXMuZGF0YV9md19ncHVfYWRkcikpOwor
CisJLyogU2V0IDB4M0ZGRkYgKDI1NkstMSkgdG8gQ1BfTUVTX01EQk9VTkRfTE8gKi8KKwlXUkVH
MzJfU09DMTUoR0MsIDAsIG1tQ1BfTUVTX01EQk9VTkRfTE8sIDB4M0ZGRkYpOworCisJLyogaW52
YWxpZGF0ZSBJQ0FDSEUgKi8KKwlkYXRhID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19J
Q19PUF9DTlRMKTsKKwlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBDUF9NRVNfSUNfT1BfQ05U
TCwgUFJJTUVfSUNBQ0hFLCAwKTsKKwlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBDUF9NRVNf
SUNfT1BfQ05UTCwgSU5WQUxJREFURV9DQUNIRSwgMSk7CisJV1JFRzMyX1NPQzE1KEdDLCAwLCBt
bUNQX01FU19JQ19PUF9DTlRMLCBkYXRhKTsKKworCS8qIHByaW1lIHRoZSBJQ0FDSEUuICovCisJ
ZGF0YSA9IFJSRUczMl9TT0MxNShHQywgMCwgbW1DUF9NRVNfSUNfT1BfQ05UTCk7CisJZGF0YSA9
IFJFR19TRVRfRklFTEQoZGF0YSwgQ1BfTUVTX0lDX09QX0NOVEwsIFBSSU1FX0lDQUNIRSwgMSk7
CisJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUNQX01FU19JQ19PUF9DTlRMLCBkYXRhKTsKKworCW52
X2dyYm1fc2VsZWN0KGFkZXYsIDAsIDAsIDAsIDApOworCW11dGV4X3VubG9jaygmYWRldi0+c3Ji
bV9tdXRleCk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBtZXNfdjEwXzFfc3dfaW5p
dCh2b2lkICpoYW5kbGUpCiB7CiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
