Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255761EDF4B
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 10:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6A6E2F2;
	Thu,  4 Jun 2020 08:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B266E2E1
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so4303747wmj.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RU/4ty0eEugeyrPrVEiQiwkrKqeJ+uZPrr4qGpCy8Ns=;
 b=WQ76x/1RuTy1JkP9aezKfVnljVf6mBF2k34u6CEzkCHMD5rjzO23Ol0qswF1Uqnn3r
 NZfMgpfPaWZjBnzc3b4R0o6daICNWxE3wsC5YBUn7XLwXhFfZLN5ZIKJ1vC7UEvOJvnQ
 jpY5agvtrUOJPNYvXTokA+XG56fPkvmyjcTDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RU/4ty0eEugeyrPrVEiQiwkrKqeJ+uZPrr4qGpCy8Ns=;
 b=NBNVinV33C2tEtBUU7DL8/vuJcqeryMpmnTnvgr20LsNq5JpDQJvjGCC1zWXpC37/k
 iGGyzUqJP99FeEp2fwC7MdeYBXK8CI+Sn3bECtLjlNRqBYkya3pIHLA/C5yqyUepqFm1
 jmSGI7igcOaby+XxbdJJBpJok7wVTatvbs0+LC5H6s3CeHvyKkroCb5ekEtc7gvqtB+X
 pJ5U475VV/rzg8bKfDvVosMucy2I0S3afApolKMx/QD8S6lE0rhazLM/RX1JsJOVUA7v
 bmdxstW9+xPlBwykJDPI8CNdMof5QiBvAc7UYyuSXdZS8dKGEkoZSvWEY4i6s6mjGcFd
 YjDg==
X-Gm-Message-State: AOAM530CXCYkP+Kkr3CDZNMvBChGD+yuzhvUFoo8R+a+v67Vtprj9tfB
 AV/HFglAfsLJUSfVoYInrA+dMg==
X-Google-Smtp-Source: ABdhPJzyEEdLMFWp1SPIqCkQHe7o3lL3hDIhqzkna+QlwTAI0JRQsL2kauEYBN5PgJQKziIXdiNizg==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr3030923wma.118.1591258362288; 
 Thu, 04 Jun 2020 01:12:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/18] drm/amdgpu: add dma-fence annotations to atomic commit
 path
Date: Thu,  4 Jun 2020 10:12:14 +0200
Message-Id: <20200604081224.863494-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBuZWVkIGEgY2FuYXJ5IGluIGEgdHRtLWJhc2VkIGF0b21pYyBkcml2ZXIgdG8gbWFrZSBzdXJl
IHRoZQpkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgYW5ub3RhdGlvbnMgYWN0dWFsbHkg
d29yay4KCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA2ICsrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGJkYmEwYmZkNmRmMS4uYWRhYmZhOTI5ZjQy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKQEAgLTU3LDYgKzU3LDcgQEAKIAogI2luY2x1ZGUgIml2c3JjaWQvaXZzcmNpZF92aXNs
YW5kczMwLmgiCiAKKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPgogI2luY2x1ZGUgPGxpbnV4
L3ZlcnNpb24uaD4KQEAgLTczMjAsNiArNzMyMSw5IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9h
dG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogCXN0cnVj
dCBkcm1fY29ubmVjdG9yX3N0YXRlICpvbGRfY29uX3N0YXRlLCAqbmV3X2Nvbl9zdGF0ZTsKIAlz
dHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqZG1fb2xkX2NydGNfc3RhdGUsICpkbV9uZXdfY3J0Y19zdGF0
ZTsKIAlpbnQgY3J0Y19kaXNhYmxlX2NvdW50ID0gMDsKKwlib29sIGZlbmNlX2Nvb2tpZTsKKwor
CWZlbmNlX2Nvb2tpZSA9IGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7CiAKIAlkcm1fYXRv
bWljX2hlbHBlcl91cGRhdGVfbGVnYWN5X21vZGVzZXRfc3RhdGUoZGV2LCBzdGF0ZSk7CiAKQEAg
LTc2MDAsNiArNzYwNCw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3Rh
aWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogCS8qIFNpZ25hbCBIVyBwcm9ncmFt
bWluZyBjb21wbGV0aW9uICovCiAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUoc3Rh
dGUpOwogCisJZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CisKIAlpZiAo
d2FpdF9mb3JfdmJsYW5rKQogCQlkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUo
ZGV2LCBzdGF0ZSk7CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cg==
