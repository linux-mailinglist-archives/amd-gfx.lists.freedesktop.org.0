Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D551A2B50B3
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77576EA17;
	Mon, 16 Nov 2020 19:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2AD89FA6
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 17:30:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so19595313wrb.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEdGEUBcwEa3ohTuW8AeQ9rcZ1jBGC5RhjVmwh26pbA=;
 b=MH+f+Sm0LLQRTh9iWew0DtLlUhhW8oHlovfsPBNmPolwL17i7Gu6Fbvk6lr0xb8TD2
 cQ9CuBZv66bQplnJ0/6Vbgdrj8mcy4+YI9UPVN0//u1bYGJnNVqYh7vKtey0uJfssem/
 ijoKKyRzcP0SK5uRDsOYJAby+Dc+8P0hyNFUc5Ts4HY4BwTRxReA3c2KBHmXTfBS0Acb
 78N1TWh8hkraQBZJxy6B4Llsw87P+vrg8vR8gnEm8yQ6n8j1j8zuLidX1kXjJMzbEDvx
 10ZluVMeRVZKYM5BpiHMhQaJvnt6nQ/5NN3L8XLbLxM2sZ/uY/ALE4qjbwZpoM9iHlz0
 I16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEdGEUBcwEa3ohTuW8AeQ9rcZ1jBGC5RhjVmwh26pbA=;
 b=d6Y182OE5mCFjOFWBHn4g8M8M2/pa8y2XHqJXaR/H502mHuQrmLKFpsmwvY/owtoUG
 8f6btgCgUyPwpxJVR0pFBxtDsa61Y7BBDB0H4Mh7rzXaY3/i/6JYswE/hSzSLMWhAXJf
 qJUCeD5xwct4oXv6LBrJha3/rIGsDZdeW2KwL8+4wqDDeHZNPKLEnVuAU24lhym/3d7J
 nDjZkD/BzoG07CWRHFXqHxLXg235hWSK/NGvwkT+HDSoBLrlVG/F+bSzYfcNCmMJ6fGq
 t1DE1EMe3f1Ail9KC+945J7XQW98ANjv9k9hb/YrnikMEfxpwLZMGSieNowgF7iwKYt4
 DWrw==
X-Gm-Message-State: AOAM531PcIgigShI/jAPhwBYRTkrVxUW0S6D1Y6KjAxiiC6rUdI6qhN+
 L8IRQlFxunamG/rtFBk5AuDtoWDE+Lu7FTLV
X-Google-Smtp-Source: ABdhPJw2Dw6Jy2671RSR5mnQeuBOPEihwV92+AMlw871nEIFzH7ZpKtVFzrpHYhIOTq4Iq0Myn0HqA==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr20339054wru.405.1605547820954; 
 Mon, 16 Nov 2020 09:30:20 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:30:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/43] drm/radeon/rv770: Move 'rv770_set_clk_bypass_mode'
 prototype to shared location
Date: Mon, 16 Nov 2020 17:29:31 +0000
Message-Id: <20201116173005.1825880-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173005.1825880-1-lee.jones@linaro.org>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 19:18:13 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ydjc3MC5jOjExMzg6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhydjc3MF9zZXRfY2xrX2J5cGFzc19tb2Rl4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KIDExMzggfCB2b2lkIHJ2NzcwX3NldF9jbGtfYnlwYXNzX21vZGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3I2MDAuYyAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcnY3NzAu
YyAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3J2NzcwLmggICAgIHwgMzUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ydjc3MC5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVy
Z3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmMKaW5kZXggMWYyYWNj
YTQzN2FiZC4uOWExZTI0MGIwNzIzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9ldmVyZ3JlZW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCkBA
IC0zMSw2ICszMSw3IEBACiAKICNpbmNsdWRlICJhdG9tLmgiCiAjaW5jbHVkZSAiYXZpdm9kLmgi
CisjaW5jbHVkZSAicnY3NzAuaCIKICNpbmNsdWRlICJldmVyZ3JlZW5fYmxpdF9zaGFkZXJzLmgi
CiAjaW5jbHVkZSAiZXZlcmdyZWVuX3JlZy5oIgogI2luY2x1ZGUgImV2ZXJncmVlbmQuaCIKQEAg
LTIyMyw3ICsyMjQsNiBAQCBleHRlcm4gdTMyIHNpX2dldF9jc2Jfc2l6ZShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7CiBleHRlcm4gdm9pZCBzaV9nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMyICpidWZmZXIpOwogZXh0ZXJuIHUzMiBjaWtf
Z2V0X2NzYl9zaXplKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIGNp
a19nZXRfY3NiX2J1ZmZlcihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdm9sYXRpbGUgdTMy
ICpidWZmZXIpOwotZXh0ZXJuIHZvaWQgcnY3NzBfc2V0X2Nsa19ieXBhc3NfbW9kZShzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldik7CiAKIHN0YXRpYyBjb25zdCB1MzIgZXZlcmdyZWVuX2dvbGRl
bl9yZWdpc3RlcnNbXSA9CiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2
MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCmluZGV4IDEyYTkxODMzNWFjN2Iu
LmYwOWI2ZGM1Y2JlYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCkBAIC00MCw2ICs0MCw3IEBACiAj
aW5jbHVkZSAiYXRvbS5oIgogI2luY2x1ZGUgImF2aXZvZC5oIgogI2luY2x1ZGUgInI2MDBkLmgi
CisjaW5jbHVkZSAicnY3NzAuaCIKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgogI2luY2x1ZGUgInJhZGVvbl9hdWRpby5oIgpAQCAtMTEyLDcgKzExMyw2IEBA
IHZvaWQgcjYwMF9maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgcjYwMF9p
cnFfZGlzYWJsZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiBzdGF0aWMgdm9pZCByNjAw
X3BjaWVfZ2VuMl9lbmFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogZXh0ZXJuIGlu
dCBldmVyZ3JlZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Ci1leHRl
cm4gdm9pZCBydjc3MF9zZXRfY2xrX2J5cGFzc19tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2KTsKIAogLyoKICAqIEluZGlyZWN0IHJlZ2lzdGVycyBhY2Nlc3NvcgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ydjc3MC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
djc3MC5jCmluZGV4IDIxZjY1M2FlMWUxYmIuLjg4ZTI5ZWJhYWQ0NjcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcnY3NzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3J2NzcwLmMKQEAgLTM5LDYgKzM5LDcgQEAKICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgogI2lu
Y2x1ZGUgInJhZGVvbl9hdWRpby5oIgogI2luY2x1ZGUgInJ2NzcwZC5oIgorI2luY2x1ZGUgInJ2
NzcwLmgiCiAKICNkZWZpbmUgUjcwMF9QRlBfVUNPREVfU0laRSA4NDgKICNkZWZpbmUgUjcwMF9Q
TTRfVUNPREVfU0laRSAxMzYwCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3J2
NzcwLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3J2NzcwLmgKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwMC4uYTNmMmJiNDQ5NzlmZQotLS0gL2Rldi9udWxsCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcnY3NzAuaApAQCAtMCwwICsxLDM1IEBACisvKiByYWRl
b25fcnY3NzAuaCAtLSBQcml2YXRlIGhlYWRlciBmb3IgcmFkZW9uIGRyaXZlciAtKi0gbGludXgt
YyAtKi0KKyAqCisgKiBDb3B5cmlnaHQgMTk5OSBQcmVjaXNpb24gSW5zaWdodCwgSW5jLiwgQ2Vk
YXIgUGFyaywgVGV4YXMuCisgKiBDb3B5cmlnaHQgMjAwMCBWQSBMaW51eCBTeXN0ZW1zLCBJbmMu
LCBGcmVtb250LCBDYWxpZm9ybmlhLgorICogQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyAqCisgKiBQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYQorICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhlIFNv
ZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24K
KyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0
cmlidXRlLCBzdWJsaWNlbnNlLAorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2Fy
ZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlCisgKiBTb2Z0d2FyZSBpcyBmdXJu
aXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorICoK
KyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNl
IChpbmNsdWRpbmcgdGhlIG5leHQKKyAqIHBhcmFncmFwaCkgc2hhbGwgYmUgaW5jbHVkZWQgaW4g
YWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUKKyAqIFNvZnR3YXJlLgor
ICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVO
VCBTSEFMTAorICogUFJFQ0lTSU9OIElOU0lHSFQgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElB
QkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhF
UiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorICogQVJJU0lO
RyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUg
VVNFIE9SIE9USEVSCisgKiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisgKgorICovCisKKyNp
Zm5kZWYgX19SQURFT05fUlY3NzBfSF9fCisjZGVmaW5lIF9fUkFERU9OX1JWNzcwX0hfXworCitz
dHJ1Y3QgcmFkZW9uX2RldmljZTsKKwordm9pZCBydjc3MF9zZXRfY2xrX2J5cGFzc19tb2RlKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKKworI2VuZGlmCQkJCS8qIF9fUkFERU9OX1JWNzcw
X0hfXyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
